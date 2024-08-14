`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 00:25:55
// Design Name: 
// Module Name: shift_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_register(clr,Ld,shift_en,data_out,data_in,s_in,clk);
input clr,Ld,shift_en,s_in,clk;input signed[31:0]data_in;output reg signed[31:0]data_out;
always @(posedge clk)begin 
if(clr)data_out<=31'b0;
else if(Ld)data_out<=data_in;
else if(shift_en)data_out<={s_in,data_out[31:1]};
end
endmodule
