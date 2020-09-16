module TLK_error_output(clk,reset,err_in_00,err_in_01,err_in_02,send_err_00,send_err_01,send_err_02,err_out);

input wire clk;
input wire reset;
input wire err_in_00;
input wire err_in_01;
input wire err_in_02;
input wire send_err_00;
input wire send_err_01;
input wire send_err_02;

output reg[2:0] err_out;

always @(posedge clk)
begin

  if(reset)
  begin
    err_out = 3'b0;
  end

  err_out[0]  = send_err_00  ? err_in_00  : err_out[0];
  err_out[1]  = send_err_01  ? err_in_01  : err_out[1];
  err_out[2]  = send_err_02  ? err_in_02  : err_out[2];



end
endmodule
