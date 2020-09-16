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
-- CREATED      "Sat Feb 02 22:41:37 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Rx IS 
	PORT
	(
		_lword :  IN  STD_LOGIC;
		_vme_write :  IN  STD_LOGIC;
		_as :  IN  STD_LOGIC;
		_iack :  IN  STD_LOGIC;
		sysclk :  IN  STD_LOGIC;
		CRC_ERROR_IN :  IN  STD_LOGIC;
		ClockSwitch_0 :  IN  STD_LOGIC;
		ClockSwitch_1 :  IN  STD_LOGIC;
		CLOCKIN_2 :  IN  STD_LOGIC;
		CLOCKIN_3 :  IN  STD_LOGIC;
		CLOCKIN_0 :  IN  STD_LOGIC;
		CLOCKIN_1 :  IN  STD_LOGIC;
		CLOCKIN_4 :  IN  STD_LOGIC;
		CLOCKIN_5 :  IN  STD_LOGIC;
		CLOCKIN_6 :  IN  STD_LOGIC;
		CLOCKIN_7 :  IN  STD_LOGIC;
		ClockSwitch_3 :  IN  STD_LOGIC;
		ClockSwitch_2 :  IN  STD_LOGIC;
		AUX_IN :  IN  STD_LOGIC;
		SFPB_pll_ref_clk :  IN  STD_LOGIC;
		SFP_pll_ref_clk1 :  IN  STD_LOGIC;
		SFP_rx_in1 :  IN  STD_LOGIC;
		SFP_rx_in2 :  IN  STD_LOGIC;
		mem_qvld :  IN  STD_LOGIC;
		extmem_pll_refclk :  IN  STD_LOGIC;
		oct_rzqin :  IN  STD_LOGIC;
		SFP_pll_ref_clk2 :  IN  STD_LOGIC;
		SFP_rx_in3 :  IN  STD_LOGIC;
		SFP_rx_in4 :  IN  STD_LOGIC;
		SFP_pll_ref_clk3 :  IN  STD_LOGIC;
		SFP_rx_in5 :  IN  STD_LOGIC;
		SFP_rx_in6 :  IN  STD_LOGIC;
		SFP_pll_ref_clk4 :  IN  STD_LOGIC;
		SFP_rx_in7 :  IN  STD_LOGIC;
		SFP_rx_in8 :  IN  STD_LOGIC;
		SFPA_pll_ref_clk :  IN  STD_LOGIC;
		_ds :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		_ga :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		address :  IN  STD_LOGIC_VECTOR(31 DOWNTO 2);
		am :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		debug :  INOUT  STD_LOGIC_VECTOR(19 DOWNTO 2);
		mem_dq :  INOUT  STD_LOGIC_VECTOR(35 DOWNTO 0);
		mem_qk :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		mem_qk_n :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SFP0_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP10_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP11_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP12_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP13_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP14_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP15_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP16_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP17_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP1_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP2_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP3_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP4_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP5_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP6_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP7_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP8_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFP9_Control :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SFPA_rx_in :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		SFPB_rx_in :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Systemin :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		vme_data :  INOUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		_dtack :  OUT  STD_LOGIC;
		_berr :  OUT  STD_LOGIC;
		dir_trans :  OUT  STD_LOGIC;
		transceivers_OE :  OUT  STD_LOGIC;
		led_0 :  OUT  STD_LOGIC;
		led_1 :  OUT  STD_LOGIC;
		led_2 :  OUT  STD_LOGIC;
		Systemout :  OUT  STD_LOGIC;
		ClockSwitchControl_0 :  OUT  STD_LOGIC;
		ClockSwitchControl_1 :  OUT  STD_LOGIC;
		ClockSwitchControl_2 :  OUT  STD_LOGIC;
		ClockSwitchControl_3 :  OUT  STD_LOGIC;
		ClockSwitchControl_4 :  OUT  STD_LOGIC;
		AUX_OUT1 :  OUT  STD_LOGIC;
		AUX_OUT2 :  OUT  STD_LOGIC;
		AUX_OUT3 :  OUT  STD_LOGIC;
		SFP_tx_Out1 :  OUT  STD_LOGIC;
		SFP_tx_Out2 :  OUT  STD_LOGIC;
		mem_ck :  OUT  STD_LOGIC;
		mem_ck_n :  OUT  STD_LOGIC;
		mem_ref_n :  OUT  STD_LOGIC;
		mem_we_n :  OUT  STD_LOGIC;
		SFP_tx_Out3 :  OUT  STD_LOGIC;
		SFP_tx_Out4 :  OUT  STD_LOGIC;
		SFP_tx_Out5 :  OUT  STD_LOGIC;
		SFP_tx_Out6 :  OUT  STD_LOGIC;
		SFP_tx_Out7 :  OUT  STD_LOGIC;
		SFP_tx_Out8 :  OUT  STD_LOGIC;
		mem_a :  OUT  STD_LOGIC_VECTOR(19 DOWNTO 0);
		mem_ba :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		mem_cs_n :  OUT  STD_LOGIC_VECTOR(0 TO 0);
		mem_dk :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		mem_dk_n :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		mem_dm :  OUT  STD_LOGIC_VECTOR(0 TO 0);
		SFPA_tx_Out :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		SFPB_tx_Out :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END Rx;

ARCHITECTURE bdf_type OF Rx IS 

COMPONENT counter_show
	PORT(clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux32
	PORT(clock : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ethernet_optical_block
	PORT(ff_tx_eop : IN STD_LOGIC;
		 ff_tx_sop : IN STD_LOGIC;
		 ff_tx_wren : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 SFP_pll_ref_clk1 : IN STD_LOGIC;
		 SFP_rx_in1 : IN STD_LOGIC;
		 ff_tx_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mac_config : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 souce_mac_addr : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
		 ff_rx_eop : OUT STD_LOGIC;
		 ff_rx_sop : OUT STD_LOGIC;
		 ff_rx_dval : OUT STD_LOGIC;
		 ff_tx_rdy : OUT STD_LOGIC;
		 ff_tx_septy : OUT STD_LOGIC;
		 SFP_tx_Out1 : OUT STD_LOGIC;
		 ff_tx_a_full : OUT STD_LOGIC;
		 ff_rx_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ol_controller
	PORT(clk : IN STD_LOGIC;
		 LIVE : IN STD_LOGIC;
		 ena_rx : IN STD_LOGIC;
		 data_rx : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 data_tx : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ena_tx : OUT STD_LOGIC;
		 error : OUT STD_LOGIC;
		 send_err : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 datak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter16
	PORT(clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ofc1_manager
	PORT(The_clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 L1A_rd_req : IN STD_LOGIC;
		 ff_tx_rdy : IN STD_LOGIC;
		 ff_tx_a_full : IN STD_LOGIC;
		 ff_tx_septy : IN STD_LOGIC;
		 start_read_pulse : IN STD_LOGIC;
		 lv2_info_valid : IN STD_LOGIC;
		 crate_id : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dest_ip : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_type : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 event_id : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 FIFO_in_delay : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 L1A_rd_addr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 lv2_packet : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 max_payload : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 mem_upper_limit : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 nListenPorts : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 port_id : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 source_ip : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 spill_id : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 ff_tx_wren : OUT STD_LOGIC;
		 ff_tx_eop : OUT STD_LOGIC;
		 ff_tx_sop : OUT STD_LOGIC;
		 event_finish_write : OUT STD_LOGIC;
		 event_finish_read : OUT STD_LOGIC;
		 event_start_read : OUT STD_LOGIC;
		 error_out : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 ff_tx_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 L1A_out : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 mem_err : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mem_usage : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;

COMPONENT trig_cnt
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 trig_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 trig_cnt : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_2b_clk
	PORT(data1 : IN STD_LOGIC;
		 data0 : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT compare_01
	PORT(dataa : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 aeb : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT pulse_generator
	PORT(clock : IN STD_LOGIC;
		 signal : IN STD_LOGIC;
		 pulse : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT simu_ram
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 wrclock : IN STD_LOGIC;
		 rdclock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT simu_ram_read
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 trigger : IN STD_LOGIC;
		 total_number : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 rd_req : OUT STD_LOGIC;
		 rd_addr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pll_new
	PORT(refclk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 refclk1 : IN STD_LOGIC;
		 extswitch : IN STD_LOGIC;
		 outclk_0 : OUT STD_LOGIC;
		 outclk_1 : OUT STD_LOGIC;
		 outclk_2 : OUT STD_LOGIC;
		 locked : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT register_set0
	PORT(clock : IN STD_LOGIC;
		 in00 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in01 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in02 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in03 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in04 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in05 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 in06 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 in07 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 in08 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 in09 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out00 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out01 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out02 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out03 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out04 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out05 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out06 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out07 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out08 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out09 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dff_one
	PORT(data : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT compare_02
	PORT(dataa : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 aeb : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT new_receive_manager
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 din : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 evt_tx : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 need_read : OUT STD_LOGIC;
		 need_check : OUT STD_LOGIC;
		 evt_rx_00 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 evt_rx_01 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT trig_cnt_v0
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 trig_in : IN STD_LOGIC;
		 trig_cnt : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x32
	PORT(clock : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT delta_reset
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 delta_trig : IN STD_LOGIC;
		 delta_rst : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT trig_delay
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 trig_in : IN STD_LOGIC;
		 delay : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 trig_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT output_check
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 ff_tx_sop : IN STD_LOGIC;
		 ff_tx_eop : IN STD_LOGIC;
		 ff_tx_wren : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 error : OUT STD_LOGIC;
		 Current_L1A : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 packet_number : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tlk_error_output
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 err_in_00 : IN STD_LOGIC;
		 err_in_01 : IN STD_LOGIC;
		 err_in_02 : IN STD_LOGIC;
		 send_err_00 : IN STD_LOGIC;
		 send_err_01 : IN STD_LOGIC;
		 send_err_02 : IN STD_LOGIC;
		 err_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT delta_trig_delay
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 trig_in : IN STD_LOGIC;
		 delay : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 trig_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT vme_ram
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 wrclock : IN STD_LOGIC;
		 rdclock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT l1a_checker_part1
	PORT(reset : IN STD_LOGIC;
		 need_check : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 one_adc_finish_check : IN STD_LOGIC;
		 check_in_progress : OUT STD_LOGIC;
		 error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 start_check : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT show_counter
	PORT(clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter7
	PORT(clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 aclr : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END COMPONENT;

COMPONENT const_16b
	PORT(		 result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT l1a_checker_part3
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 check_in_progress : IN STD_LOGIC;
		 L1A_00 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 L1A_01 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 start_check : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 trig_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 L1A_align : OUT STD_LOGIC;
		 one_adc_finish_check : OUT STD_LOGIC;
		 error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT vme_interface
	PORT(_lword : IN STD_LOGIC;
		 _vme_write : IN STD_LOGIC;
		 _as : IN STD_LOGIC;
		 _iack : IN STD_LOGIC;
		 _delayed_modsel : IN STD_LOGIC;
		 _delayed_ds : IN STD_LOGIC;
		 _dtack : INOUT STD_LOGIC;
		 _berr : INOUT STD_LOGIC;
		 _ds : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 _ga : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 address : IN STD_LOGIC_VECTOR(31 DOWNTO 2);
		 am : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 fromtapdel : IN STD_LOGIC_VECTOR(5 DOWNTO 1);
		 _modsel : OUT STD_LOGIC;
		 _vme_data_str : OUT STD_LOGIC;
		 vme_write : OUT STD_LOGIC;
		 dir_trans : OUT STD_LOGIC;
		 totapdel : OUT STD_LOGIC;
		 vmeas : OUT STD_LOGIC;
		 vmeds : OUT STD_LOGIC;
		 vmespare : OUT STD_LOGIC;
		 vme_address : OUT STD_LOGIC_VECTOR(26 DOWNTO 2)
	);
END COMPONENT;

COMPONENT rldramii
	PORT(pll_ref_clk : IN STD_LOGIC;
		 global_reset_n : IN STD_LOGIC;
		 soft_reset_n : IN STD_LOGIC;
		 avl_write_req : IN STD_LOGIC;
		 avl_read_req : IN STD_LOGIC;
		 oct_rzqin : IN STD_LOGIC;
		 avl_addr : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		 avl_size : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 avl_wdata : IN STD_LOGIC_VECTOR(143 DOWNTO 0);
		 mem_dq : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 mem_qk : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mem_qk_n : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 afi_clk : OUT STD_LOGIC;
		 afi_half_clk : OUT STD_LOGIC;
		 afi_reset_n : OUT STD_LOGIC;
		 afi_reset_export_n : OUT STD_LOGIC;
		 mem_ck : OUT STD_LOGIC;
		 mem_ck_n : OUT STD_LOGIC;
		 mem_cs_n : OUT STD_LOGIC;
		 mem_dm : OUT STD_LOGIC;
		 mem_ref_n : OUT STD_LOGIC;
		 mem_we_n : OUT STD_LOGIC;
		 avl_rdata_valid : OUT STD_LOGIC;
		 avl_ready : OUT STD_LOGIC;
		 local_init_done : OUT STD_LOGIC;
		 local_cal_success : OUT STD_LOGIC;
		 local_cal_fail : OUT STD_LOGIC;
		 pll_mem_clk : OUT STD_LOGIC;
		 pll_write_clk : OUT STD_LOGIC;
		 pll_locked : OUT STD_LOGIC;
		 pll_write_clk_pre_phy_clk : OUT STD_LOGIC;
		 pll_addr_cmd_clk : OUT STD_LOGIC;
		 pll_avl_clk : OUT STD_LOGIC;
		 pll_config_clk : OUT STD_LOGIC;
		 pll_mem_phy_clk : OUT STD_LOGIC;
		 afi_phy_clk : OUT STD_LOGIC;
		 pll_avl_phy_clk : OUT STD_LOGIC;
		 avl_rdata : OUT STD_LOGIC_VECTOR(143 DOWNTO 0);
		 mem_a : OUT STD_LOGIC_VECTOR(18 DOWNTO 0);
		 mem_ba : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 mem_dk : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mem_dk_n : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tx_manager
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 L1A_Align : IN STD_LOGIC;
		 need_read : IN STD_LOGIC;
		 one_adc_finish_read : IN STD_LOGIC;
		 error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 evt_tx : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 start_read : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sfp_5g_block
	PORT(pll_ref_clk : IN STD_LOGIC;
		 phy_mgmt_clk : IN STD_LOGIC;
		 phy_mgmt_clk_reset : IN STD_LOGIC;
		 a_txdatak : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b_txdatak : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 bin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 c_txdatak : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 cin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 d_txdatak : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 e_txdatak : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ein : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SFP_rx_in : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Test_0 : OUT STD_LOGIC;
		 Test_1 : OUT STD_LOGIC;
		 a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 a_rxdatak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b_rxdatak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 c : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 c_rxdatak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 d_rxdatak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 e : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 e_rxdatak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SFP_Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dff16
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT input_control
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 trig_00 : IN STD_LOGIC;
		 trig_01 : IN STD_LOGIC;
		 input_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux32_nodly
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2b
	PORT(data1 : IN STD_LOGIC;
		 data0 : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT dff32
	PORT(clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT live_cnt
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 live : IN STD_LOGIC;
		 LIVE_rst : OUT STD_LOGIC;
		 cnt : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_set2
	PORT(clock : IN STD_LOGIC;
		 in00 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in01 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in02 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in03 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in04 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in05 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in06 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in07 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in08 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in09 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out00 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out01 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out02 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out03 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out04 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 out05 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out06 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out07 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out08 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out09 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT l1a_discriminator
	PORT(clk : IN STD_LOGIC;
		 in : IN STD_LOGIC;
		 L1A : OUT STD_LOGIC;
		 PL1A : OUT STD_LOGIC;
		 PS : OUT STD_LOGIC;
		 ALIGN : OUT STD_LOGIC;
		 DELTA : OUT STD_LOGIC;
		 RST : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT trig_counter
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 L1A : IN STD_LOGIC;
		 PL1A : IN STD_LOGIC;
		 PS : IN STD_LOGIC;
		 ALIGN : IN STD_LOGIC;
		 DELTA : IN STD_LOGIC;
		 cnt_ALIGN : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cnt_DELTA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cnt_L1A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cnt_PL1A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cnt_PS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT vme_ram_write
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 trig_in : IN STD_LOGIC;
		 wr_ena : OUT STD_LOGIC;
		 wr_addr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT l1a_checker_part2
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 start_check : IN STD_LOGIC;
		 rd_req : OUT STD_LOGIC;
		 rd_addr : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ol_controller_32
	PORT(clk : IN STD_LOGIC;
		 LIVE : IN STD_LOGIC;
		 ena_rx : IN STD_LOGIC;
		 data_rx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data_tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ena_tx : OUT STD_LOGIC;
		 error : OUT STD_LOGIC;
		 send_err : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 datak : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 delay_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lv3_info
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 LIVE : IN STD_LOGIC;
		 trig_delta : IN STD_LOGIC;
		 delay : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rx_evt_00 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 rx_evt_01 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 tx_evt_00 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 tx_evt_01 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 error : OUT STD_LOGIC;
		 data_valid : OUT STD_LOGIC;
		 packet_lv2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT count_valid
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 tlk_err : IN STD_LOGIC;
		 LIVE : IN STD_LOGIC;
		 dval : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT sfp_gxblock_x5new
	PORT(pll_ref_clk : IN STD_LOGIC;
		 phy_mgmt_clk : IN STD_LOGIC;
		 phy_mgmt_clk_reset : IN STD_LOGIC;
		 a_txdatak : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 ain : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b_txdatak : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 bin : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 c_txdatak : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 cin : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 d_txdatak : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e_txdatak : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 ein : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 SFP_rx_in : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Test_0 : OUT STD_LOGIC;
		 Test_1 : OUT STD_LOGIC;
		 a : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 a_rxdatak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b_rxdatak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 c : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 c_rxdatak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 d : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 d_rxdatak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 e : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 e_rxdatak : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 SFP_Out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT max_mem
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 current_mem_usage : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 max_mem_usage : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tapdel_10
	PORT(in : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 out : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tdc_vme
	PORT(vmewrite : IN STD_LOGIC;
		 vmeas : IN STD_LOGIC;
		 vmeds : IN STD_LOGIC;
		 id : IN STD_LOGIC;
		 sysclk : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(26 DOWNTO 2);
		 data : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data8 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_data9 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_bus0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_bus1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_bus2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_bus3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_bus4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg100 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg101 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg102 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg103 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg104 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg105 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg106 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg107 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg108 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg109 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg110 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg111 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg112 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg113 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg114 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg115 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg116 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg117 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg118 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg119 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 status_reg120 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 test_mode : OUT STD_LOGIC;
		 reset : OUT STD_LOGIC;
		 ena_simu : OUT STD_LOGIC;
		 SPI_start : OUT STD_LOGIC;
		 vmel2a_mode : OUT STD_LOGIC;
		 reset1 : OUT STD_LOGIC;
		 halt_mode : OUT STD_LOGIC;
		 vme_wr_en1 : OUT STD_LOGIC;
		 vme_wr_en2 : OUT STD_LOGIC;
		 vme_wr_en3 : OUT STD_LOGIC;
		 vme_wr_en4 : OUT STD_LOGIC;
		 vme_wr_en5 : OUT STD_LOGIC;
		 vme_wr_en6 : OUT STD_LOGIC;
		 vme_wr_en7 : OUT STD_LOGIC;
		 vme_wr_en8 : OUT STD_LOGIC;
		 reg20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg21 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg22 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg23 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg24 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg25 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg26 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg27 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg28 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg29 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg30 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg31 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg33 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg34 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg35 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg36 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg37 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg38 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 reg39 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register7 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 register8 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT vme_thing
	PORT(In1 : IN STD_LOGIC;
		 In2 : IN STD_LOGIC;
		 In3 : IN STD_LOGIC;
		 In4 : IN STD_LOGIC;
		 In5 : IN STD_LOGIC;
		 In6 : IN STD_LOGIC;
		 In15 : IN STD_LOGIC;
		 In16 : IN STD_LOGIC;
		 In17 : IN STD_LOGIC;
		 In18 : IN STD_LOGIC;
		 In19 : IN STD_LOGIC;
		 In20 : IN STD_LOGIC;
		 In21 : IN STD_LOGIC;
		 In22 : IN STD_LOGIC;
		 In23 : IN STD_LOGIC;
		 Outclk : IN STD_LOGIC;
		 In30 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In31 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In32 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In33 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In34 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In35 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In36 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In37 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In38 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In39 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In40 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In41 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In42 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In43 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In44 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In45 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In46 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In47 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In48 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In49 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In50 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In51 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In52 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In53 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In54 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In55 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In56 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 In57 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out1 : OUT STD_LOGIC;
		 Out2 : OUT STD_LOGIC;
		 Out3 : OUT STD_LOGIC;
		 Out4 : OUT STD_LOGIC;
		 Out5 : OUT STD_LOGIC;
		 Out6 : OUT STD_LOGIC;
		 Out15 : OUT STD_LOGIC;
		 Out16 : OUT STD_LOGIC;
		 Out17 : OUT STD_LOGIC;
		 Out18 : OUT STD_LOGIC;
		 Out19 : OUT STD_LOGIC;
		 Out20 : OUT STD_LOGIC;
		 Out21 : OUT STD_LOGIC;
		 Out22 : OUT STD_LOGIC;
		 Out23 : OUT STD_LOGIC;
		 Out30 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out31 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out33 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out34 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out35 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out36 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out37 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out38 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out39 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out40 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out41 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out42 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out43 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out44 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out45 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out46 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out47 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out48 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out49 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out50 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out51 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out52 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out53 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out54 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out55 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out56 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Out57 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	00_Fiber_in :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	01_Fiber_in :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	02_Fiber_in :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	03_Fiber_in :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	04_Fiber_in :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	05_data_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	05_data_in_fix :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	05_Fiber_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	06_cb_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	06_data_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	06_data_in_fix :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	06_Fiber_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	06_Simu_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	07_data_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	07_data_in_fix :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	07_Fiber_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	08_cb_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	08_data_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	08_data_in_fix :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	08_Fiber_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	08_Simu_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	09_data_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	09_data_in_fix :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	09_Fiber_in :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	_dalayed_ds_in :  STD_LOGIC;
SIGNAL	_dalayed_modsel_in :  STD_LOGIC;
SIGNAL	adc_data_valid :  STD_LOGIC;
SIGNAL	addr :  STD_LOGIC_VECTOR(26 DOWNTO 2);
SIGNAL	auto_rst :  STD_LOGIC;
SIGNAL	check_in_progress :  STD_LOGIC;
SIGNAL	cnt_DELTA :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	cnt_eop_00 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	cnt_eop_01 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	counter7_out :  STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL	counter_show :  STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL	crate_id_00 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	crate_id_01 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	data_ena :  STD_LOGIC;
SIGNAL	data_mem0 :  STD_LOGIC;
SIGNAL	data_mem0160 :  STD_LOGIC;
SIGNAL	data_mem0161 :  STD_LOGIC;
SIGNAL	data_mem0162 :  STD_LOGIC;
SIGNAL	data_mem0163 :  STD_LOGIC;
SIGNAL	data_mem0164 :  STD_LOGIC;
SIGNAL	data_mem0165 :  STD_LOGIC;
SIGNAL	data_mem0166 :  STD_LOGIC;
SIGNAL	data_mem0167 :  STD_LOGIC;
SIGNAL	data_mem0168 :  STD_LOGIC;
SIGNAL	data_mem0169 :  STD_LOGIC;
SIGNAL	data_mem0170 :  STD_LOGIC;
SIGNAL	data_mem0171 :  STD_LOGIC;
SIGNAL	data_mem0172 :  STD_LOGIC;
SIGNAL	data_mem0173 :  STD_LOGIC;
SIGNAL	data_mem0174 :  STD_LOGIC;
SIGNAL	data_mem0175 :  STD_LOGIC;
SIGNAL	data_mem0176 :  STD_LOGIC;
SIGNAL	data_mem0177 :  STD_LOGIC;
SIGNAL	data_mem0178 :  STD_LOGIC;
SIGNAL	data_mem0179 :  STD_LOGIC;
SIGNAL	data_mem0180 :  STD_LOGIC;
SIGNAL	data_mem0181 :  STD_LOGIC;
SIGNAL	data_mem0182 :  STD_LOGIC;
SIGNAL	data_mem0183 :  STD_LOGIC;
SIGNAL	data_mem0184 :  STD_LOGIC;
SIGNAL	data_mem0185 :  STD_LOGIC;
SIGNAL	data_mem0186 :  STD_LOGIC;
SIGNAL	data_mem0187 :  STD_LOGIC;
SIGNAL	data_mem0188 :  STD_LOGIC;
SIGNAL	data_mem0189 :  STD_LOGIC;
SIGNAL	data_mem0190 :  STD_LOGIC;
SIGNAL	data_mem0191 :  STD_LOGIC;
SIGNAL	data_mem0192 :  STD_LOGIC;
SIGNAL	data_mem0193 :  STD_LOGIC;
SIGNAL	data_mem0194 :  STD_LOGIC;
SIGNAL	data_mem0195 :  STD_LOGIC;
SIGNAL	data_mem0196 :  STD_LOGIC;
SIGNAL	data_mem0197 :  STD_LOGIC;
SIGNAL	data_mem0198 :  STD_LOGIC;
SIGNAL	data_mem0199 :  STD_LOGIC;
SIGNAL	data_mem0200 :  STD_LOGIC;
SIGNAL	data_mem0201 :  STD_LOGIC;
SIGNAL	data_mem0202 :  STD_LOGIC;
SIGNAL	data_mem0203 :  STD_LOGIC;
SIGNAL	data_mem0204 :  STD_LOGIC;
SIGNAL	data_mem0205 :  STD_LOGIC;
SIGNAL	data_mem0206 :  STD_LOGIC;
SIGNAL	data_mem0207 :  STD_LOGIC;
SIGNAL	data_mem0208 :  STD_LOGIC;
SIGNAL	data_mem0209 :  STD_LOGIC;
SIGNAL	data_mem0210 :  STD_LOGIC;
SIGNAL	data_mem0211 :  STD_LOGIC;
SIGNAL	data_mem0212 :  STD_LOGIC;
SIGNAL	data_mem0213 :  STD_LOGIC;
SIGNAL	data_mem0214 :  STD_LOGIC;
SIGNAL	data_mem0215 :  STD_LOGIC;
SIGNAL	data_mem0216 :  STD_LOGIC;
SIGNAL	data_mem0217 :  STD_LOGIC;
SIGNAL	data_mem0218 :  STD_LOGIC;
SIGNAL	data_mem0219 :  STD_LOGIC;
SIGNAL	data_mem0220 :  STD_LOGIC;
SIGNAL	data_mem0221 :  STD_LOGIC;
SIGNAL	data_mem0222 :  STD_LOGIC;
SIGNAL	data_mem0223 :  STD_LOGIC;
SIGNAL	data_mem0224 :  STD_LOGIC;
SIGNAL	data_mem0225 :  STD_LOGIC;
SIGNAL	data_mem0226 :  STD_LOGIC;
SIGNAL	data_mem0227 :  STD_LOGIC;
SIGNAL	data_mem0228 :  STD_LOGIC;
SIGNAL	data_mem0229 :  STD_LOGIC;
SIGNAL	data_mem0230 :  STD_LOGIC;
SIGNAL	data_mem0231 :  STD_LOGIC;
SIGNAL	data_mem0232 :  STD_LOGIC;
SIGNAL	data_mem0233 :  STD_LOGIC;
SIGNAL	data_mem0234 :  STD_LOGIC;
SIGNAL	data_mem0235 :  STD_LOGIC;
SIGNAL	data_mem0236 :  STD_LOGIC;
SIGNAL	data_mem0237 :  STD_LOGIC;
SIGNAL	data_mem0238 :  STD_LOGIC;
SIGNAL	data_mem0239 :  STD_LOGIC;
SIGNAL	data_mem0240 :  STD_LOGIC;
SIGNAL	data_mem0241 :  STD_LOGIC;
SIGNAL	data_mem0242 :  STD_LOGIC;
SIGNAL	data_mem0243 :  STD_LOGIC;
SIGNAL	data_mem0244 :  STD_LOGIC;
SIGNAL	data_mem0245 :  STD_LOGIC;
SIGNAL	data_mem0246 :  STD_LOGIC;
SIGNAL	data_mem0247 :  STD_LOGIC;
SIGNAL	data_mem0248 :  STD_LOGIC;
SIGNAL	data_mem0249 :  STD_LOGIC;
SIGNAL	data_mem0250 :  STD_LOGIC;
SIGNAL	data_mem0251 :  STD_LOGIC;
SIGNAL	data_mem0252 :  STD_LOGIC;
SIGNAL	data_mem0253 :  STD_LOGIC;
SIGNAL	data_mem0254 :  STD_LOGIC;
SIGNAL	data_mem0255 :  STD_LOGIC;
SIGNAL	data_mem0256 :  STD_LOGIC;
SIGNAL	data_mem0257 :  STD_LOGIC;
SIGNAL	data_mem0258 :  STD_LOGIC;
SIGNAL	data_mem0259 :  STD_LOGIC;
SIGNAL	data_mem0260 :  STD_LOGIC;
SIGNAL	data_mem0261 :  STD_LOGIC;
SIGNAL	data_mem0262 :  STD_LOGIC;
SIGNAL	data_mem0263 :  STD_LOGIC;
SIGNAL	data_mem0264 :  STD_LOGIC;
SIGNAL	data_mem0265 :  STD_LOGIC;
SIGNAL	data_mem0266 :  STD_LOGIC;
SIGNAL	data_mem0267 :  STD_LOGIC;
SIGNAL	data_mem0268 :  STD_LOGIC;
SIGNAL	data_mem0269 :  STD_LOGIC;
SIGNAL	data_mem0270 :  STD_LOGIC;
SIGNAL	data_mem0271 :  STD_LOGIC;
SIGNAL	data_mem0272 :  STD_LOGIC;
SIGNAL	data_mem0273 :  STD_LOGIC;
SIGNAL	data_mem0274 :  STD_LOGIC;
SIGNAL	data_mem0275 :  STD_LOGIC;
SIGNAL	data_mem0276 :  STD_LOGIC;
SIGNAL	data_mem0277 :  STD_LOGIC;
SIGNAL	data_mem0278 :  STD_LOGIC;
SIGNAL	data_mem0279 :  STD_LOGIC;
SIGNAL	data_mem0280 :  STD_LOGIC;
SIGNAL	data_mem0281 :  STD_LOGIC;
SIGNAL	data_mem0282 :  STD_LOGIC;
SIGNAL	data_mem0283 :  STD_LOGIC;
SIGNAL	data_mem0284 :  STD_LOGIC;
SIGNAL	data_mem0285 :  STD_LOGIC;
SIGNAL	data_mem0286 :  STD_LOGIC;
SIGNAL	data_mem0287 :  STD_LOGIC;
SIGNAL	data_mem1 :  STD_LOGIC;
SIGNAL	data_mem10 :  STD_LOGIC;
SIGNAL	data_mem11 :  STD_LOGIC;
SIGNAL	data_mem12 :  STD_LOGIC;
SIGNAL	data_mem13 :  STD_LOGIC;
SIGNAL	data_mem14 :  STD_LOGIC;
SIGNAL	data_mem15 :  STD_LOGIC;
SIGNAL	data_mem16 :  STD_LOGIC;
SIGNAL	data_mem17 :  STD_LOGIC;
SIGNAL	data_mem18 :  STD_LOGIC;
SIGNAL	data_mem19 :  STD_LOGIC;
SIGNAL	data_mem2 :  STD_LOGIC;
SIGNAL	data_mem20 :  STD_LOGIC;
SIGNAL	data_mem21 :  STD_LOGIC;
SIGNAL	data_mem22 :  STD_LOGIC;
SIGNAL	data_mem23 :  STD_LOGIC;
SIGNAL	data_mem24 :  STD_LOGIC;
SIGNAL	data_mem25 :  STD_LOGIC;
SIGNAL	data_mem26 :  STD_LOGIC;
SIGNAL	data_mem27 :  STD_LOGIC;
SIGNAL	data_mem28 :  STD_LOGIC;
SIGNAL	data_mem29 :  STD_LOGIC;
SIGNAL	data_mem3 :  STD_LOGIC;
SIGNAL	data_mem30 :  STD_LOGIC;
SIGNAL	data_mem31 :  STD_LOGIC;
SIGNAL	data_mem4 :  STD_LOGIC;
SIGNAL	data_mem5 :  STD_LOGIC;
SIGNAL	data_mem6 :  STD_LOGIC;
SIGNAL	data_mem7 :  STD_LOGIC;
SIGNAL	data_mem8 :  STD_LOGIC;
SIGNAL	data_mem9 :  STD_LOGIC;
SIGNAL	data_out_test :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	delay_mode_05 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	delay_mode_06 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	delay_mode_07 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	delay_mode_08 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	delay_mode_09 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	delta_rst :  STD_LOGIC;
SIGNAL	dest_ip :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	DigiIn :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	ENA_RX :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	ether_header_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ether_header_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ether_header_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ether_type :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	event_finish_write :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	event_id :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	evt_rx_00 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	evt_rx_01 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	evt_tx :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	fanout_clock :  STD_LOGIC;
SIGNAL	ff_rx_data_00 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_01 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_02 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_03 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_04 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_05 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_06 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_rx_data_07 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_tx_a_full :  STD_LOGIC;
SIGNAL	ff_tx_data_00 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_tx_data_01 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_tx_data_out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ff_tx_eop_00 :  STD_LOGIC;
SIGNAL	ff_tx_eop_01 :  STD_LOGIC;
SIGNAL	ff_tx_eop_out :  STD_LOGIC;
SIGNAL	ff_tx_rdy :  STD_LOGIC;
SIGNAL	ff_tx_septy :  STD_LOGIC;
SIGNAL	ff_tx_sop_00 :  STD_LOGIC;
SIGNAL	ff_tx_sop_01 :  STD_LOGIC;
SIGNAL	ff_tx_sop_out :  STD_LOGIC;
SIGNAL	ff_tx_wren_00 :  STD_LOGIC;
SIGNAL	ff_tx_wren_01 :  STD_LOGIC;
SIGNAL	ff_tx_wren_out :  STD_LOGIC;
SIGNAL	FIFO_in_delay :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	finish_read_00 :  STD_LOGIC;
SIGNAL	finish_read_01 :  STD_LOGIC;
SIGNAL	fromdel :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	glink_on_ch_12_14_active :  STD_LOGIC;
SIGNAL	input_mode :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	input_switch :  STD_LOGIC;
SIGNAL	L1A_00 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	L1A_00_delay :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	L1A_01 :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	L1A_check_error :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	L1A_check_part1_error :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	L1A_rd_addr_00 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	L1A_rd_addr_01 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	L1A_rd_req_00 :  STD_LOGIC;
SIGNAL	L1A_rd_req_01 :  STD_LOGIC;
SIGNAL	L1A_trig_delayed :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	LIVE :  STD_LOGIC;
SIGNAL	LIVE_delay :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	LIVE_rst :  STD_LOGIC;
SIGNAL	logic_reset :  STD_LOGIC;
SIGNAL	lv2_info_error :  STD_LOGIC;
SIGNAL	lv2_info_valid :  STD_LOGIC;
SIGNAL	m_register_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_28 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_29 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_30 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_31 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_32 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_33 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_34 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_35 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_36 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_37 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_38 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	m_register_39 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	mac_config :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	max_mem_00 :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	max_mem_01 :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	max_payload :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	mem_upper_limit :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	mem_usage_00 :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	mem_usage_01 :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	memory_error_00 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	memory_error_01 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	MemWrite_page :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	more_counter :  STD_LOGIC_VECTOR(24 DOWNTO 0);
SIGNAL	need_check :  STD_LOGIC;
SIGNAL	need_read :  STD_LOGIC;
SIGNAL	nListenPorts :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	OFC_manager_error_00 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	OFC_manager_error_01 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	OL_mode :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	one_adc_finish_check :  STD_LOGIC;
SIGNAL	one_adc_finish_read :  STD_LOGIC;
SIGNAL	output_err :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	packet_lv2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	phy_mgmt_clk_reset_1 :  STD_LOGIC;
SIGNAL	port_id :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_1data8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_data9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_memory5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_memory6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_memory7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rd_memory8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	reset :  STD_LOGIC;
SIGNAL	reset_mode :  STD_LOGIC;
SIGNAL	reset_PLLs :  STD_LOGIC;
SIGNAL	send_data_ena :  STD_LOGIC;
SIGNAL	send_err :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	show_counter :  STD_LOGIC_VECTOR(24 DOWNTO 0);
SIGNAL	simu_ram_number_01 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	simu_ram_number_02 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	source_ip :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	source_mac_addr :  STD_LOGIC_VECTOR(47 DOWNTO 0);
SIGNAL	SPI_start :  STD_LOGIC;
SIGNAL	spill_id :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	spy_mem_mux :  STD_LOGIC;
SIGNAL	start_check :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	start_read :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	start_read_00 :  STD_LOGIC;
SIGNAL	start_read_01 :  STD_LOGIC;
SIGNAL	start_read_pulse :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	status :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg109 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg110 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg111 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg112 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg113 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg114 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg115 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg116 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg117 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg118 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg119 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	status_reg120 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	test_counter :  STD_LOGIC_VECTOR(24 DOWNTO 0);
SIGNAL	test_mode :  STD_LOGIC;
SIGNAL	The_clock :  STD_LOGIC;
SIGNAL	TLK_Err :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	TLK_err_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	total_packet_sent_00 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	total_packet_sent_01 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	trig_delay_ram :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	trig_delta :  STD_LOGIC;
SIGNAL	trigger_active :  STD_LOGIC;
SIGNAL	TrigIn :  STD_LOGIC;
SIGNAL	tx_manger_error :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	vme_halt :  STD_LOGIC;
SIGNAL	vme_ram_wr_addr :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	vme_ram_wr_ena :  STD_LOGIC;
SIGNAL	vme_register_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_register_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	vme_service_8ns :  STD_LOGIC;
SIGNAL	vme_service_clock :  STD_LOGIC;
SIGNAL	vmeas :  STD_LOGIC;
SIGNAL	vmeds :  STD_LOGIC;
SIGNAL	vmewrite :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_208 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC_VECTOR(0 TO 7);
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_209 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_210 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_77 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_84 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_85 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_86 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_87 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_88 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_89 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_90 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_91 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_92 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_93 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_94 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_95 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_96 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_97 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_98 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_100 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_101 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_102 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_103 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_104 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_105 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_106 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_107 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_108 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_109 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_110 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_111 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_112 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_113 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_114 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_115 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_116 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_117 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_118 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_119 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_120 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_121 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_122 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_211 :  STD_LOGIC_VECTOR(0 TO 14);
SIGNAL	SYNTHESIZED_WIRE_125 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_126 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_127 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_128 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_129 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_130 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_131 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_132 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_133 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_134 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_135 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_136 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_137 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_138 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_139 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_140 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_142 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_143 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_144 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_212 :  STD_LOGIC_VECTOR(0 TO 31);
SIGNAL	SYNTHESIZED_WIRE_213 :  STD_LOGIC_VECTOR(0 TO 31);
SIGNAL	SYNTHESIZED_WIRE_159 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_160 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_161 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_162 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_163 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_164 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_165 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_166 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_167 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_168 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_169 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_170 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_171 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_172 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_173 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_174 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_175 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_176 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_177 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_178 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_179 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_180 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_181 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_182 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_183 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_184 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_185 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_186 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_187 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_188 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_189 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_190 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_191 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_192 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_193 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_194 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_195 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_196 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_197 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_198 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_199 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_200 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_201 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_202 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_204 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_205 :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN 
transceivers_OE <= SYNTHESIZED_WIRE_30;
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_4 <= '0';
SYNTHESIZED_WIRE_8 <= '0';
SYNTHESIZED_WIRE_13 <= "00000000";
SYNTHESIZED_WIRE_14 <= "00000000";
SYNTHESIZED_WIRE_15 <= "00000000";
SYNTHESIZED_WIRE_16 <= "00000000";
SYNTHESIZED_WIRE_27 <= "00000000";
SYNTHESIZED_WIRE_28 <= "00000000";
SYNTHESIZED_WIRE_29 <= '0';
SYNTHESIZED_WIRE_31 <= "00000000";
SYNTHESIZED_WIRE_32 <= "00000000";
SYNTHESIZED_WIRE_33 <= "00000000";
SYNTHESIZED_WIRE_34 <= "00000000";
SYNTHESIZED_WIRE_35 <= "00000000";
SYNTHESIZED_WIRE_36 <= "00000000";
SYNTHESIZED_WIRE_37 <= "00000000";
SYNTHESIZED_WIRE_38 <= "00000000";
SYNTHESIZED_WIRE_39 <= "00000000";
SYNTHESIZED_WIRE_40 <= "00000000";
SYNTHESIZED_WIRE_41 <= "00000000";
SYNTHESIZED_WIRE_42 <= "00000000";
SYNTHESIZED_WIRE_43 <= "00000000";
SYNTHESIZED_WIRE_44 <= "00000000";
SYNTHESIZED_WIRE_45 <= "00000000";
SYNTHESIZED_WIRE_46 <= "00000000";
SYNTHESIZED_WIRE_47 <= "00000000";
SYNTHESIZED_WIRE_48 <= "00000000";
SYNTHESIZED_WIRE_50 <= "00000000";
SYNTHESIZED_WIRE_51 <= "00000000";
SYNTHESIZED_WIRE_52 <= "00000000";
SYNTHESIZED_WIRE_53 <= "00000000";
SYNTHESIZED_WIRE_54 <= "00000000";
SYNTHESIZED_WIRE_55 <= "00000000";
SYNTHESIZED_WIRE_56 <= "00000000";
SYNTHESIZED_WIRE_57 <= "00000000";
SYNTHESIZED_WIRE_58 <= "00000000";
SYNTHESIZED_WIRE_59 <= "00000000";
SYNTHESIZED_WIRE_60 <= "00000000";
SYNTHESIZED_WIRE_61 <= "00000000";
SYNTHESIZED_WIRE_211 <= "000000000000000";
SYNTHESIZED_WIRE_126 <= '0';
SYNTHESIZED_WIRE_138 <= '1';
SYNTHESIZED_WIRE_139 <= '1';
SYNTHESIZED_WIRE_142 <= '1';
SYNTHESIZED_WIRE_143 <= '1';
SYNTHESIZED_WIRE_144 <= '0';
SYNTHESIZED_WIRE_212 <= "00000000000000000000000000000000";
SYNTHESIZED_WIRE_213 <= "00000000000000000000000000000000";
SYNTHESIZED_WIRE_159 <= '1';

data_mem31 <= GDFX_TEMP_SIGNAL_0(31);
data_mem30 <= GDFX_TEMP_SIGNAL_0(30);
data_mem29 <= GDFX_TEMP_SIGNAL_0(29);
data_mem28 <= GDFX_TEMP_SIGNAL_0(28);
data_mem27 <= GDFX_TEMP_SIGNAL_0(27);
data_mem26 <= GDFX_TEMP_SIGNAL_0(26);
data_mem25 <= GDFX_TEMP_SIGNAL_0(25);
data_mem24 <= GDFX_TEMP_SIGNAL_0(24);
data_mem23 <= GDFX_TEMP_SIGNAL_0(23);
data_mem22 <= GDFX_TEMP_SIGNAL_0(22);
data_mem21 <= GDFX_TEMP_SIGNAL_0(21);
data_mem20 <= GDFX_TEMP_SIGNAL_0(20);
data_mem19 <= GDFX_TEMP_SIGNAL_0(19);
data_mem18 <= GDFX_TEMP_SIGNAL_0(18);
data_mem17 <= GDFX_TEMP_SIGNAL_0(17);
data_mem16 <= GDFX_TEMP_SIGNAL_0(16);
data_mem15 <= GDFX_TEMP_SIGNAL_0(15);
data_mem14 <= GDFX_TEMP_SIGNAL_0(14);
data_mem13 <= GDFX_TEMP_SIGNAL_0(13);
data_mem12 <= GDFX_TEMP_SIGNAL_0(12);
data_mem11 <= GDFX_TEMP_SIGNAL_0(11);
data_mem10 <= GDFX_TEMP_SIGNAL_0(10);
data_mem9 <= GDFX_TEMP_SIGNAL_0(9);
data_mem8 <= GDFX_TEMP_SIGNAL_0(8);
data_mem7 <= GDFX_TEMP_SIGNAL_0(7);
data_mem6 <= GDFX_TEMP_SIGNAL_0(6);
data_mem5 <= GDFX_TEMP_SIGNAL_0(5);
data_mem4 <= GDFX_TEMP_SIGNAL_0(4);
data_mem3 <= GDFX_TEMP_SIGNAL_0(3);
data_mem2 <= GDFX_TEMP_SIGNAL_0(2);
data_mem1 <= GDFX_TEMP_SIGNAL_0(1);
data_mem0 <= GDFX_TEMP_SIGNAL_0(0);

GDFX_TEMP_SIGNAL_1 <= (data_mem31 & data_mem30 & data_mem29 & data_mem28 & data_mem27 & data_mem26 & data_mem25 & data_mem24 & data_mem23 & data_mem22 & data_mem21 & data_mem20 & data_mem19 & data_mem18 & data_mem17 & data_mem16 & data_mem15 & data_mem14 & data_mem13 & data_mem12 & data_mem11 & data_mem10 & data_mem9 & data_mem8 & data_mem7 & data_mem6 & data_mem5 & data_mem4 & data_mem3 & data_mem2 & data_mem1 & data_mem0);


b2v_inst : counter_show
PORT MAP(clock => vme_service_clock,
		 q => counter_show);


phy_mgmt_clk_reset_1 <= SYNTHESIZED_WIRE_0;



b2v_inst100 : mux32
PORT MAP(clock => The_clock,
		 sel => data_ena,
		 data0x => 08_Simu_in,
		 data1x => 08_data_in,
		 result => SYNTHESIZED_WIRE_97);

led_2 <= counter_show(21);



b2v_inst101 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk1,
		 SFP_rx_in1 => SFP_rx_in1,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 ff_tx_rdy => ff_tx_rdy,
		 ff_tx_septy => ff_tx_septy,
		 SFP_tx_Out1 => SFP_tx_Out1,
		 ff_tx_a_full => ff_tx_a_full);




b2v_inst104 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk1,
		 SFP_rx_in1 => SFP_rx_in2,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out2);



b2v_inst106 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk2,
		 SFP_rx_in1 => SFP_rx_in3,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out3);


b2v_inst107 : ol_controller
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(0),
		 data_rx => 00_Fiber_in,
		 data_tx => SYNTHESIZED_WIRE_208,
		 error => TLK_Err(0),
		 send_err => send_err(0),
		 data_out => SYNTHESIZED_WIRE_21,
		 datak => SYNTHESIZED_WIRE_26,
		 mode => OL_mode);



b2v_inst109 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk2,
		 SFP_rx_in1 => SFP_rx_in4,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out4);



b2v_inst110 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk3,
		 SFP_rx_in1 => SFP_rx_in5,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out5);


b2v_inst111 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk3,
		 SFP_rx_in1 => SFP_rx_in6,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out6);


b2v_inst112 : counter16
PORT MAP(clock => The_clock,
		 q => SYNTHESIZED_WIRE_208);

06_data_in_fix(31 DOWNTO 16) <= 06_Fiber_in(15 DOWNTO 0);



b2v_inst114 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk4,
		 SFP_rx_in1 => SFP_rx_in7,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out7);


b2v_inst115 : ethernet_optical_block
PORT MAP(ff_tx_eop => ff_tx_eop_out,
		 ff_tx_sop => ff_tx_sop_out,
		 ff_tx_wren => ff_tx_wren_out,
		 clock => The_clock,
		 reset => reset,
		 SFP_pll_ref_clk1 => SFP_pll_ref_clk4,
		 SFP_rx_in1 => SFP_rx_in8,
		 ff_tx_data => ff_tx_data_out,
		 mac_config => mac_config,
		 souce_mac_addr => source_mac_addr,
		 SFP_tx_Out1 => SFP_tx_Out8);

05_data_in_fix(31 DOWNTO 16) <= 05_Fiber_in(15 DOWNTO 0);



b2v_inst117 : mux32
PORT MAP(clock => The_clock,
		 sel => delay_mode_05(0),
		 data0x => 05_Fiber_in,
		 data1x => 05_data_in_fix);


data_ena <= adc_data_valid AND input_switch;


b2v_inst119 : ofc1_manager
PORT MAP(The_clock => The_clock,
		 reset => logic_reset,
		 L1A_rd_req => L1A_rd_req_00,
		 ff_tx_rdy => ff_tx_rdy,
		 ff_tx_a_full => ff_tx_a_full,
		 ff_tx_septy => ff_tx_septy,
		 start_read_pulse => start_read_pulse(0),
		 lv2_info_valid => SYNTHESIZED_WIRE_2,
		 crate_id => crate_id_00,
		 data_in => 06_cb_in,
		 dest_ip => dest_ip,
		 ether_header_0 => ether_header_0,
		 ether_header_1 => ether_header_1,
		 ether_header_2 => ether_header_2,
		 ether_type => ether_type,
		 event_id => event_id,
		 FIFO_in_delay => FIFO_in_delay,
		 L1A_rd_addr => L1A_rd_addr_00,
		 lv2_packet => SYNTHESIZED_WIRE_3,
		 max_payload => max_payload,
		 mem_upper_limit => mem_upper_limit,
		 nListenPorts => nListenPorts,
		 port_id => port_id,
		 source_ip => source_ip,
		 spill_id => spill_id,
		 ff_tx_wren => ff_tx_wren_00,
		 ff_tx_eop => ff_tx_eop_00,
		 ff_tx_sop => ff_tx_sop_00,
		 event_finish_write => event_finish_write(0),
		 event_finish_read => finish_read_00,
		 event_start_read => start_read_00,
		 error_out => OFC_manager_error_00,
		 ff_tx_data => ff_tx_data_00,
		 L1A_out => L1A_00,
		 mem_err => memory_error_00,
		 mem_usage => mem_usage_00);

led_1 <= vme_halt;



b2v_inst120 : counter16
PORT MAP(clock => The_clock,
		 q => data_out_test(15 DOWNTO 0));


b2v_inst121 : ofc1_manager
PORT MAP(The_clock => The_clock,
		 reset => logic_reset,
		 L1A_rd_req => L1A_rd_req_01,
		 ff_tx_rdy => ff_tx_rdy,
		 ff_tx_a_full => ff_tx_a_full,
		 ff_tx_septy => ff_tx_septy,
		 start_read_pulse => start_read_pulse(1),
		 lv2_info_valid => lv2_info_valid,
		 crate_id => crate_id_01,
		 data_in => 08_cb_in,
		 dest_ip => dest_ip,
		 ether_header_0 => ether_header_0,
		 ether_header_1 => ether_header_1,
		 ether_header_2 => ether_header_2,
		 ether_type => ether_type,
		 event_id => event_id,
		 FIFO_in_delay => FIFO_in_delay,
		 L1A_rd_addr => L1A_rd_addr_01,
		 lv2_packet => packet_lv2(14 DOWNTO 0),
		 max_payload => max_payload,
		 mem_upper_limit => mem_upper_limit,
		 nListenPorts => nListenPorts,
		 port_id => port_id,
		 source_ip => source_ip,
		 spill_id => spill_id,
		 ff_tx_wren => ff_tx_wren_01,
		 ff_tx_eop => ff_tx_eop_01,
		 ff_tx_sop => ff_tx_sop_01,
		 event_finish_write => event_finish_write(1),
		 event_finish_read => finish_read_01,
		 event_start_read => start_read_01,
		 error_out => OFC_manager_error_01,
		 ff_tx_data => ff_tx_data_01,
		 L1A_out => L1A_01,
		 mem_err => memory_error_01,
		 mem_usage => mem_usage_01);

SYNTHESIZED_WIRE_210 <= SYNTHESIZED_WIRE_4;



b2v_inst123 : trig_cnt
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 trig_in => start_read_pulse,
		 trig_cnt => event_id);

debug(16) <= reset_PLLs;



b2v_inst125 : mux_2b_clk
PORT MAP(data1 => LIVE_rst,
		 data0 => delta_rst,
		 clock => The_clock,
		 sel => reset_mode,
		 result => auto_rst);


b2v_inst126 : compare_01
PORT MAP(dataa => vme_register_2(4 DOWNTO 0),
		 aeb => SYNTHESIZED_WIRE_204);


b2v_inst127 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => start_read(0),
		 pulse => start_read_pulse(0));


b2v_inst128 : simu_ram
PORT MAP(wren => SYNTHESIZED_WIRE_5,
		 rden => SYNTHESIZED_WIRE_6,
		 wrclock => vmeas,
		 rdclock => The_clock,
		 data => vme_register_1,
		 rdaddress => SYNTHESIZED_WIRE_7,
		 wraddress => vme_register_5(9 DOWNTO 0),
		 q => SYNTHESIZED_WIRE_96);


b2v_inst129 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => vme_register_7(0),
		 pulse => SYNTHESIZED_WIRE_9);

mem_a(19) <= mem_qvld;




b2v_inst131 : simu_ram_read
PORT MAP(clk => The_clock,
		 reset => reset,
		 trigger => SYNTHESIZED_WIRE_9,
		 total_number => simu_ram_number_01,
		 rd_req => SYNTHESIZED_WIRE_6,
		 rd_addr => SYNTHESIZED_WIRE_7);


b2v_inst132 : simu_ram
PORT MAP(wren => SYNTHESIZED_WIRE_10,
		 rden => SYNTHESIZED_WIRE_11,
		 wrclock => vmeas,
		 rdclock => The_clock,
		 data => vme_register_1,
		 rdaddress => SYNTHESIZED_WIRE_12,
		 wraddress => vme_register_5(9 DOWNTO 0),
		 q => SYNTHESIZED_WIRE_101);


b2v_inst133 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => vme_register_7(0),
		 pulse => SYNTHESIZED_WIRE_62);


b2v_inst134 : pll_new
PORT MAP(refclk => CLOCKIN_0,
		 rst => reset_PLLs,
		 refclk1 => CLOCKIN_1,
		 extswitch => ClockSwitch_0,
		 outclk_0 => The_clock,
		 outclk_2 => fanout_clock);


PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(0) = '1') THEN
	SFP0_Control(7) <= SYNTHESIZED_WIRE_13(0);
ELSE
	SFP0_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(1) = '1') THEN
	SFP0_Control(6) <= SYNTHESIZED_WIRE_13(1);
ELSE
	SFP0_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(2) = '1') THEN
	SFP0_Control(5) <= SYNTHESIZED_WIRE_13(2);
ELSE
	SFP0_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(3) = '1') THEN
	SFP0_Control(4) <= SYNTHESIZED_WIRE_13(3);
ELSE
	SFP0_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(4) = '1') THEN
	SFP0_Control(3) <= SYNTHESIZED_WIRE_13(4);
ELSE
	SFP0_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(5) = '1') THEN
	SFP0_Control(2) <= SYNTHESIZED_WIRE_13(5);
ELSE
	SFP0_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(6) = '1') THEN
	SFP0_Control(1) <= SYNTHESIZED_WIRE_13(6);
ELSE
	SFP0_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_13,SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14(7) = '1') THEN
	SFP0_Control(0) <= SYNTHESIZED_WIRE_13(7);
ELSE
	SFP0_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(0) = '1') THEN
	SFP1_Control(7) <= SYNTHESIZED_WIRE_15(0);
ELSE
	SFP1_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(1) = '1') THEN
	SFP1_Control(6) <= SYNTHESIZED_WIRE_15(1);
ELSE
	SFP1_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(2) = '1') THEN
	SFP1_Control(5) <= SYNTHESIZED_WIRE_15(2);
ELSE
	SFP1_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(3) = '1') THEN
	SFP1_Control(4) <= SYNTHESIZED_WIRE_15(3);
ELSE
	SFP1_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(4) = '1') THEN
	SFP1_Control(3) <= SYNTHESIZED_WIRE_15(4);
ELSE
	SFP1_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(5) = '1') THEN
	SFP1_Control(2) <= SYNTHESIZED_WIRE_15(5);
ELSE
	SFP1_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(6) = '1') THEN
	SFP1_Control(1) <= SYNTHESIZED_WIRE_15(6);
ELSE
	SFP1_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16(7) = '1') THEN
	SFP1_Control(0) <= SYNTHESIZED_WIRE_15(7);
ELSE
	SFP1_Control(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst137 : register_set0
PORT MAP(clock => The_clock,
		 in00 => SYNTHESIZED_WIRE_17,
		 in01 => SYNTHESIZED_WIRE_18,
		 in02 => SYNTHESIZED_WIRE_19,
		 in03 => SYNTHESIZED_WIRE_20,
		 in04 => SYNTHESIZED_WIRE_21,
		 in05 => SYNTHESIZED_WIRE_22,
		 in06 => SYNTHESIZED_WIRE_23,
		 in07 => SYNTHESIZED_WIRE_24,
		 in08 => SYNTHESIZED_WIRE_25,
		 in09 => SYNTHESIZED_WIRE_26,
		 out00 => SYNTHESIZED_WIRE_129,
		 out01 => SYNTHESIZED_WIRE_131,
		 out02 => SYNTHESIZED_WIRE_133,
		 out03 => SYNTHESIZED_WIRE_135,
		 out04 => SYNTHESIZED_WIRE_137,
		 out05 => SYNTHESIZED_WIRE_128,
		 out06 => SYNTHESIZED_WIRE_130,
		 out07 => SYNTHESIZED_WIRE_132,
		 out08 => SYNTHESIZED_WIRE_134,
		 out09 => SYNTHESIZED_WIRE_136);


PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(0) = '1') THEN
	SFP2_Control(7) <= SYNTHESIZED_WIRE_27(0);
ELSE
	SFP2_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(1) = '1') THEN
	SFP2_Control(6) <= SYNTHESIZED_WIRE_27(1);
ELSE
	SFP2_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(2) = '1') THEN
	SFP2_Control(5) <= SYNTHESIZED_WIRE_27(2);
