`timescale 1ns/1ps

module tb_simple_8bit_adder;

reg [7:0] a, b;
reg c_in;
wire [7:0] s;
wire c_out;

simple_8bit_adder addr(
    .a(a),
    .b(b),
    .c_in(c_in),
    .s(s),
    .c_out(c_out)
);

initial begin
    $dumpfile("src/components/simple_8bit_adder/simple_8bit_adder.vcd");
    $dumpvars(0, tb_simple_8bit_adder);

    a = 8'b00001010;
    b = 8'b00000101;
    c_in = 1'b0;

    #10; // один такт

    assert (s == 8'b00001111 ) else $error("ошибка, некорректный расчёт суммы 8-бит сумматора %b", s);
    assert (c_out == 0) else $error("ошибка, некорректный расчёт бита переноса %b",c_out);

    a = 8'hFF;
    b = 8'hFF;
    c_in = 1'b0;

    #10
    assert (s == 8'b00001111 ) else $error("ошибка, некорректный расчёт суммы 8-бит сумматора %b", s);
    assert (c_out == 0) else $error("ошибка, некорректный расчёт бита переноса %b",c_out);


    $finish;
end

endmodule
