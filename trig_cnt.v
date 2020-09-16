module trig_cnt(clk,reset,trig_in,trig_cnt);

input wire clk;
input wire reset;
input wire[1:0] trig_in;
output reg[31:0] trig_cnt;

always @(posedge clk)
begin

  trig_cnt = reset ? 32'b0 : trig_cnt;
  trig_cnt = trig_in[0] ? trig_cnt + 1'b1 : trig_cnt;
  trig_cnt = trig_in[1] ? trig_cnt + 1'b1 : trig_cnt;




end
endmodule

