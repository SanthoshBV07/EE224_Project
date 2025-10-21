module PC_log(A,B,sel,C);
    input [5:0] A,B;
    input sel;
    output [5:0] C;
    wire [5:0]C1,C2;
    
    rca_6 rc1(A,6'b000001,1'b0,C1);
    rca_6 rc2(C1,B,1'b0,C2);
    
    mux_2_1 #(.k(6)) mux1 (
        .A(C1),
        .B(C2),
        .C(C),
        .S(sel)
    );

endmodule


