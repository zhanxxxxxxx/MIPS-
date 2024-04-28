`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 23:01:37
// Design Name: 
// Module Name: top
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


// module top(input logic clk,reset,
//             output logic [31:0] writedata, dataadr,
//             output logic memwrite);
//     logic [31:0] pc, instr, readdata;
//     //instantiate processor and memories
//     mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
//     imem imem(pc[7:2], instr);
//     dmem dmem(clk, memwrite, dataadr, writedata, readdata);
// endmodule

module Top (
    input logic CLK100MHZ,
    input logic BTNC,
    input logic BTNL,
    input logic BTNR,
    input logic [15:0] SW,
    output logic[7:0] AN,
    output logic [6:0] A2G,
    output logic dp
);
logic [31:0] pc,instr;
imem imem(.a(pc[7:2]),
          .rd(instr));

logic Write;
logic[31:0] dataAdr,writeData,readData;

mips mips(.clk(CLK100MHZ),
          .reset(BTNC),
          .pc(pc),
          .instr(instr),
          .memwrite(Write),
          .aluout(dataAdr),
          .writedata(writeData),
          .readdata(readData)
          );

dMemoryDecoder dmd(.clk(CLK100MHZ),
                   .write(Write),
                   .addr(dataAdr[7:0]),
                   .writeData(writeData),
                   .readData(readData),
                   .reset(BTNC),
                   .btnL(BTNL),
                   .btnR(BTNR),
                   .switch(SW),
                   .an(AN),
                   .a2g(A2G),
                   .dp(dp)
                    );
    
endmodule