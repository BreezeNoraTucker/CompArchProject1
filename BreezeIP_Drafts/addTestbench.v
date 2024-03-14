`timescale 1ns / 1ns
`include "ADD.v"

module halfAdder_tb;

reg a;
reg b;
reg cin;
wire out;
reg cout;

//reg half;
//reg full;
//reg twenty;

halfAdder out(a,b,out,cout)

initial begin

    $dumpfile("ADD.vcd");
    $dumpvars(0, halfAdder_tb);

    a = 20'b00000000000000000000;
    b = 20'b11111111111111111111;
    c = 0;
    #10;

    $display("test complete");
    $finish;

end

endmodule

    
