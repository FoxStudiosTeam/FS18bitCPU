module abstract_register(
    input clk,
    input reset,
    input [7:0] data,
    input load,
    output reg [7:0] current
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            current <= 8'b0;
        else if (load)
            current <= data;
    end

endmodule