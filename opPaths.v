`include "./Logic.v"
//`include "./BitShifts.v"
//BitShifts.v currently does not compile
`include "ADD.v"
`include "INC.v"
module opPaths(input [31:0][19:0] A, input [31:0][19:0] B,
            output [31:0][19:0] W);
    wire carry;
    
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
    twentyBitInc op17(A[17], W[17], carry);
    assign b[17] =  20'b00000000000000000000;

endmodule