module program_counter(
    input clk,
    input reset,
    input [7:0] next_pc,
    input pc_write,
    output reg [7:0] pc
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 8'b0;
        end else if (pc_write) begin
            pc <= next_pc;
        end
    end
endmodule