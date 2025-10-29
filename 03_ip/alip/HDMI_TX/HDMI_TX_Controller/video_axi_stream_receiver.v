
module video_axi_stream_receiver (
    input wire       I_clk,
    input wire       I_rst,
   
    input wire       I_video_source_sof,
    input wire       I_video_source_sol,
    output wire       O_video_source_pause,
    output reg       O_video_locked,
   
    input wire       I_video_in_user,
    input wire       I_video_in_valid,
    input wire       I_video_in_last,
    input wire[23:0] I_video_in_data,
    output wire      O_video_in_ready,
   
    input wire       I_video_data_assemble_rd_en,
    output wire[7:0] O_video_data_ch0,
    output wire[7:0] O_video_data_ch1,
    output wire[7:0] O_video_data_ch2
);

    wire       S_fifo_rst;
    wire       S_fifo_pro_full;
    wire[10:0] S_fifo_wr_num;
    wire       S_fifo_empty;
    reg        S_video_in_ready;
    wire[23:0] S_fifo_rd_data;




assign O_video_source_pause = 1'b0;
assign O_video_in_ready = I_video_data_assemble_rd_en;



    assign O_video_data_ch0 = I_video_in_data[7:0];
    assign O_video_data_ch1 = I_video_in_data[15:8];
    assign O_video_data_ch2 = I_video_in_data[23:16];

endmodule