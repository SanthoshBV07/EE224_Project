module rca_6(A,B,Cin,S)
    input signed [5:0] A,B;
    input Cin;
    output signed [5:0] S;
    S=A+B+Cin;
endmodule
    
