
module video_tpg_rgb444_gen #(
    parameter HTOTAL  = 2200,
    parameter HACTIVE = 1920,
 
    parameter VTOTAL  = 1125,
    parameter VACTIVE = 1080
)
(
    input wire      I_clk,
    input wire      I_rst,

    input wire      I_tpg_en,
    input wire[3:0] I_tpg_mode,

    output reg      O_video_start,
    output reg      O_video_user,
    output reg      O_video_valid,
    output reg      O_video_last,
    output reg[7:0] O_video_data_r,
    output reg[7:0] O_video_data_g,
    output reg[7:0] O_video_data_b,
    input wire      I_video_ready
);


    localparam HBLANK = HTOTAL - HACTIVE;
    localparam VBLANK = VTOTAL - VACTIVE;

    localparam TPG_BLACK     = 4'b0000;
    localparam TPG_WHITE     = 4'b0001;
    localparam TPG_RED       = 4'b0010;
    localparam TPG_GREEN     = 4'b0011;
    localparam TPG_BLUE      = 4'b0100;
    localparam TPG_RED_BAR   = 4'b0101;
    localparam TPG_GREEN_BAR = 4'b0110;
    localparam TPG_BLUE_BAR  = 4'b0111;
    localparam TPG_GRAY_BAR  = 4'b1000;

    reg[13:0]  S_col_cnt;
    reg[13:0]  S_line_cnt;
    reg        S_video_valid;
    reg        S_video_user;
    reg        S_video_last;
    reg[7:0]   S_tpg_data;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_col_cnt <= 'd0;
        else
            if(S_col_cnt == HTOTAL - 'd1)
                S_col_cnt <= 'd0;
            else
                S_col_cnt <= S_col_cnt + 1'b1;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_line_cnt <= 'd0;
        else
            if(S_col_cnt == HTOTAL - 'd1)
                begin
                    if(S_line_cnt == VTOTAL - 'd1)
                        S_line_cnt <= 'd0;
                    else
                        S_line_cnt <= S_line_cnt + 1'b1; 
                end
            else
                S_line_cnt <= S_line_cnt;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            O_video_start <= 1'b0;
        else
            if(S_line_cnt == VBLANK-'d5 && S_col_cnt == HBLANK)
                O_video_start <= 1'b1;
            else
                O_video_start <= 1'b0;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_video_valid <= 1'b0;
        else
            if(S_line_cnt >= VBLANK && S_col_cnt >= HBLANK)
                S_video_valid <= 1'b1;
            else
                S_video_valid <= 1'b0;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_video_user <= 1'b0;
        else
            if(S_line_cnt == VBLANK && S_col_cnt == HBLANK)
                S_video_user <= 1'b1;
            else
                S_video_user <= 1'b0;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            S_video_last <= 1'b0;
        else
            if(S_line_cnt >= VBLANK && S_col_cnt == HTOTAL - 'd1)
                S_video_last <= 1'b1;
            else
                S_video_last <= 1'b0;
    end

    always @(posedge I_clk) begin
        if(S_video_valid)
            S_tpg_data <= S_tpg_data + 1'b1;
        else
            S_tpg_data <= 'd0;
    end


    always @(posedge I_clk) begin
        O_video_user  <= S_video_user;
        O_video_valid <= S_video_valid;
        O_video_last  <= S_video_last;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst || (~I_tpg_en))
            begin
                O_video_data_r <= 'd0;
                O_video_data_g <= 'd0;
                O_video_data_b <= 'd0;
            end
        else
            begin
                case(I_tpg_mode)
                    TPG_BLACK:    
                            begin
                                O_video_data_r <= 'd0;
                                O_video_data_g <= 'd0;
                                O_video_data_b <= 'd0;
                            end
                    TPG_WHITE:  
                            begin
                                O_video_data_r <= 8'hff;
                                O_video_data_g <= 8'hff;
                                O_video_data_b <= 8'hff;
                            end  
                    TPG_RED:     
                            begin
                                O_video_data_r <= 8'hff;
                                O_video_data_g <= 'd0;
                                O_video_data_b <= 'd0;
                            end   
                    TPG_GREEN:    
                            begin
                                O_video_data_r <= 'd0;
                                O_video_data_g <= 8'hff;
                                O_video_data_b <= 'd0;
                            end  
                    TPG_BLUE:     
                            begin
                                O_video_data_r <= 'd0;
                                O_video_data_g <= 'd0;
                                O_video_data_b <= 8'hff;
                            end 
                    TPG_RED_BAR:  
                            begin
                                O_video_data_r <= S_tpg_data;
                                O_video_data_g <= 'd0;
                                O_video_data_b <= 'd0;
                            end
                    TPG_GREEN_BAR:
                            begin
                                O_video_data_r <= 'd0;
                                O_video_data_g <= S_tpg_data;
                                O_video_data_b <= 'd0;
                            end
                    TPG_BLUE_BAR: 
                            begin
                                O_video_data_r <= 'd0;
                                O_video_data_g <= 'd0;
                                O_video_data_b <= S_tpg_data;
                            end
                    TPG_GRAY_BAR: 
                            begin
                                O_video_data_r <= S_tpg_data;
                                O_video_data_g <= S_tpg_data;
                                O_video_data_b <= S_tpg_data;
                            end
                endcase
            end
    end
    
endmodule