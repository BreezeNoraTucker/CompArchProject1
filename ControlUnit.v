`include "./FlowControl.v"
`include "./opPaths"
module intrFetch(input [19:0] idx, input [31:0][19:0] mem, output [19:0]instr);
    wire [4:0]sel;
    assign sel = idx[4:0];
    //replace this with a load from mem once complete
    MUX m(mem, sel, instr);
endmodule
module instrDecode(input [19:0] instr, input [31:0][19:0] regArr, 
            input [31:0][19:0] sourcesW, 
            output [31:0][19:0] targetsA, output [31:0][19:0] targetsB,
            output [31:0] regWE, output [31:0][19:0] regArrW, 
            output TODO);
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
    MUX muxA(regArr, addrA, wordA);
    MUX muxB(regArr, addrB, wordB);

    //route the three words acording to the opcode
    //wire [31:0][19:0]targetsA; //possible input locations for A
    //wire [31:0][19:0]targetsB; //possible input locations for B
    //wire [31:0][19:0]sourcesW; //possible source locations for W
    
    DEMUX demuxA(wordA, opcode, targetsA);
    DEMUX demuxB(wordB, opcode, targetsB);
    MUX muxW(sourcesW, opcode, wordW);
    DEMUX demuxW(wordW, addrW, regArrW);
    DECODE enableWrite(addrW, regWE);
endmodule



