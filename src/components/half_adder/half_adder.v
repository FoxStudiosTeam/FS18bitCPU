module half_adder (
    input wire a,
    input wire b,
    output wire s, //сумма
    output wire c // бит-переноса
);
    
    assign s = a ^ b;
    assign c = a & b;

endmodule