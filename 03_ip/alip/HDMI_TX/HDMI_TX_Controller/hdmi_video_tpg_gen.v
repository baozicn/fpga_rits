

module hdmi_video_tpg_gen #(
    parameter HTOTAL  = 2200,
    parameter HACTIVE = 1920,
    parameter VTOTAL  = 1125,
    parameter VACTIVE = 1080
)    
(
    input wire         I_clk,
    input wire         I_rst,

    input wire         I_tpg_en,

    output reg         O_video_user,   
    output reg         O_video_valid,  
    output reg         O_video_last,   
    output reg[23:0]   O_video_data,   
    input wire         I_video_ready   
);

    reg[7:0]  S_freme_cnt;
    reg[3:0]  S_tpg_mode;
    wire      S_video_start;  
    wire      S_video_user;   
    wire      S_video_valid;  
    wire      S_video_last;   
    wire[7:0] S_video_data_r;
    wire[7:0] S_video_data_g;
    wire[7:0] S_video_data_b;



    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_freme_cnt <= 'd0;
        else
            if(S_video_start)
                if(S_freme_cnt == 'd119)
                    S_freme_cnt <= 'd0;
                else
                    S_freme_cnt <= S_freme_cnt + 1'b1;
            else
                S_freme_cnt <= S_freme_cnt;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_tpg_mode <= 'd0;
        else
            if(S_video_start && S_freme_cnt == 'd119)
                if(S_tpg_mode == 'd8)
                    S_tpg_mode <= 'd0;
                else
                    S_tpg_mode <= S_tpg_mode + 1'b1;
            else
                S_tpg_mode <= S_tpg_mode;
    end


    always @(posedge I_clk) begin
        O_video_user  <= S_video_user;
        O_video_valid <= S_video_valid;
        O_video_last  <= S_video_last;
        O_video_data  <= {S_video_data_r,S_video_data_g,S_video_data_b};
    end


    video_tpg_rgb444_gen #(
        .HTOTAL  ( HTOTAL  ),
        .HACTIVE ( HACTIVE ),

        .VTOTAL  ( VTOTAL  ),
        .VACTIVE ( VACTIVE )
    )u_video_tpg_rgb444_gen(
        .I_clk           ( I_clk           ),
        .I_rst           ( I_rst           ),

        .I_tpg_en        ( I_tpg_en        ),

        .I_tpg_mode      ( S_tpg_mode      ),

        .O_video_start   ( S_video_start   ),
        .O_video_user    ( S_video_user    ),
        .O_video_valid   ( S_video_valid   ),
        .O_video_last    ( S_video_last    ),
        .O_video_data_r  ( S_video_data_r  ),
        .O_video_data_g  ( S_video_data_g  ),
        .O_video_data_b  ( S_video_data_b  ),
        .I_video_ready   ( I_video_ready   )
    );

    
endmodule