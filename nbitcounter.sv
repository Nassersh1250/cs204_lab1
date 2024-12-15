`timescale 1ns / 1ps

module nbitcounter#(parameter N = 3)(
    input [1:0] D,
    input logic clk, R,
    output logic [1:0] Q

    );
    
    always_ff@(posedge clk, negedge R)
        begin  
            if (R == 0) Q<=0;
            else if (Q == 3)  Q<=0;
            else Q <= Q+1;
        end 
endmodule
