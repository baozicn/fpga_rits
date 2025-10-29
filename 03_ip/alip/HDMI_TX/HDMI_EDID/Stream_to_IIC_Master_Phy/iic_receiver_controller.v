

module iic_receiver_controller (
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_rx_clk_data_trig,
    input wire       I_rx_clk_ack_trig,
    input wire       I_tx_end,
    input wire       I_iic_sda,

    output reg       O_rx_valid,
    output reg[8:0]  O_rx_data,
    output reg       O_rx_last
);

    reg        S_rx_clk_ack_trig_1d;
    reg        S_rx_clk_ack_trig_2d;
    reg        S_tx_end_1d;
    reg[15:0]  S_rx_data_cnt;
    reg[15:0]  S_rx_data_length;
    reg[8:0]   S_rx_shift_data;
    reg        S_fifo_wr_en;
    reg[8:0]   S_fifo_wr_data;
    reg        S_fifo_rd_en;
    wire[8:0]  S_fifo_rd_data;
    reg[15:0]  S_rd_data_cnt;
    wire       S_rx_last;
    reg        S_rx_last_1d;
    reg        S_fifo_rd_en_1d;
    reg[8:0]   S_fifo_rd_data_1d;


    always @(posedge I_clk) begin
        S_rx_clk_ack_trig_1d <= I_rx_clk_ack_trig;
        S_rx_clk_ack_trig_2d <= S_rx_clk_ack_trig_1d;
        S_tx_end_1d          <= I_tx_end;
        S_rx_last_1d         <= S_rx_last;
        S_fifo_rd_en_1d      <= S_fifo_rd_en;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_rx_shift_data <= 'd0;
        else
            if(I_rx_clk_data_trig || I_rx_clk_ack_trig)
                S_rx_shift_data <= {S_rx_shift_data[7:0],I_iic_sda};
            else if(S_rx_clk_ack_trig_2d)
                S_rx_shift_data <= 'd0;
            else
                S_rx_shift_data <= S_rx_shift_data;
    end

    always @(posedge I_clk) begin
        if(S_rx_clk_ack_trig_1d)
            begin
                S_fifo_wr_en   <= 1'b1;
                S_fifo_wr_data <= S_rx_shift_data;
            end
        else
            begin
                S_fifo_wr_en   <= 1'b0;
                S_fifo_wr_data <= 'd0;
            end
    end


    w9_d1024_fifo u_w9_d1024_fifo(
        .clk        ( I_clk          ),
        .rst        ( I_rst          ),

        .we         ( S_fifo_wr_en   ),
        .di         ( S_fifo_wr_data ),
		.wrusedw	(  ),
        .full_flag  (  ),


        .re         ( S_fifo_rd_en   ),
        .dout       ( S_fifo_rd_data ),
		.rdusedw	(  ),
        .empty_flag (  )
        
    );

    // w9_d1024_fifo U_w9_d1024_fifo(
    //     .clk     ( I_clk          ),
    //     .rst     ( I_rst          ),

    //     .wr_en   ( S_fifo_wr_en   ),
    //     .wr_data ( S_fifo_wr_data ),
    //     .full    ( ),

    //     .rd_en   ( S_fifo_rd_en   ),
    //     .rd_data ( S_fifo_rd_data ),
    //     .empty   ( )
    // );



    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_rx_data_cnt <= 'd0;
        else
            if(S_fifo_wr_en)
                S_rx_data_cnt <= S_rx_data_cnt + 1'b1;
            else if(I_tx_end)
                S_rx_data_cnt <= 'd0;
            else
                S_rx_data_cnt <= S_rx_data_cnt;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_rx_data_length <= 'd0;
        else
            if(I_tx_end)
                S_rx_data_length <= S_rx_data_cnt;
            else
                S_rx_data_length <= S_rx_data_length;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_fifo_rd_en <= 1'b0;
        else
            if(S_tx_end_1d)
                S_fifo_rd_en <= 1'b1;
            else if(S_rx_last)
                S_fifo_rd_en <= 1'b0;
            else
                S_fifo_rd_en <= S_fifo_rd_en;
    end


    always @(posedge I_clk) begin
        if(S_fifo_rd_en)
            S_rd_data_cnt <= S_rd_data_cnt + 1'b1;
        else
            S_rd_data_cnt <= 'd0;
    end

    assign S_rx_last = S_fifo_rd_en && S_rd_data_cnt == S_rx_data_length - 1 ? 1'b1 : 1'b0;

    always @(posedge I_clk) begin
        O_rx_valid <= S_fifo_rd_en_1d;
        O_rx_last  <= S_rx_last_1d;
        O_rx_data  <= {S_fifo_rd_data[0],S_fifo_rd_data[8:1]};
    end
    
endmodule