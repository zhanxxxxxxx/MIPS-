`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/05 21:36:44
// Design Name: 
// Module Name: controller
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

module controller(input logic [5:0] op, funct,
                input logic zero,
                output logic memtoreg, memwrite,
                output logic pcsrc, alusrc, regdst, regwrite,
                output logic jump, 
                output logic sig,
                output logic [2:0] alucontrol);

    logic [2:0] aluop;
    logic branch;

    maindec md(.op(op), 
               .memtoreg(memtoreg), 
               .memwrite(memwrite), 
               .branch(branch), 
               .alusrc(alusrc), 
               .regdst(regdst), 
               .regwrite(regwrite), 
               .jump(jump), 
               .sig(sig), 
               .aluop(aluop));
    aludec ad(.funct(funct), 
              .aluop(aluop), 
              .alucontrol(alucontrol));

    always_comb
        case(op)
            6'b000101: pcsrc = branch & (~zero);//bne
            default: pcsrc = branch & zero;//beq
        endcase   
endmodule
