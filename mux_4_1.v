module mux_4_1 (A,B,C,D,S1,S0,E);
    parameter k = 8;
    input [k-1 : 0] A,B,C,D;
    input S1,S0;
    output reg [k-1:0] E;
    
    always @ (*) begin
        case ({S1,S0})
            2'b00 : E = A;
            2'b01 : E = B;
            2'b10 : E = C;
            2'b11 : E = D;
        endcase
    end
endmodule
