module alu(sel,A,B,res,neg,zero,carry,overflow);
    input [7:0]A,B;
    input [1:0]sel;
    output [7:0]result;
    output neg,zero,carry,overflow;
    reg [7:0]shifted_out;
    reg shi;
    wire [7:0]res1,res2,res;
    wire car1,car2,ovf1,ovf2,car,ovf;
    rca rca_instance1(A,B,1'b0,res1,car1,ovf1);
    rca rca_instance2(A,~B,1'b1,res2,car2,ovf2);
    always@(sel[0],A)
    begin
        if (sel[0]==1'b0) begin
            shifted_out=A<<1;
            shi=A[7];
        end
        else begin
            shifted_out=A>>1;
            shi=A[0];
        end
    end

    assign res = (sel[0]==0) ? res1 : res2;
    assign car = (sel[0]==0) ? car1 : car2;
    assign ovf = (sel[0]==0) ? ovf1 : ovf2;

    mux_2_1 #(.k(1)) mux1 (
        .A(shi),
        .B(car),
        .C(carry),
        .S(sel[1])
    );

    mux_2_1 #(.k(1)) mux2 (
        .A(1'b0),
        .B(ovf),
        .C(overflow),
        .S(sel[1])
    );

    mux_2_1 #(.k(8)) mux3 (
        .A(shifted_out),
        .B(res),
        .C(result),
        .S(sel[1])
    );

    assign neg=res[7];
    assign zero=~|res;

endmodule