ELSE
	SFP2_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(3) = '1') THEN
	SFP2_Control(4) <= SYNTHESIZED_WIRE_27(3);
ELSE
	SFP2_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(4) = '1') THEN
	SFP2_Control(3) <= SYNTHESIZED_WIRE_27(4);
ELSE
	SFP2_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(5) = '1') THEN
	SFP2_Control(2) <= SYNTHESIZED_WIRE_27(5);
ELSE
	SFP2_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(6) = '1') THEN
	SFP2_Control(1) <= SYNTHESIZED_WIRE_27(6);
ELSE
	SFP2_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_27,SYNTHESIZED_WIRE_28)
BEGIN
if (SYNTHESIZED_WIRE_28(7) = '1') THEN
	SFP2_Control(0) <= SYNTHESIZED_WIRE_27(7);
ELSE
	SFP2_Control(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst139 : pll_new
PORT MAP(refclk => CLOCKIN_2,
		 rst => SYNTHESIZED_WIRE_29,
		 refclk1 => CLOCKIN_3,
		 extswitch => ClockSwitch_1,
		 outclk_1 => vme_service_clock);


b2v_inst14 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_30,
		 clock => vme_service_clock,
		 q => SYNTHESIZED_WIRE_49);


PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(0) = '1') THEN
	SFP3_Control(7) <= SYNTHESIZED_WIRE_31(0);
