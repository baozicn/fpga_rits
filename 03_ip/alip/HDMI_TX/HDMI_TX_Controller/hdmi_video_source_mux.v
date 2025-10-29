

module hdmi_video_source_mux (
    input wire         I_clk,
    input wire         I_rst,

    input wire         I_tpg_en,
 
    input wire         I_video_in_user,
    input wire         I_video_in_valid,
    input wire         I_video_in_last,
    input wire[23:0]   I_video_in_data,
    output wire        O_video_in_ready,
 
    input wire         I_tpg_video_user,
    input wire         I_tpg_video_valid,
    input wire         I_tpg_video_last,
    input wire[23:0]   I_tpg_video_data,
    output wire        O_tpg_video_ready,

    output wire        O_video_out_user,
    output wire        O_video_out_valid,
    output wire        O_video_out_last,
    output wire[23:0]  O_video_out_data,
    input wire         I_video_out_ready
);


    assign O_video_out_user  = I_tpg_en ? I_tpg_video_user  : I_video_in_user;
    assign O_video_out_valid = I_tpg_en ? I_tpg_video_valid : I_video_in_valid;
    assign O_video_out_last  = I_tpg_en ? I_tpg_video_last  : I_video_in_last;
    assign O_video_out_data  = I_tpg_en ? I_tpg_video_data  : I_video_in_data;

    assign O_video_in_ready  = I_video_out_ready;
    assign O_tpg_video_ready = I_video_out_ready;
    
endmodule