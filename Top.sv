`timescale 1ns / 1ps

localparam IMEM_DEPTH=64;
localparam REGF_WIDTH=16;
localparam ALU_WIDTH=16;
localparam PROG_VALUE=3;

module Top(
    input logic clk, reset_n
    );
    
    logic [REGF_WIDTH-1:0] rs1,rs2,rd ;
    logic [7:0] opcode;
    logic [1:0] count;
    
    nbitcounter PC(.clk(clk),.R(reset_n),.Q(count));
    
    ROM mem(.a(count), .b(opcode));
    
    Registerfile RF(.rs1(rs1), .rs2(rs2),.rd(rd),.clk(clk),.reset_n(reset_n), .opcode(opcode[7:2]));
    
    ALU alu( .opcode(opcode[1:0]),.sum(rd), .a(rs1), .b(rs2));
endmodule
