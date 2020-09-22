module memory_monitor_v1(clk,reset,wr_addr,rd_addr,limit,n1,n2,error,usage);

input wire clk, reset;
output reg[1:0] error;
input wire[17:0] wr_addr, rd_addr;
input wire[17:0] limit;
input wire[15:0] n1; //number_of_rounds_wr;      //n1
input wire[15:0] n2; //number_of_rounds_rd;      //n2
// total number of words written in is N1 = n1*limit+ wr_addr
// total number of words read out is   N2 = n2*limit+ rd_addr

output reg[17:0] usage;

reg lock;

always @(posedge clk)
begin

  if(reset)
  begin
    error = 2'b0;
    usage = 17'b0; 
  end

  if(wr_addr>=rd_addr)
  begin
    if(n1==n2)
    begin
      usage = wr_addr - rd_addr;
      error = error;	 
    end
    else if(n1>n2)
	begin
      usage = limit;
      error = 2'b01;	
    end	
    else 
    begin
      usage = limit;
      error = 2'b10;	
    end
  end	
  
  else
  begin
    if(n1>(n2+1'b1))
    begin
      error = 2'b01;
      usage = limit;
    end
    else if(n1==(n2+1'b1))
    begin
      usage = limit - rd_addr + wr_addr;
      error = error;	 
    end
    else
    begin
      error = 2'b10;
      usage = limit;	 
    end
  end 

end
endmodule
