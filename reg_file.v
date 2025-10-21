module reg_file( clk, resetn, w_en, D_in, r_sel, w_sel, r_out );
    parameter k = 8;
    parameter n = 4;
    input [n-1:0] r_sel, w_sel;
    input clk, resetn, w_en;
    input [k-1:0] D_in;
    output wire [k-1:0] r_out;
    wire [ (1<<n) - 1 : 0 ] w_dec_out;
    wire [k-1:0] r_mux_in [ (1<<n) - 1 : 0 ]; 
    genvar i;
    assign w_dec_out = w_en? (1 << w_sel) : 0;
    assign r_out = r_mux_in[r_sel];
    generate
        for(i = 0 ; i < (1<<n) ; i = i + 1) begin : reg_loop
            register  reg_inst (
                .w_en( w_dec_out[i] ),
                .clk( clk ),
                .rstn( resetn ),
                .in( D_in ),
                .A( r_mux_in[i] )
            );
            defparam reg_inst.k = k;
        end
    endgenerate
endmodule

// the register file contains 2^n, k bit registers

