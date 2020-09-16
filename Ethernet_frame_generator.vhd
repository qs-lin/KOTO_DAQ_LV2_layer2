-------------------------------------------------------------------------------
-- Title      : Ethernet Simulated Data Generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : Ethernet_data_generator.vhd
-- Author     : Qisen Lin  <qslin@uchicago.edu>  
-- Company    : University of Chicago
-- Created    : 2018-10-24
-- Last update: 2018-10-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates ethernet, IPv4, and UDP headers for transmission over
-- ethernet line. Generate consecutive counters and encapsulate in Ethernet frame 
-------------------------------------------------------------------------------
-- Copyright (c) 2018 University of Chicago
-------------------------------------------------------------------------------
-- Revisions  :                
-- Date        Version  Author  Description
-- 2018-10-24  1.0      Qisen  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ethernet_frame_generator is
  port (
    --The clock
    clock           : in  std_logic;
    reset           : in  std_logic;
    ff_tx_rdy       : in  std_logic;
    ff_tx_a_full    : in  std_logic;
    --Sent from mem_read_control. Initiate ethernet frame
    data_start      : in  std_logic;
    --Input data
    data_in         : in  std_logic_vector(31 downto 0);
    data_valid      : in  std_logic;
    --Output data
    ff_tx_data      : out std_logic_vector(31 downto 0);
    --High when data is valid
    ff_tx_wren      : out std_logic;
    --High when data ends
    ff_tx_eop       : out std_logic;
    --High when data starts
    ff_tx_sop       : out std_logic;
    --Length of payload, in 32-bit words
    payload_len     : in  std_logic_vector(11 downto 0);
    --Ethernet frame header
    ether_header_0  : in  std_logic_vector(31 downto 0);       -- dma[47..16]
    ether_header_1  : in  std_logic_vector(31 downto 0);       -- dma[15..0] & sma[47..32]
    ether_header_2  : in  std_logic_vector(31 downto 0);       -- sma[31..0]
    -- Standard Ethernet 0x0800; Jumbo Ethernet 0x8870
    ether_type      : in  std_logic_vector(15 downto 0);
    --IPv4 Header info
    source_ip       : in  std_logic_vector(31 downto 0);
    dest_ip         : in  std_logic_vector(31 downto 0);
    port_id         : in  std_logic_vector(31 downto 0);
	 
    --Interface to mem_read_control
    --header is done. You can send the data in
    payload_rdy     : out std_logic;
    --current event is done. You can send another packet
    fg_rdy          : out std_logic;

    error           : out std_logic_vector(4 downto 0);
    -- handling buffer data. Forbid mem_read_control from requiring new data from the ram
    is_buff         : out std_logic;
    is_valid        : out std_logic;
    go_to_buff_port : out std_logic;
    ff_tx_septy     : in  std_logic;
    event_id        : in  std_logic_vector(31 downto 0);
    nListenPorts    : in  std_logic_vector(3 downto 0);
    chunk_id        : in  std_logic_vector(31 downto 0);
    crate_id        : in  std_logic_vector(7 downto 0);
    error_buff      : out std_logic;
    spill_id        : in  std_logic_vector(8 downto 0);
    lv2_packet      : in  std_logic_vector(14 downto 0);
    lv2_info_valid  : in  std_logic
    );
end Ethernet_frame_generator;

