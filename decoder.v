module decoder (A,B,En);
    parameter k = 4;
    input [k-1:0] A;
    input En;
    output [(1<<k) - 1 :0 ] B;
    assign B = En?(1 << A):0;
endmodule