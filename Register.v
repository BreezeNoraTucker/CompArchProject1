module SRlatch(input R, input S, output Q, output notQ);
    assign Q = !(R|notQ);
    assign notQ = !(S|Q);
endmodule
module Dlatch(input D, input E, output Q, output notQ);
    wire R;
    wire S;
    assign R = (!D)&E;
    assign S = D&E;
    SRlatch SR(R, S, Q, notQ);
endmodule
module ctrlFlipFlop(input D, input WE, input clk, output Q, output notQ);
    wire Q0;
    wire ctrl;
    assign ctrl = clk&WE;
    assign notCtrl = !ctrl;
    wire X;
    Dlatch latch1(D, notCtrl, Q0, X);
    Dlatch latch2(Q0, ctrl, Q, notQ);
endmodule