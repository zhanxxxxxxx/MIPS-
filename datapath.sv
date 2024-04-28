`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 21:58:29
// Design Name: 
// Module Name: datapath
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


module datapath(input logic clk, reset,
                input logic memtoreg, pcsrc,
                input logic alusrc,regdst,
                input logic regwrite, jump,
                input logic sig,//0 or 1 expend
                input logic [2:0] alucontrol,
                output logic zero,
                output logic [31:0] pc,
                input logic [31:0] instr,
                output logic [31:0] aluout,writedata,
                input logic [31:0] readdata);

    logic [4:0] writereg;
    logic[31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    logic[31:0] signimm, signimmsh;
    logic [31:0] srca, srcb;
    logic [31:0] result;

    flopr #(32) pcreg(.clk(clk), .reset(reset), .d(pcnext), .q(pc));
    adder pcadd1(.a(pc), .b(32'b100), .y(pcplus4));//pc+4
    sl2 immsh(.a(signimm), .y(signimmsh));
    adder pcadd2(.a(pcplus4), .b(signimmsh), .y(pcbranch));//beq, bne
    mux2 #(32) pcbrmux(.d0(pcplus4), .d1(pcbranch), .s(pcsrc), .y(pcnextbr));//beq, bne
    mux2 #(32) pcmux(.d0(pcnextbr), .d1({pcplus4[31:28], instr[25:0], 2'b00}), .s(jump), .y(pcnext));
    // register file logic

    regfile rf(.clk(clk), 
               .we3(regwrite), 
               .ra1(instr[25:21]), 
               .ra2(instr[20:16]), 
               .wa3(writereg), 
               .wd3(result), 
               .rd1(srca), 
               .rd2(writedata));
    mux2 #(5) wrmux(instr[20:16], instr[15:11], regdst, writereg);
    mux2 #(32) resmux(aluout, readdata, memtoreg, result);
    signext se(.sig(sig), .a(instr[15:0]), .y(signimm));
    // ALU 1ogic
    mux2 #(32) srcbmux(.d0(writedata), .d1(signimm), .s(alusrc), .y(srcb));

    alu alu(.a(srca), .b(srcb), .alucont(alucontrol), .result(aluout), .zf(zero));
endmodule
