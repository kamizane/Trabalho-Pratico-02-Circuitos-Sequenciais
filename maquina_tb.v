`include "./maquina.v"
module maquina_tb ();
    reg clk, reset, insere;
    reg [4:1] numero;
    wire LED, A, B, C, D, E, F, G;


    maquina tb_maquina(.clk(clk), .reset(reset), .insere(insere), .numero(numero), .LED(LED), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G));

    always begin
        #10
        clk = ~clk;
    end
    initial begin
        $dumpfile("maquina.vcd");
        $dumpvars;
        $display("numero A B C D E F G LED");
        $monitor("%b%b%b%b   %b %b %b %b %b %b %b %b %b",numero[4],numero[3], numero[2], numero[1], A,B,C,D,E,F,G,LED,reset);

        reset = 1'b1;
        reset = 1'b0;
        #10
        clk = 1; insere = 1;
        numero = 4'b0101;

        #20
        numero = 4'b1001;

        #20
        numero = 4'b0000;;

        #20
        numero = 4'b1001;;
        insere = 1'b0;

        #20
        numero = 4'b1000;

        #20
        numero = 4'b0001;

//-------------------------------------------------------------------------------------
 

        #10 $finish;
    end
endmodule