module register(w_en,clk,rstn,in,A);
    parameter k = 8;
    input w_en, clk, rstn ;
    input [k-1:0] in;
    output wire [k-1:0] A;
    genvar  i;

    generate
        for (i= 0; i<k ; i = i+1) begin
            reg_dff dff_inst (.D_in(in[i]), .clk(clk), .rstn(rstn), .Q(A[i]), .w_en(w_en));
        end
    endgenerate 
endmodule