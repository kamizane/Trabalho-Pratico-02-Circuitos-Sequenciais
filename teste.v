module maquina (
    input clk, reset, insere, numero,
    output reg LED, A, B, C, D, E, F, G
);
    parameter inicial = 4'b0000;
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
        if (reset)  estado = inicial;
        else        estado = proximo_estado;
//duvida na linha a cima
    end

    always @(numero or estado) begin
        case (estado)
            inicial:
            begin
                if (numero == 0101) proximo_estado = cinco;
                else begin
                    proximo_estado = inicial;
                    LED = 1;
                end
            end
            cinco:
            begin
                if (LED) begin
                    if (numero == 1001) proximo_estado = nove;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 1001) proximo_estado = nove;
                    else begin
                        proximo_estado = cinco;
                        LED = 1;
                    end
                end
            end
            nove:
            begin
                if (LED) begin
                    if (numero == 0000) proximo_estado = zero;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 0000) proximo_estado = nove;
                    else begin
                        proximo_estado = falha;
                        LED = 1;
                    end
                end
            end
            zero:
            begin
                if (LED) begin
                    if (numero == 1001) proximo_estado = nove_final;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 1001) proximo_estado = nove_final;
                    else begin
                        proximo_estado = zero;
                        LED = 1;
                    end
                end
            end
            nove_final:
            begin
                if (LED) begin
                    if (numero == 1000) proximo_estado = oito;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 1000) proximo_estado = oito;
                    else begin
                        proximo_estado = nove_final;
                        LED = 1;
                    end
                end
            end
            oito:
            begin
                if(LED) begin
                    if (numero == 0001) proximo_estado = um;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 0001) proximo_estado = um;
                    else begin
                        proximo_estado = oito;
                        LED = 1;
                    end
                end
            end
    end
    always @(estado) begin
        case(estado)
        inicial: begin
            A <= 1'b0;
            B <= 1'b0;
            C <= 1'b0;
            D <= 1'b0;
            E <= 1'b0;
            F <= 1'b0;
            G <= 1'b1;
        end
    cinco
endmodule