architecture behavior of Ethernet_frame_generator is

  subtype word is std_logic_vector(31 downto 0);
  type header is array(integer range <>) of word;
  -- when ff_tx_a_full is on, data will be stored here temporarily.
  -- wait untill ff_tx_a_full is off. And send data in this buffer zone first and go back to new data
    
  -- I think I only need two. Just in case not enough. 	 
  type data_array is array (0 to 17) of word;
  signal buffer_data        : data_array;
  signal pipe_data          : data_array;
  signal pipe_dval          : std_logic := '1';
  
  type state_type is (IDLE, CALCULATION, WAIT_SEC_EMPTY, WAIT_HEADER,
                      ETH0, ETH1, ETH2, ETH3, 
                      IP0,  IP1,  IP_PAUSE0,  IP_PAUSE1, IP_PAUSE2,  --Pause for checksum computation
                      IP2,  IP3,  IP4,
                      UDP0, UDP1, EVENT_ID_STATE, CHUNK_ID_STATE, DISCRIMINATOR,
                      DATA, --BUFFER_WAIT, BUFFER_STATE, 
                      DONE
                      );
  signal state      : state_type := IDLE;
  signal next_state : state_type := IDLE;
  
  constant protocol      : std_logic_vector(7 downto 0)   := X"11";
  --constant source_port   : std_logic_vector(15 downto 0)  := X"1002";
  --constant dest_port   : std_logic_vector(15 downto 0)  := X"1002";  

  -----------------------------------------------------------------------------
  -- Ethernet Header
  -----------------------------------------------------------------------------
  constant padding           : std_logic_vector(31 downto 0) := (others => '0');
  signal eth_header          : header(0 to 3)                := (others => (others => '0'));
  -----------------------------------------------------------------------------
  -- IPv4 Header
  -----------------------------------------------------------------------------
  signal ip_header           : header(0 to 4)                := (others => (others => '0'));
  --First header word
  --IPv4 version
  constant version           : std_logic_vector(3 downto 0)  := "0100";
  --Header is only 5 words long, as long as we don't have any options
  constant ip_header_len     : std_logic_vector(3 downto 0)  := "0101";
  constant diff_serv         : std_logic_vector(7 downto 0)  := (others => '0');
  signal packet_len          : std_logic_vector(15 downto 0) := (others => '0');
  signal ether_type_sig      : std_logic_vector(15 downto 0) := X"0800";
  --Second header word
  --This field may be useable for our retransmission controller, not sure yet...
  constant id_field          : std_logic_vector(15 downto 0) := (others => '0');
  constant frag_field        : std_logic_vector(15 downto 0) := (others => '0');
  --Third header word
  constant ip_ttl            : std_logic_vector(7 downto 0)  := (others => '1');
  signal protocol_sig        : std_logic_vector(7 downto 0)  := (others => '0');
  signal ip_checksum         : std_logic_vector(15 downto 0) := (others => '0');
  -----------------------------------------------------------------------------
  -- Internal Signals
  -----------------------------------------------------------------------------
  signal header_len_sig      : unsigned(8 downto 0);
  signal payload_octets      : std_logic_vector(15 downto 0);
  signal source_mac_addr_sig : std_logic_vector(47 downto 0);
  signal dest_mac_addr_sig   : std_logic_vector(47 downto 0);
  signal ff_tx_rdy_sig       : std_logic;
  
  signal ether_header_0_sig  : std_logic_vector(31 downto 0);
  signal ether_header_1_sig  : std_logic_vector(31 downto 0);
  signal ether_header_2_sig  : std_logic_vector(31 downto 0);    
  
  signal port_id_sig         : unsigned(31 downto 0);    
  
  signal go_to_buff          : std_logic := '0';
  
  --signal ff_tx_wren_sig      : std_logic := '0'; 

  signal lock                : std_logic := '0';
  
  signal event_id_sig        : std_logic_vector(31 downto 0);    
  signal chunk_id_sig        : std_logic_vector(31 downto 0);   
  signal nListenPorts_sig    : unsigned(3 downto 0);

