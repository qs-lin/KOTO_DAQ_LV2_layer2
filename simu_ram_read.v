module simu_ram_read(clk,reset,trigger,total_number,rd_addr,rd_req);

input wire clk;
input wire reset;
input wire trigger;
input wire[9:0] total_number;

output reg rd_req;
output reg[9:0] rd_addr;

reg in_progress;
reg[9:0] counter;

always @(posedge clk)
begin

  if(reset)
  begin
    in_progress = 1'b0;
    counter     = 10'b0;
	rd_req      = 1'b0;
	rd_addr     = 10'b0;
  end

  in_progress = trigger ? 1'b1 : in_progress;
  
  if(in_progress)
  begin
    rd_req  = 1'b1;
	counter = counter + 1'b1;
  end
  else
  begin
    rd_req  = 1'b0;
	counter = 10'b0;
  end	 
  if(counter == total_number)
  begin
    in_progress = 1'b0;
	 //counter = 15'b0;
  
  end
  
  rd_addr = counter; 
end

endmodule
