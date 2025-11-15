module simple_8bit_adder(
    input [7:0] a,
    input [7:0] b,
    input wire c_in,
    output wire c_out,
    output [7:0] s
);
    wire [7:0] carry;  // промежуточные переносы
    // это переменная причем не wire и не reg, а именно что genvar для генерации
    genvar i;
    // это типо макросы
    generate
        for (i = 0; i < 8; i = i + 1) begin : adder_block
            if (i == 0) begin
                // Младший разряд, входящий перенос c_in
                full_adder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .c_in(c_in),
                    .s(s[i]),
                    .c_out(carry[i])
                );
            end else begin
                // Остальные разряды
                full_adder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .c_in(carry[i-1]),
                    .s(s[i]),
                    .c_out(carry[i])
                );
            end
        end
    endgenerate

    assign c_out = carry[7];  // перенос из старшего разряда

endmodule
