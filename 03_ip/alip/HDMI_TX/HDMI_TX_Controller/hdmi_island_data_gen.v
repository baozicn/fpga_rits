

module hdmi_island_data_gen #(
    parameter VIDEO_FORMAT      = "RGB444",
    parameter VIDEO_VIC         = 16,
    parameter AUDIO_CTS         = 148500,
    parameter AUDIO_N           = 6144,
    parameter AUDIO_SAMPLE_RATE = "48K",
    parameter AUDIO_CHANNEL_NUM = "AUDIO_2_CHANNEL"
)    
(
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_audio_valid,     
    input wire[23:0] I_audio_left_data, 
    input wire[23:0] I_audio_right_data,

    input wire       I_frame_start,
    input wire       I_island_packet_req,

    output reg[31:0] O_BCH_block_4,
    output reg[63:0] O_BCH_block_3,
    output reg[63:0] O_BCH_block_2,
    output reg[63:0] O_BCH_block_1,
    output reg[63:0] O_BCH_block_0
);

    localparam video_format        = VIDEO_FORMAT == "RGB444" ? 2'b00 :
                                     VIDEO_FORMAT == "YUV444" ? 2'b10 : 2'b00;
       
    localparam colorimetry         = VIDEO_FORMAT == "RGB444" ? 2'b00 :
                                     VIDEO_FORMAT == "YUV444" ? 2'b10 : 2'b00;
  
    localparam audio_sample_rate   = AUDIO_SAMPLE_RATE == "32K"    ? 3'b001 :
                                     AUDIO_SAMPLE_RATE == "44.1K"  ? 3'b010 :
                                     AUDIO_SAMPLE_RATE == "48K"    ? 3'b011 :
                                     AUDIO_SAMPLE_RATE == "88.2K"  ? 3'b100 :
                                     AUDIO_SAMPLE_RATE == "96K"    ? 3'b101 :
                                     AUDIO_SAMPLE_RATE == "176.4K" ? 3'b110 :
                                     AUDIO_SAMPLE_RATE == "192K"   ? 3'b111 : 3'b000;

    localparam audio_channel_count = AUDIO_CHANNEL_NUM == "AUDIO_2_CHANNEL" ? 3'b001 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_3_CHANNEL" ? 3'b010 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_4_CHANNEL" ? 3'b011 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_5_CHANNEL" ? 3'b100 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_6_CHANNEL" ? 3'b101 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_7_CHANNEL" ? 3'b110 : 
                                     AUDIO_CHANNEL_NUM == "AUDIO_8_CHANNEL" ? 3'b111 : 3'b000;

    reg[3:0]   S_packet_cnt;
    reg        S_island_packet_req_1d;

    wire[31:0] S_audio_clock_regeneration_packet_BCH_block_4;
    wire[63:0] S_audio_clock_regeneration_packet_BCH_block_3;
    wire[63:0] S_audio_clock_regeneration_packet_BCH_block_2;
    wire[63:0] S_audio_clock_regeneration_packet_BCH_block_1;
    wire[63:0] S_audio_clock_regeneration_packet_BCH_block_0;

    wire[31:0] S_audio_info_frame_packet_BCH_block_4;
    wire[63:0] S_audio_info_frame_packet_BCH_block_3;
    wire[63:0] S_audio_info_frame_packet_BCH_block_2;
    wire[63:0] S_audio_info_frame_packet_BCH_block_1;
    wire[63:0] S_audio_info_frame_packet_BCH_block_0;

    wire[31:0] S_avi_info_frame_packet_BCH_block_4;
    wire[63:0] S_avi_info_frame_packet_BCH_block_3;
    wire[63:0] S_avi_info_frame_packet_BCH_block_2;
    wire[63:0] S_avi_info_frame_packet_BCH_block_1;
    wire[63:0] S_avi_info_frame_packet_BCH_block_0;

    wire[31:0] S_general_control_packet_BCH_block_4;
    wire[63:0] S_general_control_packet_BCH_block_3;
    wire[63:0] S_general_control_packet_BCH_block_2;
    wire[63:0] S_general_control_packet_BCH_block_1;
    wire[63:0] S_general_control_packet_BCH_block_0;

    wire[31:0] S_audio_sample_packet_BCH_block_4;
    wire[63:0] S_audio_sample_packet_BCH_block_3;
    wire[63:0] S_audio_sample_packet_BCH_block_2;
    wire[63:0] S_audio_sample_packet_BCH_block_1;
    wire[63:0] S_audio_sample_packet_BCH_block_0;

    wire       S_audio_sample_packet_valid;
    wire       S_audio_sample_packet_req;

    audio_clock_regeneration_packet u_audio_clock_regeneration_packet(
        .I_clk         ( I_clk                                         ),
        .I_rst         ( I_rst                                         ),
                                   
        .I_audio_CTS   ( AUDIO_CTS                                     ),
        .I_audio_N     ( AUDIO_N                                       ),

        .O_BCH_block_4 ( S_audio_clock_regeneration_packet_BCH_block_4 ),
        .O_BCH_block_3 ( S_audio_clock_regeneration_packet_BCH_block_3 ),
        .O_BCH_block_2 ( S_audio_clock_regeneration_packet_BCH_block_2 ),
        .O_BCH_block_1 ( S_audio_clock_regeneration_packet_BCH_block_1 ),
        .O_BCH_block_0 ( S_audio_clock_regeneration_packet_BCH_block_0 )
    );


    audio_info_frame_packet u_audio_info_frame_packet(
        .I_clk                    ( I_clk                                 ),
        .I_rst                    ( I_rst                                 ),

        .I_audio_sample_frequency ( audio_sample_rate                     ),
        .I_audio_channel_count    ( audio_channel_count                   ),

        .O_BCH_block_4            ( S_audio_info_frame_packet_BCH_block_4 ),
        .O_BCH_block_3            ( S_audio_info_frame_packet_BCH_block_3 ),
        .O_BCH_block_2            ( S_audio_info_frame_packet_BCH_block_2 ),
        .O_BCH_block_1            ( S_audio_info_frame_packet_BCH_block_1 ),
        .O_BCH_block_0            ( S_audio_info_frame_packet_BCH_block_0 )
    );



    avi_info_frame_packet u_avi_info_frame_packet(
        .I_clk          ( I_clk                                ),
        .I_rst          ( I_rst                                ),
                      
        .I_video_format ( video_format                         ),
        .I_colorimetry  ( colorimetry                          ),
        .I_video_VIC    ( VIDEO_VIC                            ),

        .O_BCH_block_4  ( S_avi_info_frame_packet_BCH_block_4  ),
        .O_BCH_block_3  ( S_avi_info_frame_packet_BCH_block_3  ),
        .O_BCH_block_2  ( S_avi_info_frame_packet_BCH_block_2  ),
        .O_BCH_block_1  ( S_avi_info_frame_packet_BCH_block_1  ),
        .O_BCH_block_0  ( S_avi_info_frame_packet_BCH_block_0  )
    );


    general_control_packet u_general_control_packet(
        .I_clk                ( I_clk                                ),
        .I_rst                ( I_rst                                ),
                
        .I_color_depth        ( 4'b0100                              ),
        .I_pixel_packet_phase ( 4'b0000                              ),
        .I_audio_video_valid  ( 1'b1                                 ),

        .O_BCH_block_4        ( S_general_control_packet_BCH_block_4 ),
        .O_BCH_block_3        ( S_general_control_packet_BCH_block_3 ),
        .O_BCH_block_2        ( S_general_control_packet_BCH_block_2 ),
        .O_BCH_block_1        ( S_general_control_packet_BCH_block_1 ),
        .O_BCH_block_0        ( S_general_control_packet_BCH_block_0 )
    );



    audio_sample_packet_2_channel U_audio_sample_packet_2_channel(
        .I_clk                       ( I_clk                             ),
        .I_rst                       ( I_rst                             ),
      
        .I_audio_valid               ( I_audio_valid                     ),
        .I_audio_left_data           ( I_audio_left_data                 ),
        .I_audio_right_data          ( I_audio_right_data                ),
      
        .I_audio_sample_packet_req   ( S_audio_sample_packet_req         ),
        .O_audio_sample_packet_valid ( S_audio_sample_packet_valid       ),

        .O_BCH_block_4               ( S_audio_sample_packet_BCH_block_4 ),
        .O_BCH_block_3               ( S_audio_sample_packet_BCH_block_3 ),
        .O_BCH_block_2               ( S_audio_sample_packet_BCH_block_2 ),
        .O_BCH_block_1               ( S_audio_sample_packet_BCH_block_1 ),
        .O_BCH_block_0               ( S_audio_sample_packet_BCH_block_0 )
    );


    assign S_audio_sample_packet_req = S_packet_cnt == 'd4 ? I_island_packet_req : 1'b0;



    always @(posedge I_clk) begin
        S_island_packet_req_1d <= I_island_packet_req;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_packet_cnt <= 'd0;
        else
            if(I_frame_start)
                S_packet_cnt <= 'd0;
            else if(S_island_packet_req_1d)
                begin
                    if(S_packet_cnt == 'd4)
                        S_packet_cnt <= S_packet_cnt;
                    else
                        S_packet_cnt <= S_packet_cnt + 1'b1;
                end
            else
                S_packet_cnt <= S_packet_cnt;
    end


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
            if(S_island_packet_req_1d)
                begin
                    case(S_packet_cnt)
                        'd0 : 
                                begin
                                    O_BCH_block_4 <= S_audio_clock_regeneration_packet_BCH_block_4;
                                    O_BCH_block_3 <= S_audio_clock_regeneration_packet_BCH_block_3;
                                    O_BCH_block_2 <= S_audio_clock_regeneration_packet_BCH_block_2;
                                    O_BCH_block_1 <= S_audio_clock_regeneration_packet_BCH_block_1;
                                    O_BCH_block_0 <= S_audio_clock_regeneration_packet_BCH_block_0;
                                end
                        'd1 :
                                begin
                                    O_BCH_block_4 <= S_audio_info_frame_packet_BCH_block_4;
                                    O_BCH_block_3 <= S_audio_info_frame_packet_BCH_block_3;
                                    O_BCH_block_2 <= S_audio_info_frame_packet_BCH_block_2;
                                    O_BCH_block_1 <= S_audio_info_frame_packet_BCH_block_1;
                                    O_BCH_block_0 <= S_audio_info_frame_packet_BCH_block_0;
                                end
                        'd2 :
                                begin
                                    O_BCH_block_4 <= S_avi_info_frame_packet_BCH_block_4;
                                    O_BCH_block_3 <= S_avi_info_frame_packet_BCH_block_3;
                                    O_BCH_block_2 <= S_avi_info_frame_packet_BCH_block_2;
                                    O_BCH_block_1 <= S_avi_info_frame_packet_BCH_block_1;
                                    O_BCH_block_0 <= S_avi_info_frame_packet_BCH_block_0;
                                end
                        'd3 :
                                begin
                                    O_BCH_block_4 <= S_general_control_packet_BCH_block_4;
                                    O_BCH_block_3 <= S_general_control_packet_BCH_block_3;
                                    O_BCH_block_2 <= S_general_control_packet_BCH_block_2;
                                    O_BCH_block_1 <= S_general_control_packet_BCH_block_1;
                                    O_BCH_block_0 <= S_general_control_packet_BCH_block_0;
                                end
                        'd4:
                                begin
                                    if(S_audio_sample_packet_valid)
                                        begin
                                            O_BCH_block_4 <= S_audio_sample_packet_BCH_block_4;
                                            O_BCH_block_3 <= S_audio_sample_packet_BCH_block_3;
                                            O_BCH_block_2 <= S_audio_sample_packet_BCH_block_2;
                                            O_BCH_block_1 <= S_audio_sample_packet_BCH_block_1;
                                            O_BCH_block_0 <= S_audio_sample_packet_BCH_block_0;
                                        end
                                    else    
                                        begin
                                            O_BCH_block_4 <= 'd0;
                                            O_BCH_block_3 <= 'd0;
                                            O_BCH_block_2 <= 'd0;
                                            O_BCH_block_1 <= 'd0;
                                            O_BCH_block_0 <= 'd0;
                                        end
                                end
                        default:
                                begin
                                    O_BCH_block_4 <= 'd0;
                                    O_BCH_block_3 <= 'd0;
                                    O_BCH_block_2 <= 'd0;
                                    O_BCH_block_1 <= 'd0;
                                    O_BCH_block_0 <= 'd0;
                                end
                    endcase
                end
            else
                begin
                    O_BCH_block_4 <= O_BCH_block_4;
                    O_BCH_block_3 <= O_BCH_block_3;
                    O_BCH_block_2 <= O_BCH_block_2;
                    O_BCH_block_1 <= O_BCH_block_1;
                    O_BCH_block_0 <= O_BCH_block_0;
                end

    end



    
endmodule