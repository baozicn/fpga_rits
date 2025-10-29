

module iic_transmitter_controller (
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_tx_valid,
    input wire[10:0] I_tx_data,   /*bit[10]  : start bit    
                                    bit[9]   : stop bit    
                                    bit[8]   : ack bit
                                    bit[7:0] : data[7:0]
                                  */
    input wire       I_tx_last,
    output reg       O_tx_ready,

    output reg       O_tx_end,

    output reg       O_bit_tx_valid,
    output reg[2:0]  O_bit_tx_data_type, /* 3'd1 : start bit
                                            3'd2 : data 1
                                            3'd3 : data 0
                                            3'd4 : ack bit 1
                                            3'd5 : ack bit 0
                                            3'd6 : stop bit
                                         */
    input wire       I_bit_tx_ready
);


    localparam  IDLE           = 4'd0,
                READ_DATA      = 4'd1,
                SEND_START_BIT = 4'd2,
                SEND_BIT_7     = 4'd3,
                SEND_BIT_6     = 4'd4,
                SEND_BIT_5     = 4'd5,
                SEND_BIT_4     = 4'd6,
                SEND_BIT_3     = 4'd7,
                SEND_BIT_2     = 4'd8,
                SEND_BIT_1     = 4'd9,
                SEND_BIT_0     = 4'd10,
                SEND_ACK_BIT   = 4'd11,
                SEND_STOP_BIT  = 4'd12,
                END            = 4'd13;


    reg[3:0]   S_current_state;
    reg[3:0]   S_next_state;
    reg[15:0]  S_wr_cnt;
    reg[15:0]  S_wr_data_length;
    wire       S_fifo_rd_en;
    wire[10:0] S_fifo_rd_data;
    wire       S_start_bit;
    wire       S_stop_bit;
    wire       S_ack_bit;
    reg        S_bit_tx_ready_1d;
    wire       S_bit_tx_ready_p_edge;
    reg[15:0]  S_rd_cnt;
    reg        S_tx_end;    
    wire       S_start_bit_send_trig;
    wire       S_bit_7_send_trig;
    wire       S_bit_6_send_trig;
    wire       S_bit_5_send_trig;
    wire       S_bit_4_send_trig;
    wire       S_bit_3_send_trig;
    wire       S_bit_2_send_trig;
    wire       S_bit_1_send_trig;
    wire       S_bit_0_send_trig;
    wire       S_ack_bit_send_trig;
    wire       S_stop_bit_send_trig;




    ///对写入的数据进行计数，确定数据长度
    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_wr_cnt <= 'd0;
        else
            if(I_tx_last)
                S_wr_cnt <= 'd0;
            else if(I_tx_valid)
                S_wr_cnt <= S_wr_cnt + 1'b1;
            else
                S_wr_cnt <= S_wr_cnt;
    end


    ///在last来的时候把数据长度锁存
    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)   
            S_wr_data_length <= 'd0;
        else
            if(I_tx_last)
                S_wr_data_length <= S_wr_cnt + 1'b1;
            else
                S_wr_data_length <= S_wr_data_length;
    end

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            O_tx_ready <= 1'b1;
        else
            if(I_tx_last)
                O_tx_ready <= 1'b0;
            else if(S_tx_end)
                O_tx_ready <= 1'b1;
            else
                O_tx_ready <= O_tx_ready;
    end


    always @(posedge I_clk) begin
        O_tx_end <= S_tx_end;
    end

    w11_d1024_fifo u_w11_d1024_fifo(
        .clk        ( I_clk          ),
        .rst        ( I_rst          ),

        .we         ( I_tx_valid     ),
        .di         ( I_tx_data      ),
		.wrusedw	(  ),
        .full_flag  (  ),

        .re         ( S_fifo_rd_en   ),
        .dout       ( S_fifo_rd_data ),
		.rdusedw	(  ),
        .empty_flag (  )
    );

    // w10_d1024_fifo U_w10_d1024_fifo(
    //     .clk     ( I_clk          ),
    //     .rst     ( I_rst          ),

    //     .wr_en   ( I_tx_valid     ),
    //     .wr_data ( I_tx_data      ),
    //     .full    ( ),

    //     .rd_en   ( S_fifo_rd_en   ),
    //     .rd_data ( S_fifo_rd_data ),
    //     .empty   ( )
    // );


    assign S_start_bit = S_fifo_rd_data[10];
    assign S_stop_bit  = S_fifo_rd_data[9];
    assign S_ack_bit   = S_fifo_rd_data[8];

    always @(posedge I_clk) begin
        S_bit_tx_ready_1d <= I_bit_tx_ready;
    end


    assign S_bit_tx_ready_p_edge = ~S_bit_tx_ready_1d & I_bit_tx_ready;


    assign S_fifo_rd_en = S_next_state == READ_DATA ? 1'b1 : 1'b0;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_rd_cnt <= 'd0;
        else
            if(S_tx_end)
                S_rd_cnt <= 'd0;
            else if(S_fifo_rd_en)
                S_rd_cnt <= S_rd_cnt + 1'b1;
            else
                S_rd_cnt <= S_rd_cnt;
    end

    ///三段式状态机
    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_current_state <= IDLE;
        else
            S_current_state <= S_next_state;
    end


    always @(*) begin
        case(S_current_state)
            IDLE:
                            begin
                                if(I_tx_last)
                                    S_next_state = READ_DATA;
                                else
                                    S_next_state = IDLE;
                            end
            READ_DATA:
                            begin
                                if(S_start_bit)
                                    S_next_state = SEND_START_BIT;
                                else
                                    S_next_state = SEND_BIT_7;
                            end
            SEND_START_BIT:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_7;
                                else
                                    S_next_state = SEND_START_BIT;
                            end
            SEND_BIT_7:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_6;
                                else
                                    S_next_state = SEND_BIT_7;
                            end
            SEND_BIT_6:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_5;
                                else
                                    S_next_state = SEND_BIT_6;
                            end
            SEND_BIT_5:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_4;
                                else
                                    S_next_state = SEND_BIT_5;
                            end
            SEND_BIT_4:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_3;
                                else
                                    S_next_state = SEND_BIT_4;
                            end
            SEND_BIT_3:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_2;
                                else
                                    S_next_state = SEND_BIT_3;
                            end
            SEND_BIT_2:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_1;
                                else
                                    S_next_state = SEND_BIT_2;
                            end
            SEND_BIT_1:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_BIT_0;
                                else
                                    S_next_state = SEND_BIT_1;
                            end
            SEND_BIT_0:
                            begin
                                if(S_bit_tx_ready_p_edge)
                                    S_next_state = SEND_ACK_BIT;
                                else
                                    S_next_state = SEND_BIT_0;
                            end
            SEND_ACK_BIT:
                            begin
                                 if(S_bit_tx_ready_p_edge)    
                                    begin
                                        if(S_stop_bit)
                                            S_next_state = SEND_STOP_BIT;
                                        else if(S_rd_cnt == S_wr_data_length)
                                            S_next_state = END;
                                        else
                                            S_next_state = READ_DATA;
                                    end   
                                else
                                    S_next_state = SEND_ACK_BIT;
                            end         
            SEND_STOP_BIT:
                            begin
                                if(S_bit_tx_ready_p_edge)     
                                    begin
                                        if(S_rd_cnt == S_wr_data_length)
                                            S_next_state = END;
                                        else
                                            S_next_state = READ_DATA;
                                    end
                                else
                                    S_next_state = SEND_STOP_BIT;
                            end
            END:
                            begin
                                S_next_state = IDLE;
                            end
            default:
                            begin
                                S_next_state = IDLE;
                            end
        endcase
    end


    always @(posedge I_clk) begin
        if(S_current_state == END)
            S_tx_end <= 1'b1;
        else
            S_tx_end <= 1'b0;
    end


    assign S_start_bit_send_trig = S_next_state == SEND_START_BIT && S_current_state != SEND_START_BIT ? 1'b1 : 1'b0;
    assign S_bit_7_send_trig     = S_next_state == SEND_BIT_7     && S_current_state != SEND_BIT_7     ? 1'b1 : 1'b0;
    assign S_bit_6_send_trig     = S_next_state == SEND_BIT_6     && S_current_state != SEND_BIT_6     ? 1'b1 : 1'b0;
    assign S_bit_5_send_trig     = S_next_state == SEND_BIT_5     && S_current_state != SEND_BIT_5     ? 1'b1 : 1'b0;
    assign S_bit_4_send_trig     = S_next_state == SEND_BIT_4     && S_current_state != SEND_BIT_4     ? 1'b1 : 1'b0;
    assign S_bit_3_send_trig     = S_next_state == SEND_BIT_3     && S_current_state != SEND_BIT_3     ? 1'b1 : 1'b0;
    assign S_bit_2_send_trig     = S_next_state == SEND_BIT_2     && S_current_state != SEND_BIT_2     ? 1'b1 : 1'b0;
    assign S_bit_1_send_trig     = S_next_state == SEND_BIT_1     && S_current_state != SEND_BIT_1     ? 1'b1 : 1'b0;
    assign S_bit_0_send_trig     = S_next_state == SEND_BIT_0     && S_current_state != SEND_BIT_0     ? 1'b1 : 1'b0;
    assign S_ack_bit_send_trig   = S_next_state == SEND_ACK_BIT   && S_current_state != SEND_ACK_BIT   ? 1'b1 : 1'b0;
    assign S_stop_bit_send_trig  = S_next_state == SEND_STOP_BIT  && S_current_state != SEND_STOP_BIT  ? 1'b1 : 1'b0;

    
    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                O_bit_tx_valid     <= 1'b0;
                O_bit_tx_data_type <= 'd0;
            end
        else
            if(S_start_bit_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    O_bit_tx_data_type <= 'd1;
                end
            else if(S_bit_7_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[7])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_6_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[6])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_5_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[5])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_4_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[4])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_3_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[3])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_2_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[2])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_1_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[1])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_bit_0_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_fifo_rd_data[0])
                        O_bit_tx_data_type <= 'd2;
                    else
                        O_bit_tx_data_type <= 'd3; 
                end
            else if(S_ack_bit_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    if(S_ack_bit)
                        O_bit_tx_data_type <= 'd4;
                    else
                        O_bit_tx_data_type <= 'd5;
                end
            else if(S_stop_bit_send_trig)
                begin
                    O_bit_tx_valid     <= 1'b1;
                    O_bit_tx_data_type <= 'd6;
                end
            else
                begin
                    O_bit_tx_valid     <= 1'b0;
                    O_bit_tx_data_type <= 'd0;
                end
    end

endmodule