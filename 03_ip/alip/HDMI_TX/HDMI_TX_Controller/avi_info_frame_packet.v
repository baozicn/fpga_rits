
module avi_info_frame_packet (
    input wire       I_clk,
    input wire       I_rst,

    input wire[1:0]  I_video_format,
    input wire[1:0]  I_colorimetry,
    input wire[6:0]  I_video_VIC,

    output reg[31:0] O_BCH_block_4,
    output reg[63:0] O_BCH_block_3,
    output reg[63:0] O_BCH_block_2,
    output reg[63:0] O_BCH_block_1,
    output reg[63:0] O_BCH_block_0
);

    wire[7:0]   S_HB0;
    wire[7:0]   S_HB1;
    wire[7:0]   S_HB2;

    wire[7:0]   S_PB0;
    wire[7:0]   S_PB1;
    wire[7:0]   S_PB2;
    wire[7:0]   S_PB3;
    wire[7:0]   S_PB4;
    wire[7:0]   S_PB5;
    wire[7:0]   S_PB6;

    wire[23:0]  S_packet_header;
    wire[55:0]  S_packet_body;
    wire[7:0]   S_packet_header_parity;
    wire[7:0]   S_packet_body_parity;


    assign S_HB0 = 8'h82;
    assign S_HB1 = 8'h02;
    assign S_HB2 = 8'h0D;

    assign S_PB0 = 8'd1 + ~(S_HB0 + S_HB1 + S_HB2 + S_PB1 + S_PB2 + S_PB3 + S_PB4 + S_PB5);
    assign S_PB1 = {1'b0,I_video_format,1'b0,2'b00,2'b00};
    assign S_PB2 = {I_colorimetry,2'b00,4'b1000};
    assign S_PB3 = {1'b0,3'b001,2'b00,2'b00};
    assign S_PB4 = {1'b0,I_video_VIC};
    assign S_PB5 = {2'b00,2'b00,4'b0000};
    assign S_PB6 = 'd0;

    assign S_packet_header = {S_HB2,S_HB1,S_HB0};
    assign S_packet_body   = {S_PB6,S_PB5,S_PB4,S_PB3,S_PB2,S_PB1,S_PB0};

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