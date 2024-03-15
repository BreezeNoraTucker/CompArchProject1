`timescale 1ns / 1ns
`include "INC.v"


//LARGE BIT INCREMENT TESTBENCH
module twentyBitInc_tb;

reg [19:0] a;
//reg bits;
wire [19:0] out;
wire cout;


twentyBitInc Increment(a,out,cout);

initial begin

    $dumpfile("INC.vcd");
    $dumpvars(0, twentyBitInc_tb);
    #1;

    //bits = 20;
    a = 20'b00000000000000000000;
    #10;

    a = 20'b00000000000000000001;
    #10;

    a = 20'b01111111111111111111;
    #10;

    a = 20'b11111111111111111111;
    #10;

    a = 3'b010;
    #10;
    
    $display("test complete");
    $finish;

end

endmodule