
module BCH_32_24_encode (
    input wire       I_clk,
    input wire[23:0] I_data_in,
    output reg[7:0]  O_bch_ecc_out
);

    wire[7:0] S_ecc_init = 'd0;
    wire[7:0] S_ecc_1;
    wire[7:0] S_ecc_2;
    wire[7:0] S_ecc_3;
    wire[7:0] S_ecc_4;
    wire[7:0] S_ecc_5;
    wire[7:0] S_ecc_6;
    wire[7:0] S_ecc_7;
    wire[7:0] S_ecc_8;
    wire[7:0] S_ecc_9;
    wire[7:0] S_ecc_10;
    wire[7:0] S_ecc_11;
    wire[7:0] S_ecc_12;
    wire[7:0] S_ecc_13;
    wire[7:0] S_ecc_14;
    wire[7:0] S_ecc_15;
    wire[7:0] S_ecc_16;
    wire[7:0] S_ecc_17;
    wire[7:0] S_ecc_18;
    wire[7:0] S_ecc_19;
    wire[7:0] S_ecc_20;
    wire[7:0] S_ecc_21;
    wire[7:0] S_ecc_22;
    wire[7:0] S_ecc_23;
    wire[7:0] S_ecc_24;

    assign S_ecc_1 =  (S_ecc_init >> 1) ^ (I_data_in[0]  ^ S_ecc_init[0] ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_2 =  (S_ecc_1 >> 1)    ^ (I_data_in[1]  ^ S_ecc_1[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_3 =  (S_ecc_2 >> 1)    ^ (I_data_in[2]  ^ S_ecc_2[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_4 =  (S_ecc_3 >> 1)    ^ (I_data_in[3]  ^ S_ecc_3[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_5 =  (S_ecc_4 >> 1)    ^ (I_data_in[4]  ^ S_ecc_4[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_6 =  (S_ecc_5 >> 1)    ^ (I_data_in[5]  ^ S_ecc_5[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_7 =  (S_ecc_6 >> 1)    ^ (I_data_in[6]  ^ S_ecc_6[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_8 =  (S_ecc_7 >> 1)    ^ (I_data_in[7]  ^ S_ecc_7[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_9 =  (S_ecc_8 >> 1)    ^ (I_data_in[8]  ^ S_ecc_8[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_10 = (S_ecc_9 >> 1)    ^ (I_data_in[9]  ^ S_ecc_9[0]    ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_11 = (S_ecc_10 >> 1)   ^ (I_data_in[10] ^ S_ecc_10[0]   ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_12 = (S_ecc_11 >> 1)   ^ (I_data_in[11] ^ S_ecc_11[0]   ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_13 = (S_ecc_12 >> 1)   ^ (I_data_in[12] ^ S_ecc_12[0]   ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_14 = (S_ecc_13 >> 1)   ^ (I_data_in[13] ^ S_ecc_13[0]   ? 8'b10000011 : 8'h00000000); 
    assign S_ecc_15 = (S_ecc_14 >> 1)   ^ (I_data_in[14] ^ S_ecc_14[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_16 = (S_ecc_15 >> 1)   ^ (I_data_in[15] ^ S_ecc_15[0]   ? 8'b10000011 : 8'h00000000);  
    assign S_ecc_17 = (S_ecc_16 >> 1)   ^ (I_data_in[16] ^ S_ecc_16[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_18 = (S_ecc_17 >> 1)   ^ (I_data_in[17] ^ S_ecc_17[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_19 = (S_ecc_18 >> 1)   ^ (I_data_in[18] ^ S_ecc_18[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_20 = (S_ecc_19 >> 1)   ^ (I_data_in[19] ^ S_ecc_19[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_21 = (S_ecc_20 >> 1)   ^ (I_data_in[20] ^ S_ecc_20[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_22 = (S_ecc_21 >> 1)   ^ (I_data_in[21] ^ S_ecc_21[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_23 = (S_ecc_22 >> 1)   ^ (I_data_in[22] ^ S_ecc_22[0]   ? 8'b10000011 : 8'h00000000);
    assign S_ecc_24 = (S_ecc_23 >> 1)   ^ (I_data_in[23] ^ S_ecc_23[0]   ? 8'b10000011 : 8'h00000000);
    
    always @(posedge I_clk) begin
        O_bch_ecc_out <= S_ecc_24;
    end

endmodule