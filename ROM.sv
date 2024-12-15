`timescale 1ns / 1ps


module ROM(//parameter n = 8
//input [n-1:0] a,
//output [n-1:0] b,

input logic [1:0]a, output logic [7:0]b
    );

    logic [7:0] instruction[3:0];
    initial $readmemb("/home/it/Desktop/CX204/CX-204-Lab1/support_files/fib_im.mem", instruction); 

    always @(*)
    begin
    
    case (a)
    2'b00: b = instruction[0];
    2'b01: b = instruction[1];
    2'b10: b = instruction[2];
    2'b11: b = instruction[3];   
    default: b = 8'bxxxx;
    
    
    endcase
    
    
    end
endmodule