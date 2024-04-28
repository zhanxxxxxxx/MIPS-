`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/16 21:47:27
// Design Name: 
// Module Name: Hex7Seg
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


module Hex7Seg(
    input  logic [3:0] x,
    output logic [6:0] a2g); 
    // A2G format {ccc  , f, e, d, c, b, a} 
    always_comb
    case (x) 
            4'h0: a2g = 7'b0000001; 
            4'h1: a2g = 7'b1001111; 
            4'h2: a2g = 7'b0010010; 
            4'h3: a2g = 7'b0000110; 
            4'h4: a2g = 7'b1001100; 
            4'h5: a2g = 7'b0100100; 
            4'h6: a2g = 7'b0100000; 
            4'h7: a2g = 7'b0001111; 
            4'h8: a2g = 7'b0000000; 
            4'h9: a2g = 7'b0000100; 
        default: a2g =  7'b0110111; //=
    endcase 
endmodule
