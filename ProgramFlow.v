module TRAP (input trap_mode, input clock, input reset, output reg alu_trap);
    reg first_instruction_executed;

    always @(posedge clock or posedge reset) begin
        if (reset)
            first_instruction_executed <= 0;
        else if (!first_instruction_executed && trap_mode)
            first_instruction_executed <= 1;
    end

    always @(posedge clock) begin
        if (reset)
            alu_trap <= 0;
        else if (first_instruction_executed)
            alu_trap <= 1;
    end
endmodule

module NOP (input clock, output reg nop_executed);
    always @(posedge clock) begin
        nop_executed <= 1;
        #1 nop_executed <= 0;
    end
endmodule

module JMP (input [19:0] rel_addr, input clock, output reg jmp_executed);
    always @(posedge clock) begin
        jmp_executed <= 1;
    end
endmodule

module JMPZ (input [19:0] rel_addr, input zero_flag, input clock, output reg jmpz_executed);
    always @(posedge clock) begin
        if (zero_flag) begin
            jmpz_executed <= 1;
        end else begin
            jmpz_executed <= 0;
        end
    end
endmodule

module JMPS (input [19:0] rel_addr, input sign_flag, input clock, output reg jmps_executed);
    always @(posedge clock) begin
        if (sign_flag) begin
            jmps_executed <= 1;
        end else begin
            jmps_executed <= 0;
        end
    end
endmodule

module JMPZS (input [19:0] rel_addr, input zero_flag, input sign_flag, input clock, output reg jmpzs_executed);
    always @(posedge clock) begin
        if (zero_flag && sign_flag) begin
            jmpzs_executed <= 1;
        end else begin
            jmpzs_executed <= 0;
        end
    end
endmodule

module LSTAT (input [3:0] status_reg, input clock, output reg [3:0] gp_reg);
    always @(posedge clock) begin
        gp_reg <= status_reg;
    end
endmodule

module XSTAT (input [3:0] status_reg, input [19:0] current_reg, input trap_mode_flag, input clock, output reg [3:0] updated_reg);
    always@(posedge clock) begin
        if (trap_mode_flag)
            updated_reg <= status_reg ^ current_reg;
    end
endmodule