`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 00:25:55
// Design Name: 
// Module Name: D_FF
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


module D_FF(D,Q,shift_en,clk);
input D,clk,shift_en;output reg Q;
always @(posedge clk)begin 
if(shift_en)Q<=D;
else Q<=1'b0;
end
endmodule
