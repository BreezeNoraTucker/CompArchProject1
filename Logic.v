module XOR20 (input [19:0] a, input b,
    output reg [19:0] c, output reg zero);
    integer i;
    always @(a or b) begin
        for (i = 0; i < 20; i = i + 1) begin
            c[i] = a[i] ^ c[i];
        end
        zero = !(|c);
    end
endmodule

module NOT20(input [19:0] a, output reg [19:0] out);
    always @a begin
        out = !a;
    end
endmodule

module AND20(input [19:0] a, input [19:0] b, output reg [19:0] out);
    always @(a or b) begin
        out = a & b;
    end
endmodule

module OR20(input [19:0] a, input [19:0] b, output reg [19:0] out);
    always @(a or b) begin
        out = a | b;
    end
endmodule