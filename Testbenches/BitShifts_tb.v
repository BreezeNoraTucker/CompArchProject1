module test_bench;

    reg [19:0] data;
    reg [4:0] amount;
    reg [19:0] data1, data2;
    wire [19:0] result_SHFTR, result_SHFTL, result1_SWAP, result2_SWAP;

    SHFTR SHFTR_inst (
        .data(data),
        .amount(amount),
        .result(result_SHFTR)
    );

    SHFTL SHFTL_inst (
        .data(data),
        .amount(amount),
        .result(result_SHFTL)
    );

    SWAP SWAP_inst (
        .data1(data1),
        .data2(data2),
        .result1(result1_SWAP),
        .result2(result2_SWAP)
    );

    reg clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("BitShifts.vcd");
        $dumpvars(0, test_bench);
    end

    initial begin
        $monitor("data=%d, amount=%d, SHFTR=%d, SHFTL=%d, data1=%d, data2=%d, result1=%d, result2=%d",
            data, amount, result_SHFTR, result_SHFTL, data1, data2, result1_SWAP, result2_SWAP);
        
        data = 20; amount = 3; data1 = 10; data2 = 30;
        #10;
        
        data = 15; amount = 2; data1 = 5; data2 = 5;
        #10;
        
        data = 30; amount = 25; data1 = 40; data2 = 50;
        #10;
        
        $finish;
    end

    $dumpfile("dump.vcd");
    $dumpvars(0, test_bench);

endmodule
