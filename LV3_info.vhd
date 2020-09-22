library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LV3_info is
  port (
    --The clock
    clock            : in  std_logic;
    --Asynchronous reset
    reset            : in  std_logic;
    --From control_center. A one-clock pulse to initiate reading of one data_ram
    LIVE             : in  std_logic;
    trig_delta       : in  std_logic;
    rx_evt_00        : in  std_logic_vector(15 downto 0);
    rx_evt_01        : in  std_logic_vector(15 downto 0);
    tx_evt_00        : in  std_logic_vector(15 downto 0);
    tx_evt_01        : in  std_logic_vector(15 downto 0);	
    delay            : in  std_logic_vector(31 downto 0); 
    packet_lv2       : out std_logic_vector(15 downto 0);
    error            : out std_logic;
    data_valid       : out std_logic
    );
end LV3_info;

architecture behaviour of LV3_info is 

  type state_type is ( WAIT_LIVE_FALL, STAND_BY, CHECK_PHASE_00, CHECK_PHASE_01,
                      CHECK_PHASE_02);
  signal LIVE_pipe   : std_logic  :=  '0';	
  signal next_state  : state_type := WAIT_LIVE_FALL;  

begin  -- architecture behaviour
    
  state_machine : process(reset, clock)
  
    variable nstate      : state_type             := WAIT_LIVE_FALL;
    variable counter     : unsigned(31 downto 0)  := ( others=>'0' );
 	 
  
  begin
    if (reset = '1') then

      packet_lv2 <= (others => '0');
      counter    := (others => '0');
      next_state <= WAIT_LIVE_FALL;
      data_valid <= '0';

    elsif rising_edge(clock) then
	 
      LIVE_pipe  <= LIVE;
      
      case next_state is

        when WAIT_LIVE_FALL =>		
          data_valid <= '0';
          if(LIVE_pipe = '1' and LIVE = '0') then
            next_state   <= STAND_BY;
          else
            next_state   <= next_state;  
          end if;
		  
        -- we certainly don't want to start check right afer falling edge of LIVE
        -- we wait for some time ~ 1 sec. changed by run_control
        when STAND_BY =>
          counter  := counter + 1;
          if (unsigned(delay) = counter) then
            next_state   <= CHECK_PHASE_00;
            counter      := (others => '0');
          else
            next_state   <= next_state;    
          end if;
		  
        -- basically we want to check if four numbers are the same 
        -- split the work into 4 clocks to avoid timing violations.	
        -- every time it fails, we have to go back to the 1st stage.
        when CHECK_PHASE_00 =>
          if(rx_evt_00 = rx_evt_01) then  
            next_state   <= CHECK_PHASE_01;
          else
            next_state   <= CHECK_PHASE_00;
          end if;	

        when CHECK_PHASE_01 =>
          if(rx_evt_01 = tx_evt_00) then  
            next_state   <= CHECK_PHASE_02;
          else
            next_state   <= CHECK_PHASE_00;
          end if;	

        when CHECK_PHASE_02 =>
          if(tx_evt_00 = tx_evt_01) then  
            next_state   <= WAIT_LIVE_FALL;
            packet_lv2   <= tx_evt_01;
            data_valid   <= '1';
          else
            next_state   <= CHECK_PHASE_00;
        end if;			  
		  
    end case; 		
    --packet_lv2 <= (others => '0');
	

end if;
	 
  end process state_machine;	
 
  error_detect : process(reset, clock) 
  begin
    if (reset = '1') then		
      error     <= '0';
    elsif rising_edge(clock) then
      if(trig_delta='1' and next_state /= WAIT_LIVE_FALL) then
        error   <= '1';
      end if;
    end if;		

  end process error_detect;
  
end architecture behaviour;  
