`timescale 1ns / 1ps

module testbench;

    parameter CLK_PERIOD = 10;

    reg clock = 0;
    reg reset = 0;
    reg trap_mode = 0;
    reg zero_flag = 0;
    reg sign_flag = 0;
    reg [19:0] rel_addr;
    reg [3:0] status_reg;
    reg [19:0] current_reg;
    reg trap_mode_flag = 0;

    TRAP trap_inst (.trap_mode(trap_mode), .clock(clock), .reset(reset), .alu_trap(alu_trap));
    NOP nop_inst (.clock(clock), .nop_executed(nop_executed));
    JMP jmp_inst (.rel_addr(rel_addr), .clock(clock), .jmp_executed(jmp_executed));
    JMPZ jmpz_inst (.rel_addr(rel_addr), .zero_flag(zero_flag), .clock(clock), .jmpz_executed(jmpz_executed));
    JMPS jmps_inst (.rel_addr(rel_addr), .sign_flag(sign_flag), .clock(clock), .jmps_executed(jmps_executed));
    JMPZS jmpzs_inst (.rel_addr(rel_addr), .zero_flag(zero_flag), .sign_flag(sign_flag), .clock(clock), .jmpzs_executed(jmpzs_executed));
    LSTAT lstat_inst (.status_reg(status_reg), .clock(clock), .gp_reg(gp_reg));
    XSTAT xstat_inst (.status_reg(status_reg), .current_reg(current_reg), .trap_mode_flag(trap_mode_flag), .clock(clock), .updated_reg(updated_reg));

    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, testbench);
    end

    always #(CLK_PERIOD/2) clock = ~clock;

    initial begin
        reset = 1;
        #50 reset = 0;
    end

    initial begin
        status_reg = 4'b0000;
        current_reg = 20'b00000000000000000000;
        rel_addr = 20'b00000000000000000000;

        #100;
        trap_mode = 1;
        zero_flag = 0;
        sign_flag = 0;
        trap_mode_flag = 1;
        #100;
        trap_mode = 0;
        zero_flag = 1;
        sign_flag = 0;
        trap_mode_flag = 1;
        #100;
        trap_mode = 0;
        zero_flag = 0;
        sign_flag = 1;
        trap_mode_flag = 1;
        #100;
        trap_mode = 0;
        zero_flag = 1;
        sign_flag = 1;
        trap_mode_flag = 1;
        #100;
        $finish;
    end

    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

endmodule
