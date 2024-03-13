module Lshift(input wire [19:0] in, output reg [19:0] out);
    integer i;
    always @(in)begin
        for(i = 0; i < 20; i++)begin
            out[i] = in[i-1];
        end
        out[0] = 0;
    end

endmodule