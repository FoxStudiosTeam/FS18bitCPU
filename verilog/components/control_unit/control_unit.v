module control_unit (
    input [7:0] instruction,
    input clk,
    input reset,

    output reg reg_write,
    output reg [2:0] alu_op,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg [1:0] reg_dst
);

    parameter OP_ADD  = 4'b0000;
    parameter OP_SUB  = 4'b0001;
    parameter OP_AND  = 4'b0010;
    parameter OP_OR   = 4'b0011;
    parameter OP_XOR  = 4'b0100;
    parameter OP_NOT  = 4'b0101;
    parameter OP_SHL  = 4'b0110;
    parameter OP_SHR  = 4'b0111;
    parameter OP_LOAD = 4'b1000;
    parameter OP_STORE = 4'b1001;

    wire [3:0] opcode = instruction[7:4];

    always @(*) begin
        reg_write = 0;
        alu_op = 3'b000;
        mem_read = 0;
        mem_write = 0;
        alu_src = 0;
        reg_dst = 2'b00;

        case (opcode)
            OP_ADD: begin
                reg_write = 1;
                alu_op = 3'b000;
                alu_src = 0;
            end
            OP_SUB: begin
                reg_write = 1;
                alu_op = 3'b001; // SUB
                alu_src = 0;
            end
            OP_LOAD: begin
                reg_write = 1;
                mem_read = 1;
                alu_src = 1;
            end
            OP_STORE: begin
                mem_write = 1;
                alu_src = 1;
            end
        endcase
    end
endmodule