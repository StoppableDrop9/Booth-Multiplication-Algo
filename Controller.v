`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2024 11:42:10
// Design Name: 
// Module Name: Controller
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


module Controller(Done,LdA,LdQ,LdM,clrA,clrQ,add_sub,shift_en,LdCNT,decCNT,Q1,Q,eqz,data_in,Start,clk);
input Start,clk,eqz,Q1; input signed[31:0]Q,data_in; 
output reg Done,LdA,LdQ,LdM,clrA,clrQ,add_sub,shift_en,LdCNT,decCNT;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110; 
reg [2:0]state;
always @(posedge clk)begin 
case(state)
S0:begin if(Start)state<=S1;
end
S1:begin state<=S2;
end
S2:begin #2 if({Q[0],Q1}==2'b01)state<=S3;
            else if({Q[0],Q1}==2'b10)state<=S4;
            else state<=S5;
end
S3:begin state<=S5;
end
S4:begin state<=S5;
end
S5:begin #2 if(({Q[0],Q1}==2'b01)&&(!eqz))state<=S3;
            else if(({Q[0],Q1}==2'b10)&&(!eqz))state<=S4;
            else if(eqz)state<=S6;
end
S6:begin state<=S6;
end
default:begin state<=S0;
end
endcase
end

always @(state)begin 
case(state)
S0:begin #1 LdA=0;LdQ=0;LdM=0;clrA=0;clrQ=0;LdM=0;shift_en=0;LdCNT=0;decCNT=0;
end
S1:begin #1 clrA=1;LdCNT=1;LdM=1; 
end
S2:begin #1 LdQ=1;clrA=0;LdCNT=0;
end
S3:begin #1 LdA=1;add_sub=1;LdQ=0;decCNT=0;
end
S4:begin #1 LdA=1;add_sub=0;LdQ=0;decCNT=0;
end
S5:begin #1 LdA=0;LdQ=0;shift_en=1;decCNT=1;
end
S6:begin Done=1;decCNT=0;shift_en=0;
end
default:begin LdA=0;LdQ=0;LdM=0;clrA=0;clrQ=0;LdM=0;shift_en=0;LdCNT=0;decCNT=0;
end
endcase
end
endmodule
