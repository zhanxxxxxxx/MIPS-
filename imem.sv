`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 08:47:06
// Design Name: 
// Module Name: imem
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

module imem(input logic [5:0] a, //pc 
            output logic [31:0] rd); //instruction
      
      logic  [31:0] RAM[255:0];
      
      initial 
         begin
            $readmemh("testIO.dat", RAM);
         end 
      assign rd = RAM[a];
endmodule
