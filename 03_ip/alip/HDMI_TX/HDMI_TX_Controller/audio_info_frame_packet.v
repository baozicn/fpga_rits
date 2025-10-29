

module audio_info_frame_packet (
    input wire       I_clk,
    input wire       I_rst,

    input wire[2:0]  I_audio_sample_frequency,
    input wire[2:0]  I_audio_channel_count,

    output reg[31:0] O_BCH_block_4,
    output reg[63:0] O_BCH_block_3,
    output reg[63:0] O_BCH_block_2,
    output reg[63:0] O_BCH_block_1,
    output reg[64:0] O_BCH_block_0
);

    


    wire[7:0]  S_HB0;
    wire[7:0]  S_HB1;
    wire[7:0]  S_HB2;

    wire[7:0]  S_SB0;
    wire[7:0]  S_SB1;
    wire[7:0]  S_SB2;
    wire[7:0]  S_SB3;
    wire[7:0]  S_SB4;
    wire[7:0]  S_SB5;
    wire[7:0]  S_SB6;

    wire[23:0] S_packet_header;
    wire[55:0] S_packet_body;
    wire[7:0]  S_packet_header_parity;
    wire[7:0]  S_packet_body_parity;

    assign S_HB0 = 8'h84;
    assign S_HB1 = 8'h01;
    assign S_HB2 = 8'd10;

    assign S_SB0 = 8'd1 + ~(S_HB0 + S_HB1 + S_HB2 + S_SB1 + S_SB2 + S_SB3 + S_SB4 + S_SB5);
    assign S_SB1 = {4'b0000,1'b0,I_audio_channel_count};  
    assign S_SB2 = {3'b000,I_audio_sample_frequency,2'b11};   
    assign S_SB3 = 8'h00;
    assign S_SB4 = 8'h00;
    assign S_SB5 = 8'h00;
    assign S_SB6 = 8'h00;


    assign S_packet_header = {S_HB2,S_HB1,S_HB0};
    assign S_packet_body   = {S_SB6,S_SB5,S_SB4,S_SB3,S_SB2,S_SB1,S_SB0};


    BCH_32_24_encode u_BCH_32_24_encode(
        .I_clk          ( I_clk                  ),
        .I_data_in      ( S_packet_header        ),
        .O_bch_ecc_out  ( S_packet_header_parity )
    );

    BCH_64_56_encode u_BCH_64_56_encode(
        .I_clk          ( I_clk                ),
        .I_data_in      ( S_packet_body        ),
        .O_bch_ecc_out  ( S_packet_body_parity )
    );


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                O_BCH_block_4 <= 'd0;
                O_BCH_block_3 <= 'd0;
                O_BCH_block_2 <= 'd0;
                O_BCH_block_1 <= 'd0;
                O_BCH_block_0 <= 'd0;
            end
        else
            begin
                O_BCH_block_4 <= {S_packet_header_parity,S_packet_header};

                O_BCH_block_3 <= 64'd0;
                O_BCH_block_2 <= 64'd0;
                O_BCH_block_1 <= 64'd0;
                O_BCH_block_0 <= {S_packet_body_parity,S_packet_body};
            end
    end
    
endmodule