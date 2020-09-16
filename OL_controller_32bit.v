/*
-------------------------------------------------------------------------------
-- Title      : OL_controller_32bit 
-- Project    : DAQ_LV2
-------------------------------------------------------------------------------
-- File       : OL_controller_32.v 
-- Author     : Qisen Lin  <qslin@uchicago.edu>
-- Company    : University of Chicago
-- Created    : 2019-01-01
-- Last update: 2019-02-03
-- Platform   :
-------------------------------------------------------------------------------
-- Description:
-- Send out alignment pattern during LIVE off 
-- Check pattern shortly after LIVE on 
-- The alignment pattern is copied from 16 bit case.  
-- Sometimes the two 16-bit word in the 32-bit word will be firstly flipped, and then shifted 
-- To detect this, one more logic is used and output the delay_mode
-- delay_mode : 0 work perfectly
-- delay_mode : 1 flipped and shifted. We can correct it once we received data
-- delay_mode : 2 alignemnt is not working
-------------------------------------------------------------------------------
-- Copyright (c) 2018 University of Chicago
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-01-01  1.0      Qisen   Send out {32b'counter} 
-- 2019-02-03  2.0      Qisen   Send out {16b'counter, 16b'counter+1} 
-------------------------------------------------------------------------------
*/

module OL_Controller_32(    
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
    delay_mode
);

input wire clk;
input wire LIVE;
input wire [31:0] data_tx;
input wire [31:0] data_rx;
input wire ena_rx;

output reg [31:0] data_out;
output reg ena_tx = 1'b1;
output reg [3:0] datak;
output reg error = 1'b1;
output reg send_err = 1'b0;
output reg[1:0] delay_mode = 2'b0;

reg error_reg = 1'b1;

reg [15:0] pattern_align = 16'h50BC;
reg [15:0] pattern_check = 16'hFFEE;
reg [1:0] mode = 2'b11; // 0: alignment mode 1: test mode, 2: data mode

reg [19:0] control = 20'b0;
reg [10:0] cnt_pattern = 11'b0;

reg [31:0] pipe_rx [1:0];
reg [15:0] counter = 16'b0;
reg [15:0] align_counter = 16'b0;

always @(posedge clk)
begin
    
    mode = (LIVE==1'b0)? 2'b00:mode;
    align_counter = align_counter + 1'b1;
    
    case(mode)
    2'b00: // alignment
    begin
    
        data_out = {align_counter,pattern_align}; 
        ena_tx = (control<20'hFDDDD)? 1'b0 : 1'b1;
        datak = (control<20'hFDDDD)? 4'b0011 : 4'b0000; 
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
        datak = 4'b0000;
        data_out = {counter,counter+1'b1};
        cnt_pattern = ( (pipe_rx[0][31:16]-pipe_rx[1][31:16])==1'b1 && (pipe_rx[0][15:0]-pipe_rx[1][15:0])==1'b1 )? cnt_pattern + 1'b1 : 11'b0;
        error_reg = (cnt_pattern==11'b11111111111)? 1'b0 : error_reg;
        error = 1'b1;
        
        if(control==20'hFFFFF)
        begin
            mode = 2'b10;
            send_err = 1'b1;
            error = (ena_rx==1'b0)? 1'b0 : error_reg;
            if( (pipe_rx[0][15:0]-pipe_rx[0][31:16])==1'b1 )
              delay_mode = 2'b0;
            else if( (pipe_rx[0][31:16]-pipe_rx[0][15:0])==2'b10 )
              delay_mode = 2'b01;
            else
             delay_mode = 2'b10;
        end
        
        counter = counter + 1'b1;
        
        control = control + 1'b1;
        
    end
    2'b10: // data mode
    begin
    
        ena_tx = 1'b1;
        datak = 4'b0000;
        data_out = data_tx;
        send_err = 1'b0;
        
    end
    
    endcase
//  error = (ena_rx==1'b0)? 1'b0 : error;
    
end

endmodule

