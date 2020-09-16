-- generate this from block diagram file by Qisen
-- use VHD declaration to show the connection between each module

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
-- CREATED		"Sat Feb 02 22:38:37 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY OFC1_manager IS 
	PORT
	(
		ff_tx_rdy :  IN  STD_LOGIC;
		ff_tx_a_full :  IN  STD_LOGIC;
		ff_tx_septy :  IN  STD_LOGIC;
		The_clock :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		L1A_rd_req :  IN  STD_LOGIC;
		start_read_pulse :  IN  STD_LOGIC;
		lv2_info_valid :  IN  STD_LOGIC;
		crate_id :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dest_ip :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ether_header_0 :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ether_header_1 :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ether_header_2 :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ether_type :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		event_id :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		FIFO_in_delay :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		L1A_rd_addr :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		lv2_packet :  IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
		max_payload :  IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		mem_upper_limit :  IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		nListenPorts :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		port_id :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		source_ip :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		spill_id :  IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		ff_tx_wren :  OUT  STD_LOGIC;
		ff_tx_sop :  OUT  STD_LOGIC;
		ff_tx_eop :  OUT  STD_LOGIC;
		event_finish_write :  OUT  STD_LOGIC;
		event_start_read :  OUT  STD_LOGIC;
		event_finish_read :  OUT  STD_LOGIC;
		error_out :  OUT  STD_LOGIC_VECTOR(8 DOWNTO 0);
		ff_tx_data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		L1A_out :  OUT  STD_LOGIC_VECTOR(13 DOWNTO 0);
		mem_err :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		mem_usage :  OUT  STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END OFC1_manager;

ARCHITECTURE bdf_type OF OFC1_manager IS 

COMPONENT mem_write_control_v3
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_upper_limit : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 data_wr_req : OUT STD_LOGIC;
		 es_wr_req : OUT STD_LOGIC;
		 L1A_wr_req : OUT STD_LOGIC;
		 event_in_progress : OUT STD_LOGIC;
		 error_01 : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data_wr_addr : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		 error_00 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 es_wr_addr : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 event_size : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
		 L1A_event : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
		 L1A_wr_addr : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 write_rounds : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram_l1a
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ethernet_frame_generator
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 ff_tx_rdy : IN STD_LOGIC;
		 ff_tx_a_full : IN STD_LOGIC;
		 data_start : IN STD_LOGIC;
		 data_valid : IN STD_LOGIC;
		 ff_tx_septy : IN STD_LOGIC;
		 lv2_info_valid : IN STD_LOGIC;
		 chunk_id : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 crate_id : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dest_ip : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_header_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ether_type : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 event_id : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 lv2_packet : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 nListenPorts : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 payload_len : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 port_id : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 source_ip : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 spill_id : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 ff_tx_wren : OUT STD_LOGIC;
		 ff_tx_eop : OUT STD_LOGIC;
		 ff_tx_sop : OUT STD_LOGIC;
		 payload_rdy : OUT STD_LOGIC;
		 fg_rdy : OUT STD_LOGIC;
		 is_buff : OUT STD_LOGIC;
		 is_valid : OUT STD_LOGIC;
		 go_to_buff_port : OUT STD_LOGIC;
		 error_buff : OUT STD_LOGIC;
		 error : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ff_tx_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pulse_generator_falledge
	PORT(clock : IN STD_LOGIC;
		 signal : IN STD_LOGIC;
		 pulse : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT memory_monitor_v1
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 limit : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 n1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 n2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 rd_addr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 wr_addr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 usage : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pulse_generator
	PORT(clock : IN STD_LOGIC;
		 signal : IN STD_LOGIC;
		 pulse : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT true_ram_sclk
	PORT(wr_ena : IN STD_LOGIC;
		 wr_clk : IN STD_LOGIC;
		 rd_ena : IN STD_LOGIC;
		 rd_clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rd_addr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 wr_addr : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 dval : OUT STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram_es
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem_read_control
	PORT(clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 start_read_pulse : IN STD_LOGIC;
		 ff_tx_septy : IN STD_LOGIC;
		 ff_tx_a_full : IN STD_LOGIC;
		 fg_rdy : IN STD_LOGIC;
		 payload_rdy : IN STD_LOGIC;
		 event_size : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 FIFO_in_dly : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 max_payload : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 ram_upper_limit : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		 es_rd_req : OUT STD_LOGIC;
		 data_rd_req : OUT STD_LOGIC;
		 error : OUT STD_LOGIC;
		 work_in_progress : OUT STD_LOGIC;
		 trigger_fg : OUT STD_LOGIC;
		 chunk_id : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data_rd_addr : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		 es_rd_addr : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 limit : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 payload_len : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	chunk_id :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	data_out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	data_rd_addr :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	data_rd_req :  STD_LOGIC;
SIGNAL	data_valid :  STD_LOGIC;
SIGNAL	data_wr_addr :  STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL	data_wr_req :  STD_LOGIC;
SIGNAL	EFG_error :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	error :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	error_01 :  STD_LOGIC;
SIGNAL	error_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	es_rd_addr :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	es_rd_req :  STD_LOGIC;
SIGNAL	es_wr_addr :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	es_wr_req :  STD_LOGIC;
SIGNAL	event_data :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	event_in_progress :  STD_LOGIC;
SIGNAL	event_size :  STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL	event_size_out :  STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL	fg_rdy :  STD_LOGIC;
SIGNAL	fg_trigger :  STD_LOGIC;
SIGNAL	go_to_buff :  STD_LOGIC;
SIGNAL	is_buff :  STD_LOGIC;
SIGNAL	is_valid :  STD_LOGIC;
SIGNAL	L1A_event :  STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL	L1A_wr_addr :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	L1A_wr_req :  STD_LOGIC;
SIGNAL	mem_read_error :  STD_LOGIC;
SIGNAL	memory_usage_err :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	payload_len :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	payload_rdy :  STD_LOGIC;
SIGNAL	read_rounds :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	work_in_progress :  STD_LOGIC;
SIGNAL	write_rounds :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : mem_write_control_v3
PORT MAP(clock => The_clock,
		 reset => reset,
		 data_in => data_in,
		 mem_upper_limit => mem_upper_limit,
		 data_wr_req => data_wr_req,
		 es_wr_req => es_wr_req,
		 L1A_wr_req => L1A_wr_req,
		 event_in_progress => event_in_progress,
		 error_01 => error_01,
		 data_out => data_out,
		 data_wr_addr => data_wr_addr,
		 error_00 => error,
		 es_wr_addr => es_wr_addr,
		 event_size => event_size,
		 L1A_event => L1A_event,
		 L1A_wr_addr => L1A_wr_addr,
		 write_rounds => write_rounds);


b2v_inst1 : ram_l1a
PORT MAP(wren => L1A_wr_req,
		 rden => L1A_rd_req,
		 clock => The_clock,
		 data => L1A_event,
		 rdaddress => L1A_rd_addr,
		 wraddress => L1A_wr_addr,
		 q => L1A_out);


b2v_inst100 : ethernet_frame_generator
PORT MAP(clock => The_clock,
		 reset => reset,
		 ff_tx_rdy => ff_tx_rdy,
		 ff_tx_a_full => ff_tx_a_full,
		 data_start => fg_trigger,
		 data_valid => data_valid,
		 ff_tx_septy => ff_tx_septy,
		 lv2_info_valid => lv2_info_valid,
		 chunk_id => chunk_id,
		 crate_id => crate_id,
		 data_in => event_data,
		 dest_ip => dest_ip,
		 ether_header_0 => ether_header_0,
		 ether_header_1 => ether_header_1,
		 ether_header_2 => ether_header_2,
		 ether_type => ether_type,
		 event_id => event_id,
		 lv2_packet => lv2_packet,
		 nListenPorts => nListenPorts,
		 payload_len => payload_len,
		 port_id => port_id,
		 source_ip => source_ip,
		 spill_id => spill_id,
		 ff_tx_wren => ff_tx_wren,
		 ff_tx_eop => ff_tx_eop,
		 ff_tx_sop => ff_tx_sop,
		 payload_rdy => payload_rdy,
		 fg_rdy => fg_rdy,
		 error_buff => error_out_ALTERA_SYNTHESIZED(8),
		 error => EFG_error,
		 ff_tx_data => ff_tx_data);


b2v_inst15 : pulse_generator_falledge
PORT MAP(clock => The_clock,
		 signal => event_in_progress,
		 pulse => event_finish_write);


b2v_inst16 : memory_monitor_v1
PORT MAP(clk => The_clock,
		 reset => reset,
		 limit => mem_upper_limit,
		 n1 => write_rounds,
		 n2 => read_rounds,
		 rd_addr => data_rd_addr,
		 wr_addr => data_wr_addr,
		 error => memory_usage_err,
		 usage => mem_usage);


b2v_inst17 : pulse_generator_falledge
PORT MAP(clock => The_clock,
		 signal => work_in_progress,
		 pulse => event_finish_read);

error_out_ALTERA_SYNTHESIZED(0) <= error(0);



b2v_inst228 : pulse_generator
PORT MAP(clock => The_clock,
		 signal => work_in_progress,
		 pulse => event_start_read);

error_out_ALTERA_SYNTHESIZED(1) <= error_01;


error_out_ALTERA_SYNTHESIZED(6 DOWNTO 2) <= EFG_error;



b2v_inst48 : true_ram_sclk
PORT MAP(wr_ena => data_wr_req,
		 wr_clk => The_clock,
		 rd_ena => data_rd_req,
		 rd_clk => The_clock,
		 data => data_out,
		 rd_addr => data_rd_addr,
		 wr_addr => data_wr_addr,
		 dval => data_valid,
		 q => event_data);

error_out_ALTERA_SYNTHESIZED(7) <= mem_read_error;



b2v_inst94 : ram_es
PORT MAP(wren => es_wr_req,
		 rden => es_rd_req,
		 clock => The_clock,
		 data => event_size,
		 rdaddress => es_rd_addr,
		 wraddress => es_wr_addr,
		 q => event_size_out);


b2v_inst97 : mem_read_control
PORT MAP(clock => The_clock,
		 reset => reset,
		 start_read_pulse => start_read_pulse,
		 ff_tx_septy => ff_tx_septy,
		 ff_tx_a_full => ff_tx_a_full,
		 fg_rdy => fg_rdy,
		 payload_rdy => payload_rdy,
		 event_size => event_size_out,
		 FIFO_in_dly => FIFO_in_delay,
		 max_payload => max_payload,
		 ram_upper_limit => mem_upper_limit,
		 es_rd_req => es_rd_req,
		 data_rd_req => data_rd_req,
		 error => mem_read_error,
		 work_in_progress => work_in_progress,
		 trigger_fg => fg_trigger,
		 chunk_id => chunk_id,
		 data_rd_addr => data_rd_addr,
		 es_rd_addr => es_rd_addr,
		 limit => read_rounds,
		 payload_len => payload_len);

error_out <= error_out_ALTERA_SYNTHESIZED;
mem_err <= memory_usage_err;

END bdf_type;
