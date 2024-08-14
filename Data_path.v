`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2024 11:42:10
// Design Name: 
// Module Name: Data_path
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


module Data_path(LdA,LdQ,clrA,clrQ,LdM,add_sub,shift_en,Q,Q1,LdCNT,decCNT,eqz,data_in,clk);
input LdA,LdQ,clrA,clrQ,LdM,add_sub,shift_en,LdCNT,decCNT,clk; 
input signed[31:0]data_in; 
output signed[31:0]Q; 
output eqz,Q1;
wire signed [31:0]A,M,Z;wire[5:0]count;
shift_register AR(clrA,LdA,shift_en,A,Z,A[31],clk);
shift_register QR(clrQ,LdQ,shift_en,Q,data_in,A[0],clk);
PIPO MR(LdM,data_in,M,clk);
ALU alu(Z,A,M,add_sub);
COUNTER counter(count,eqz,LdCNT,decCNT,clk);
D_FF q_1(Q[0],Q1,shift_en,clk);
endmodule
