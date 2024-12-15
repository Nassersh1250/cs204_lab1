`timescale 1ns / 1ps


module Registerfile#(parameter n = 16)(
    input logic [5:0] opcode,
    output logic [n-1:0] rs1, rs2,
    input logic [n-1: 0] rd,
    input logic clk,reset_n
    );
    logic [n-1:0] register[0:3];
    initial $readmemb("/home/it/Desktop/CX204/CX-204-Lab1/support_files/fib_rf.mem", register); 
    assign register[0] = 0;
always@(*) begin 
    case(opcode[1:0])
        2'b00: rs1 = register[0];
        2'b01: rs1 = register[1];
        2'b10: rs1 = register[2];
        2'b11: rs1 = register[3];
        default : rs1 = 0; 
        endcase
        
     case (opcode[3:2]) 
         2'b00: rs2 = register[0];
         2'b01: rs2 = register[1];
         2'b10: rs2 = register[2];
         2'b11: rs2 = register[3];
         default : rs2 = 0;           
         endcase
end


always@(posedge clk or reset_n) begin 
    
    case (opcode[5:4])
        2'b01: register[1] = rd;
        2'b10: register[2] = rd;
        2'b11: register[3] = rd;
        endcase
        end
        
endmodule
