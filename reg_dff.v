module reg_dff (D_in,clk,Q,rstn,w_en);
    input rstn , clk, D_in , w_en;
    output reg Q;
    wire nxtD;

    always @ (posedge clk or negedge rstn) begin  
        if (rstn == 1'b0)
            Q <= 1'b0;
        else 
            Q <= nxtD;
    end
    assign nxtD = w_en ? D_in : Q;
endmodule