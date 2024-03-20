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


module sub(input [19:0] a, input [19:0] b, output wire [19:0] out, output wire cout);
    //assign comp = compliment here
    add20 Adder(a,comp,out,cout);
endmodule;
