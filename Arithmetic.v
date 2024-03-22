module halfAdder(input a, b, output out, c);
    //xor(a, b, out);
    assign out = a ^ b;
    assign c = a & b;
endmodule

module fullAdder(input a, input b, input cin, output wire out, output wire cout);
    wire ab;
    wire ab_c;
    wire aOb;
    wire aXb;
    wire aXbANDcin;
    //halfAdder abAdder(a, b, ab, ab_c);
    // DONT PUT BACK THIS ONE (or any of them for that matter...) --> xor(out, ab_c, cin);
    //assign out = cin ^ ab_c;
    //assign aOb = a|b;
    //assign aObANDcin = aOb & cin;
    //assign cout = aObANDcin | ab_c;
    assign aXb = a ^ b;
    assign out = aXb ^ cin;
    assign aOb = a & b;
    assign aXbANDcin = aXb & cin;
    assign cout = aXbANDcin | aOb;
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

module twentyBitInc(input [19:0] a, output wire [19:0] out, output wire cout);
    wire [19:0] carry;
    assign b = 1;
    halfAdder Adder(a[0], b, out[0], carry[0]);
	genvar i;
    generate
    	for (i = 1; i < 20; i = i + 1) begin
        	halfAdder Adder_i(a[i], carry[i-1], out[i], carry[i]);
            
    	end
	endgenerate
	assign cout = carry[19];
endmodule

module dec(input [19:0] a, output wire [19:0] out, output wire cout);
    wire [19:0] b;
    assign b = 20'b00000000000000000001;
    subtraction Sub(a, b, out, cout);
	/*
    genvar i;
    generate
    	for (i = 1; i < 20; i = i + 1) begin
            wire [19:0] bufferA;
            assign bufferA[0] = a[i];
            assign bufferA[19:1] = 19'b0000000000000000000;
        	subtraction Sub_i(bufferA, carry[i-1], out[i], carry[i]);
            
    	end
	endgenerate
	assign cout = carry[19];
    */
	
endmodule