
module audio_sample_packet_2_channel (
    input wire        I_clk,
    input wire        I_rst,

    input wire        I_audio_valid,
    input wire[23:0]  I_audio_left_data,
    input wire[23:0]  I_audio_right_data,
 
    input wire        I_audio_sample_packet_req,     //synthesis keep 
    output reg        O_audio_sample_packet_valid,   //synthesis keep

    output wire[31:0] O_BCH_block_4,
    output wire[63:0] O_BCH_block_3,
    output wire[63:0] O_BCH_block_2,
    output wire[63:0] O_BCH_block_1,
    output wire[63:0] O_BCH_block_0
);

    wire[7:0]     S_HB0;
    wire[7:0]     S_HB1;
    wire[7:0]     S_HB2;
    wire[23:0]    S_packet_header;
    wire[7:0]     S_packet_header_parity;

    wire[7:0]     S_SB0;
    wire[7:0]     S_SB1;
    wire[7:0]     S_SB2;
    wire[7:0]     S_SB3;
    wire[7:0]     S_SB4;
    wire[7:0]     S_SB5;
    wire[7:0]     S_SB6;
    wire[55:0]    S_packet_body;
    reg[55:0]     S_packet_body_1d;
    wire[7:0]     S_packet_body_parity;
    wire[63:0]    S_BCH_block_0;      

    reg           S_fifo_wr_en;      
    wire          S_fifo_full;      

    wire[63:0]    S_fifo_rd_data;   
    wire          S_fifo_empty;       
    reg[7:0]      S_audio_frame_cnt;


    assign S_SB0 = I_audio_left_data[7:0];
    assign S_SB1 = I_audio_left_data[15:8];
    assign S_SB2 = I_audio_left_data[23:16];
    assign S_SB3 = I_audio_right_data[7:0];
    assign S_SB4 = I_audio_right_data[15:8];
    assign S_SB5 = I_audio_right_data[23:16];
    assign S_SB6 = 'd0;

    assign S_packet_body = {S_SB6,S_SB5,S_SB4,S_SB3,S_SB2,S_SB1,S_SB0};

    always @(posedge I_clk) begin
        S_packet_body_1d <= S_packet_body;
    end
    
    BCH_64_56_encode u_BCH_64_56_encode(
        .I_clk          ( I_clk                ),
        .I_data_in      ( S_packet_body        ),
        .O_bch_ecc_out  ( S_packet_body_parity )
    );

    assign S_BCH_block_0 = {S_packet_body_parity,S_packet_body_1d};


    always @(posedge I_clk) begin
        S_fifo_wr_en <= I_audio_valid;
    end

    w64_d1024_fifo u_w64_d1024_fifo(
        .clk        ( I_clk                     ),
        .rst        ( I_rst                     ),
            
        .we         ( S_fifo_wr_en              ),
        .di         ( S_BCH_block_0             ),
        .full_flag  ( S_fifo_full               ),

        .re         ( I_audio_sample_packet_req ),
        .dout       ( S_fifo_rd_data            ),
        .empty_flag ( S_fifo_empty              ),

        .rdusedw    (     ),
        .wrusedw    (     )
    );


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_audio_frame_cnt <= 'd0;
        else
            if(I_audio_sample_packet_req && (!S_fifo_empty))
                if(S_audio_frame_cnt == 'd191)
                    S_audio_frame_cnt <= 'd0;
                else
                    S_audio_frame_cnt <= S_audio_frame_cnt + 1'b1;
            else
                S_audio_frame_cnt <= S_audio_frame_cnt;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            O_audio_sample_packet_valid <= 1'b0;
        else
            if(I_audio_sample_packet_req && (!S_fifo_empty))
                O_audio_sample_packet_valid <= 1'b1;
            else
                O_audio_sample_packet_valid <= 1'b0;
    end

    
    assign S_HB0 = 8'h02;
    assign S_HB1 = {3'b000,1'b0,4'b0001};
    assign S_HB2 = 8'h00;

    assign S_packet_header = {S_HB2,S_HB1,S_HB0};

    BCH_32_24_encode u_BCH_32_24_encode(
        .I_clk          ( I_clk                  ),
        .I_data_in      ( S_packet_header        ),
        .O_bch_ecc_out  ( S_packet_header_parity )
    );

    assign O_BCH_block_4 = {S_packet_header_parity,S_packet_header};

    assign O_BCH_block_3 = 'd0;
    assign O_BCH_block_2 = 'd0;
    assign O_BCH_block_1 = 'd0;
    assign O_BCH_block_0 = S_fifo_rd_data;

    
endmodule