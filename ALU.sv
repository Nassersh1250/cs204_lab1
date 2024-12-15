`timescale 1ns / 1ps

module ALU#(parameter n = 16)(
    input [n-1:0] a,
    input [n-1:0] b,
    input [1:0]opcode,
    output logic [n-1:0] sum,
    output logic cout
    );
    
    always@(*)
    begin 
    if (opcode == 2'b00) begin
        {cout,sum} = a+b;
        end
    else if (opcode == 2'b01) begin
        {cout,sum} = a-b;
        end
     else if (opcode == 2'b10) begin 
        sum = a&b;
        end
     else if (opcode == 2'b11) begin
        sum = a|b;
        end
    end
endmodule
