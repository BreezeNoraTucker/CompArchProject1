//send equals to zero flag
module EQ(input [0:19] a, input [0:19] b, output reg equals);
    reg [0:19] bitComp;
    initial begin
        bitComp = a ^ b;
        equals = !(|bitComp);
    end
endmodule

module GT(input [0:19] a, input [0:19] b, output reg signFlag);
    //if a > b, write 0
    //if a <=b, write 1
    initial begin
        signFlag = a <= b;
    end
endmodule

module LT(input [0:19] a, input [0:19] b, output reg signFlag);
    //if a >= b, write 0
    //if a < b, write 1
    initial begin
        signFlag = a < b;
    end
endmodule