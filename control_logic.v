module control_logic(op_code, reg_flags, control_out);
    input [26:0] op_code;
    input [3:0] reg_flags;
    output [18:1] control_out;
    assign control_out[1] = op_code[1] | op_code[2];
    assign control_out[2] = op_code[18] | (op_code[19]& reg_flags[0]) | (op_code[20]& ~reg_flags[0]) | 
    (op_code[21]& (~reg_flags[0] & ~(reg_flags[1] ^reg_flags[2]))) | (op_code[22]& (~(reg_flags[1] ^reg_flags[2])));
    assign control_out[3] = 1'b1;
    assign control_out[4] = (op_code[2]&op_code[23]) | (op_code[4]&op_code[23]) | (op_code[5]&op_code[25]) |(op_code[7]&op_code[23]) |
                            (op_code[8]&op_code[23]) |(op_code[9]&op_code[23]) |(op_code[10]&op_code[23]) |(op_code[15]&op_code[23]) |
                            (op_code[16]&op_code[23]) |(op_code[17]&op_code[23]) |(op_code[14]&op_code[25]) |(op_code[12]&op_code[25]) ;
    assign control_out[5] = (op_code[2]&op_code[24]) | (op_code[4]&op_code[24]) | (op_code[5]&op_code[26]) |(op_code[7]&op_code[24]) |
                            (op_code[8]&op_code[24]) |(op_code[9]&op_code[24]) |(op_code[10]&op_code[24]) |(op_code[15]&op_code[24]) |
                            (op_code[16]&op_code[24]) |(op_code[17]&op_code[24]) |(op_code[14]&op_code[26]) |(op_code[12]&op_code[26]) ;
    assign control_out[6] = (op_code[7]&op_code[25]) | (op_code[9]&op_code[25]) | (op_code[13]&op_code[23]) | (op_code[14]&op_code[23]) |
                            (op_code[17]&op_code[25]) ;
    assign control_out[7] = (op_code[7]&op_code[26]) | (op_code[9]&op_code[26]) | (op_code[13]&op_code[24]) | (op_code[14]&op_code[24]) |
                            (op_code[17]&op_code[26]) ;
    assign control_out[8] = (op_code[5]&op_code[23]) | (op_code[6]&op_code[23]) | (op_code[7]&op_code[23]) |(op_code[8]&op_code[23]) |
                            (op_code[9]&op_code[23]) | (op_code[10]&op_code[23]) | (op_code[11]&op_code[23]) | (op_code[12]&op_code[23]) |
                            (op_code[15]&op_code[23]) |(op_code[16]&op_code[23]);
    assign control_out[9] = (op_code[5]&op_code[24]) | (op_code[6]&op_code[24]) | (op_code[7]&op_code[24]) |(op_code[8]&op_code[24]) |
                            (op_code[9]&op_code[23]) | (op_code[10]&op_code[24]) | (op_code[11]&op_code[24]) | (op_code[12]&op_code[24]) |
                            (op_code[15]&op_code[23]) |(op_code[16]&op_code[24]);
    assign control_out[10] = op_code[5] | op_code [6] | op_code[7]  | op_code[8] | op_code[9] |op_code[10]|op_code[11]|op_code[12]|op_code[15]|op_code[16]; 
    assign control_out[11] = op_code[2] | op_code[4] | op_code[5] | op_code[7] |op_code[8] |op_code[9] |op_code[10] | op_code[12] |op_code[14] |op_code[17] ;
    assign control_out[13] = op_code[9] |op_code[10] |op_code[16] |op_code[17] ;
    assign control_out[14] = op_code[7] |op_code[8] |op_code[9] |op_code[10] |op_code[15] |op_code[16] |op_code[17] ;
    assign control_out[15] = op_code[1] |op_code[3] |op_code[6] |op_code[11] |op_code[13] ;
    assign control_out[16] = op_code[3] |op_code[4] ;
    assign control_out[17] = op_code[3] |op_code[4] |op_code[13] |op_code[14] ;
    assign control_out[18] = op_code[11] |op_code[12] ;
endmodule