ELSE
	SFP3_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(1) = '1') THEN
	SFP3_Control(6) <= SYNTHESIZED_WIRE_31(1);
ELSE
	SFP3_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(2) = '1') THEN
	SFP3_Control(5) <= SYNTHESIZED_WIRE_31(2);
ELSE
	SFP3_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(3) = '1') THEN
	SFP3_Control(4) <= SYNTHESIZED_WIRE_31(3);
ELSE
	SFP3_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(4) = '1') THEN
	SFP3_Control(3) <= SYNTHESIZED_WIRE_31(4);
ELSE
	SFP3_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(5) = '1') THEN
	SFP3_Control(2) <= SYNTHESIZED_WIRE_31(5);
ELSE
	SFP3_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(6) = '1') THEN
	SFP3_Control(1) <= SYNTHESIZED_WIRE_31(6);
ELSE
	SFP3_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_31,SYNTHESIZED_WIRE_32)
BEGIN
if (SYNTHESIZED_WIRE_32(7) = '1') THEN
	SFP3_Control(0) <= SYNTHESIZED_WIRE_31(7);
ELSE
	SFP3_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(0) = '1') THEN
	SFP4_Control(7) <= SYNTHESIZED_WIRE_33(0);
ELSE
	SFP4_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(1) = '1') THEN
	SFP4_Control(6) <= SYNTHESIZED_WIRE_33(1);
