
module hdmi_island_data_assemble (
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_vsync,
    input wire       I_hsync,
    input wire       I_video_preamble,
    input wire       I_video_guard_band,
    input wire       I_video_period,
    input wire[7:0]  I_video_data_ch0,
    input wire[7:0]  I_video_data_ch1,
    input wire[7:0]  I_video_data_ch2,
    input wire       I_island_preamble,
    input wire       I_island_guard_band,
    input wire       I_island_period,

    output wire      O_frame_start,
    output wire      O_island_packet_req,

    ///byte0 ~ byte6,parity bits  see hdmi 1.4 spec 5.2.3.4 figure 5-4
    input wire[63:0] I_BCH_block_0,  
    input wire[63:0] I_BCH_block_1,
    input wire[63:0] I_BCH_block_2,
    input wire[63:0] I_BCH_block_3,
    input wire[31:0] I_BCH_block_4,

    output reg       O_vsync,
    output reg       O_hsync,
    output reg       O_video_preamble,
    output reg       O_video_guard_band,
    output reg       O_video_period,
    output reg[7:0]  O_video_data_ch0,
    output reg[7:0]  O_video_data_ch1,
    output reg[7:0]  O_video_data_ch2,
    output reg       O_island_preamble,
    output reg       O_island_guard_band,
    output reg       O_island_period,
    output reg[3:0]  O_island_data_ch0,
    output reg[3:0]  O_island_data_ch1,
    output reg[3:0]  O_island_data_ch2
);

    localparam CLOCK_1_PIXEL = 2'b00;
    localparam CLOCK_2_PIXEL = 2'b01;
    localparam CLOCK_4_PIXEL = 2'b10;

    reg       S_vsync_1d;
    reg       S_vsync_2d;
    reg       S_vsync_3d;
    reg       S_hsync_1d;
    reg       S_hsync_2d;
    reg       S_hsync_3d;
    reg       S_video_preamble_1d;
    reg       S_video_preamble_2d;
    reg       S_video_preamble_3d;
    reg       S_video_guard_band_1d;
    reg       S_video_guard_band_2d;
    reg       S_video_guard_band_3d;
    reg       S_video_period_1d;
    reg       S_video_period_2d;
    reg       S_video_period_3d;
    reg[7:0]  S_video_data_ch0_1d;
    reg[7:0]  S_video_data_ch1_1d;
    reg[7:0]  S_video_data_ch2_1d;
    reg[7:0]  S_video_data_ch0_2d;
    reg[7:0]  S_video_data_ch1_2d;
    reg[7:0]  S_video_data_ch2_2d;
    reg[7:0]  S_video_data_ch0_3d;
    reg[7:0]  S_video_data_ch1_3d;
    reg[7:0]  S_video_data_ch2_3d;
    reg       S_island_preamble_1d;
    reg       S_island_preamble_2d;
    reg       S_island_preamble_3d;
    reg       S_island_guard_band_1d;
    reg       S_island_guard_band_2d;
    reg       S_island_guard_band_3d;
    reg       S_island_period_1d;
    reg       S_island_period_2d;
    reg       S_island_period_3d;
    reg[4:0]  S_island_packet_cnt;
    reg       S_island_packet_req_1d;
    reg       S_island_packet_req_2d;

    ///see hdmi 1.4 spec 5.2.3.4 figure 5-4
    wire[31:0] S_CH1_D0_data;
    wire[31:0] S_CH1_D1_data;
    wire[31:0] S_CH1_D2_data;
    wire[31:0] S_CH1_D3_data;

    wire[31:0] S_CH2_D0_data;
    wire[31:0] S_CH2_D1_data;
    wire[31:0] S_CH2_D2_data;
    wire[31:0] S_CH2_D3_data;

    reg[31:0] S_CH0_D2_shift;

    reg[31:0] S_CH1_D0_shift;
    reg[31:0] S_CH1_D1_shift;
    reg[31:0] S_CH1_D2_shift;
    reg[31:0] S_CH1_D3_shift;

    reg[31:0] S_CH2_D0_shift;
    reg[31:0] S_CH2_D1_shift;
    reg[31:0] S_CH2_D2_shift;
    reg[31:0] S_CH2_D3_shift;



    always @(posedge I_clk) begin
        S_vsync_1d             <= I_vsync;
        S_vsync_2d             <= S_vsync_1d;
        S_vsync_3d             <= S_vsync_2d;
                  
        S_hsync_1d             <= I_hsync;
        S_hsync_2d             <= S_hsync_1d;
        S_hsync_3d             <= S_hsync_2d;
       
        S_video_preamble_1d    <= I_video_preamble;
        S_video_preamble_2d    <= S_video_preamble_1d;
        S_video_preamble_3d    <= S_video_preamble_2d;
       
        S_video_guard_band_1d  <= I_video_guard_band;
        S_video_guard_band_2d  <= S_video_guard_band_1d;
        S_video_guard_band_3d  <= S_video_guard_band_2d;
       
        S_video_period_1d      <= I_video_period;
        S_video_period_2d      <= S_video_period_1d;
        S_video_period_3d      <= S_video_period_2d;

        S_video_data_ch0_1d    <= I_video_data_ch0;
        S_video_data_ch1_1d    <= I_video_data_ch1;
        S_video_data_ch2_1d    <= I_video_data_ch2;

        S_video_data_ch0_2d    <= S_video_data_ch0_1d;
        S_video_data_ch1_2d    <= S_video_data_ch1_1d;
        S_video_data_ch2_2d    <= S_video_data_ch2_1d;

        S_video_data_ch0_3d    <= S_video_data_ch0_2d;
        S_video_data_ch1_3d    <= S_video_data_ch1_2d;
        S_video_data_ch2_3d    <= S_video_data_ch2_2d;

        S_island_preamble_1d   <= I_island_preamble;
        S_island_preamble_2d   <= S_island_preamble_1d;
        S_island_preamble_3d   <= S_island_preamble_2d;
   
        S_island_guard_band_1d <= I_island_guard_band;
        S_island_guard_band_2d <= S_island_guard_band_1d;
        S_island_guard_band_3d <= S_island_guard_band_2d;
   
        S_island_period_1d     <= I_island_period;
        S_island_period_2d     <= S_island_period_1d;
        S_island_period_3d     <= S_island_period_2d;
    end

    assign O_frame_start = ~S_vsync_1d & S_vsync_2d;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_island_packet_cnt <= 'd0;
        else
            begin
                if(I_island_period)
                    begin
                        if(S_island_packet_cnt == 'd31)
                            S_island_packet_cnt <= 'd0;
                        else
                            S_island_packet_cnt <= S_island_packet_cnt + 1'b1;
                    end
                else
                    S_island_packet_cnt <= 'd0;
            end
    end

    assign O_island_packet_req = I_island_period && S_island_packet_cnt == 'd0 ? 1'b1 : 1'b0;

    always @(posedge I_clk) begin
        S_island_packet_req_1d <= O_island_packet_req;
        S_island_packet_req_2d <= S_island_packet_req_1d;
    end


    assign S_CH1_D0_data = {I_BCH_block_0[62],I_BCH_block_0[60],I_BCH_block_0[58],I_BCH_block_0[56],
                            I_BCH_block_0[54],I_BCH_block_0[52],I_BCH_block_0[50],I_BCH_block_0[48],
                            I_BCH_block_0[46],I_BCH_block_0[44],I_BCH_block_0[42],I_BCH_block_0[40],
                            I_BCH_block_0[38],I_BCH_block_0[36],I_BCH_block_0[34],I_BCH_block_0[32],
                            I_BCH_block_0[30],I_BCH_block_0[28],I_BCH_block_0[26],I_BCH_block_0[24],
                            I_BCH_block_0[22],I_BCH_block_0[20],I_BCH_block_0[18],I_BCH_block_0[16],
                            I_BCH_block_0[14],I_BCH_block_0[12],I_BCH_block_0[10],I_BCH_block_0[8] ,
                            I_BCH_block_0[6], I_BCH_block_0[4], I_BCH_block_0[2], I_BCH_block_0[0] };

    assign S_CH1_D1_data = {I_BCH_block_1[62],I_BCH_block_1[60],I_BCH_block_1[58],I_BCH_block_1[56],
                            I_BCH_block_1[54],I_BCH_block_1[52],I_BCH_block_1[50],I_BCH_block_1[48],
                            I_BCH_block_1[46],I_BCH_block_1[44],I_BCH_block_1[42],I_BCH_block_1[40],
                            I_BCH_block_1[38],I_BCH_block_1[36],I_BCH_block_1[34],I_BCH_block_1[32],
                            I_BCH_block_1[30],I_BCH_block_1[28],I_BCH_block_1[26],I_BCH_block_1[24],
                            I_BCH_block_1[22],I_BCH_block_1[20],I_BCH_block_1[18],I_BCH_block_1[16],
                            I_BCH_block_1[14],I_BCH_block_1[12],I_BCH_block_1[10],I_BCH_block_1[8] ,
                            I_BCH_block_1[6], I_BCH_block_1[4], I_BCH_block_1[2], I_BCH_block_1[0] };

    assign S_CH1_D2_data = {I_BCH_block_2[62],I_BCH_block_2[60],I_BCH_block_2[58],I_BCH_block_2[56],
                            I_BCH_block_2[54],I_BCH_block_2[52],I_BCH_block_2[50],I_BCH_block_2[48],
                            I_BCH_block_2[46],I_BCH_block_2[44],I_BCH_block_2[42],I_BCH_block_2[40],
                            I_BCH_block_2[38],I_BCH_block_2[36],I_BCH_block_2[34],I_BCH_block_2[32],
                            I_BCH_block_2[30],I_BCH_block_2[28],I_BCH_block_2[26],I_BCH_block_2[24],
                            I_BCH_block_2[22],I_BCH_block_2[20],I_BCH_block_2[18],I_BCH_block_2[16],
                            I_BCH_block_2[14],I_BCH_block_2[12],I_BCH_block_2[10],I_BCH_block_2[8] ,
                            I_BCH_block_2[6], I_BCH_block_2[4], I_BCH_block_2[2], I_BCH_block_2[0] };

    assign S_CH1_D3_data = {I_BCH_block_3[62],I_BCH_block_3[60],I_BCH_block_3[58],I_BCH_block_3[56],
                            I_BCH_block_3[54],I_BCH_block_3[52],I_BCH_block_3[50],I_BCH_block_3[48],
                            I_BCH_block_3[46],I_BCH_block_3[44],I_BCH_block_3[42],I_BCH_block_3[40],
                            I_BCH_block_3[38],I_BCH_block_3[36],I_BCH_block_3[34],I_BCH_block_3[32],
                            I_BCH_block_3[30],I_BCH_block_3[28],I_BCH_block_3[26],I_BCH_block_3[24],
                            I_BCH_block_3[22],I_BCH_block_3[20],I_BCH_block_3[18],I_BCH_block_3[16],
                            I_BCH_block_3[14],I_BCH_block_3[12],I_BCH_block_3[10],I_BCH_block_3[8] ,
                            I_BCH_block_3[6], I_BCH_block_3[4], I_BCH_block_3[2], I_BCH_block_3[0] };


    assign S_CH2_D0_data = {I_BCH_block_0[63],I_BCH_block_0[61],I_BCH_block_0[59],I_BCH_block_0[57],
                            I_BCH_block_0[55],I_BCH_block_0[53],I_BCH_block_0[51],I_BCH_block_0[49],
                            I_BCH_block_0[47],I_BCH_block_0[45],I_BCH_block_0[43],I_BCH_block_0[41],
                            I_BCH_block_0[39],I_BCH_block_0[37],I_BCH_block_0[35],I_BCH_block_0[33],
                            I_BCH_block_0[31],I_BCH_block_0[29],I_BCH_block_0[27],I_BCH_block_0[25],
                            I_BCH_block_0[23],I_BCH_block_0[21],I_BCH_block_0[19],I_BCH_block_0[17],
                            I_BCH_block_0[15],I_BCH_block_0[13],I_BCH_block_0[11],I_BCH_block_0[9] ,
                            I_BCH_block_0[7], I_BCH_block_0[5], I_BCH_block_0[3], I_BCH_block_0[1] };

    assign S_CH2_D1_data = {I_BCH_block_1[63],I_BCH_block_1[61],I_BCH_block_1[59],I_BCH_block_1[57],
                            I_BCH_block_1[55],I_BCH_block_1[53],I_BCH_block_1[51],I_BCH_block_1[49],
                            I_BCH_block_1[47],I_BCH_block_1[45],I_BCH_block_1[43],I_BCH_block_1[41],
                            I_BCH_block_1[39],I_BCH_block_1[37],I_BCH_block_1[35],I_BCH_block_1[33],
                            I_BCH_block_1[31],I_BCH_block_1[29],I_BCH_block_1[27],I_BCH_block_1[25],
                            I_BCH_block_1[23],I_BCH_block_1[21],I_BCH_block_1[19],I_BCH_block_1[17],
                            I_BCH_block_1[15],I_BCH_block_1[13],I_BCH_block_1[11],I_BCH_block_1[9] ,
                            I_BCH_block_1[7], I_BCH_block_1[5], I_BCH_block_1[3], I_BCH_block_1[1] };

    assign S_CH2_D2_data = {I_BCH_block_2[63],I_BCH_block_2[61],I_BCH_block_2[59],I_BCH_block_2[57],
                            I_BCH_block_2[55],I_BCH_block_2[53],I_BCH_block_2[51],I_BCH_block_2[49],
                            I_BCH_block_2[47],I_BCH_block_2[45],I_BCH_block_2[43],I_BCH_block_2[41],
                            I_BCH_block_2[39],I_BCH_block_2[37],I_BCH_block_2[35],I_BCH_block_2[33],
                            I_BCH_block_2[31],I_BCH_block_2[29],I_BCH_block_2[27],I_BCH_block_2[25],
                            I_BCH_block_2[23],I_BCH_block_2[21],I_BCH_block_2[19],I_BCH_block_2[17],
                            I_BCH_block_2[15],I_BCH_block_2[13],I_BCH_block_2[11],I_BCH_block_2[9] ,
                            I_BCH_block_2[7], I_BCH_block_2[5], I_BCH_block_2[3], I_BCH_block_2[1] };

    assign S_CH2_D3_data = {I_BCH_block_3[63],I_BCH_block_3[61],I_BCH_block_3[59],I_BCH_block_3[57],
                            I_BCH_block_3[55],I_BCH_block_3[53],I_BCH_block_3[51],I_BCH_block_3[49],
                            I_BCH_block_3[47],I_BCH_block_3[45],I_BCH_block_3[43],I_BCH_block_3[41],
                            I_BCH_block_3[39],I_BCH_block_3[37],I_BCH_block_3[35],I_BCH_block_3[33],
                            I_BCH_block_3[31],I_BCH_block_3[29],I_BCH_block_3[27],I_BCH_block_3[25],
                            I_BCH_block_3[23],I_BCH_block_3[21],I_BCH_block_3[19],I_BCH_block_3[17],
                            I_BCH_block_3[15],I_BCH_block_3[13],I_BCH_block_3[11],I_BCH_block_3[9] ,
                            I_BCH_block_3[7], I_BCH_block_3[5], I_BCH_block_3[3], I_BCH_block_3[1] };

    

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                S_CH0_D2_shift <= 'd0;
                S_CH1_D0_shift <= 'd0;
                S_CH1_D1_shift <= 'd0;
                S_CH1_D2_shift <= 'd0;
                S_CH1_D3_shift <= 'd0;
                S_CH2_D0_shift <= 'd0;
                S_CH2_D1_shift <= 'd0;
                S_CH2_D2_shift <= 'd0;
                S_CH2_D3_shift <= 'd0;
            end
        else
            if(S_island_packet_req_2d)
                begin
                    S_CH0_D2_shift <= I_BCH_block_4;

                    S_CH1_D0_shift <= S_CH1_D0_data;
                    S_CH1_D1_shift <= S_CH1_D1_data;
                    S_CH1_D2_shift <= S_CH1_D2_data;
                    S_CH1_D3_shift <= S_CH1_D3_data;

                    S_CH2_D0_shift <= S_CH2_D0_data;
                    S_CH2_D1_shift <= S_CH2_D1_data;
                    S_CH2_D2_shift <= S_CH2_D2_data;
                    S_CH2_D3_shift <= S_CH2_D3_data;
                end
            else
                begin
                    S_CH0_D2_shift <= S_CH0_D2_shift >> 1;

                    S_CH1_D0_shift <= S_CH1_D0_shift >> 1;
                    S_CH1_D1_shift <= S_CH1_D1_shift >> 1;
                    S_CH1_D2_shift <= S_CH1_D2_shift >> 1;
                    S_CH1_D3_shift <= S_CH1_D3_shift >> 1;

                    S_CH2_D0_shift <= S_CH2_D0_shift >> 1;
                    S_CH2_D1_shift <= S_CH2_D1_shift >> 1;
                    S_CH2_D2_shift <= S_CH2_D2_shift >> 1;
                    S_CH2_D3_shift <= S_CH2_D3_shift >> 1;
                end
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                O_island_data_ch0 <= 'd0;
                O_island_data_ch1 <= 'd0;
                O_island_data_ch2 <= 'd0;

            end
        else
            begin
                O_island_data_ch0 <= { 1'b0,
                                       S_CH0_D2_shift[0],
                                       S_vsync_3d,
                                       S_hsync_3d};

                O_island_data_ch1 <= { S_CH1_D3_shift[0], 
                                       S_CH1_D2_shift[0],
                                       S_CH1_D1_shift[0],
                                       S_CH1_D0_shift[0]};
    
                O_island_data_ch2 <= { S_CH2_D3_shift[0], 
                                       S_CH2_D2_shift[0],
                                       S_CH2_D1_shift[0],
                                       S_CH2_D0_shift[0]};
            end
    end

    
    always @(posedge I_clk) begin
        O_vsync             <= S_vsync_3d;
        O_hsync             <= S_hsync_3d;
        O_video_preamble    <= S_video_preamble_3d;    
        O_video_guard_band  <= S_video_guard_band_3d;   
        O_video_period      <= S_video_period_3d;       
        O_island_preamble   <= S_island_preamble_3d;    
        O_island_guard_band <= S_island_guard_band_3d;  
        O_island_period     <= S_island_period_3d;      
        O_video_data_ch0    <= S_video_data_ch0_3d;
        O_video_data_ch1    <= S_video_data_ch1_3d;
        O_video_data_ch2    <= S_video_data_ch2_3d;
    end


endmodule