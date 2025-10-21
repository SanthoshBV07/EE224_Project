module fa(a,b,c0,s,c1);
    input a,b,c0;
    output s,c1;

    assign s=(a^b^c0);
    assign c1=((a&b)|(c0&(a^b)));
endmodule

