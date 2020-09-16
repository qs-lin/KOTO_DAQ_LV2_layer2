library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mem_read_control is
  port (
    --The clock
    clock            : in  std_logic;
    --Asynchronous reset
    reset            : in  std_logic;
    --From control_center. A one-clock pulse to initiate reading of one data_ram
	start_read_pulse : in  std_logic;
    --Interface to es_ram	
    es_rd_req        : out std_logic;
    es_rd_addr       : out std_logic_vector(5 downto 0)   := (others => '0');
	event_size			: in  std_logic_vector(14 downto 0);
    --# of clock cycles between rdreq going high and data_in being valid
    FIFO_in_dly      : in  std_logic_vector (3 downto 0)  := "1111";
    ram_upper_limit	: in  std_logic_vector(17 downto 0)  := (others => '0');	 
	--Interface to data_ram. The memory is a 2-port ram so we need two rd_req and rd_addr
	data_rd_req	   : out std_logic;
	data_rd_addr	   : out std_logic_vector(17 downto 0)  := (others => '0');
	error				: out std_logic := '0';
	limit            : out std_logic_vector(15 downto 0);
	-- tx_valid = not_full && tx_rdy
	-- replace ff_tx_rdy by ff_tx_septy by Qisen in v43
	--ff_tx_rdy        : in  std_logic; 
	ff_tx_septy      : in  std_logic;
	ff_tx_a_full     : in  std_logic;
	work_in_progress : out std_logic := '0';
	-- interface to frame generator
	-- let the fg start generating header
	trigger_fg       : out std_logic := '0';
	-- mtu 1500: standard Ethernet; 9000: jumbo Ethernet
	max_payload      : in  std_logic_vector(11 downto 0);
	payload_len      : out std_logic_vector(11 downto 0);   
	fg_rdy           : in  std_logic  := '0';
	payload_rdy      : in  std_logic  := '0';
	--go_to_buff       : in  std_logic  := '0';
	chunk_id         : out std_logic_vector(31 downto 0)
	 
    );
end mem_read_control;

architecture behaviour of mem_read_control is 



  --signal event_size_sig  : std_logic_vector(12 downto 0);
  signal event_size_sig        : unsigned (14 downto 0);  
  --signal FIFO_in_dly_sig : std_logic_vector(3 downto 0);
  signal in_fifo_delay         : unsigned (3 downto 0)  := "0101"; 
  signal ram_upper_limit_sig   : unsigned (17 downto 0) := "110000110101000000";  --20_0000
  --signal es_rd_addr_sig  : std_logic_vector(7 downto 0);
  type state_type is (IDLE, GET_SIZE, WAIT_SIZE, ISSUE_TRIGGER, WAIT_FG,
							 WAIT_END, GET_DATA, STAND_BY--, DONE
                      );
							 
  signal next_state : state_type := IDLE;
  signal max_payload_sig       : unsigned (11 downto 0) := (others => '0');
  signal payload_len_sig       : unsigned (11 downto 0) := (others => '0'); 
  
