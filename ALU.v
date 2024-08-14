`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 00:25:55
// Design Name: 
// Module Name: ALU
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


module ALU(out,in1,in2,add_sub);
input signed [31:0]in1,in2;input add_sub;output reg signed[31:0]out;
always @(*)begin 
if(add_sub) out<=in1+in2;
else out<=in1-in2;
end
endmodule
