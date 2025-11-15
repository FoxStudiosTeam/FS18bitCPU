module full_adder (
    input wire a,
    input wire b,
    input wire c_in,
    output wire c_out,
    output wire s
);

    wire s1, c1, c2;

    half_adder h1 (
        .a(a),
        .b(b),
        .s(s1),
        .c(c1)
    );

    half_adder h2(
        .a(s1),
        .b(c_in),
        .s(s),
        .c(c2)
    );

    assign c_out = c1 | c2;

endmodule