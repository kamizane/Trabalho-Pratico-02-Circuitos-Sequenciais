module maquina(
    input clk, reset, insere,
    input [4:1] numero,
    output reg LED =0,
    output reg A, B, C, D, E, F, G
);
    parameter inicial = 4'b1110;
    parameter cinco = 4'b0101;
    parameter nove = 4'b1001;
    parameter zero = 4'b0000;
    parameter nove_final= 4'b0010;
    parameter oito = 4'b1000;
    parameter um = 4'b0001;
    parameter falha = 4'b1111;

    reg [3:0] estado;
    reg [3:0] proximo_estado;
    
    reg teste1 = 0;
    reg teste2 = 0;
    reg teste3 = 0;

    always @(posedge clk) begin
        if (reset == 1'b0)  begin
            estado <= inicial;
        end
        else begin 
            estado <= proximo_estado;
        end
    end

    always @(negedge insere) begin
        proximo_estado = estado;
        case (estado)
            um:
                proximo_estado = um;
            falha:
                proximo_estado = falha;
            inicial:
                if (numero == 4'b0101) proximo_estado = cinco;
                else begin
                    if (LED) proximo_estado = falha;
                    else begin
                        proximo_estado = inicial;
                        LED = 1'b1;
                    end
                end
            cinco:
                if (LED) begin
                    if (numero == 4'b1001) proximo_estado = nove;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 4'b1001) proximo_estado = nove;
                    else begin
                        proximo_estado = cinco;
                        LED = 1;
                    end
                end
            nove:
                if (LED) begin
                    if (numero == 4'b0000) proximo_estado =zero;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 4'b0000) proximo_estado =zero;
                    else begin
                        proximo_estado = nove;
                        LED = 1;
                    end
                end
            zero: begin
                teste3 = 0;
                if (LED) begin
                    teste1 = 0;
                    if (numero == 4'b0010) proximo_estado = nove_final;
                    else                proximo_estado = falha;
                end
                else begin
                    teste2 =1;
                    if (numero == 4'b0010) proximo_estado = nove_final;
                    else begin
                        proximo_estado = zero;
                        LED = 1;
                    end
                end
            end
            nove_final:
                if (LED) begin
                    if (numero == 4'b1000) proximo_estado = oito;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 4'b1000) proximo_estado = oito;
                    else begin
                        proximo_estado = nove_final;
                        LED = 1;
                    end
                end
            oito:
                if(LED) begin
                    if (numero == 4'b0001) proximo_estado = um;
                    else                proximo_estado = falha;
                end
                else begin
                    if (numero == 4'b0001) proximo_estado = um;
                    else begin
                        proximo_estado = oito;
                        LED = 1;
                    end
                end
            default:
                proximo_estado = inicial;
        endcase
    end
    always @(negedge insere) begin
        if (estado == um & LED == 1) begin
            A <= 1'b0;
            B <= 1'b0;
            C <= 1'b1;
            D <= 1'b1;
            E <= 1'b0;
            F <= 1'b0;
            G <= 1'b0;
        end

        else if (estado == um & LED == 0) begin
            A <= 1'b0;
            B <= 1'b1;
            C <= 1'b0;
            D <= 1'b0;
            E <= 1'b1;
            F <= 1'b0;
            G <= 1'b0;
        end
        else if (estado == falha) begin
            A <= 1'b0;
            B <= 1'b1;
            C <= 1'b1;
            D <= 1'b1;
            E <= 1'b0;
            F <= 1'b0;
            G <= 1'b0;
        end
        else begin
            A <= ~(((~numero[4])&numero[2])|((~numero[4])&(~numero[3])&(~numero[1]))|((~numero[4])&numero[3]&numero[1])|(numero[4]&(~numero[3])&(~numero[2])));
            B <= ~(((~numero[4])&(~numero[3]))|((~numero[3]&(~numero[2])))|((~numero[4])&(~numero[2])&(~numero[1]))|((~numero[4])&numero[2]&numero[1]));
            C <= ~(((~numero[3])&(~numero[2]))|((~numero[4])&numero[1])|((~numero[4])&numero[3]));
            D <= ~(((~numero[4])&(~numero[3])&(~numero[1]))|((~numero[4])&(~numero[3])&numero[2])|((~numero[4])&numero[2]&(~numero[1]))|(numero[4]&(~numero[3])&(~numero[2]))|((~numero[4])&(numero[3])&(~numero[2])&numero[1]));
            E <= ~(((~numero[3])&(~numero[2])&(~numero[1]))|((~numero[4])&numero[2]&(~numero[1])));
            F <= ~(((~numero[4])&(~numero[2])&(~numero[1]))|((~numero[4])&numero[3]&(~numero[2]))|((~numero[4])&numero[3]&(~numero[1]))|(numero[4]&(~numero[3])&(~numero[2])));
            G <= ~((numero[4]|((~numero[3])&numero[2])|(numero[2]&(~numero[1]))|(numero[3]&(~numero[2]))));
        end
    end
endmodule