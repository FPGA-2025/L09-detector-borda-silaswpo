module detector_borda (
    input wire clk,
    input wire rst,
    input wire [1:0] entrada,
    output reg [1:0] detector
);

reg [1:0] entrada_antiga;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        entrada_antiga <= 2'b00;
        detector <= 2'b00;
    end else begin
        detector <= (~entrada_antiga) & entrada; // Detecta transição 0 → 1
        entrada_antiga <= entrada;
    end
end

endmodule
