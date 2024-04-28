`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 09:32:48
// Design Name: 
// Module Name: signext
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
module signext(input logic sig,
            input logic [15:0] a,
            output logic [31:0] y);
    always_comb
    case(sig)
        1: y={{16{a[15]}}, a};
        0: y={16'b0, a};
    endcase
endmodule
