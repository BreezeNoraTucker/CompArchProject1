module MUX(input [15:0] in, input [3:0] sel, output reg out);
    integer idx;
    always @(in) begin
        idx = $unsigned(sel);
        out = in[idx];
    end
endmodule


module MUX20(input [19:0][15:0] a, input [3:0] sel, output wire [19:0] out);    
    genvar i;
    generate
        for (i = 0; i < 20; i = i + 1) begin
            MUX mux_i(a[i], sel, out[i]);
        end
    endgenerate
endmodule