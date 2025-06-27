module instruction_decoder(
    input [7:0] instruction,
    output [3:0] opcode,
    output [1:0] rs,
    output [1:0] rt,
    output [1:0] rd,
    output [3:0] immediate
);

    assign opcode = instruction[7:4];
    assign rs = instruction[3:2];
    assign rt = instruction[1:0];
    assign rd = instruction[3:2];  // Может совпадать с rs в зависимости от формата инструкции
    assign immediate = instruction[3:0];  // 4-битное непосредственное значение

endmodule
