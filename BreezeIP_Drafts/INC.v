`include "ADD.v"

//INCREMENTING WITH MUTLIPLE BITS
module twentyBitInc(input [19:0] a, output wire [19:0] out, output wire cout);
    wire [19:0] carry;
    assign b = 1;
    halfAdder Adder(a[0], b, out[0], carry[0]);
	genvar i;
    generate
    	for (i = 1; i < 20; i = i + 1) begin
        	halfAdder Adder_i(a[i], carry[i-1], out[i], carry[i]);
            $display("hi");
    	end
	endgenerate
	assign cout = carry[19];
	
endmodule

//module inc20bit(input [19:0] a, output wire [19:0] out, output wire cout);
    //assign b = 20'b00000000000000000001;
    //add20 Adder(a,b,out,cout)
//endmodule