begin


  -- ff_tx_rdy = not ff_tx_a_full. Confirmed by signalTap these two signals

  go_to_buff_port     <= go_to_buff;
  ether_type_sig      <= ether_type;
  protocol_sig        <= protocol;
  --TODO: make this dynamically correct
  --Note: this is in words
  -- 5 ip headers + 2 udp headers
  -- change from 7 to 10 by Qisen on 2020/02/02
  -- 3 more data words : event_id, chunk_id, discriminator
  header_len_sig      <= to_unsigned(10, header_len_sig'length); 
                         
  --Note: this is in *bytes*
  packet_len          <= std_logic_vector(resize(header_len_sig+unsigned(payload_len), packet_len'length-2)) & "00";
  ether_header_0_sig  <= ether_header_0;
  ether_header_1_sig  <= ether_header_1;
  ether_header_2_sig  <= ether_header_2; 
  port_id_sig         <= unsigned(port_id); 
  event_id_sig        <= event_id; 
  nListenPorts_sig    <= unsigned(nListenPorts);
  chunk_id_sig        <= chunk_id;
  
  state_machine : process(reset, clock)
    variable nstate         : state_type := IDLE; 
    variable counter_sent   : integer    := 0;
    variable counter_head   : integer    := 0;
    variable dest_port      : unsigned(15 downto 0):= (others => '0');	 

  begin
    if (reset = '1') then
      --interface
      error_buff       <= '0';     
      ff_tx_data       <= (others => '0');
      ff_tx_wren       <= '0';
      ff_tx_eop        <= '0';
      ff_tx_sop        <= '0';
      fg_rdy           <= '0';
      payload_rdy      <= '0';

      --variable
      next_state       <= IDLE;
      counter_sent     := 0;
      counter_head     := 0;
      dest_port        := ( port_id_sig(15 downto 0) );	

      --signal			
    elsif rising_edge(clock) then


      case next_state is
        when IDLE =>

          ff_tx_data        <= (others => '0');
          ff_tx_wren        <= '0';
          ff_tx_eop         <= '0';
          ff_tx_sop         <= '0';
          counter_sent      := 0;
          counter_head      := 0;
          payload_rdy       <= '0';
          fg_rdy            <= '0';
          is_buff           <= '0';

          -- if (data_start = '1') then
          -- we also want to send out the LV2 information 
          if (data_start = '1' or lv2_info_valid = '1') then
            next_state  <= CALCULATION;
          else
            next_state  <= IDLE;
          end if;
  
          ---- Modified this logic by Qisen @ 2018/11/24
          ---- I don't want the system calculate the headers all the time in IDEL stage
          ---- So I add this CALCULATION stage

			 
        when CALCULATION =>
          ff_tx_data        <= (others => '0');
          ff_tx_wren        <= '0';
          ff_tx_eop         <= '0';
          ff_tx_sop         <= '0';

          ip_header(0)  <= version & ip_header_len & diff_serv & packet_len;
          ip_header(1)  <= id_field & frag_field;
          --Last 2 bytes 0 for checksum computing later
          ip_header(2)  <= ip_ttl & protocol_sig & X"00_00";
          ip_header(3)  <= source_ip;
          ip_header(4)  <= dest_ip;
          eth_header(0) <= padding(31 downto 16) & ether_header_0_sig(31 downto 16);
          eth_header(1) <= ether_header_0_sig(15 downto 0) & ether_header_1_sig(31 downto 16);
          eth_header(2) <= ether_header_1_sig(15 downto 0) & ether_header_2_sig(31 downto 16);
          eth_header(3) <= ether_header_2_sig(15 downto 0) & ether_type_sig;

          next_state <= WAIT_SEC_EMPTY;

        -- make sure the tse_buffer has enough space to send ethernet_frame data	 
        when WAIT_SEC_EMPTY =>
          if( ff_tx_septy = '1') then 
            next_state      <= WAIT_HEADER;
          else
            next_state      <= next_state; 
          end if;	
			 
        when WAIT_HEADER =>
          counter_head     := counter_head + 1;
          if(counter_head = 14) then 
            next_state      <= ETH0;
			counter_head     := 0;
          else
            next_state      <= next_state; 
          end if;	
						 
        when ETH0 =>
          ff_tx_data        <= eth_header(0);
          ff_tx_wren        <= ff_tx_rdy;
          ff_tx_sop         <= '1';
          next_state        <= ETH1;

        when ETH1 =>
          ff_tx_data    <= eth_header(1);
          ff_tx_sop     <= '0';
          next_state    <= ETH2;

        when ETH2 =>
          ff_tx_data    <= eth_header(2);
          next_state    <= ETH3;

        when ETH3 =>
          ff_tx_data    <= eth_header(3);
          next_state    <= IP0;

        when IP0 =>
          ff_tx_data    <= ip_header(0);
          next_state    <= IP1;

        when IP1 =>
          ff_tx_data    <= ip_header(1);
          next_state    <= IP_PAUSE0;

        when IP_PAUSE0 =>
          ff_tx_data        <= (others => '1');
          ff_tx_wren        <= '0';
          next_state        <= IP_PAUSE1;

			 
        --Based on the simulation, we only need pause for 1 clock.
        --But we can stil pause for two for safety

        when IP_PAUSE1 =>
          ff_tx_data        <= (others => '1');
          ff_tx_wren        <= '0';
          next_state        <= IP_PAUSE2;      

          -- This wait stage is added back on 2019/12/12 by Qisen
          -- when step=8, not sure whether ip_checksum is assigned before or after 
          -- ff_tx_data is assigned. So add this back to make sure ip_checksum is updated 
          -- before encapsulated in IP2  
        when IP_PAUSE2 =>
          ff_tx_data        <= (others => '1');
          ff_tx_wren        <= '0';
          next_state        <= IP2;  			 

        when IP2 =>
          ff_tx_data        <= ip_ttl & protocol_sig & ip_checksum;
          ff_tx_wren        <= ff_tx_rdy;
          next_state        <= IP3;

        when IP3 =>
          ff_tx_data        <= ip_header(3);
          next_state        <= IP4;

        when IP4 =>
          ff_tx_data        <= ip_header(4);
          next_state        <= UDP0;

        when UDP0 =>
          --ff_tx_data    <= port_id_sig;       --source_port & dest_port;
          ff_tx_data    <= std_logic_vector(dest_port) & std_logic_vector(dest_port);
          dest_port     := dest_port +  to_unsigned(1, dest_port'length);
          if( dest_port = (resize(nListenPorts_sig,dest_port'length)+port_id_sig(15 downto 0)) ) then
            dest_port   := port_id_sig(15 downto 0);
          end if;
          next_state    <= UDP1;

        when UDP1 =>
          -- Length in bytes followed by (unused) checksum
          -- 2 UDP header + 3 LV3 header 
          ff_tx_data    <= std_logic_vector(resize(unsigned(payload_len)+to_unsigned(5, payload_len'length), 14))& "00" & X"00_00";
          next_state    <= EVENT_ID_STATE;

        when EVENT_ID_STATE =>
          --Event ID
          ff_tx_data    <= event_id_sig;
          next_state    <= CHUNK_ID_STATE;			 

        when CHUNK_ID_STATE =>
          --Chunk ID
          ff_tx_data    <= chunk_id_sig; 
          next_state    <= DISCRIMINATOR;	

        when DISCRIMINATOR =>
          --Used to discriminate payload and footer
          if( unsigned(payload_len) = 0) then
            --ff_tx_data    <= X"080000" & crate_id;
            --ff_tx_data    <= X"000" & "000" & spill_id & crate_id;				
            ff_tx_data    <= lv2_packet & spill_id & crate_id;
            next_state    <= DONE;
            ff_tx_eop     <= '1';
            payload_rdy   <= '1';	
          else
            ff_tx_data    <= (others => '0');
            next_state    <= DATA;		
            payload_rdy   <= '1'; 
          end if;	

        when DATA =>  
          payload_rdy     <= '0';	  
          --ff_tx_data    <= std_logic_vector(to_unsigned(counter, ff_tx_data'length));
          --ff_tx_eop     <='0';
          ff_tx_data        <= data_in;
          --if(data_valid  = '1' and ff_tx_septy = '1') then
          if(data_valid  = '1') then
            ff_tx_wren    <= '1';
            counter_sent  := counter_sent + 1;
          else 
            ff_tx_wren    <= '0';
            counter_sent  := counter_sent;
          end if;			

          if(counter_sent>=to_integer(unsigned(payload_len))) then
            --if(counter_v1>=to_integer(unsigned(payload_len)) and  ff_tx_septy = '1') then		 
            --ff_tx_data      <= X"0AAAAAAA";		 
            next_state      <= DONE;
            ff_tx_eop       <= '1';
            --ff_tx_wren_sig  <= '1';
          end if;		

        when DONE =>
          fg_rdy            <= '1'; 
          ff_tx_data        <= (others => '0');
          ff_tx_eop         <= '0';
          ff_tx_wren        <= '0';
          counter_sent      := 0;
          --counter_v1        := 0;
          next_state        <= IDLE;
          payload_rdy       <= '0'; 

      end case;
      --state <= next_state;
		
    end if;

  end process state_machine;

--Some modifications by Qisen:
--  becuase of the CALCULATION stage, we have to delay the stage by 1 clock. Becuase during step0
--  these headers have not been updated. So we need to start doing the sum from step=1
--  that's why we add ip_header(step-1)
  
--Notes:
--  The reason we have two clocks calculating the sum between [22:16] and [15:0]
--  is just in case of carry  
--  
  checksum_computer : process (reset, clock)
    --Checksum computer for ipv4 header
    --Only really need 19 bits for a 5 word header, extra is just cause
    variable sum   : unsigned(22 downto 0) := (others => '0');
    variable carry : unsigned(6 downto 0)  := (others => '0');
    variable step  : integer               := -1;
  begin
    if (reset = '1') then
      sum         := (others => '0');
      step        := -1;
      ip_checksum <= (others => '0');
    elsif rising_edge(clock) then
      if (step = -1) then
        --Reset our sum
        sum  := (others => '0');
        if (data_start='1') then
          step := 0;
        else
          step := -1;
        end if;
        -- wait for one clock to finish the CALCULATION state  
        elsif (step<=0) then  
          step := step +1;
      elsif (step <= ip_header'length) then
        --Add everything to our sum
        sum  := sum + unsigned(ip_header(step-1)(31 downto 16))+unsigned(ip_header(step-1)(15 downto 0));
        step := step +1;
      elsif (step <= ip_header'length+2) then
        --Now add our carry
        carry := sum(22 downto 16);
        sum   := resize(sum(15 downto 0) + sum(22 downto 16), 23);
        step  := step +1;
      elsif (step = ip_header'length +3) then
        ip_checksum <= not(std_logic_vector(sum(15 downto 0)));
        step        := -1;
      end if;
    end if;
  end process checksum_computer;

  error_detect : process(reset, clock) 
  begin
    if (reset = '1') then		
      error        <= (others => '0');
    elsif rising_edge(clock) then
      if(data_start = '1' and next_state /= IDLE) then
        error(0)   <= '1';
    end if;
		
		-- packets lengh sent from data_ram exceeds payload_len 
--		if(data_valid = '1' and next_state /= DATA) then
--		  error(1)   <= '1';
--		end if;  


      if(data_valid = '1' and next_state /= DATA) then
        if( next_state = DONE) then
          error(1) <='1';
        elsif( next_state = DISCRIMINATOR) then	 
          error(2) <='1';
        elsif( next_state = IDLE) then	 
          error(3) <='1';			 
        else
          error(4) <='1';
			
		end if;	
      end if; 		
    end if;		
		
  end process error_detect;
end architecture behavior;


