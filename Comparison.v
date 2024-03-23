//send equals to zero flag
module EQ(input [0:19] a, input [0:19] b, output equals);
    wire [0:19] bitComp;
   
    assign bitComp = a ^ b;
    assign equals = !(|bitComp);
    
endmodule

module GT(input [0:19] a, input [0:19] b, output signFlag);
    //if a > b, write 0
    //if a <=b, write 1
    assign signFlag = a <= b;
    
endmodule

module LT(input [0:19] a, input [0:19] b, output signFlag);
    //if a >= b, write 0
    //if a < b, write 1
    
    assign signFlag = a < b;
    
endmodule