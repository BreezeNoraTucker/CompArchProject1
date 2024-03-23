`include "./ControlUnit.v"

module CU_tb():
    wire [31:0][19:0] W; 
    wire [31:0][19:0] A; 
    wire [31:0][19:0] B;
    wire [19:0] instrIdx;
    wire [19:0] instr;
    wire [31:0][19:0] regArr;
    wire [31:0] regWE;
    wire [31:0][19:0] regArrW;
    wire [31:0][19:0] mem; //UPDATE ONCE MEM COMPLETE
    opPaths path(A, B, W);

    intrFetch fetch(instrIdx, mem, instr);
    instrDecode decode(instr, regArr, W, A, B, regWE, regArrW);
    
endmodule