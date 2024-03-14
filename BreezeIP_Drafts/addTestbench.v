`timescale 1ns / 1ns
`include "ADD.v"

module halfAdder_tb;

input a;
input b;
//cin;
wire out;
wire cout;


halfAdder Adder(a,b,out,cout);

initial begin

    $dumpfile("ADD.vcd");
    $dumpvars(0, halfAdder_tb);

    a = 20'b00000000000000000000;
    b = 20'b11111111111111111111;
    //cin = 0;
    #10;

    $display("test complete");
    $finish;

end

endmodule

    