ELSE
	SFP4_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(2) = '1') THEN
	SFP4_Control(5) <= SYNTHESIZED_WIRE_33(2);
ELSE
	SFP4_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(3) = '1') THEN
	SFP4_Control(4) <= SYNTHESIZED_WIRE_33(3);
ELSE
	SFP4_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(4) = '1') THEN
	SFP4_Control(3) <= SYNTHESIZED_WIRE_33(4);
ELSE
	SFP4_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(5) = '1') THEN
	SFP4_Control(2) <= SYNTHESIZED_WIRE_33(5);
ELSE
	SFP4_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(6) = '1') THEN
	SFP4_Control(1) <= SYNTHESIZED_WIRE_33(6);
ELSE
	SFP4_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_33,SYNTHESIZED_WIRE_34)
BEGIN
if (SYNTHESIZED_WIRE_34(7) = '1') THEN
	SFP4_Control(0) <= SYNTHESIZED_WIRE_33(7);
ELSE
	SFP4_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(0) = '1') THEN
	SFP5_Control(7) <= SYNTHESIZED_WIRE_35(0);
ELSE
	SFP5_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(1) = '1') THEN
	SFP5_Control(6) <= SYNTHESIZED_WIRE_35(1);
ELSE
	SFP5_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(2) = '1') THEN
	SFP5_Control(5) <= SYNTHESIZED_WIRE_35(2);
