`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 10:01:06
// Design Name: 
// Module Name: dmem
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

module dmem(input logic clk, we,
            input logic [31:0] a, wd,
            output logic [31:0] rd);
            
    logic [31:0] RAM [255:0];//change
    assign rd = RAM[a[31:2]]; // word aligned
    always @(posedge clk)
        if(we) RAM[a[31:2]] <= wd;
endmodule
