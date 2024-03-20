/*
module MUX(input [31:0] in, input [4:0] sel, output reg out);
    integer idx;
    always @(in) begin
        idx = $unsigned(sel);
        out = in[idx];
    end
endmodule
*/


module MUX
(input [31:0][19:0] a, input [4:0] sel, output wire [19:0] out);    
    //32 channels by 20 bits, so 5 bit selector
    genvar i;
    integer idx;
    wire [31:0][19:0] tmp;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign tmp[i] = (idx == i) & a[i];
        end
        assign out = |tmp;
    endgenerate
    
endmodule

module DEMUX (input [19:0] a, input [4:0] sel, output [31:0][19:0] out);
    genvar i;
    integer idx;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign out[i] = (idx == i) & a[i];
        end
    endgenerate
endmodule
