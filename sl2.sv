`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 20:34:19
// Design Name: 
// Module Name: sl2
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

module sl2(input logic [31:0] a,
           output logic [31:0] y);
    assign y = {a[29:0], 2'b00};
endmodule
