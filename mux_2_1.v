module mux_2_1 (A,B,C,S);
    parameter k=8;
    input [k-1:0] A,B;
    input S;
    output [k-1:0] C;

    assign C = S == 1'b1 ? B : A;
endmodule

