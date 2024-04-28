`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/16 21:45:23
// Design Name: 
// Module Name: mux7seg
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


module mux7seg( input  logic [31:0] x,
              input  logic        clk,
              input  logic        clr,
              output logic [6:0]  a2g,
              output logic [7:0]  an, 
              output logic        dp ); 
    
    logic [2:0] s;     
    logic [3:0] digit;
    logic [19:0] clkdiv;
    
    assign dp = 1;           
    assign s = clkdiv[19:17];        
    
   
    always_comb
        case(s)
            0:  digit = x[3:0];
            1:  digit = x[7:4];
            2:  digit = x[11:8];//00xx
            3:  digit = x[15:12];//1010 '='
            4:  digit = x[19:16];
            5:  digit = x[23:20];
            6:  digit = x[27:24];
            7:  digit = x[31:28];
            default: digit = x[3:0];
        endcase
    
    always_comb
        case(s)
            0:  an = 8'b11111110;
            1:  an = 8'b11111101;
            2:  an = 8'b11111011;
            3:  an = 8'b11110111;
            4:  an = 8'b11101111;
            5:  an = 8'b11011111;
            6:  an = 8'b10111111;
            7:  an = 8'b01111111;
            default: an = 8'b11111110;
        endcase
        
   
    always @(posedge clk, posedge clr)
      if(clr == 1) clkdiv <= 0;
      else         clkdiv <= clkdiv + 1;
    
    Hex7Seg s7(.x(digit), .a2g(a2g));    
endmodule
