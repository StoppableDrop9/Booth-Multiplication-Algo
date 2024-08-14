`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 00:25:55
// Design Name: 
// Module Name: COUNTER
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


module COUNTER(count,eqz,Ld,dec,clk);
input clk,dec,Ld; output reg [5:0]count;output eqz;
assign eqz=~|count;
always @(posedge clk)begin 
if(Ld)count<=6'b100000;
else if(dec)count<=count-1;
end
endmodule