ELSE
	SFP5_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(3) = '1') THEN
	SFP5_Control(4) <= SYNTHESIZED_WIRE_35(3);
ELSE
	SFP5_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(4) = '1') THEN
	SFP5_Control(3) <= SYNTHESIZED_WIRE_35(4);
ELSE
	SFP5_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(5) = '1') THEN
	SFP5_Control(2) <= SYNTHESIZED_WIRE_35(5);
ELSE
	SFP5_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(6) = '1') THEN
	SFP5_Control(1) <= SYNTHESIZED_WIRE_35(6);
ELSE
	SFP5_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_35,SYNTHESIZED_WIRE_36)
BEGIN
if (SYNTHESIZED_WIRE_36(7) = '1') THEN
	SFP5_Control(0) <= SYNTHESIZED_WIRE_35(7);
ELSE
	SFP5_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(0) = '1') THEN
	SFP6_Control(7) <= SYNTHESIZED_WIRE_37(0);
ELSE
	SFP6_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(1) = '1') THEN
	SFP6_Control(6) <= SYNTHESIZED_WIRE_37(1);
ELSE
	SFP6_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(2) = '1') THEN
	SFP6_Control(5) <= SYNTHESIZED_WIRE_37(2);
ELSE
	SFP6_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(3) = '1') THEN
	SFP6_Control(4) <= SYNTHESIZED_WIRE_37(3);
ELSE
	SFP6_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(4) = '1') THEN
	SFP6_Control(3) <= SYNTHESIZED_WIRE_37(4);
ELSE
	SFP6_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(5) = '1') THEN
	SFP6_Control(2) <= SYNTHESIZED_WIRE_37(5);
ELSE
	SFP6_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(6) = '1') THEN
	SFP6_Control(1) <= SYNTHESIZED_WIRE_37(6);
ELSE
	SFP6_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_37,SYNTHESIZED_WIRE_38)
BEGIN
if (SYNTHESIZED_WIRE_38(7) = '1') THEN
	SFP6_Control(0) <= SYNTHESIZED_WIRE_37(7);
ELSE
	SFP6_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(0) = '1') THEN
	SFP7_Control(7) <= SYNTHESIZED_WIRE_39(0);
ELSE
	SFP7_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(1) = '1') THEN
	SFP7_Control(6) <= SYNTHESIZED_WIRE_39(1);
ELSE
	SFP7_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(2) = '1') THEN
	SFP7_Control(5) <= SYNTHESIZED_WIRE_39(2);
ELSE
	SFP7_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(3) = '1') THEN
	SFP7_Control(4) <= SYNTHESIZED_WIRE_39(3);
ELSE
	SFP7_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(4) = '1') THEN
	SFP7_Control(3) <= SYNTHESIZED_WIRE_39(4);
ELSE
	SFP7_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(5) = '1') THEN
	SFP7_Control(2) <= SYNTHESIZED_WIRE_39(5);
ELSE
	SFP7_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(6) = '1') THEN
	SFP7_Control(1) <= SYNTHESIZED_WIRE_39(6);
ELSE
	SFP7_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_39,SYNTHESIZED_WIRE_40)
BEGIN
if (SYNTHESIZED_WIRE_40(7) = '1') THEN
	SFP7_Control(0) <= SYNTHESIZED_WIRE_39(7);
ELSE
	SFP7_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(0) = '1') THEN
	SFP8_Control(7) <= SYNTHESIZED_WIRE_41(0);
ELSE
	SFP8_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(1) = '1') THEN
	SFP8_Control(6) <= SYNTHESIZED_WIRE_41(1);
ELSE
	SFP8_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(2) = '1') THEN
	SFP8_Control(5) <= SYNTHESIZED_WIRE_41(2);
ELSE
	SFP8_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(3) = '1') THEN
	SFP8_Control(4) <= SYNTHESIZED_WIRE_41(3);
ELSE
	SFP8_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(4) = '1') THEN
	SFP8_Control(3) <= SYNTHESIZED_WIRE_41(4);
ELSE
	SFP8_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(5) = '1') THEN
	SFP8_Control(2) <= SYNTHESIZED_WIRE_41(5);
ELSE
	SFP8_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(6) = '1') THEN
	SFP8_Control(1) <= SYNTHESIZED_WIRE_41(6);
ELSE
	SFP8_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_41,SYNTHESIZED_WIRE_42)
BEGIN
if (SYNTHESIZED_WIRE_42(7) = '1') THEN
	SFP8_Control(0) <= SYNTHESIZED_WIRE_41(7);
ELSE
	SFP8_Control(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst146 : pll_new
PORT MAP(refclk => CLOCKIN_6,
		 rst => reset_PLLs,
		 refclk1 => CLOCKIN_7,
		 extswitch => ClockSwitch_3);


PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(0) = '1') THEN
	SFP9_Control(7) <= SYNTHESIZED_WIRE_43(0);
ELSE
	SFP9_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(1) = '1') THEN
	SFP9_Control(6) <= SYNTHESIZED_WIRE_43(1);
ELSE
	SFP9_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(2) = '1') THEN
	SFP9_Control(5) <= SYNTHESIZED_WIRE_43(2);
ELSE
	SFP9_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(3) = '1') THEN
	SFP9_Control(4) <= SYNTHESIZED_WIRE_43(3);
ELSE
	SFP9_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(4) = '1') THEN
	SFP9_Control(3) <= SYNTHESIZED_WIRE_43(4);
ELSE
	SFP9_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(5) = '1') THEN
	SFP9_Control(2) <= SYNTHESIZED_WIRE_43(5);
ELSE
	SFP9_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(6) = '1') THEN
	SFP9_Control(1) <= SYNTHESIZED_WIRE_43(6);
ELSE
	SFP9_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_43,SYNTHESIZED_WIRE_44)
BEGIN
if (SYNTHESIZED_WIRE_44(7) = '1') THEN
	SFP9_Control(0) <= SYNTHESIZED_WIRE_43(7);
ELSE
	SFP9_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(0) = '1') THEN
	SFP10_Control(7) <= SYNTHESIZED_WIRE_45(0);
ELSE
	SFP10_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(1) = '1') THEN
	SFP10_Control(6) <= SYNTHESIZED_WIRE_45(1);
ELSE
	SFP10_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(2) = '1') THEN
	SFP10_Control(5) <= SYNTHESIZED_WIRE_45(2);
ELSE
	SFP10_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(3) = '1') THEN
	SFP10_Control(4) <= SYNTHESIZED_WIRE_45(3);
ELSE
	SFP10_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(4) = '1') THEN
	SFP10_Control(3) <= SYNTHESIZED_WIRE_45(4);
ELSE
	SFP10_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(5) = '1') THEN
	SFP10_Control(2) <= SYNTHESIZED_WIRE_45(5);
ELSE
	SFP10_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(6) = '1') THEN
	SFP10_Control(1) <= SYNTHESIZED_WIRE_45(6);
ELSE
	SFP10_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_45,SYNTHESIZED_WIRE_46)
BEGIN
if (SYNTHESIZED_WIRE_46(7) = '1') THEN
	SFP10_Control(0) <= SYNTHESIZED_WIRE_45(7);
ELSE
	SFP10_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(0) = '1') THEN
	SFP11_Control(7) <= SYNTHESIZED_WIRE_47(0);
ELSE
	SFP11_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(1) = '1') THEN
	SFP11_Control(6) <= SYNTHESIZED_WIRE_47(1);
ELSE
	SFP11_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(2) = '1') THEN
	SFP11_Control(5) <= SYNTHESIZED_WIRE_47(2);
ELSE
	SFP11_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(3) = '1') THEN
	SFP11_Control(4) <= SYNTHESIZED_WIRE_47(3);
ELSE
	SFP11_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(4) = '1') THEN
	SFP11_Control(3) <= SYNTHESIZED_WIRE_47(4);
ELSE
	SFP11_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(5) = '1') THEN
	SFP11_Control(2) <= SYNTHESIZED_WIRE_47(5);
ELSE
	SFP11_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(6) = '1') THEN
	SFP11_Control(1) <= SYNTHESIZED_WIRE_47(6);
ELSE
	SFP11_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_47,SYNTHESIZED_WIRE_48)
BEGIN
if (SYNTHESIZED_WIRE_48(7) = '1') THEN
	SFP11_Control(0) <= SYNTHESIZED_WIRE_47(7);
ELSE
	SFP11_Control(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst15 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_49,
		 clock => vme_service_clock,
		 q => _dalayed_ds_in);


PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(0) = '1') THEN
	SFP12_Control(7) <= SYNTHESIZED_WIRE_50(0);
ELSE
	SFP12_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(1) = '1') THEN
	SFP12_Control(6) <= SYNTHESIZED_WIRE_50(1);
ELSE
	SFP12_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(2) = '1') THEN
	SFP12_Control(5) <= SYNTHESIZED_WIRE_50(2);
ELSE
	SFP12_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(3) = '1') THEN
	SFP12_Control(4) <= SYNTHESIZED_WIRE_50(3);
ELSE
	SFP12_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(4) = '1') THEN
	SFP12_Control(3) <= SYNTHESIZED_WIRE_50(4);
ELSE
	SFP12_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(5) = '1') THEN
	SFP12_Control(2) <= SYNTHESIZED_WIRE_50(5);
ELSE
	SFP12_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(6) = '1') THEN
	SFP12_Control(1) <= SYNTHESIZED_WIRE_50(6);
ELSE
	SFP12_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_50,SYNTHESIZED_WIRE_51)
BEGIN
if (SYNTHESIZED_WIRE_51(7) = '1') THEN
	SFP12_Control(0) <= SYNTHESIZED_WIRE_50(7);
ELSE
	SFP12_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(0) = '1') THEN
	SFP13_Control(7) <= SYNTHESIZED_WIRE_52(0);
ELSE
	SFP13_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(1) = '1') THEN
	SFP13_Control(6) <= SYNTHESIZED_WIRE_52(1);
ELSE
	SFP13_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(2) = '1') THEN
	SFP13_Control(5) <= SYNTHESIZED_WIRE_52(2);
