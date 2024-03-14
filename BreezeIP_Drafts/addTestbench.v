`timescale 1ns / 1ns
`include "ADD.v"

module halfAdder_tb;

reg a;
reg b;
//cin;
wire out;
wire cout;


halfAdder Adder(a,b,out,cout);

initial begin

    $dumpfile("ADD.vcd");
    $dumpvars(0, halfAdder_tb);
    #10;
    //a = 20'b00000000000000000000;
    //b = 20'b11111111111111111111;
    a = 0;
    b = 0;
    #10;
    //cin = 0;
    
    a = 0;
    b = 1;
    #10;

    a = 1;
    b = 0;
    #10;

    a = 1;
    b = 1;
    #10;

    $display("test complete");
    $finish;

end

endmodule

    
