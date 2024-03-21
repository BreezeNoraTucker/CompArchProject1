`timescale 1ns / 1ns
`include "SUB.v"

//DECREMENTER
module dec(input [19:0] a, output wire [19:0] out, output wire cout);
    wire [19:0] carry;
    assign b = 1;
    subtraction Sub(a[0], b, out[0], carry[0]);
	genvar i;
    generate
    	for (i = 1; i < 20; i = i + 1) begin
        	subtraction Sub_i(a[i], carry[i-1], out[i], carry[i]);
            $display("hi");
    	end
	endgenerate
	assign cout = carry[19];
	
endmodule