-- A simple example to practice testbench
-- and its simulaiton inside modlesim
-- And to explore the difference between VHDL signal and variable

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
    ff_tx_rdy        : in  std_logic;    
    data_valid       : in  std_logic;
     
     
    --dummy output 
    --make sure internal logic are not synthesised away
    counter00        : out std_logic_vector(15 downto 0);
    counter01        : out std_logic_vector(15 downto 0);
    counter02        : out std_logic_vector(15 downto 0);
    ff_tx_wren       : out std_logic
     
    );
end mem_read_control;


architecture behaviour of mem_read_control is 

  signal ff_tx_wren_sig : std_logic;
  signal cnt_sig        : unsigned(15 downto 0); 
   

begin  -- architecture behaviour
  
  ff_tx_wren          <= ff_tx_wren_sig and ff_tx_rdy;
  
  state_machine : process(reset, clock)
    variable cnt_var   : integer   := 0;
    variable cnt_var2  : integer   := 0;
     
  begin
    if (reset = '1') then
       -- interface
      counter00 <= (others => '0');
      cnt_sig   <= (others => '0');
      cnt_var   := 0;
      cnt_var2  := 0;
    
        
    elsif rising_edge(clock) then
      ff_tx_wren_sig    <= ff_tx_rdy and data_valid;
      if(ff_tx_wren_sig = '1' and ff_tx_rdy = '1') then
        cnt_var := cnt_var + 1;
        --cnt_sig <= cnt_sig + to_unsigned(1,cnt_sig'length);
        cnt_sig <= cnt_sig + 1;
      else
        cnt_var := cnt_var;
        cnt_sig <= cnt_sig;
      end if;    
        
      if(data_valid = '1' and ff_tx_rdy = '1') then
        cnt_var2 := cnt_var2 + 1;
      else
        cnt_var2 := cnt_var2;
      end if;          
     
      counter00 <= std_logic_vector(to_unsigned(cnt_var,counter00'length));
      --couter01  <= 
      counter01 <= std_logic_vector(cnt_sig);
      counter02 <= std_logic_vector(to_unsigned(cnt_var2,counter02'length));

    end if;

  end process state_machine;     
  
end architecture behaviour;  
  
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is

end testbench;


architecture tb of testbench is


  component mem_read_control is

    port (
      --The clock
      clock            : in  std_logic;
      --Asynchronous reset
      reset            : in  std_logic;
      --From control_center. A one-clock pulse to initiate reading of one data_ram
      ff_tx_rdy        : in  std_logic;
      data_valid       : in  std_logic;


     --dummy output
     --make sure internal logic are not synthesised away
      counter00        : out std_logic_vector(15 downto 0);
      counter01        : out std_logic_vector(15 downto 0);
      counter02        : out std_logic_vector(15 downto 0);
      ff_tx_wren       : out std_logic);

  end component mem_read_control;
  
    -- Set up the signals on the 3bit_counter
    signal clock            :   std_logic;
    --Asynchronous reset
    signal reset            :   std_logic  := '0';
    --From control_center. A one-clock pulse to initiate reading of one data_ram
    signal ff_tx_rdy        :   std_logic  := '0';
    signal data_valid       :   std_logic  := '0';


     --dummy output
     --make sure internal logic are not synthesised away
    signal counter00        :   std_logic_vector(15 downto 0) := (others => '0');
    signal counter01        :   std_logic_vector(15 downto 0) := (others => '0');
    signal counter02        :   std_logic_vector(15 downto 0) := (others => '0');
    signal ff_tx_wren       :   std_logic                     := '0';
    constant clock_period   : time                            := 5 ns;
    constant reset_start_t  : time                            := 50 ns;
    constant reset_end_t    : time                            := 100 ns;


begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.mem_read_control
      -- Map the ports from the dut to this testbench
      port map (
        clock      => clock,
        reset      =>reset,
        ff_tx_rdy  => ff_tx_rdy,
        data_valid => data_valid,
        ff_tx_wren => ff_tx_wren,
        counter00  => counter00,
        counter01  => counter01,
        counter02  => counter02 );

    reset       <= '0', '1' after reset_start_t, '0' after reset_end_t;
    ff_tx_rdy   <= '1';
    data_valid  <= '0', '1' after 200 ns;

  process
  begin
    clock <= '1'; wait for clock_period;
    clock <= '0'; wait for clock_period;
  end process;

    -- Set up the signals
--    stimulus : process is
--      begin
--        -- Just make a clock on button1 to simulate pushing the button
--        loop
--          button1 <= '0'; wait for 10 ns;
--          button1 <= '1'; wait for 10 ns;
--        end loop;
--      end process stimulus;
end architecture tb;  
  
  