begin  -- architecture behaviour
  
  event_size_sig      <= unsigned(event_size);
  in_fifo_delay       <= unsigned(FIFO_in_dly);
  ram_upper_limit_sig <= unsigned(ram_upper_limit);
  max_payload_sig     <= unsigned(max_payload);
  payload_len         <= std_logic_vector(payload_len_sig);
  --chunk_id            <= std_logic_vector(chunk_id_sig);
  --es_rd_addr      <= es_rd_addr_sig;
  
  state_machine : process(reset, clock)
    variable nstate           : state_type             := IDLE; 
    variable delay_counter    : integer                := 0;
	variable addr_counter     : integer                := 0;
	variable es_rd_addr_sig   : unsigned(5 downto 0)   := (others => '0');
	-- addr control for port a in the dual_port_ram
	variable addr             : unsigned(17 downto 0)  := (others => '0');
	-- addr control for port b in the dual_port_ram
    variable number           : unsigned(15 downto 0)  := (others => '0');	 	 
	variable remaining        : unsigned(14 downto 0)  := (others => '0');	
    variable chunk_id_sig     : unsigned(31 downto 0) := (others => '0');

	 
  begin
    if (reset = '1') then
	   -- interface
      es_rd_addr        <= (others => '0');
      es_rd_req         <= '0';		
	  data_rd_addr      <= (others => '0');
      data_rd_req       <= '0';
      trigger_fg        <= '0'; 
      work_in_progress  <= '0';
	  chunk_id          <= (others => '0');
      limit             <= (others => '0');
		
      -- internal logic
      next_state        <= IDLE;
      chunk_id_sig      := (others => '0');
      delay_counter     := 0;
      addr_counter      := 0;
      addr              := (others => '0');
      es_rd_addr_sig		:= (others => '0');
      number            := (others => '0');			
      payload_len_sig   <= (others => '0');	
      remaining         := (others => '0');	
		
    elsif rising_edge(clock) then
      case next_state is
        when IDLE =>
          next_state        <= IDLE;
		  trigger_fg        <= '0';
          es_rd_req         <= '0';
          data_rd_req       <= '0';
		  delay_counter     := 0;
          addr_counter      := 0;
          chunk_id_sig      := (others => '0');
          if (start_read_pulse = '1') then
            next_state      <= GET_SIZE;
          else
            next_state      <= IDLE;
          end if;
  
        when GET_SIZE =>
		  work_in_progress  <= '1';
		  es_rd_addr_sig    := es_rd_addr_sig+1;
		  es_rd_addr        <= std_logic_vector (es_rd_addr_sig);
          es_rd_req         <= '1';
          next_state        <= WAIT_SIZE;  

        when WAIT_SIZE =>
          es_rd_req         <= '0';
          delay_counter     := delay_counter+1;	
          if (delay_counter >= to_integer(in_fifo_delay)) then
            next_state      <= ISSUE_TRIGGER;
			remaining       := event_size_sig;
			delay_counter   := 0;
			--trigger_fg      <= '1';
          end if;			
			
		when ISSUE_TRIGGER =>
		  if(max_payload_sig>=remaining) then
		    payload_len_sig    <= resize(remaining,payload_len_sig'length);
		  else
			payload_len_sig    <= max_payload_sig;
		  end if;
	      trigger_fg       <= '1';
		  chunk_id         <= std_logic_vector(chunk_id_sig);
			  
          if(remaining = 0)then
            next_state     <= WAIT_END;
          else
            next_state     <= WAIT_FG;			
          end if;
			  
        when WAIT_END =>  
          --chunk_id_sig     := (others => '0');
          trigger_fg       <= '0';
          if(payload_rdy = '1') then
            next_state       <= IDLE ;
            work_in_progress <= '0';
          else
            next_state       <= WAIT_END;
          end if;
			  
        when WAIT_FG =>
          trigger_fg       <= '0';
          if(payload_rdy = '1') then
            next_state     <= GET_DATA;
          else
            next_state     <= WAIT_FG;
          end if;
			  
	    when GET_DATA =>
		  if(addr_counter<to_integer(payload_len_sig)) then
			  
		    --if( (ff_tx_rdy = '1') and (ff_tx_a_full = '0') and not(go_to_buff = '1' and ff_tx_rdy = '1')) then
            if(ff_tx_septy = '1') then 
              data_rd_req    <= '1';
              -- rd_addr starts from 1. In consistency with writing
              addr           := addr+1;			  
              if(addr>ram_upper_limit_sig) then
			    addr         :=(others => '0');
			    number       := number + 1;
		      end if;			
			  addr_counter   := addr_counter+1;		   
            else
              data_rd_req    <= '0';
              addr_counter   := addr_counter;
            end if;					
		    data_rd_addr   <= std_logic_vector (addr);	  
					
          else
            chunk_id_sig   := chunk_id_sig + to_unsigned(1,chunk_id_sig'length);
            data_rd_req    <= '0';
            addr_counter   := 0;
            remaining      := remaining - payload_len_sig;
--			    if(remaining = 0) then 
--				   next_state   <= ISSUE_TRIGGER;  -- still need generate footer
--					--work_in_progress <= '0';
--				 else
--				   next_state  <= STAND_BY;
--				 end if;

		    -- Go to stand-by. We have read data out from the ram, but cannot guarentee 
			-- that they have been sent out. So we wait until we receive the fg_rdy.
		    next_state     <= STAND_BY;
			end if;	 
			-- This is to wait until FG finish wrapping up everthing. like generating the eop
		   -- Probably don't even need this. But only a cost of one clock ?	

          when STAND_BY =>
            if(fg_rdy = '1') then
              next_state    <= ISSUE_TRIGGER;  -- restart the FG until we send out event_size
            else
              next_state    <= STAND_BY;
            end if;
			
				 
 
      end case;
	  limit <= std_logic_vector(number);	   	
    end if;
	--limit_a <= std_logic_vector(number_a);
	--limit_b <= std_logic_vector(number_b);
  end process state_machine;  
  
  error_detect : process(reset, clock) 
  begin
    if (reset = '1') then		
		error     <= '0';
    elsif rising_edge(clock) then
	   if(start_read_pulse='1' and next_state /= IDLE) then
		  error   <= '1';
		end if;
    end if;		
		
  end process error_detect;
  
end architecture behaviour;



