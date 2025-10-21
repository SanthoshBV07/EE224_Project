module opcode_dec(A,B);
    input [7:0] A;
    output [26:0] B;
    wire [15:0] sig1;
    wire [3:0] sig2,sig3;
    wire [1:0] sig4;
    assign B[23] = A[3];
    assign B[24] = A[2];
    assign B[25] = A[1];
    assign B[26] = A[0];
    decoder #(.k(4)) dec_4_16  (.A(A[7:4]) , .B(sig1),.En(1'b1));
    decoder #(.k(2)) dec_2_4_1 (.A(A[1:0]), .B(sig2), .En(sig1[1]));
    decoder #(.k(2)) dec_2_4_2 (.A(A[1:0]), .B(sig3), .En(sig1[15]));
    decoder #(.k(1)) dec_1_2 (.A(A[0]), .B(sig4), .En(sig1[12]));
    assign B[22:0] = {sig3,sig1[14:13],sig4,sig1[11:2],sig2,sig1[0]};
endmodule