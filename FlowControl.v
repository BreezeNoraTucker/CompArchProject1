/*
module MUX(input [31:0] in, input [4:0] sel, output reg out);
    integer idx;
    always @(in) begin
        idx = $unsigned(sel);
        out = in[idx];
    end
endmodule
*/

module MUX
(input [31:0][19:0] a, input [4:0] sel, output wire [19:0] out);    
    //32 channels by 20 bits, so 5 bit selector
    //genvar i;
    /*
    integer idx;
    always @(a) begin
        idx = $unsigned(sel);
        $display("idx=%0d",idx);
    end
    */
    //wire [31:0][19:0] tmp;
    /*
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign tmp[i] = (idx == i) & a[i];
        end
        assign out = |tmp;
    endgenerate
    */
    assign out = a[sel];
    
endmodule

module DEMUX (input [19:0] a, input [4:0] sel, output [31:0][19:0] out);
    genvar i;
    integer idx;
    always @(a) begin
        idx = $unsigned(sel);
        $display("idx=%0d",idx);
    end
    
    /*
    assign z = 20'b00000000000000000000;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign out[i] = z;
        end
    endgenerate
    */

    /*
    genvar j;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            //if (i == idx) begin
                for(j = 0; i < 19; i = i + 1)begin
                    assign out[i][j] = (idx == i) & a[j];
                end
            //end
        end
    endgenerate
    */
    


    /*
    always @(idx) begin
        case(idx)
            0: out[0] = a;
            1: out[1] = a;
            2: out[2] = a;
            default: $display(":(");
        endcase
    end
    */
    
    assign out[idx] = a;
endmodule

module ENCODE (input [31:0] in, output [4:0] out);
    //5 bit encoder
    //signal in nth channel -> 5 bit int
    assign out[0] = in[1]|in[3]|in[5]|in[7]|in[9]|in[11]|in[13]|in[15]
        |in[17]|in[19]|in[21]|in[23]|in[25]|in[27]|in[29]|in[31];
    assign out[1] = in[2]|in[3]|in[6]|in[7]|in[10]|in[11]|in[14]|in[15]
        |in[18]|in[19]|in[22]|in[23]|in[26]|in[27]|in[30]|in[31];
    assign out[2] = in[4]|in[5]|in[6]|in[7]|in[12]|in[13]|in[14]|in[15]
        |in[20]|in[21]|in[22]|in[23]|in[28]|in[29]|in[30]|in[31];
    assign out[3] = in[8]|in[9]|in[10]|in[11]|in[12]|in[13]|in[14]|in[15]
        |in[24]|in[25]|in[26]|in[27]|in[28]|in[29]|in[30]|in[31];
    assign out[4] = in[16]|in[17]|in[18]|in[19]|in[20]|in[21]|in[22]|in[23]
        |in[24]|in[25]|in[26]|in[27]|in[28]|in[29]|in[30]|in[31];
endmodule

module DECODE (input [4:0] in, output [31:0] out);
    //5 bit decoder
    //5 bit int -> signal in nth channel
    integer idx;
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1)begin
            assign out[i] = (i == idx);
        end
    endgenerate
    always @(in) begin
        idx = $unsigned(in);
    end
endmodule