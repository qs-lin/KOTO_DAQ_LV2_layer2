module delta_reset(clk,rst,delta_trig,delta_rst);

input wire clk;
input wire delta_trig;
input wire rst;
output reg delta_rst;

reg[1:0] pipe;
//reg[8:0] counter = 9'b0;
reg[8:0] reset_cnt = 9'b0;

reg lock = 1'b0;

always @(posedge clk)
begin


if(rst)
begin
  //counter   = 9'b0;
  lock      = 1'b0;
  reset_cnt = 9'b0;
  pipe      = 2'b0;
end

pipe[1]=pipe[0];
pipe[0]=delta_trig;


//rising edge of LIVE
if(pipe[0]==1'b1 && pipe[1]==1'b0)
begin
  //counter = counter + 1'b1;
  lock = 1'b1;
end

if(lock)
begin
  reset_cnt = reset_cnt + 1'b1;
  delta_rst  = 1'b1;
end
else
begin
  reset_cnt = 9'b0;
  delta_rst  = 1'b0; 
end

if(reset_cnt == 7'b110_0100)  //100
  lock = 1'b0;

//cnt = counter;  



end
endmodule
