module rca_6(A,B,Cin,S)
    input [5:0] A,B;
    input Cin;
    output [5:0] S;
    S=A+B+Cin;
endmodule
    

