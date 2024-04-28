`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 20:41:48
// Design Name: 
// Module Name: adder
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
//ready

module adder(input logic [31:0] a,b,
             output logic [31:0] y);
    assign y = a + b;
endmodule

/*20020005
2003000C
2067FFF7
00E22025
00642824
00A42820
10A7000A
0064202A
10800001
20050000
00E2202A
00853820
00E23822
AC670044
8C020050
08000011
20020001
AC020054*/