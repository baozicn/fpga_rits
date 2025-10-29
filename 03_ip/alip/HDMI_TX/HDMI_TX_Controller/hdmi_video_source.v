
module hdmi_video_source 
#(
    parameter HTOTAL  = 2200,
    parameter HSA     = 44  ,
    parameter HFP     = 88  ,
    parameter HBP     = 148 ,
    parameter HACTIVE = 1920,
 
    parameter VTOTAL  = 1125,
    parameter VSA     = 5   ,
    parameter VFP     = 4   , 
    parameter VBP     = 36  ,
    parameter VACTIVE = 1080
)
(
    input wire           I_clk,
    input wire           I_rst,

    input wire           I_video_en,
    input wire           I_video_source_pause,
       
    output reg           O_vsync,
    output reg           O_hsync,
    output reg           O_video_preamble,
    output reg           O_video_guard_band,
    output reg           O_video_period,
    output reg           O_video_sof,
    output reg           O_video_sol,
    output reg           O_island_preamble,
    output reg           O_island_guard_band,
    output reg           O_island_period
);


    localparam island_max_packet_num = (HTOTAL - HACTIVE - 8  /*island preamble*/
                                                        - 2  /*island guard band start*/
                                                        - 2  /*island guard band end*/
                                                        - 12 /*at least 12 pixel control period*/
                                                        - 8  /*video preamble*/
                                                        - 2  /*video guard band*/
                                                           ) >> 5;  
    
    /*
        hdmi协议规定每行消隐期间最大18个island包
    */
    localparam island_packet_num = island_max_packet_num > 18 ? 18 : island_max_packet_num;


    localparam  video_htotal_length      = HTOTAL;
    localparam  video_active_length      = HACTIVE;
    localparam  video_hfp_length         = HTOTAL - HACTIVE - 16 - HSA;
    localparam  video_hsa_length         = HSA;
    localparam  video_hbp_length         = 16;
    localparam  video_preamble_length    = 8;
    localparam  video_guard_band_length  = 2;
    localparam  island_preamble_length   = 8;
    localparam  island_guard_band_length = 2;
    localparam  island_period_length     = island_packet_num << 5;
    localparam  video_vtotal_length      = VTOTAL;
    localparam  video_vactive_length     = VACTIVE;
    localparam  video_vfb_length         = VFP;
    localparam  video_vsa_length         = VSA;
    localparam  video_vbp_length         = VBP;

    wire[13:0] S_vblank;
    wire[13:0] S_hblank;
    reg[13:0]  S_col_cnt;
    reg[13:0]  S_line_cnt;
    wire       S_v_en;


    assign S_vblank = video_vfb_length + video_vsa_length + video_vbp_length;
    assign S_hblank = video_hfp_length + video_hsa_length + video_hbp_length;

///行列计数器

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            S_col_cnt <= 'd0;
        else
            if(!I_video_source_pause)
                begin 
                    if(S_col_cnt == video_htotal_length-1)
                        S_col_cnt <= 'd0;
                    else
                        S_col_cnt <= S_col_cnt + 1'b1;
                end
            else
                S_col_cnt <= S_col_cnt;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            S_line_cnt <= 'd0;
        else
            if(S_col_cnt == video_htotal_length-1)
                begin
                    if(S_line_cnt == video_vtotal_length-1)
                        S_line_cnt <= 'd0;
                    else
                        S_line_cnt <= S_line_cnt + 1'b1;
                end
            else
                S_line_cnt <= S_line_cnt;
    end


    assign S_v_en = S_line_cnt >= S_vblank ? 1'b1 : 1'b0;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_video_sof <= 1'b0;
        else
            if(S_line_cnt == S_vblank && S_col_cnt == S_hblank - 'd10)
                O_video_sof <= 1'b1;
            else
                O_video_sof <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_video_sol <= 1'b0;
        else
            if(S_col_cnt == S_hblank && S_v_en)
                O_video_sol <= 1'b1;
            else
                O_video_sol <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_vsync <= 1'b1;
        else
            if(S_line_cnt >= video_vfb_length && S_line_cnt < video_vfb_length + video_vsa_length)
                O_vsync <= 1'b0;
            else
                O_vsync <= 1'b1;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_hsync <= 1'b1;
        else
            if(S_col_cnt >= video_hfp_length && S_col_cnt <= video_hfp_length + video_hsa_length)
                O_hsync <= 1'b0;
            else
                O_hsync <= 1'b1;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_video_period <= 1'b0;
        else
            if(S_col_cnt >= S_hblank && S_v_en)
                O_video_period <= 1'b1;
            else
                O_video_period <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_video_guard_band <= 1'b0;
        else
            if(S_col_cnt >= S_hblank - video_guard_band_length && S_col_cnt < S_hblank && S_v_en)
                O_video_guard_band <= 1'b1;
            else
                O_video_guard_band <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_video_preamble <= 1'b0;
        else
            if(S_col_cnt >= S_hblank - video_preamble_length - video_guard_band_length && S_col_cnt < S_hblank - video_guard_band_length && S_v_en)
                O_video_preamble <= 1'b1;
            else
                O_video_preamble <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_island_preamble <= 1'b0;
        else
            if(S_col_cnt < island_preamble_length)
                O_island_preamble <= 1'b1;
            else
                O_island_preamble <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_island_guard_band <= 1'b0;
        else
            if(S_col_cnt == 8 || S_col_cnt == 9 || S_col_cnt == 10 + island_period_length || S_col_cnt == 11 + island_period_length)
                O_island_guard_band <= 1'b1; 
            else
                O_island_guard_band <= 1'b0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || !I_video_en)
            O_island_period <= 1'b0;
        else
            if(S_col_cnt > 9 && S_col_cnt <= island_period_length + 9)
                O_island_period <= 1'b1;
            else
                O_island_period <= 1'b0;
    end
    

endmodule
