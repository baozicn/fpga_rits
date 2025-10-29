
////see hdmi spec 1.4 section 5.3.3 Audio Clock Regeneration Packet

module audio_clock_regeneration_packet (
    input wire       I_clk,
    input wire       I_rst,

    input wire[19:0] I_audio_CTS,
    input wire[19:0] I_audio_N,

    output reg[31:0] O_BCH_block_4,
    output reg[63:0] O_BCH_block_3,
    output reg[63:0] O_BCH_block_2,
    output reg[63:0] O_BCH_block_1,
    output reg[63:0] O_BCH_block_0
);

    reg[7:0]  S_HB0;
    reg[7:0]  S_HB1;
    reg[7:0]  S_HB2;

    reg[7:0]  S_SB0;
    reg[7:0]  S_SB1;
    reg[7:0]  S_SB2;
    reg[7:0]  S_SB3;
    reg[7:0]  S_SB4;
    reg[7:0]  S_SB5;
    reg[7:0]  S_SB6;

    wire[23:0] S_packet_header;
    wire[55:0] S_packet_body;
    wire[7:0]  S_packet_header_parity;
    wire[7:0]  S_packet_body_parity;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                S_HB0 <= 'd0;
                S_HB1 <= 'd0;
                S_HB2 <= 'd0;

                S_SB0 <= 'd0;
                S_SB1 <= 'd0;
                S_SB2 <= 'd0;
                S_SB3 <= 'd0;
                S_SB4 <= 'd0;
                S_SB5 <= 'd0;
                S_SB6 <= 'd0;
            end
        else
            begin
                S_HB0 <= 8'h01;
                S_HB1 <= 8'h00;
                S_HB2 <= 8'h00;

                S_SB0 <= 8'h00;
                S_SB1 <= {4'b0000,I_audio_CTS[19:16]};
                S_SB2 <= I_audio_CTS[15:8];
                S_SB3 <= I_audio_CTS[7:0];
                S_SB4 <= {4'b0000,I_audio_N[19:16]};
                S_SB5 <= I_audio_N[15:8];
                S_SB6 <= I_audio_N[7:0];
            end
    end


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

                O_BCH_block_3 <= {S_packet_body_parity,S_packet_body};
                O_BCH_block_2 <= {S_packet_body_parity,S_packet_body};
                O_BCH_block_1 <= {S_packet_body_parity,S_packet_body};
                O_BCH_block_0 <= {S_packet_body_parity,S_packet_body};
            end
    end
    
endmodule