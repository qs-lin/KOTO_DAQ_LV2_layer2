module input_control(clk,reset,trig_00,trig_01,input_mode);

input wire clk;
input wire reset;
input wire trig_00;
input wire trig_01;

output reg[1:0] input_mode;

always @(posedge clk)
begin
 
  if(reset)
    input_mode = 2'b0;



  input_mode = trig_00 ? 2'b00 : input_mode;
  input_mode = trig_01 ? 2'b01 : input_mode;




end
endmodule
