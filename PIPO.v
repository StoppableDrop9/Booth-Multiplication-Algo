`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 00:25:55
// Design Name: 
// Module Name: PIPO
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


module PIPO(Ld,data_in,data_out,clk);
input Ld,clk;input signed[31:0]data_in; output  reg signed[31:0]data_out;
always @(posedge clk)begin 
if(Ld)data_out<=data_in;
end
endmodule