ELSE
	SFP13_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(3) = '1') THEN
	SFP13_Control(4) <= SYNTHESIZED_WIRE_52(3);
ELSE
	SFP13_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(4) = '1') THEN
	SFP13_Control(3) <= SYNTHESIZED_WIRE_52(4);
ELSE
	SFP13_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(5) = '1') THEN
	SFP13_Control(2) <= SYNTHESIZED_WIRE_52(5);
ELSE
	SFP13_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(6) = '1') THEN
	SFP13_Control(1) <= SYNTHESIZED_WIRE_52(6);
ELSE
	SFP13_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_52,SYNTHESIZED_WIRE_53)
BEGIN
if (SYNTHESIZED_WIRE_53(7) = '1') THEN
	SFP13_Control(0) <= SYNTHESIZED_WIRE_52(7);
ELSE
	SFP13_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(0) = '1') THEN
	SFP14_Control(7) <= SYNTHESIZED_WIRE_54(0);
ELSE
	SFP14_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(1) = '1') THEN
	SFP14_Control(6) <= SYNTHESIZED_WIRE_54(1);
ELSE
	SFP14_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(2) = '1') THEN
	SFP14_Control(5) <= SYNTHESIZED_WIRE_54(2);
ELSE
	SFP14_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(3) = '1') THEN
	SFP14_Control(4) <= SYNTHESIZED_WIRE_54(3);
ELSE
	SFP14_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(4) = '1') THEN
	SFP14_Control(3) <= SYNTHESIZED_WIRE_54(4);
ELSE
	SFP14_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(5) = '1') THEN
	SFP14_Control(2) <= SYNTHESIZED_WIRE_54(5);
ELSE
	SFP14_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(6) = '1') THEN
	SFP14_Control(1) <= SYNTHESIZED_WIRE_54(6);
ELSE
	SFP14_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_54,SYNTHESIZED_WIRE_55)
BEGIN
if (SYNTHESIZED_WIRE_55(7) = '1') THEN
	SFP14_Control(0) <= SYNTHESIZED_WIRE_54(7);
ELSE
	SFP14_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(0) = '1') THEN
	SFP15_Control(7) <= SYNTHESIZED_WIRE_56(0);
ELSE
	SFP15_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(1) = '1') THEN
	SFP15_Control(6) <= SYNTHESIZED_WIRE_56(1);
ELSE
	SFP15_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(2) = '1') THEN
	SFP15_Control(5) <= SYNTHESIZED_WIRE_56(2);
ELSE
	SFP15_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(3) = '1') THEN
	SFP15_Control(4) <= SYNTHESIZED_WIRE_56(3);
ELSE
	SFP15_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(4) = '1') THEN
	SFP15_Control(3) <= SYNTHESIZED_WIRE_56(4);
ELSE
	SFP15_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(5) = '1') THEN
	SFP15_Control(2) <= SYNTHESIZED_WIRE_56(5);
ELSE
	SFP15_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(6) = '1') THEN
	SFP15_Control(1) <= SYNTHESIZED_WIRE_56(6);
ELSE
	SFP15_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_56,SYNTHESIZED_WIRE_57)
BEGIN
if (SYNTHESIZED_WIRE_57(7) = '1') THEN
	SFP15_Control(0) <= SYNTHESIZED_WIRE_56(7);
ELSE
	SFP15_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(0) = '1') THEN
	SFP16_Control(7) <= SYNTHESIZED_WIRE_58(0);
ELSE
	SFP16_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(1) = '1') THEN
	SFP16_Control(6) <= SYNTHESIZED_WIRE_58(1);
ELSE
	SFP16_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(2) = '1') THEN
	SFP16_Control(5) <= SYNTHESIZED_WIRE_58(2);
ELSE
	SFP16_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(3) = '1') THEN
	SFP16_Control(4) <= SYNTHESIZED_WIRE_58(3);
ELSE
	SFP16_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(4) = '1') THEN
	SFP16_Control(3) <= SYNTHESIZED_WIRE_58(4);
ELSE
	SFP16_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(5) = '1') THEN
	SFP16_Control(2) <= SYNTHESIZED_WIRE_58(5);
ELSE
	SFP16_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(6) = '1') THEN
	SFP16_Control(1) <= SYNTHESIZED_WIRE_58(6);
ELSE
	SFP16_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_58,SYNTHESIZED_WIRE_59)
BEGIN
if (SYNTHESIZED_WIRE_59(7) = '1') THEN
	SFP16_Control(0) <= SYNTHESIZED_WIRE_58(7);
ELSE
	SFP16_Control(0) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(0) = '1') THEN
	SFP17_Control(7) <= SYNTHESIZED_WIRE_60(0);
ELSE
	SFP17_Control(7) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(1) = '1') THEN
	SFP17_Control(6) <= SYNTHESIZED_WIRE_60(1);
ELSE
	SFP17_Control(6) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(2) = '1') THEN
	SFP17_Control(5) <= SYNTHESIZED_WIRE_60(2);
ELSE
	SFP17_Control(5) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(3) = '1') THEN
	SFP17_Control(4) <= SYNTHESIZED_WIRE_60(3);
ELSE
	SFP17_Control(4) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(4) = '1') THEN
	SFP17_Control(3) <= SYNTHESIZED_WIRE_60(4);
ELSE
	SFP17_Control(3) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(5) = '1') THEN
	SFP17_Control(2) <= SYNTHESIZED_WIRE_60(5);
ELSE
	SFP17_Control(2) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(6) = '1') THEN
	SFP17_Control(1) <= SYNTHESIZED_WIRE_60(6);
ELSE
	SFP17_Control(1) <= 'Z';
END IF;
END PROCESS;

PROCESS(SYNTHESIZED_WIRE_60,SYNTHESIZED_WIRE_61)
BEGIN
if (SYNTHESIZED_WIRE_61(7) = '1') THEN
	SFP17_Control(0) <= SYNTHESIZED_WIRE_60(7);
ELSE
	SFP17_Control(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst156 : pll_new
PORT MAP(refclk => CLOCKIN_4,
		 rst => reset_PLLs,
		 refclk1 => CLOCKIN_5,
		 extswitch => ClockSwitch_2);


b2v_inst157 : simu_ram_read
PORT MAP(clk => The_clock,
		 reset => reset,
		 trigger => SYNTHESIZED_WIRE_62,
		 total_number => simu_ram_number_02,
		 rd_req => SYNTHESIZED_WIRE_11,
		 rd_addr => SYNTHESIZED_WIRE_12);


b2v_inst158 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => start_read(1),
		 pulse => start_read_pulse(1));


b2v_inst159 : compare_02
PORT MAP(dataa => vme_register_2(4 DOWNTO 0),
		 aeb => SYNTHESIZED_WIRE_205);


b2v_inst16 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_209,
		 clock => vme_service_clock,
		 q => SYNTHESIZED_WIRE_64);


b2v_inst160 : new_receive_manager
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 din => event_finish_write,
		 evt_tx => evt_tx,
		 need_read => need_read,
		 need_check => need_check,
		 evt_rx_00 => evt_rx_00,
		 evt_rx_01 => evt_rx_01);


b2v_inst161 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => OL_mode(0),
		 pulse => SYNTHESIZED_WIRE_66);

status_reg120(1 DOWNTO 0) <= delay_mode_06;


status_reg120(5 DOWNTO 4) <= delay_mode_08;



b2v_inst164 : trig_cnt_v0
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 trig_in => ff_tx_eop_00,
		 trig_cnt => cnt_eop_00);


b2v_inst165 : mux2x32
PORT MAP(clock => The_clock,
		 sel => spy_mem_mux,
		 data0x => 06_Fiber_in,
		 data1x => 08_Fiber_in,
		 result => GDFX_TEMP_SIGNAL_0);

ether_header_1 <= m_register_21;



b2v_inst167 : delta_reset
PORT MAP(clk => The_clock,
		 rst => reset,
		 delta_trig => trig_delta,
		 delta_rst => delta_rst);


b2v_inst168 : trig_delay
PORT MAP(clk => The_clock,
		 rst => logic_reset,
		 trig_in => L1A_rd_req_00,
		 delay => L1A_00_delay,
		 trig_out => L1A_trig_delayed(0));


b2v_inst169 : trig_delay
PORT MAP(clk => The_clock,
		 rst => logic_reset,
		 trig_in => L1A_rd_req_01,
		 delay => L1A_00_delay,
		 trig_out => L1A_trig_delayed(1));


b2v_inst17 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_64,
		 clock => vme_service_clock,
		 q => _dalayed_modsel_in);


b2v_inst170 : output_check
PORT MAP(clock => The_clock,
		 reset => logic_reset,
		 ff_tx_sop => ff_tx_sop_00,
		 ff_tx_eop => ff_tx_eop_00,
		 ff_tx_wren => ff_tx_wren_00,
		 data_in => ff_tx_data_00,
		 error => output_err(0),
		 packet_number => total_packet_sent_00);


b2v_inst171 : trig_cnt_v0
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 trig_in => ff_tx_eop_01,
		 trig_cnt => cnt_eop_01);


b2v_inst172 : tlk_error_output
PORT MAP(clk => The_clock,
		 reset => reset,
		 err_in_00 => TLK_Err(6),
		 err_in_01 => TLK_Err(8),
		 err_in_02 => data_ena,
		 send_err_00 => send_err(6),
		 send_err_01 => send_err(8),
		 send_err_02 => send_data_ena,
		 err_out => TLK_err_out);


b2v_inst173 : delta_trig_delay
PORT MAP(clk => The_clock,
		 rst => reset,
		 trig_in => send_err(6),
		 delay => SYNTHESIZED_WIRE_65,
		 trig_out => send_data_ena);


b2v_inst174 : vme_ram
PORT MAP(wren => vme_ram_wr_ena,
		 rden => test_mode,
		 wrclock => The_clock,
		 rdclock => vmeas,
		 data => GDFX_TEMP_SIGNAL_1,
		 rdaddress => addr(11 DOWNTO 2),
		 wraddress => vme_ram_wr_addr,
		 q => rd_data1);


b2v_inst175 : delta_trig_delay
PORT MAP(clk => The_clock,
		 rst => logic_reset,
		 trig_in => SYNTHESIZED_WIRE_66,
		 delay => trig_delay_ram,
		 trig_out => SYNTHESIZED_WIRE_116);

status_reg119(15 DOWNTO 0) <= evt_rx_00;



b2v_inst177 : l1a_checker_part1
PORT MAP(reset => logic_reset,
		 need_check => need_check,
		 clk => The_clock,
		 one_adc_finish_check => one_adc_finish_check,
		 check_in_progress => check_in_progress,
		 error => L1A_check_part1_error,
		 start_check => start_check);

rd_data5(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data5(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);



b2v_inst18 : show_counter
PORT MAP(clock => vme_service_clock);

rd_data6(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data6(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data7(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data7(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data8(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data8(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);




rd_data2(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data2(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);



b2v_inst19 : counter7
PORT MAP(clock => vme_service_clock,
		 cnt_en => SYNTHESIZED_WIRE_77,
		 aclr => SYNTHESIZED_WIRE_78,
		 q => counter7_out);

rd_data3(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data3(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data4(15 DOWNTO 0) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data4(31 DOWNTO 16) <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);


rd_data9 <= (SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210 & SYNTHESIZED_WIRE_210);



b2v_inst195 : const_16b
PORT MAP(		 result => SYNTHESIZED_WIRE_65);

ether_header_2 <= m_register_22;



b2v_inst197 : l1a_checker_part3
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 check_in_progress => check_in_progress,
		 L1A_00 => L1A_00,
		 L1A_01 => L1A_01,
		 start_check => start_check,
		 trig_in => L1A_trig_delayed,
		 L1A_align => SYNTHESIZED_WIRE_84,
		 one_adc_finish_check => one_adc_finish_check,
		 error => L1A_check_error);

source_ip <= m_register_23;


dest_ip <= m_register_24;



b2v_inst2 : vme_interface
PORT MAP(_lword => _lword,
		 _vme_write => _vme_write,
		 _as => _as,
		 _iack => _iack,
		 _delayed_modsel => _dalayed_modsel_in,
		 _delayed_ds => _dalayed_ds_in,
		 _dtack => _dtack,
		 _berr => _berr,
		 _ds => _ds,
		 _ga => _ga,
		 address => address,
		 am => am,
		 fromtapdel => fromdel(5 DOWNTO 1),
		 _modsel => SYNTHESIZED_WIRE_209,
		 _vme_data_str => SYNTHESIZED_WIRE_30,
		 vme_write => vmewrite,
		 dir_trans => dir_trans,
		 totapdel => SYNTHESIZED_WIRE_140,
		 vmeas => vmeas,
		 vmeds => vmeds,
		 vme_address => addr);


b2v_inst20 : rldramii
PORT MAP(pll_ref_clk => extmem_pll_refclk,
		 global_reset_n => reset,
		 oct_rzqin => oct_rzqin,
		 mem_dq => mem_dq,
		 mem_qk => mem_qk,
		 mem_qk_n => mem_qk_n,
		 mem_ck => mem_ck,
		 mem_ck_n => mem_ck_n,
		 mem_cs_n => mem_cs_n(0),
		 mem_dm => mem_dm(0),
		 mem_ref_n => mem_ref_n,
		 mem_we_n => mem_we_n,
		 mem_a => mem_a(18 DOWNTO 0),
		 mem_ba => mem_ba,
		 mem_dk => mem_dk,
		 mem_dk_n => mem_dk_n);

ether_header_0 <= m_register_20;



b2v_inst201 : tx_manager
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 L1A_Align => SYNTHESIZED_WIRE_84,
		 need_read => need_read,
		 one_adc_finish_read => one_adc_finish_read,
		 error => tx_manger_error,
		 evt_tx => evt_tx,
		 start_read => start_read);

mac_config <= m_register_26;


source_mac_addr(47 DOWNTO 32) <= ether_header_1(15 DOWNTO 0);


source_mac_addr(31 DOWNTO 0) <= ether_header_2;


ether_type <= m_register_25(15 DOWNTO 0);


port_id <= m_register_27;


FIFO_in_delay <= m_register_28(3 DOWNTO 0);


mem_upper_limit <= m_register_29(17 DOWNTO 0);


max_payload <= m_register_30(11 DOWNTO 0);



b2v_inst21 : sfp_5g_block
PORT MAP(pll_ref_clk => SFPA_pll_ref_clk,
		 phy_mgmt_clk => The_clock,
		 phy_mgmt_clk_reset => phy_mgmt_clk_reset_1,
		 a_txdatak => SYNTHESIZED_WIRE_85,
		 ain => SYNTHESIZED_WIRE_86,
		 b_txdatak => SYNTHESIZED_WIRE_87,
		 bin => SYNTHESIZED_WIRE_88,
		 c_txdatak => SYNTHESIZED_WIRE_89,
		 cin => SYNTHESIZED_WIRE_90,
		 d_txdatak => SYNTHESIZED_WIRE_91,
		 din => SYNTHESIZED_WIRE_92,
		 e_txdatak => SYNTHESIZED_WIRE_93,
		 ein => SYNTHESIZED_WIRE_94,
		 SFP_rx_in => SFPA_rx_in,
		 a => 09_Fiber_in,
		 b => 08_Fiber_in,
		 c => 07_Fiber_in,
		 d => 06_Fiber_in,
		 e => 05_Fiber_in,
		 SFP_Out => SFPA_tx_Out);

simu_ram_number_01 <= m_register_31(9 DOWNTO 0);



b2v_inst211 : dff16
PORT MAP(clock => The_clock,
		 data => 09_Fiber_in(31 DOWNTO 16),
		 q => 09_data_in_fix(15 DOWNTO 0));


b2v_inst212 : dff16
PORT MAP(clock => The_clock,
		 data => 08_Fiber_in(31 DOWNTO 16),
		 q => 08_data_in_fix(15 DOWNTO 0));


b2v_inst213 : dff16
PORT MAP(clock => The_clock,
		 data => 07_Fiber_in(31 DOWNTO 16),
		 q => 07_data_in_fix(15 DOWNTO 0));


b2v_inst214 : dff16
PORT MAP(clock => The_clock,
		 data => 06_Fiber_in(31 DOWNTO 16),
		 q => 06_data_in_fix(15 DOWNTO 0));


b2v_inst215 : dff16
PORT MAP(clock => The_clock,
		 data => 05_Fiber_in(31 DOWNTO 16),
		 q => 05_data_in_fix(15 DOWNTO 0));

simu_ram_number_02 <= m_register_32(9 DOWNTO 0);



one_adc_finish_read <= finish_read_00 OR finish_read_01;


b2v_inst218 : input_control
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 trig_00 => start_read_00,
		 trig_01 => start_read_01,
		 input_mode => input_mode);


b2v_inst219 : mux32_nodly
PORT MAP(sel => input_mode(0),
		 data0x => ff_tx_data_00,
		 data1x => ff_tx_data_01,
		 result => ff_tx_data_out);



b2v_inst220 : mux2b
PORT MAP(data1 => ff_tx_wren_01,
		 data0 => ff_tx_wren_00,
		 sel => input_mode(0),
		 result => ff_tx_wren_out);


b2v_inst221 : mux2b
PORT MAP(data1 => ff_tx_eop_01,
		 data0 => ff_tx_eop_00,
		 sel => input_mode(0),
		 result => ff_tx_eop_out);


b2v_inst222 : mux2b
PORT MAP(data1 => ff_tx_sop_01,
		 data0 => ff_tx_sop_00,
		 sel => input_mode(0),
		 result => ff_tx_sop_out);

input_switch <= m_register_33(0);



b2v_inst224 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_95,
		 q => SYNTHESIZED_WIRE_117);


b2v_inst225 : live_cnt
PORT MAP(clk => The_clock,
		 rst => reset,
		 live => LIVE,
		 LIVE_rst => LIVE_rst,
		 cnt => spill_id);


b2v_inst226 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_96,
		 q => 06_Simu_in);


b2v_inst227 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_97,
		 q => SYNTHESIZED_WIRE_118);


logic_reset <= auto_rst OR reset;


b2v_inst229 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_98,
		 q => 08_data_in);


SYNTHESIZED_WIRE_78 <= NOT(SYNTHESIZED_WIRE_209);



b2v_inst230 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_100,
		 q => 06_data_in);

