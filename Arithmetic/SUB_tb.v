`timescale 1ns / 1ns
`include "SUB.v"


// 20-BIT COMPLIMENT
module compliment_tb;

reg [19:0] a;
reg [19:0] out;

compliment Comp(a,out);

initial begin

    $dumpfile("SUB.vcd");
    $dumpvars(0, compliment_tb);
    #10;

    a = 20'b00000000000000000000;
    #10;
    
    a = 20'b01111111111111111111;
    #10;

    a = 20'b11111111111111111111;
    #10;

    a = 20'b01010101010101010101;
    #50;

    $display("test complete");
    $finish;

end

endmodule
    