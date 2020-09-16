module OL_Controller(	
	clk,
	LIVE,
	data_tx,
	data_rx,
	ena_rx,
	data_out,
	ena_tx,
	datak,
	error,
	send_err,
	mode
);

input wire clk;
input wire LIVE;
input wire [15:0] data_tx;
input wire [15:0] data_rx;
input wire ena_rx;

output reg [15:0] data_out;
output reg ena_tx = 1'b1;
output reg [1:0] datak;
output reg error = 1'b1;
output reg send_err = 1'b0;
output reg[1:0] mode = 2'b11;
reg error_reg = 1'b1;

reg [15:0] pattern_align = 16'h50BC;
reg [15:0] pattern_check = 16'hFFEE;
//reg [1:0] mode = 2'b11; // 0: alignment mode 1: test mode, 2: data mode

reg [19:0] control = 20'b0;
reg [10:0] cnt_pattern = 11'b0;

reg [15:0] pipe_rx [1:0];
reg [15:0] counter = 16'b0;

always @(posedge clk)
begin
	
	mode = (LIVE==1'b0)? 2'b00:mode;
	
	case(mode)
	2'b00: // alignment
	begin
	
		data_out = pattern_align; 
		ena_tx = (control<20'hFDDDD)? 1'b0 : 1'b1;
		datak = (control<20'hFDDDD)? 2'b11 : 2'b00;	
		mode = (control==20'hFEEEE && LIVE==1'b1)? 2'b01 : mode;	
		error = 1'b1;
		error_reg = 1'b1;
		cnt_pattern = 11'b0;
		send_err = 1'b0;
		
		control = control + 1'b1;
		
	end
	2'b01: // test mode
	begin
	
		pipe_rx[1] = pipe_rx[0];
		pipe_rx[0] = data_rx;		
		ena_tx = 1'b1;
		datak = 2'b00;
		data_out = counter;
		cnt_pattern = ((pipe_rx[0]-pipe_rx[1])==1'b1)? cnt_pattern + 1'b1 : 10'b0;
		error_reg = (cnt_pattern==11'b11111111111)? 1'b0 : error_reg;
		error = 1'b1;
		
		if(control==20'hFFFFF)
		begin
			mode = 2'b10;
			send_err = 1'b1;
			error = (ena_rx==1'b0)? 1'b0 : error_reg;
		end
		
		counter = counter + 1'b1;
		
		control = control + 1'b1;
		
	end
	2'b10: // data mode
	begin
	
		ena_tx = 1'b1;
		datak = 2'b00;
		data_out = data_tx;
		send_err = 1'b0;
		
	end
	
	endcase
//	error = (ena_rx==1'b0)? 1'b0 : error;
	
end

endmodule
