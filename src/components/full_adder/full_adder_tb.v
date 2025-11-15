`timescale 1ns/1ps

module tb_full_adder;

    reg a, b, c_in;
    wire s, c_out;

    full_adder fa (
        .a(a), .b(b), .c_in(c_in),
        .s(s), .c_out(c_out)
    );

    initial begin
        $dumpfile("src/components/full_adder/full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        // Комбинация 0 0 0
        a = 0; b = 0; c_in = 0; #10;
        assert(s == 0)      else $error("Ошибка: s=%b, a=0 b=0 c_in=0", s);
        assert(c_out == 0)  else $error("Ошибка: c_out=%b, a=0 b=0 c_in=0", c_out);

        // Комбинация 0 0 1
        a = 0; b = 0; c_in = 1; #10;
        assert(s == 1)      else $error("Ошибка: s=%b, a=0 b=0 c_in=1", s);
        assert(c_out == 0)  else $error("Ошибка: c_out=%b, a=0 b=0 c_in=1", c_out);

        // Комбинация 0 1 0
        a = 0; b = 1; c_in = 0; #10;
        assert(s == 1)      else $error("Ошибка: s=%b, a=0 b=1 c_in=0", s);
        assert(c_out == 0)  else $error("Ошибка: c_out=%b, a=0 b=1 c_in=0", c_out);

        // Комбинация 0 1 1
        a = 0; b = 1; c_in = 1; #10;
        assert(s == 0)      else $error("Ошибка: s=%b, a=0 b=1 c_in=1", s);
        assert(c_out == 1)  else $error("Ошибка: c_out=%b, a=0 b=1 c_in=1", c_out);

        // Комбинация 1 0 0
        a = 1; b = 0; c_in = 0; #10;
        assert(s == 1)      else $error("Ошибка: s=%b, a=1 b=0 c_in=0", s);
        assert(c_out == 0)  else $error("Ошибка: c_out=%b, a=1 b=0 c_in=0", c_out);

        // Комбинация 1 0 1
        a = 1; b = 0; c_in = 1; #10;
        assert(s == 0)      else $error("Ошибка: s=%b, a=1 b=0 c_in=1", s);
        assert(c_out == 1)  else $error("Ошибка: c_out=%b, a=1 b=0 c_in=1", c_out);

        // Комбинация 1 1 0
        a = 1; b = 1; c_in = 0; #10;
        assert(s == 0)      else $error("Ошибка: s=%b, a=1 b=1 c_in=0", s);
        assert(c_out == 1)  else $error("Ошибка: c_out=%b, a=1 b=1 c_in=0", c_out);

        // Комбинация 1 1 1
        a = 1; b = 1; c_in = 1; #10;
        assert(s == 1)      else $error("Ошибка: s=%b, a=1 b=1 c_in=1", s);
        assert(c_out == 1)  else $error("Ошибка: c_out=%b, a=1 b=1 c_in=1", c_out);

        $finish;
    end

endmodule