status_reg119(31 DOWNTO 16) <= evt_rx_01;



b2v_inst232 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_101,
		 q => 08_Simu_in);

status_reg118(15 DOWNTO 0) <= evt_tx;


status_reg117(1 DOWNTO 0) <= L1A_check_error;


status_reg117(3 DOWNTO 2) <= L1A_check_part1_error;


status_reg112(8 DOWNTO 0) <= OFC_manager_error_00;


status_reg112(24 DOWNTO 16) <= OFC_manager_error_01;


status_reg117(17 DOWNTO 16) <= tx_manger_error;


L1A_00_delay <= m_register_34(3 DOWNTO 0);



b2v_inst24 : register_set2
PORT MAP(clock => The_clock,
		 in00 => SYNTHESIZED_WIRE_102,
		 in01 => SYNTHESIZED_WIRE_103,
		 in02 => SYNTHESIZED_WIRE_104,
		 in03 => SYNTHESIZED_WIRE_105,
		 in04 => SYNTHESIZED_WIRE_106,
		 in05 => SYNTHESIZED_WIRE_107,
		 in06 => SYNTHESIZED_WIRE_108,
		 in07 => SYNTHESIZED_WIRE_109,
		 in08 => SYNTHESIZED_WIRE_110,
		 in09 => SYNTHESIZED_WIRE_111,
		 out00 => SYNTHESIZED_WIRE_86,
		 out01 => SYNTHESIZED_WIRE_88,
		 out02 => SYNTHESIZED_WIRE_90,
		 out03 => SYNTHESIZED_WIRE_92,
		 out04 => SYNTHESIZED_WIRE_94,
		 out05 => SYNTHESIZED_WIRE_85,
		 out06 => SYNTHESIZED_WIRE_87,
		 out07 => SYNTHESIZED_WIRE_89,
		 out08 => SYNTHESIZED_WIRE_91,
		 out09 => SYNTHESIZED_WIRE_93);

status_reg116(17 DOWNTO 0) <= max_mem_00;


status_reg115(17 DOWNTO 0) <= max_mem_01;


status_reg116(19 DOWNTO 18) <= memory_error_00;


status_reg115(19 DOWNTO 18) <= memory_error_01;



b2v_inst244 : l1a_discriminator
PORT MAP(clk => The_clock,
		 in => TrigIn,
		 L1A => SYNTHESIZED_WIRE_112,
		 PL1A => SYNTHESIZED_WIRE_113,
		 PS => SYNTHESIZED_WIRE_114,
		 ALIGN => SYNTHESIZED_WIRE_115,
		 DELTA => trig_delta);


b2v_inst245 : trig_counter
PORT MAP(clk => The_clock,
		 rst => reset,
		 L1A => SYNTHESIZED_WIRE_112,
		 PL1A => SYNTHESIZED_WIRE_113,
		 PS => SYNTHESIZED_WIRE_114,
		 ALIGN => SYNTHESIZED_WIRE_115,
		 DELTA => trig_delta,
		 cnt_DELTA => cnt_DELTA);

status_reg114 <= cnt_DELTA;



b2v_inst247 : vme_ram_write
PORT MAP(clk => The_clock,
		 rst => logic_reset,
		 trig_in => SYNTHESIZED_WIRE_116,
		 wr_ena => vme_ram_wr_ena,
		 wr_addr => vme_ram_wr_addr);

trig_delay_ram <= m_register_35(15 DOWNTO 0);


spy_mem_mux <= m_register_36(0);



SYNTHESIZED_WIRE_77 <= NOT(counter7_out(23));


reset_mode <= m_register_28(4);


status_reg113(0) <= LIVE;


nListenPorts <= m_register_37(3 DOWNTO 0);


crate_id_00 <= m_register_38(7 DOWNTO 0);


crate_id_01 <= m_register_38(15 DOWNTO 8);



b2v_inst255 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_117,
		 q => SYNTHESIZED_WIRE_119);


b2v_inst256 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_118,
		 q => SYNTHESIZED_WIRE_120);


b2v_inst257 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_119,
		 q => SYNTHESIZED_WIRE_121);


b2v_inst258 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_120,
		 q => SYNTHESIZED_WIRE_122);


b2v_inst259 : l1a_checker_part2
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 start_check => start_check(1),
		 rd_req => L1A_rd_req_01,
		 rd_addr => L1A_rd_addr_01);


b2v_inst26 : ol_controller_32
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(9),
		 data_rx => 09_Fiber_in,
		 data_tx => data_out_test,
		 error => TLK_Err(9),
		 send_err => send_err(9),
		 data_out => SYNTHESIZED_WIRE_102,
		 datak => SYNTHESIZED_WIRE_107,
		 delay_mode => delay_mode_09);


b2v_inst260 : l1a_checker_part2
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 start_check => start_check(0),
		 rd_req => L1A_rd_req_00,
		 rd_addr => L1A_rd_addr_00);

status_reg111(15 DOWNTO 0) <= cnt_eop_00;


status_reg113(12 DOWNTO 4) <= spill_id;


status_reg111(31 DOWNTO 16) <= cnt_eop_01;


status_reg110(15 DOWNTO 0) <= total_packet_sent_01;


status_reg110(17 DOWNTO 16) <= output_err;


status_reg110(22 DOWNTO 20) <= TLK_err_out;



b2v_inst267 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_121,
		 q => 06_cb_in);


b2v_inst268 : dff32
PORT MAP(clock => The_clock,
		 data => SYNTHESIZED_WIRE_122,
		 q => 08_cb_in);


b2v_inst269 : output_check
PORT MAP(clock => The_clock,
		 reset => logic_reset,
		 ff_tx_sop => ff_tx_sop_01,
		 ff_tx_eop => ff_tx_eop_01,
		 ff_tx_wren => ff_tx_wren_01,
		 data_in => ff_tx_data_01,
		 error => output_err(1),
		 packet_number => total_packet_sent_01);


b2v_inst27 : ol_controller_32
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(8),
		 data_rx => 08_Fiber_in,
		 data_tx => data_out_test,
		 error => TLK_Err(8),
		 send_err => send_err(8),
		 data_out => SYNTHESIZED_WIRE_103,
		 datak => SYNTHESIZED_WIRE_108,
		 delay_mode => delay_mode_08);

status_reg109(15 DOWNTO 0) <= total_packet_sent_00;



b2v_inst271 : lv3_info
PORT MAP(clock => The_clock,
		 reset => logic_reset,
		 LIVE => LIVE,
		 trig_delta => trig_delta,
		 delay => LIVE_delay,
		 rx_evt_00 => evt_rx_00,
		 rx_evt_01 => evt_rx_01,
		 tx_evt_00 => total_packet_sent_00,
		 tx_evt_01 => total_packet_sent_01,
		 error => lv2_info_error,
		 data_valid => lv2_info_valid,
		 packet_lv2 => packet_lv2);

status_reg110(25 DOWNTO 24) <= (lv2_info_error & lv2_info_error);


LIVE_delay <= m_register_39;



SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_211;



b2v_inst28 : ol_controller_32
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(7),
		 data_rx => 07_Fiber_in,
		 data_tx => data_out_test,
		 error => TLK_Err(7),
		 send_err => send_err(7),
		 data_out => SYNTHESIZED_WIRE_104,
		 datak => SYNTHESIZED_WIRE_109,
		 delay_mode => delay_mode_07);

SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_211;




b2v_inst3 : count_valid
PORT MAP(clk => The_clock,
		 reset => reset,
		 tlk_err => TLK_Err(6),
		 LIVE => LIVE,
		 dval => adc_data_valid);


b2v_inst30 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_125,
		 clock => fanout_clock,
		 q => SYNTHESIZED_WIRE_127);

AUX_OUT1 <= TrigIn;



AUX_OUT2 <= TrigIn;



b2v_inst33 : ol_controller_32
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(6),
		 data_rx => 06_Fiber_in,
		 data_tx => data_out_test,
		 error => TLK_Err(6),
		 send_err => send_err(6),
		 data_out => SYNTHESIZED_WIRE_105,
		 datak => SYNTHESIZED_WIRE_110,
		 delay_mode => delay_mode_06);


b2v_inst337 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_126,
		 clock => fanout_clock,
		 q => SYNTHESIZED_WIRE_125);

test_mode <= vme_halt;



b2v_inst340 : dff_one
PORT MAP(data => SYNTHESIZED_WIRE_127,
		 clock => fanout_clock,
		 q => Systemout);



b2v_inst35 : ol_controller_32
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(5),
		 data_rx => 05_Fiber_in,
		 data_tx => data_out_test,
		 error => TLK_Err(5),
		 send_err => send_err(5),
		 data_out => SYNTHESIZED_WIRE_106,
		 datak => SYNTHESIZED_WIRE_111,
		 delay_mode => delay_mode_05);


b2v_inst36 : mux32
PORT MAP(clock => The_clock,
		 sel => delay_mode_08(0),
		 data0x => 08_Fiber_in,
		 data1x => 08_data_in_fix,
		 result => SYNTHESIZED_WIRE_98);



b2v_inst37 : mux32
PORT MAP(clock => The_clock,
		 sel => delay_mode_07(0),
		 data0x => 07_Fiber_in,
		 data1x => 07_data_in_fix);



led_0 <= NOT(counter_show(20));



b2v_inst4 : sfp_gxblock_x5new
PORT MAP(pll_ref_clk => SFPB_pll_ref_clk,
		 phy_mgmt_clk => The_clock,
		 phy_mgmt_clk_reset => phy_mgmt_clk_reset_1,
		 a_txdatak => SYNTHESIZED_WIRE_128,
		 ain => SYNTHESIZED_WIRE_129,
		 b_txdatak => SYNTHESIZED_WIRE_130,
		 bin => SYNTHESIZED_WIRE_131,
		 c_txdatak => SYNTHESIZED_WIRE_132,
		 cin => SYNTHESIZED_WIRE_133,
		 d_txdatak => SYNTHESIZED_WIRE_134,
		 din => SYNTHESIZED_WIRE_135,
		 e_txdatak => SYNTHESIZED_WIRE_136,
		 ein => SYNTHESIZED_WIRE_137,
		 SFP_rx_in => SFPB_rx_in,
		 a => 04_Fiber_in,
		 b => 03_Fiber_in,
		 c => 02_Fiber_in,
		 d => 01_Fiber_in,
		 e => 00_Fiber_in,
		 SFP_Out => SFPB_tx_Out);

ClockSwitchControl_0 <= SYNTHESIZED_WIRE_138;



b2v_inst41 : dff16
PORT MAP(clock => The_clock,
		 data => data_out_test(15 DOWNTO 0),
		 q => data_out_test(31 DOWNTO 16));


b2v_inst417 : max_mem
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 current_mem_usage => mem_usage_00,
		 max_mem_usage => max_mem_00);


