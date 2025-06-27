module memory(
    input clk,
    input [7:0] address, //0x00000001
    input write_enable,
    input [7:0] write_data,
    output [7:0] read_data
);

    // Память 256 байт (адреса 0-255)
    reg [7:0] mem [0:255];

    // Синхронная запись
    always @(posedge clk) begin
        if (write_enable) begin
            mem[address] <= write_data;
        end
    end

    // Асинхронное чтение
    assign read_data = mem[address];
endmodule