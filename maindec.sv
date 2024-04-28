`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 21:06:02
// Design Name: 
// Module Name: maindec
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

module maindec(input logic [5:0] op,
            output logic memtoreg, memwrite,
            output logic branch, alusrc,
            output logic regdst, regwrite,
            output logic jump,
            output logic sig,
            output logic [2:0] aluop);
    logic [10:0] controls;
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop, sig} = controls;
    always_comb
        case(op)
            6'b000000: controls <= 11'b11000000101;//rtype
            6'b100011: controls <= 11'b10100100001;//lw
            6'b101011: controls <= 11'b00101000001;//sw
            6'b000100: controls <= 11'b00010000011;//beq
            6'b000101: controls <= 11'b00010000011;//bne
            6'b001000: controls <= 11'b10100000001;//addi
            6'b001100: controls <= 11'b10100000110;//andi
            6'b001101: controls <= 11'b10100001000;//ori
            6'b101010: controls <= 11'b10100001011;//slti
            6'b000010: controls <= 11'b00000010001;//j
            default:controls <= 11'bxxxxxxxxxxx;//
        endcase
endmodule



