module rca(A, B, Cin, Sum, Cout ,ov);
    input [7:0] A, B;
    input Cin;
    output [7:0] Sum;
    output Cout;

    wire [8:0] c; 
    assign c[0] = Cin;

    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin : adder_loop
            fa fulladder (
                .a(A[i]),
                .b(B[i]),
                .c0(c[i]),
                .s(Sum[i]),
                .c1(c[i+1])
            );
        end
    endgenerate

    assign Cout = c[8]; 
    assign ov = c[8]^c[7];
endmodule
