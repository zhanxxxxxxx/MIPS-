`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 21:48:45
// Design Name: 
// Module Name: mips
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

module mips(input logic clk, reset,
            output logic [31:0] pc, 
            input logic [31:0]instr,
            output logic memwrite,
            output logic [31:0] aluout, writedata,
            input logic [31:0] readdata);
            
    logic memtoreg, alusrc, regdst, regwrite,jump,pcsrc,zero;
    logic [2:0] alucontrol;
    controller c(.op(instr[31:26]),
                 .funct(instr[5:0]), 
                 .zero(zero), 
                 .memtoreg(memtoreg), 
                 .memwrite(memwrite), 
                 .pcsrc(pcsrc), 
                 .alusrc(alusrc), 
                 .regdst(regdst), 
                 .regwrite(regwrite), 
                 .jump(jump), 
                 .sig(sig), 
                 .alucontrol(alucontrol));
    datapath dp(.clk(clk),
                .reset(reset),
                .memtoreg(memtoreg), 
                .pcsrc(pcsrc), 
                .alusrc(alusrc), 
                .regdst(regdst), 
                .regwrite(regwrite), 
                .jump(jump), 
                .sig(sig), 
                .alucontrol(alucontrol), 
                .zero(zero), 
                .pc(pc), 
                .instr(instr), 
                .aluout(aluout), 
                .writedata(writedata), 
                .readdata(readdata));
endmodule

