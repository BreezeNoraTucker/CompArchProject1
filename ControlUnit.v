`include "./FlowControl.v"
module intrFetch(input [19:0] idx, input [31:0][19:0] mem, output [19:0]instr);
    wire [4:0]sel;
    assign sel = idx[4:0];
    MUX MUX(mem, sel, instr);
endmodule
module instrDecode(input [19:0] instr, output TODO);
    wire [4:0]opcode;
    wire [4:0]addrA;
    wire [4:0]addrB;
    wire [4:0]addrW;
    assign opcode = instr [4:0];
    assign addrA = instr [9:5];
    assign addrB = instr [14:10];
    assign addrW = instr [19:15];
    wire [19:0] wordA; //input A, from addrA
    wire [19:0] wordB; //input B, from addrB
    wire [19:0] wordW; //output, written to addrW
    //fetch input words from memory using addresses
    


endmodule