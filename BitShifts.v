module SHFTR (input [19:0] data, input [4:0] amount, output reg [19:0] result);
    always @* begin
        if (amount < 20)
            result = data >> amount;
        else
            result = 0;
    end
endmodule

module SHFTL (input [19:0] data, input [4:0] amount, output reg [19:0] result);
    always @* begin
        if (amount < 20)
            result = data << amount;
        else
            result = 0;
    end
endmodule

module ROTR (input [19:0] data, input [4:0] amount, output reg [19:0] result);
    always @* begin
        if (amount < 20)
            result = {data[(19-amount+1):0], data[19:(20-amount)]};
        else
            result = 0;
    end
endmodule

module ROTL (input [19:0] data, input [4:0] amount, output reg [19:0] result);
    always @* begin
        if (amount < 20)
            result = {data[amount-1:0], data[19:(amount)]};
        else
            result = 0;
    end
endmodule

module SWAP (input [19:0] data1, input [19:0] data2, output reg [19:0] result1, output reg [19:0] result2);
    always @* begin
        if (data1 !== data2) begin
            result1 = data2;
            result2 = data1;
        end
    end
endmodule
