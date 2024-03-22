module XOR20 (input [19:0] a, input [19:0]b,
    output wire [19:0] c, output zero);
    genvar i;
    for (i = 0; i < 20; i = i + 1) begin
        assign c[i] = a[i] ^ b[i];
    end
    assign zero = !(|c);
    
    
endmodule

module NOT20(input [19:0] a, output [19:0] out);
    
    assign out = !a;
    
endmodule

module AND20(input [19:0] a, input [19:0] b, output [19:0] out);
    
    assign out = a & b;
    
endmodule

module OR20(input [19:0] a, input [19:0] b, output [19:0] out);
    assign out = a | b;
    
endmodule