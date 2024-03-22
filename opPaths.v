`include "./Logic.v"
//`include "./BitShifts.v"
//BitShifts.v currently does not compile
`include "Arithmetic.v"
module opPaths(input [31:0][19:0] A, input [31:0][19:0] B,
            output [31:0][19:0] W);
    wire carry[3:0];
    wire zero[3:0];
    wire sign[3:0];
    //TRAP:0
    assign A[0] = 20'b00000000000000000000;

    //NOP:1   
    assign A[1] = 20'b00000000000000000000;
    assign B[1] = 20'b00000000000000000000;
    assign W[1] = 20'b00000000000000000000;
    //JMP:2


    //NOT:8
    NOT20 op8(A[8], W[8]);
    assign B[8] = 20'b00000000000000000000;
    //AND:9
    AND20 op9(A[9], B[9], W[9]);
    //OR:10
    OR20 op10(A[10], B[10], W[10]);
    //XOR:11
    XOR20 op11(A[11], B[11], W[11]);
    /*
    bit shifts does not currently compile,
    commenting out until it does
    //SHFTR: 12
    SHFTR op12(A[12], B[12][4:0], W[12]);
    //SHFTL: 13
    SHFTL op13(A[13], B[13][4:0], W[13]);
    //ROTR: 14
    ROTR op14(A[14], B[14][4:0], W[14]);
    //ROTL: 15
    ROTL op15(A[15], B[15][4:0], W[15]);
    //SWAP:16
    //unsure how to proceed here, as implimented needs two writes,
    //currently only support one write
    */
    //INC:17
    twentyBitInc op17(A[17], W[17], carry[0]);
    assign B[17] =  20'b00000000000000000000;
    //DEC:18
    dec op18(A[18], W[18], carry[1]);
    assign B[18] = 20'b00000000000000000000;
    //ADD:19
    add20 op19(A[19], B[19], W[19], carry[2]);
    //ADDC:20
    //no requirement
    //SUB: 21
    subtraction op21(A[21], B[21], W[21], carry[3]);
    //EQ: 22
    EQ op22(A[22], B[22], zero[0]);
    //GT: 23
    GT op23(A[23], B[23], sign[0]);
    //LT:24
    LT op24(A[24], B[24], sign[1]);
    

endmodule