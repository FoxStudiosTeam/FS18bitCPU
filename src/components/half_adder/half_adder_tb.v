`timescale 1ns/1ps

module tb_half_adder;

    // Входы полусумматора
    reg a;
    reg b;

    // Выходы полусумматора
    wire s;
    wire c;

    // Подключаем наш модуль
    half_adder uut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    // Процедура тестирования
    initial begin
        // Настройка генерации VCD-файла
        $dumpfile("src/components/half_adder/half_adder.vcd");   // имя файла для waveform
        $dumpvars(0, tb_half_adder);   // какие модули записывать

        // Тестируем все комбинации (в соответствии с таблицей истинности)
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // Завершаем симуляцию
    end

endmodule
