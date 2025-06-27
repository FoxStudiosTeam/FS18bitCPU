timescale 10ns/10ns
module test_tb;
    // Объявление сигналов
    reg in;
    wire out;
    
    // Инстанцирование тестируемого модуля
    test dut (
        .in(in),
        .out(out)
    );
    
    // Генерация VCD файла для GTKWave
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test_tb);
    end
    
    // Тестовые стимулы
    initial begin
        $display("Начало тестовых стимулов");
        // Инициализация
        in = 0;
        $display("in установлен в 0, время: %t", $time);
        #1;  // Уменьшенное время для более быстрой реакции

        // Тестовые сценарии
        in = 1;
        $display("in установлен в 1, время: %t", $time);
        #1;

        in = 0;
        $display("in установлен в 0, время: %t", $time);
        #1;

        in = 1;
        $display("in установлен в 1, время: %t", $time);
        #1;

        // Завершение симуляции
        $display("Завершение симуляции, время: %t", $time);
        $finish;
    end
    
    // Монитор для отображения результатов
    initial begin
        $monitor("Time = %t, in = %d, out = %d", $time, in, out);
    end
endmodule