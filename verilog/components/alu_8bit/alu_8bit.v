module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op_code,
    output reg [7:0] result,
    output reg zero_flag,
    output reg carry_flag
);

    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter OR  = 3'b011;
    parameter XOR = 3'b100;
    parameter NOT = 3'b101;
    parameter SHL = 3'b110;
    parameter SHR = 3'b111;

    always @(*) begin
        carry_flag = 0;
        case (op_code)
            ADD: {carry_flag, result} = a + b;
            SUB: begin
                result = a - b;
                carry_flag = (a < b) ? 1 : 0;
            end
            AND: result = a & b;
            OR: result = a | b;
            XOR: result = a ^ b;
            NOT: result = ~a;
            SHL : begin
                result = a << 1;
                carry_flag = a[7];
            end
            SHR: begin
                result = a >> 1;
                carry_flag = a[0];
            end
            default: result = 8'b0;
    endcase

        zero_flag = (result == 8'b0) ? 1 : 0;
    end

endmodule