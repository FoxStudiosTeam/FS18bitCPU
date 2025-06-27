module processor_tb;
    reg clk;
    reg reset;

    // Инстанцирование процессора
    processor_8bit uut(
        .clk(clk),
        .reset(reset)
    );

    // Генерация тактового сигнала
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    // Инициализация памяти инструкций
    initial begin
    // Пример заполнения тестовыми инструкциям
        uut.instruction_memory.mem[0] = 8'b00000001; // ADD r0, r1
        uut.instruction_memory.mem[1] = 8'b00010010; // SUB r0, r2
        uut.instruction_memory.mem[2] = 8'b00100011; // AND r0, r3
    // Добавьте больше инструкций по необходимости
    end

    // Тестирование
    initial begin
        reset = 1;
        #10 reset = 0;

        // Запуск симуляции на определенное время
        #10000 $finish;
    end

    // Мониторинг сигналов
    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, processor_tb);
        $monitor("Time = %t, PC = %h, Instruction = %h", $time, uut.pc_out, uut.instruction);
    end
endmodule