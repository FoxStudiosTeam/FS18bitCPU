module register_l1_file(
    input clk,
    input reset,
    input write_enable,
    input [1:0] write_reg,
    input [1:0] read_reg_a,
    input [1:0] read_reg_b,
    input [7:0] write_data,
    output [7:0] read_data_a,
    output [7:0] read_data_b
);

    reg [7:0] registers [0:3];

    assign read_data_a = registers[read_reg_a];
    assign read_data_b = registers[read_reg_b];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Сброс всех регистров
            registers[0] <= 8'b0;
            registers[1] <= 8'b0;
            registers[2] <= 8'b0;
            registers[3] <= 8'b0;
        end
        else if (write_enable) begin
            // Запись данных в указанный регистр
            registers[write_reg] <= write_data;
        end
    end
endmodule