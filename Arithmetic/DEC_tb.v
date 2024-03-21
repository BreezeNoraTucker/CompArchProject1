`timescale 1ns / 1ns
`include "DEC.v"


//DECREMENTER TESTBENCH
module DEC_tb;

reg [19:0] a;
wire [19:0] out;
wire cout;


dec Decrement(a,out,cout);

initial begin

    $dumpfile("DEC.vcd");
    $dumpvars(0, DEC_tb);

    a = 20'b00000000000000000001;
    #10;

    a = 20'b00000000000000000000;
    #10;

    a = 20'b11111111110000000000;
    #10;

    a = 20'b11111111111111111111;
    #10;

    $display("test complete");
    $finish;

end

endmodule