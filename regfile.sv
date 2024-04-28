`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 09:27:37
// Design Name: 
// Module Name: regfile
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
module regfile(input logic clk,
                input logic we3,//дʹ��
                input logic [4:0] ra1, ra2, wa3,
                input logic [31:0] wd3,//д����
                output logic [31:0] rd1, rd2);

    logic[31:0] rf[31:0]; // 32��32λ�Ĵ���
    
    always_ff @(posedge clk)
        if(we3) rf[wa3] <= wd3;
        
    assign rd1 = (ra1 != 0) ? rf[ra1] : 0; //$0 = 0
    assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
endmodule
