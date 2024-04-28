`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 09:38:59
// Design Name: 
// Module Name: alu
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
//maybe ready

module alu(input logic [31:0] a, b,
        input logic [2:0] alucont,
        output logic [31:0] result,
        output logic zf);
    always@(*)
    begin
        case(alucont[2:0])
            3'b000: result <= a & b;//and
            3'b001: result <= a | b;//or
            3'b010: result <= a + b;//add
            3'b110: result <= a - b;//sub
            3'b111: result <= a < b ? 1 : 0;//slt
            default: result <= 0;
        endcase
        zf <= a == b ? 1 : 0;
    end
endmodule
