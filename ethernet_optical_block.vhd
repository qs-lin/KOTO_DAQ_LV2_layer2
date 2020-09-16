-- generate this from block diagram file by Qisen
-- use VHD declaration to show the connection between each modul


-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Full Version"
-- CREATED      "Sat Feb 02 22:48:27 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ethernet_optical_block IS 
	PORT
	(
		SFP_pll_ref_clk1 :  IN  STD_LOGIC;
		SFP_rx_in1 :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		ff_tx_eop :  IN  STD_LOGIC;
		ff_tx_sop :  IN  STD_LOGIC;
		ff_tx_wren :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		ff_tx_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mac_config :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		souce_mac_addr :  IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		SFP_tx_Out1 :  OUT  STD_LOGIC;
		ff_rx_eop :  OUT  STD_LOGIC;
		ff_rx_sop :  OUT  STD_LOGIC;
		ff_rx_dval :  OUT  STD_LOGIC;
		ff_tx_rdy :  OUT  STD_LOGIC;
		ff_tx_septy :  OUT  STD_LOGIC;
		ff_tx_a_full :  OUT  STD_LOGIC;
		ff_rx_data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ethernet_optical_block;

ARCHITECTURE bdf_type OF ethernet_optical_block IS 

COMPONENT fifo_32
	PORT(wrreq : IN STD_LOGIC;
		 wrclk : IN STD_LOGIC;
		 rdreq : IN STD_LOGIC;
		 rdclk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dff32
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT triple_speed_ethernet
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 reg_rd : IN STD_LOGIC;
		 reg_wr : IN STD_LOGIC;
		 ff_rx_clk : IN STD_LOGIC;
		 ff_tx_clk : IN STD_LOGIC;
		 ff_rx_rdy : IN STD_LOGIC;
		 ff_tx_eop : IN STD_LOGIC;
		 ff_tx_err : IN STD_LOGIC;
		 ff_tx_sop : IN STD_LOGIC;
		 ff_tx_wren : IN STD_LOGIC;
		 xon_gen : IN STD_LOGIC;
		 xoff_gen : IN STD_LOGIC;
		 magic_sleep_n : IN STD_LOGIC;
		 ff_tx_crc_fwd : IN STD_LOGIC;
		 ref_clk : IN STD_LOGIC;
		 rxp : IN STD_LOGIC;
		 ff_tx_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ff_tx_mod : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 reconfig_togxb : IN STD_LOGIC_VECTOR(139 DOWNTO 0);
		 reg_addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg_busy : OUT STD_LOGIC;
		 ff_rx_eop : OUT STD_LOGIC;
		 ff_rx_sop : OUT STD_LOGIC;
		 ff_rx_dval : OUT STD_LOGIC;
		 ff_tx_rdy : OUT STD_LOGIC;
		 magic_wakeup : OUT STD_LOGIC;
		 ff_tx_septy : OUT STD_LOGIC;
		 tx_ff_uflow : OUT STD_LOGIC;
		 ff_tx_a_full : OUT STD_LOGIC;
		 ff_tx_a_empty : OUT STD_LOGIC;
		 ff_rx_dsav : OUT STD_LOGIC;
		 ff_rx_a_full : OUT STD_LOGIC;
		 ff_rx_a_empty : OUT STD_LOGIC;
		 led_crs : OUT STD_LOGIC;
		 led_link : OUT STD_LOGIC;
		 led_panel_link : OUT STD_LOGIC;
		 led_col : OUT STD_LOGIC;
		 led_an : OUT STD_LOGIC;
		 led_char_err : OUT STD_LOGIC;
		 led_disp_err : OUT STD_LOGIC;
		 rx_recovclkout : OUT STD_LOGIC;
		 txp : OUT STD_LOGIC;
		 ff_rx_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ff_rx_mod : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 reconfig_fromgxb : OUT STD_LOGIC_VECTOR(91 DOWNTO 0);
		 reg_data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rx_err : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 rx_err_stat : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		 rx_frm_type : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tse_config_controller
GENERIC (port_id : INTEGER;
			TSE_FIFO_SIZE : INTEGER
			);
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 mac_sw_reset : IN STD_LOGIC;
		 reconfig : IN STD_LOGIC;
		 waitrequest : IN STD_LOGIC;
		 config : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mac_addr : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
		 readdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 read_req : OUT STD_LOGIC;
		 write_req : OUT STD_LOGIC;
		 mac_ready : OUT STD_LOGIC;
		 mac_error : OUT STD_LOGIC;
		 address : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 writedata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ff_rx_data_raw :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	fx_tx_data :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	mac_addr :  STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL	readdata :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	The_clock :  STD_LOGIC;
SIGNAL	waitrequest :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(0 TO 139);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(139 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_17 <= '1';
SYNTHESIZED_WIRE_3 <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
SYNTHESIZED_WIRE_6 <= '1';
SYNTHESIZED_WIRE_7 <= '0';
SYNTHESIZED_WIRE_18 <= '0';
SYNTHESIZED_WIRE_19 <= '0';



b2v_inst : fifo_32
PORT MAP(wrreq => SYNTHESIZED_WIRE_17,
		 wrclk => The_clock,
		 rdreq => SYNTHESIZED_WIRE_17,
		 rdclk => The_clock,
		 data => ff_rx_data_raw,
		 q => SYNTHESIZED_WIRE_2);


b2v_inst1 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_2,
		 q => ff_rx_data);






SYNTHESIZED_WIRE_12 <= SYNTHESIZED_WIRE_3;



b2v_inst8 : triple_speed_ethernet
PORT MAP(clk => The_clock,
		 reset => reset,
		 reg_rd => SYNTHESIZED_WIRE_4,
		 reg_wr => SYNTHESIZED_WIRE_5,
		 ff_rx_clk => The_clock,
		 ff_tx_clk => The_clock,
		 ff_rx_rdy => SYNTHESIZED_WIRE_6,
		 ff_tx_eop => ff_tx_eop,
		 ff_tx_err => SYNTHESIZED_WIRE_7,
		 ff_tx_sop => ff_tx_sop,
		 ff_tx_wren => ff_tx_wren,
		 xon_gen => SYNTHESIZED_WIRE_18,
		 xoff_gen => SYNTHESIZED_WIRE_18,
		 magic_sleep_n => SYNTHESIZED_WIRE_18,
		 ff_tx_crc_fwd => SYNTHESIZED_WIRE_18,
		 ref_clk => SFP_pll_ref_clk1,
		 rxp => SFP_rx_in1,
		 ff_tx_data => ff_tx_data,
		 reconfig_togxb => SYNTHESIZED_WIRE_12,
		 reg_addr => SYNTHESIZED_WIRE_13,
		 reg_data_in => SYNTHESIZED_WIRE_14,
		 reg_busy => waitrequest,
		 ff_rx_eop => ff_rx_eop,
		 ff_rx_sop => ff_rx_sop,
		 ff_rx_dval => ff_rx_dval,
		 ff_tx_rdy => ff_tx_rdy,
		 ff_tx_septy => ff_tx_septy,
		 ff_tx_a_full => ff_tx_a_full,
		 txp => SFP_tx_Out1,
		 ff_rx_data => ff_rx_data_raw,
		 reg_data_out => readdata);


b2v_inst9 : tse_config_controller
GENERIC MAP(port_id => 0,
			TSE_FIFO_SIZE => 2048
			)
PORT MAP(clock => The_clock,
		 reset => reset,
		 mac_sw_reset => SYNTHESIZED_WIRE_19,
		 reconfig => SYNTHESIZED_WIRE_19,
		 waitrequest => waitrequest,
		 config => mac_config,
		 mac_addr => mac_addr,
		 readdata => readdata,
		 read_req => SYNTHESIZED_WIRE_4,
		 write_req => SYNTHESIZED_WIRE_5,
		 address => SYNTHESIZED_WIRE_13,
		 writedata => SYNTHESIZED_WIRE_14);


The_clock <= clock;
mac_addr <= souce_mac_addr;

END bdf_type;
