module halfAdder(input a, b, output out, c);
    xor(a, b, out);
    assign c = a & b;
endmodule
module fullAdder(input a, input b, input cin, output wire out, output wire cout);
    wire ab;
    wire ab_c;
    wire aOb;
    wire aObANDcin;
    halfAdder abAdder(a, b, ab, ab_c);
    xor(out, ab_c, cin);
    assign aOb = a|b;
    assign aObANDcin = aOb & cin;
    assign cout = aObANDcin | ab_c;
endmodule
module add20(input [19:0] a, input [19:0] b, output wire [19:0] out, output wire cout);
    wire [19:0] carry;
    wire ground;
    assign ground = 0;
    fullAdder Adder(a[0], b[0], ground, out[0], carry[0]);
	genvar i;
    generate
    	for (i = 1; i < 20; i = i + 1) begin
        	fullAdder Adder_i(a[i], b[i], carry[i-1], out[i], carry[i]);
    	end
	endgenerate
	assign cout = carry[19];
	
endmodule