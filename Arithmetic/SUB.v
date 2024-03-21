`timescale 1ns / 1ns
`include "ADD.v"

module compliment(input [19:0] a, output wire [19:0] out);
    genvar i;
    generate
    	for (i = 0; i < 20; i = i + 1) begin
        	assign out[i] = ~a[i];
    	end
	endgenerate
endmodule;


module subtraction(input [19:0] a, input [19:0] b, output wire [19:0] out, output wire cout);
    wire [19:0] comp;
    wire [19:0] compout;
    compliment Comp(a,comp);
    add20 Adder(b,comp,compout,cout);
    compliment Compl(compout,out);
endmodule;
