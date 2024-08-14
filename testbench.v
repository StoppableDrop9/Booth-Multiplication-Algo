`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 16:27:15
// Design Name: 
// Module Name: testbench
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


module testbench;
reg clk,Start; reg signed[31:0]data_in;
wire Done;wire signed[31:0]Q;
Controller CNTRL(Done,LdA,LdQ,LdM,clrA,clrQ,add_sub,shift_en,LdCNT,decCNT,Q1,Q,eqz,data_in,Start,clk);
Data_path DP(LdA,LdQ,clrA,clrQ,LdM,add_sub,shift_en,Q,Q1,LdCNT,decCNT,eqz,data_in,clk);
wire signed[63:0]Product={DP.A,DP.Q};wire signed[31:0]A=DP.A,M=DP.M;
initial begin 
clk=1'b0;
#3 Start=1;
#500 $finish;
end

always #5 clk=~clk;

initial begin 
#17 data_in=-10;
#10 data_in=13;
end
initial begin 
$display("Simulation begins at time=%3d",$time);
$monitor("Simulation Time=%d, Product=%d, Done=%b",$time,{DP.A,DP.Q},Done);
end
endmodule
