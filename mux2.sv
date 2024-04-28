`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 10:12:26
// Design Name: 
// Module Name: mux2
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
//ready width = 8?

module mux2 #(parameter WIDTH=8)
            (input logic [WIDTH-1:0] d0, d1,
            input logic s,
            output logic [WIDTH-1:0] y);
    assign y = s ? d1 : d0;
endmodule
