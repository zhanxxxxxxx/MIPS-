`timescale 1ns/1ps
module decoder (
    input logic write,
    input logic s,
    output logic a,
    output logic b
);
    always_comb
    begin
        case (s)
            1: begin
                   a = 1'b0;
                   b = write; 
               end
            default: begin
                        a = write;
                        b = 1'b0;
                     end
        endcase
    end
endmodule