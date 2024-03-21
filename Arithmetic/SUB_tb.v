`timescale 1ns / 1ns
`include "SUB.v"

// 20-BIT COMPLIMENT
module compliment_tb;

reg [19:0] a;
wire [19:0] out;

compliment Comp(a,out);

initial begin

    $dumpfile("SUB.vcd");
    $dumpvars(0, compliment_tb);

    a = 20'b00000000000000000000;
    #10;
    
    a = 20'b01111111111111111111;
    #10;

    a = 20'b11111111111111111111;
    #10;

    a = 20'b01010101010101010101;
    #10;

    $display("test complete");
    $finish;

end

endmodule


// 20-BIT SUBTRACTION
module sub_tb;

reg [19:0] a;
reg [19:0] b;
wire [19:0] out;
wire cout;

subtraction Subtract(a,b,out,cout);

initial begin

    $dumpfile("SUBTRACT.vcd");
    $dumpvars(0, sub_tb);

    a = 20'b00000000000000000001;
    b = 20'b00000000000000000000;
    #10;
    
    a = 20'b00000000000000000000;
    b = 20'b01111111111111111111;
    #10;

    a = 20'b11111111111111111111;
    b = 20'b00000000000000000001;
    #10;

    a = 20'b11111111111111111111;
    b = 20'b11111111111111111111;
    #10;

    a = 20'b10101010101010101010;
    b = 20'b01010101010101010101;
    #10;

    $display("test complete");
    $finish;

end

endmodule
    