`include "./maquina.v"
module maquina_tb ();
    reg clk, reset, insere;
    reg [4:1] numero;
    wire LED, A, B, C, D, E, F, G;

    //instancia o módulo de display de forma a enviar estímulos e receber as saídas
    maquina tb_maquina(.clk(clk), .reset(reset), .insere(insere), .numero(numero), .LED(LED), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G));

    always begin
        #5
        clk = ~clk;
    end
    //inicio da simulação
    initial begin
        //gera o arquivo para visualizar a forma de ondas
        $dumpfile("maquina.vcd");
        $dumpvars;
        $display("numero A B C D E F G LED");
        //monitora as variações nas variáveis e exibe no terminal
        $monitor("%b%b%b%b   %b %b %b %b %b %b %b %b %b",numero[4],numero[3], numero[2], numero[1], A,B,C,D,E,F,G,LED,reset);

        reset = 1'b1;
        clk = 1; insere =1;
        numero = 4'b0101;
        reset = 0;

        #15
        insere =0;
        #10
        insere =1;
        numero = 4'b1001;


        #10
        insere =0;

        #10
        numero = 4'b0000;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b1001;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b1000;
        insere =1;

        #10
        insere =0;
        #10
        numero = 4'b0001;
        insere =1;

        #10
        insere =0;
        #15
        reset= 1;
        #15
//-------------------------------------------------------------------------------------
        reset = 1'b0;
        clk = 1; insere =1;
        numero = 4'b0101;

        #15
        insere =0;
        #10
        insere =1;
        numero = 4'b1001;

        #10
        insere =0;

        #10
        numero = 4'b0000;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b0001;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b1001;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b1000;
        insere =1;

        #10
        insere =0;
        #10
        numero = 4'b0001;
        insere =1;
        #10
        insere =0;
        #15
        reset= 1;
        #15
//-------------------------------------------------------------------------------------

        reset = 1'b0;
        clk = 1; insere = 1;
        numero = 4'b0101;

        #15
        insere =0;
        #10
        insere =1;
        numero = 4'b1001;

        #10
        insere =0;

        #10
        numero = 4'b0000;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b0001;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b0010;
        insere =1;

        #10
        insere =0;

        #10
        numero = 4'b1000;
        insere =1;

        #10
        insere =0;
        #10
        numero = 4'b0001;
        insere =1;
        #10
        insere =0;
        #15
        #40 $finish;
        //fim da simulação
    end
endmodule
