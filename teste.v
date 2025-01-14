module maquina (
    input clk, reset, insere, numero,
    output reg LED, A, B, C, D, E, F, G
);
    parameter inicial;
    parameter cinco = 4'b0101;
    parameter nove = 4'b1001;
    parameter zero = 4'b0000;
    parameter nove_final = 4'b0101;
    parameter oito = 4'b1000;
    parameter um = 4'b0001;
    parameter falha = 4'b1111;

    reg [3:0] estado;
    reg [3:0] proximo_estado

    always @(posedge clk) begin
        if (reset)  estado = zero
    end
endmodule