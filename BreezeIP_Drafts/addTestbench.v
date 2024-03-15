`timescale 1ns / 1ns
`include "ADD.v"


//HALF ADDER TESTBENCH
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

    #40

    $display("test complete");
    $finish;

end

endmodule



// FULL ADDER TESTBENCH
module fullAdder_tb;

reg a;
reg b;
reg cin;
wire out;
wire cout;


fullAdder Adder(a,b,cin,out,cout);

initial begin

    $dumpfile("ADD.vcd");
    $dumpvars(0, fullAdder_tb);
    #10;
    //a = 20'b00000000000000000000;
    //b = 20'b11111111111111111111;
    a = 0;
    b = 0;
    cin = 0;
    #10;
    
    a = 0;
    b = 1;
    cin = 0;
    #10;

    a = 1;
    b = 0;
    cin = 0;
    #10;

    a = 1;
    b = 1;
    cin = 0;
    #10;

    a = 0;
    b = 0;
    cin = 1;
    #10;
    
    a = 0;
    b = 1;
    cin = 1;
    #10;

    a = 1;
    b = 0;
    cin = 1;
    #10;

    a = 1;
    b = 1;
    cin = 1;
    #10;

    $display("test complete");
    $finish;

end

endmodule



// 20-BIT FULL ADDER TESTBENCH
module twentyBitAdd_tb;

reg [19:0] a;
reg [19:0] b;
//reg cin;
wire [19:0] out;
wire cout;


add20 Adder(a,b,out,cout);

initial begin

    $dumpfile("ADD.vcd");
    $dumpvars(0, twentyBitAdd_tb);
    #10;
    a = 20'b00000000000000000000;
    b = 20'b00000000000000000000;
    //cin = 0;
    #10;
    
    a = 20'b00000000000000000000;
    b = 20'b01111111111111111111;
    //cin = 0;
    #10;

    b = 20'b00000000000000000000;
    a = 20'b01111111111111111111;
    //cin = 0;
    #10;

    a = 20'b11111111111111111111;
    b = 20'b11111111111111111111;
    //cin = 0;
    #10;

    a = 20'b01010101010101010101;
    b = 20'b01010101010101010101;
    //cin = 0;
    #50;

    $display("test complete");
    $finish;

end

endmodule
    
