module regfile1( clk, resetn, w_en, D_in, r_sel1,r_sel2, w_sel, r_out1, r_out2 );

    input [1:0] r_sel1,rsel2, w_sel;
    input clk, resetn, w_en;
    input [7:0] D_in;
    output wire [7:0] r_out1,r_out2;
    wire [ 3: 0 ] w_dec_out;
    wire [7:0] reg_out [3:0];
    genvar i;
    assign w_dec_out = w_en? (1 << w_sel) : 0;
    assign r_out1 = reg_out[r_sel1];
    assign r_out2 = reg_out[r_sel2];
    generate
        for(i = 0 ; i < 4 ; i = i + 1) begin : reg_loop
            register  reg_inst (
                .w_en( w_dec_out[i] ),
                .clk( clk ),
                .rstn( resetn ),
                .in( D_in ),
                .A( reg_out[i] )
            );
            defparam reg_inst.k = 8;
        end
    endgenerate
endmodule