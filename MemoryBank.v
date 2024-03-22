`timescale 1ns / 1ns
`include "../FlowControl.v"

module LDC (input [63:0][19:0] mem, input [19:0] C, input[5:0] R, output wire [19:0] out, output wire [19:0] buffer0, output wire [19:0] buffer1); 
    wire [31:0][19:0] mem1;
    wire [31:0][19:0] mem2;
    assign mem1 = mem [31:0];
    assign mem2 = mem [63:32];

    wire [4:0] sel;
    assign sel = R [4:0];

    //wire [1:0][19:0] buffer;
    //wire [19:0] buffer0;
    //wire [19:0] buffer1;
    wire [19:0] buffer2;
    wire [19:0] buffer3;
    wire [19:0] buffer4;

    MUX memory1(mem1,sel,buffer0);
    MUX memory2(mem2,sel,buffer1);

    //wire [19:0] zeros;
    //assign zeros = 20'b

    //assign zero = 0;
    //assign one = 1;

    /*
    //integer idx;
    //integer subIdx;
    always @(mem) begin
        //idx = $unsigned(sel);
        //subIx = idx - 32;
        if (R[5] == 1) begin
            buffer[0] = 20'b00000000000000000000;
            //MUX memory1(mem1,sel,buffer1);
        end else begin
            buffer1 = 20'b00000000000000000000;
            //MUX memory2(mem2,sel,buffer2);
        end
    //assign out = buffer 1 | buffer 2;
    end
    */

    /*
    always @(mem) begin
        if (R[5] == 1) begin
            //buffer[0] = 20'b00000000000000000000;
            buffer3[idx] = buffer[idx] & sel[]
            //assign out = buffer[0];
        end else begin
            buffer1 = 20'b00000000000000000000;
            //assign out = buffer[1];
        end
    end
    */

    genvar i;
    generate
        for(i = 0; i < 20; i = i + 1)begin
            assign buffer2[i] = !buffer0[i] & R[5];         
            assign buffer3[i] = buffer1[i] & R[5];  
            assign buffer4[i] = buffer2[i] || buffer3[i];       
            $display("i=0%d, buffer2=%0d, buffer3=%0d, R[5]=%0d",i,buffer2[i],buffer0[i],R[5]);
            //$display("i=0%d, buffer3=%0d, buffer1=%0d, R[5]=%0d",i,buffer3[i],buffer1[i],R[5]);
        end
    endgenerate



    assign out = buffer4;

    
endmodule