b2v_inst418 : max_mem
PORT MAP(clk => The_clock,
		 reset => logic_reset,
		 current_mem_usage => mem_usage_01,
		 max_mem_usage => max_mem_01);


b2v_inst42 : mux32
PORT MAP(clock => The_clock,
		 sel => delay_mode_06(0),
		 data0x => 06_Fiber_in,
		 data1x => 06_data_in_fix,
		 result => SYNTHESIZED_WIRE_100);


ClockSwitchControl_1 <= SYNTHESIZED_WIRE_139;



b2v_inst45 : tapdel_10
PORT MAP(in => SYNTHESIZED_WIRE_140,
		 clk => vme_service_clock,
		 out => fromdel);


AUX_OUT3 <= TrigIn;



b2v_inst48 : mux32
PORT MAP(clock => The_clock,
		 sel => data_ena,
		 data0x => 06_Simu_in,
		 data1x => 06_data_in,
		 result => SYNTHESIZED_WIRE_95);

09_data_in_fix(31 DOWNTO 16) <= 09_Fiber_in(15 DOWNTO 0);




b2v_inst50 : ol_controller
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(4),
		 data_rx => 04_Fiber_in,
		 data_tx => SYNTHESIZED_WIRE_208,
		 error => TLK_Err(4),
		 send_err => send_err(4),
		 data_out => SYNTHESIZED_WIRE_17,
		 datak => SYNTHESIZED_WIRE_22);

08_data_in_fix(31 DOWNTO 16) <= 08_Fiber_in(15 DOWNTO 0);



ClockSwitchControl_2 <= SYNTHESIZED_WIRE_142;



ClockSwitchControl_3 <= SYNTHESIZED_WIRE_143;




b2v_inst57 : tdc_vme
PORT MAP(vmewrite => vmewrite,
		 vmeas => vmeas,
		 vmeds => vmeds,
		 id => SYNTHESIZED_WIRE_144,
		 sysclk => sysclk,
		 addr => addr,
		 data => vme_data,
		 rd_data1 => rd_data1,
		 rd_data2 => rd_data2,
		 rd_data3 => rd_data3,
		 rd_data4 => rd_data4,
		 rd_data5 => rd_data5,
		 rd_data6 => rd_data6,
		 rd_data7 => rd_data7,
		 rd_data8 => rd_data8,
		 rd_data9 => rd_data9,
		 status_bus0 => SYNTHESIZED_WIRE_212,
		 status_bus1 => SYNTHESIZED_WIRE_212,
		 status_bus2 => SYNTHESIZED_WIRE_212,
		 status_bus3 => SYNTHESIZED_WIRE_212,
		 status_bus4 => SYNTHESIZED_WIRE_213,
		 status_reg100 => SYNTHESIZED_WIRE_213,
		 status_reg101 => SYNTHESIZED_WIRE_213,
		 status_reg102 => SYNTHESIZED_WIRE_213,
		 status_reg103 => SYNTHESIZED_WIRE_213,
		 status_reg104 => SYNTHESIZED_WIRE_213,
		 status_reg105 => SYNTHESIZED_WIRE_213,
		 status_reg106 => SYNTHESIZED_WIRE_213,
		 status_reg107 => SYNTHESIZED_WIRE_213,
		 status_reg108 => SYNTHESIZED_WIRE_213,
		 status_reg109 => status_reg109,
		 status_reg110 => status_reg110,
		 status_reg111 => status_reg111,
		 status_reg112 => status_reg112,
		 status_reg113 => status_reg113,
		 status_reg114 => status_reg114,
		 status_reg115 => status_reg115,
		 status_reg116 => status_reg116,
		 status_reg117 => status_reg117,
		 status_reg118 => status_reg118,
		 status_reg119 => status_reg119,
		 status_reg120 => status_reg120,
		 test_mode => SYNTHESIZED_WIRE_160,
		 reset => SYNTHESIZED_WIRE_161,
		 ena_simu => SYNTHESIZED_WIRE_162,
		 SPI_start => SYNTHESIZED_WIRE_163,
		 vmel2a_mode => SYNTHESIZED_WIRE_164,
		 reset1 => SYNTHESIZED_WIRE_165,
		 halt_mode => SYNTHESIZED_WIRE_166,
		 vme_wr_en1 => SYNTHESIZED_WIRE_167,
		 vme_wr_en2 => SYNTHESIZED_WIRE_168,
		 vme_wr_en3 => SYNTHESIZED_WIRE_169,
		 vme_wr_en4 => SYNTHESIZED_WIRE_170,
		 vme_wr_en5 => SYNTHESIZED_WIRE_171,
		 vme_wr_en6 => SYNTHESIZED_WIRE_172,
		 vme_wr_en7 => SYNTHESIZED_WIRE_173,
		 vme_wr_en8 => SYNTHESIZED_WIRE_174,
		 reg20 => SYNTHESIZED_WIRE_183,
		 reg21 => SYNTHESIZED_WIRE_184,
		 reg22 => SYNTHESIZED_WIRE_185,
		 reg23 => SYNTHESIZED_WIRE_186,
		 reg24 => SYNTHESIZED_WIRE_187,
		 reg25 => SYNTHESIZED_WIRE_188,
		 reg26 => SYNTHESIZED_WIRE_189,
		 reg27 => SYNTHESIZED_WIRE_190,
		 reg28 => SYNTHESIZED_WIRE_191,
		 reg29 => SYNTHESIZED_WIRE_192,
		 reg30 => SYNTHESIZED_WIRE_193,
		 reg31 => SYNTHESIZED_WIRE_194,
		 reg32 => SYNTHESIZED_WIRE_195,
		 reg33 => SYNTHESIZED_WIRE_196,
		 reg34 => SYNTHESIZED_WIRE_197,
		 reg35 => SYNTHESIZED_WIRE_198,
		 reg36 => SYNTHESIZED_WIRE_199,
		 reg37 => SYNTHESIZED_WIRE_200,
		 reg38 => SYNTHESIZED_WIRE_201,
		 reg39 => SYNTHESIZED_WIRE_202,
		 register1 => SYNTHESIZED_WIRE_175,
		 register2 => SYNTHESIZED_WIRE_176,
		 register3 => SYNTHESIZED_WIRE_177,
		 register4 => SYNTHESIZED_WIRE_178,
		 register5 => SYNTHESIZED_WIRE_179,
		 register6 => SYNTHESIZED_WIRE_180,
		 register7 => SYNTHESIZED_WIRE_181,
		 register8 => SYNTHESIZED_WIRE_182);

ClockSwitchControl_4 <= SYNTHESIZED_WIRE_159;









07_data_in_fix(31 DOWNTO 16) <= 07_Fiber_in(15 DOWNTO 0);





b2v_inst676 : dff_one
PORT MAP(data => DigiIn(1),
		 clock => The_clock,
		 q => LIVE);


b2v_inst677 : dff_one
PORT MAP(data => DigiIn(0),
		 clock => The_clock,
		 q => TrigIn);




b2v_inst681 : vme_thing
PORT MAP(In1 => SYNTHESIZED_WIRE_160,
		 In2 => SYNTHESIZED_WIRE_161,
		 In3 => SYNTHESIZED_WIRE_162,
		 In4 => SYNTHESIZED_WIRE_163,
		 In5 => SYNTHESIZED_WIRE_164,
		 In6 => SYNTHESIZED_WIRE_165,
		 In15 => SYNTHESIZED_WIRE_166,
		 In16 => SYNTHESIZED_WIRE_167,
		 In17 => SYNTHESIZED_WIRE_168,
		 In18 => SYNTHESIZED_WIRE_169,
		 In19 => SYNTHESIZED_WIRE_170,
		 In20 => SYNTHESIZED_WIRE_171,
		 In21 => SYNTHESIZED_WIRE_172,
		 In22 => SYNTHESIZED_WIRE_173,
		 In23 => SYNTHESIZED_WIRE_174,
		 Outclk => vme_service_clock,
		 In30 => SYNTHESIZED_WIRE_175,
		 In31 => SYNTHESIZED_WIRE_176,
		 In32 => SYNTHESIZED_WIRE_177,
		 In33 => SYNTHESIZED_WIRE_178,
		 In34 => SYNTHESIZED_WIRE_179,
		 In35 => SYNTHESIZED_WIRE_180,
		 In36 => SYNTHESIZED_WIRE_181,
		 In37 => SYNTHESIZED_WIRE_182,
		 In38 => SYNTHESIZED_WIRE_183,
		 In39 => SYNTHESIZED_WIRE_184,
		 In40 => SYNTHESIZED_WIRE_185,
		 In41 => SYNTHESIZED_WIRE_186,
		 In42 => SYNTHESIZED_WIRE_187,
		 In43 => SYNTHESIZED_WIRE_188,
		 In44 => SYNTHESIZED_WIRE_189,
		 In45 => SYNTHESIZED_WIRE_190,
		 In46 => SYNTHESIZED_WIRE_191,
		 In47 => SYNTHESIZED_WIRE_192,
		 In48 => SYNTHESIZED_WIRE_193,
		 In49 => SYNTHESIZED_WIRE_194,
		 In50 => SYNTHESIZED_WIRE_195,
		 In51 => SYNTHESIZED_WIRE_196,
		 In52 => SYNTHESIZED_WIRE_197,
		 In53 => SYNTHESIZED_WIRE_198,
		 In54 => SYNTHESIZED_WIRE_199,
		 In55 => SYNTHESIZED_WIRE_200,
		 In56 => SYNTHESIZED_WIRE_201,
		 In57 => SYNTHESIZED_WIRE_202,
		 Out1 => vme_halt,
		 Out2 => reset,
		 Out6 => reset_PLLs,
		 Out30 => vme_register_1,
		 Out31 => vme_register_2,
		 Out34 => vme_register_5,
		 Out36 => vme_register_7,
		 Out37 => vme_register_8,
		 Out38 => m_register_20,
		 Out39 => m_register_21,
		 Out40 => m_register_22,
		 Out41 => m_register_23,
		 Out42 => m_register_24,
		 Out43 => m_register_25,
		 Out44 => m_register_26,
		 Out45 => m_register_27,
		 Out46 => m_register_28,
		 Out47 => m_register_29,
		 Out48 => m_register_30,
		 Out49 => m_register_31,
		 Out50 => m_register_32,
		 Out51 => m_register_33,
		 Out52 => m_register_34,
		 Out53 => m_register_35,
		 Out54 => m_register_36,
		 Out55 => m_register_37,
		 Out56 => m_register_38,
		 Out57 => m_register_39);

ENA_RX <= vme_register_8(17 DOWNTO 0);




b2v_inst7 : show_counter
PORT MAP(clock => vme_service_clock);

debug(9) <= reset;














b2v_inst81 : ol_controller
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(3),
		 data_rx => 03_Fiber_in,
		 data_tx => SYNTHESIZED_WIRE_208,
		 error => TLK_Err(3),
		 send_err => send_err(3),
		 data_out => SYNTHESIZED_WIRE_18,
		 datak => SYNTHESIZED_WIRE_23);








b2v_inst88 : show_counter
PORT MAP(clock => The_clock);



b2v_inst9 : mux32
PORT MAP(clock => The_clock,
		 sel => delay_mode_09(0),
		 data0x => 09_Fiber_in,
		 data1x => 09_data_in_fix);




debug(7) <= phy_mgmt_clk_reset_1;



SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_204 AND test_mode;




SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_205 AND test_mode;


b2v_inst98 : ol_controller
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(2),
		 data_rx => 02_Fiber_in,
		 data_tx => SYNTHESIZED_WIRE_208,
		 error => TLK_Err(2),
		 send_err => send_err(2),
		 data_out => SYNTHESIZED_WIRE_19,
		 datak => SYNTHESIZED_WIRE_24);


b2v_inst99 : ol_controller
PORT MAP(clk => The_clock,
		 LIVE => LIVE,
		 ena_rx => ENA_RX(1),
		 data_rx => 01_Fiber_in,
		 data_tx => SYNTHESIZED_WIRE_208,
		 error => TLK_Err(1),
		 send_err => send_err(1),
		 data_out => SYNTHESIZED_WIRE_20,
		 datak => SYNTHESIZED_WIRE_25);

DigiIn <= Systemin;

data_mem0 <= GDFX_TEMP_SIGNAL_0(0);
data_mem1 <= GDFX_TEMP_SIGNAL_0(1);
data_mem10 <= GDFX_TEMP_SIGNAL_0(10);
data_mem11 <= GDFX_TEMP_SIGNAL_0(11);
data_mem12 <= GDFX_TEMP_SIGNAL_0(12);
data_mem13 <= GDFX_TEMP_SIGNAL_0(13);
data_mem14 <= GDFX_TEMP_SIGNAL_0(14);
data_mem15 <= GDFX_TEMP_SIGNAL_0(15);
data_mem16 <= GDFX_TEMP_SIGNAL_0(16);
data_mem17 <= GDFX_TEMP_SIGNAL_0(17);
data_mem18 <= GDFX_TEMP_SIGNAL_0(18);
data_mem19 <= GDFX_TEMP_SIGNAL_0(19);
data_mem2 <= GDFX_TEMP_SIGNAL_0(2);
data_mem20 <= GDFX_TEMP_SIGNAL_0(20);
data_mem21 <= GDFX_TEMP_SIGNAL_0(21);
data_mem22 <= GDFX_TEMP_SIGNAL_0(22);
data_mem23 <= GDFX_TEMP_SIGNAL_0(23);
data_mem24 <= GDFX_TEMP_SIGNAL_0(24);
data_mem25 <= GDFX_TEMP_SIGNAL_0(25);
data_mem26 <= GDFX_TEMP_SIGNAL_0(26);
data_mem27 <= GDFX_TEMP_SIGNAL_0(27);
data_mem28 <= GDFX_TEMP_SIGNAL_0(28);
data_mem29 <= GDFX_TEMP_SIGNAL_0(29);
data_mem3 <= GDFX_TEMP_SIGNAL_0(3);
data_mem30 <= GDFX_TEMP_SIGNAL_0(30);
data_mem31 <= GDFX_TEMP_SIGNAL_0(31);
data_mem4 <= GDFX_TEMP_SIGNAL_0(4);
data_mem5 <= GDFX_TEMP_SIGNAL_0(5);
data_mem6 <= GDFX_TEMP_SIGNAL_0(6);
data_mem7 <= GDFX_TEMP_SIGNAL_0(7);
data_mem8 <= GDFX_TEMP_SIGNAL_0(8);
data_mem9 <= GDFX_TEMP_SIGNAL_0(9);
END bdf_type;
