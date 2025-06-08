`timescale 1ns/1ps

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
        // Инициализация
        in = 0;
        #10;
        
        // Тестовые сценарии
        in = 1;
        #10;
        
        in = 0;
        #10;
        
        in = 1;
        #10;
        
        // Завершение симуляции
        $finish;
    end
    
    // Монитор для отображения результатов
    initial begin
        $monitor("Time = %t, in = %d, out = %d", $time, in, out);
    end
endmodule