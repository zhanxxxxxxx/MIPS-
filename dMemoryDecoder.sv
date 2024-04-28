`timescale 1ns/1ps
module dMemoryDecoder (
    input logic clk,
    input logic[7:0] addr,
    input write,
    input logic[31:0] writeData,
    output logic[31:0] readData,
    input logic reset,
    input logic btnL,
    input logic btnR,
    input logic[15:0] switch,
    output logic[7:0] an,
    output logic[6:0] a2g,
    output logic dp
);
logic [9:0] result1;
logic [9:0] result2;
logic [9:0] result3;

    shift shift1(.bin_in(switch[15:8]),.bcd_out(result1));
    shift shift2(.bin_in(switch[7:0]),.bcd_out(result2));


logic [31:0] readData1;
logic [31:0] readData2;
logic [11:0] led;

    decoder decoder(.write(write),
                    .s(addr[7]),
                    .a(we),
                    .b(pwrite));
        
   
    dmem dmem(.clk(clk),
              .we(we),
              .a({24'b0,addr}),
              .wd(writeData),
              .rd(readData1));
    
    IO IO(.clk(clk),
          .reset(reset),
          .pRead(addr[7]),
          .pWrite(pwrite),
          .addr(addr[3:2]),
          .pWriteData(writeData[11:0]),
          .pReadData(readData2),
          .buttonL(btnL),
          .buttonR(btnR),
          .switch(switch),
          .led(led));
    
    shift shift3(.bin_in(led[7:0]),.bcd_out(result3));

    mux2 #(32) mux2_1(.d0(readData1),
                      .d1(readData2),
                      .s(addr[7]),
                      .y(readData));
    

    mux7seg mux7seg(.x({result1[7:0],result2[7:0],6'b101000,result3}),
            .clk(clk),
            .clr(reset),
            .a2g(a2g),
            .an(an),
            .dp(dp));

endmodule


