module processor_8bit (
    input clk,
    input reset
);

    wire [7:0] pc_out;
    wire [7:0] instruction;
    wire [7:0] alu_result;
    wire [7:0] reg_data_a, reg_data_b;
    wire [7:0] mem_data;
    wire zero_flag, carry_flag;

    // Сигналы управления
    wire reg_write, mem_read, mem_write, alu_src;
    wire [2:0] alu_op;
    wire [1:0] reg_dst;

    // Экземпляры модулей
    program_counter pc(
        .clk(clk),
        .reset(reset),
        .next_pc(pc_out + 8'd1), // Явное указание 8-битной константы
        .pc_write(1'b1),         // Всегда разрешаем запись в PC
        .pc(pc_out)
    );

    // Память инструкций с инициализацией
    memory instruction_memory(
        .clk(clk),
        .address(pc_out),
        .write_enable(1'b0),  // Только чтение для памяти инструкций
        .write_data(8'b0),
        .read_data(instruction)
    );

    control_unit control(
        .instruction(instruction),
        .clk(clk),
        .reset(reset),
        .reg_write(reg_write),
        .alu_op(alu_op),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_dst(reg_dst)
    );

    // Извлечение полей инструкции
    wire [1:0] rs = instruction[3:2];
    wire [1:0] rt = instruction[1:0];
    wire [3:0] immediate = instruction[3:0];

    // Мультиплексор для выбора данных для записи в регистр
    wire [7:0] write_data_to_reg = mem_read ? mem_data : alu_result;

    register_l1_file registers(
        .clk(clk),
        .reset(reset),
        .write_enable(reg_write),
        .write_reg(reg_dst),
        .read_reg_a(rs),
        .read_reg_b(rt),
        .write_data(write_data_to_reg), // Исправлено: выбор между ALU и памятью
        .read_data_a(reg_data_a),
        .read_data_b(reg_data_b)
    );

    // Мультиплексор для выбора второго операнда АЛУ
    wire [7:0] alu_input_b = alu_src ? {4'b0, immediate} : reg_data_b;

    alu_8bit alu(
        .a(reg_data_a),
        .b(alu_input_b),
        .op_code(alu_op),
        .result(alu_result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag)
    );

    memory data_memory(
        .clk(clk),
        .address(alu_result),
        .write_enable(mem_write),
        .write_data(reg_data_b),
        .read_data(mem_data)
    );

    // Важно понимать, что в данном сценарии у нас нет даже намека на ОЗУ, не говоря уже об постоянной памяти, тут мы работаем только с кэшами l1 (command-cache/data-cache)

endmodule
