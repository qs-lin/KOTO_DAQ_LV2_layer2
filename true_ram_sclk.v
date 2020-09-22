module true_ram_sclk
(
    input [31:0] data,
    input [17:0] wr_addr,rd_addr,
    input wr_ena,  wr_clk, rd_ena, rd_clk,
    output reg [31:0] q,
    output reg dval
);
    // Declare the RAM variable
    reg [31:0] ram[230000:0];
	
	// Write
	always @ (posedge wr_clk)
	begin
		if (wr_ena) 
		begin
			ram[wr_addr] <= data;
			//q_a <= data_a;
		end
	end

	// Read	
	always @ (posedge rd_clk)
	begin
		if(rd_ena)
		begin
		  q <= ram[rd_addr];
		  dval <= 1'b1;
		end

		else
		  dval <= 1'b0;		
		  
		  //q_a <= 16'b0;

	end
	
endmodule	
