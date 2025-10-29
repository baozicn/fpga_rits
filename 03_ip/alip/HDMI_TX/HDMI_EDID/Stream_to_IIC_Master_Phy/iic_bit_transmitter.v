

module iic_bit_transmitter (
    input wire      I_clk,
    input wire      I_rst,

    input wire      I_bit_tx_valid,
    input wire[2:0] I_bit_tx_data_type, /*  3'd1 : start bit
                                            3'd2 : bit 1
                                            3'd3 : bit 0
                                            3'd4 : ack bit 1 
                                            3'd5 : ack bit 0
                                            3'd6 : stop bit
                                         */
    output reg      O_bit_tx_ready,

    output reg      O_rx_clk_data_trig,
    output reg      O_rx_clk_ack_trig,

    output reg      O_iic_scl,
    output reg      O_iic_sda
);


    parameter IIC_SCL_DIV = 10;

    reg       S_start_bit_tx_en;
    reg       S_stop_bit_tx_en;
    reg       S_ack_bit_1_tx_en;
    reg       S_ack_bit_0_tx_en;
    reg       S_data_1_bit_tx_en;
    reg       S_data_0_bit_tx_en;

    wire      S_start_bit_tx_end;
    wire      S_stop_bit_tx_end;
    wire      S_ack_bit_1_tx_end;
    wire      S_ack_bit_0_tx_end;
    wire      S_data_1_bit_tx_end;
    wire      S_data_0_bit_tx_end;

    wire      S_bit_send_en;
    wire      S_bit_send_end;

    reg[15:0] S_scl_clk_div_cnt;
    wire      S_scl_clk_trig;
    reg[7:0]  S_clk_bit_cnt;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            O_bit_tx_ready <= 1'b1;
        else
            if(I_bit_tx_valid)
                O_bit_tx_ready <= 1'b0;
            else if(S_bit_send_end)
                O_bit_tx_ready <= 1'b1;
            else
                O_bit_tx_ready <= O_bit_tx_ready;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_start_bit_tx_en <= 1'b0;
        else
            if(I_bit_tx_valid && I_bit_tx_data_type == 'd1)
                S_start_bit_tx_en <= 1'b1;
            else if(S_start_bit_tx_end)
                S_start_bit_tx_en <= 1'b0;
            else
                S_start_bit_tx_en <= S_start_bit_tx_en;
    end

    assign S_start_bit_tx_end = S_start_bit_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd2) ? 1'b1 : 1'b0;



    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_stop_bit_tx_en <= 1'b0;
        else
            if(I_bit_tx_valid && I_bit_tx_data_type == 'd6)
                S_stop_bit_tx_en <= 1'b1;
            else if(S_stop_bit_tx_end)
                S_stop_bit_tx_en <= 1'b0; 
            else
                S_stop_bit_tx_en <= S_stop_bit_tx_en;
    end

    assign S_stop_bit_tx_end = S_stop_bit_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd3) ? 1'b1 : 1'b0;



    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_ack_bit_1_tx_en <= 1'b0;
        else
            if(I_bit_tx_valid && I_bit_tx_data_type == 'd4)
                S_ack_bit_1_tx_en <= 1'b1;
            else if(S_ack_bit_1_tx_end)
                S_ack_bit_1_tx_en <= 1'b0;
            else
                S_ack_bit_1_tx_en <= S_ack_bit_1_tx_en;
    end

    assign S_ack_bit_1_tx_end = S_ack_bit_1_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd3) ? 1'b1 : 1'b0;


    always @(posedge I_clk or posedge I_rst) begin
            if(I_rst)
                S_ack_bit_0_tx_en <= 1'b0;
            else
                if(I_bit_tx_valid && I_bit_tx_data_type == 'd5)
                    S_ack_bit_0_tx_en <= 1'b1;
                else if(S_ack_bit_0_tx_end)
                    S_ack_bit_0_tx_en <= 1'b0;
                else
                    S_ack_bit_0_tx_en <= S_ack_bit_0_tx_en;
        end

    assign S_ack_bit_0_tx_end = S_ack_bit_0_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd3) ? 1'b1 : 1'b0;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_data_1_bit_tx_en <= 1'b0;
        else
            if(I_bit_tx_valid && I_bit_tx_data_type == 'd2)
                S_data_1_bit_tx_en <= 1'b1;
            else if(S_data_1_bit_tx_end)
                S_data_1_bit_tx_en <= 1'b0;
            else
                S_data_1_bit_tx_en <= S_data_1_bit_tx_en;
    end

    assign S_data_1_bit_tx_end = S_data_1_bit_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd2) ? 1'b1 : 1'b0;
    


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_data_0_bit_tx_en <= 1'b0;
        else
            if(I_bit_tx_valid && I_bit_tx_data_type == 'd3)
                S_data_0_bit_tx_en <= 1'b1;
            else if(S_data_0_bit_tx_end)
                S_data_0_bit_tx_en <= 1'b0;
            else
                S_data_0_bit_tx_en <= S_data_0_bit_tx_en;
    end

    assign S_data_0_bit_tx_end = S_data_0_bit_tx_en && (S_scl_clk_div_cnt == IIC_SCL_DIV-1) && (S_clk_bit_cnt == 'd2) ? 1'b1 : 1'b0;


    assign S_bit_send_en = S_start_bit_tx_en | S_stop_bit_tx_en | S_ack_bit_1_tx_en | S_ack_bit_0_tx_en | S_data_1_bit_tx_en | S_data_0_bit_tx_en;

    assign S_bit_send_end = S_start_bit_tx_end | S_stop_bit_tx_end | S_ack_bit_1_tx_end | S_ack_bit_0_tx_end | S_data_1_bit_tx_end | S_data_0_bit_tx_end;

    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_scl_clk_div_cnt <= 'd0;
        else
            if(S_bit_send_en)
                begin
                    if(S_scl_clk_div_cnt == IIC_SCL_DIV-1)
                        S_scl_clk_div_cnt <= 'd0;
                    else
                        S_scl_clk_div_cnt <= S_scl_clk_div_cnt + 1'b1;
                end
            else
                S_scl_clk_div_cnt <= 'd0;
    end

    assign S_scl_clk_trig = S_bit_send_en && S_scl_clk_div_cnt == 'd0 ? 1'b1 : 1'b0;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            S_clk_bit_cnt <= 'd0;
        else
            if(S_bit_send_en)
                begin
                    if(S_scl_clk_trig)
                        S_clk_bit_cnt <= S_clk_bit_cnt + 1'b1;
                    else
                        S_clk_bit_cnt <= S_clk_bit_cnt;
                end
            else
                S_clk_bit_cnt <= 'd0;
    end


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            begin
                O_iic_scl <= 1'b1;
                O_iic_sda <= 1'b1;
            end
        else
            if(S_start_bit_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b1;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b0;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                    else
                        begin
                            O_iic_scl <= O_iic_scl;
                            O_iic_sda <= O_iic_sda;
                        end
                end
            else if(S_stop_bit_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b0;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b0;
                                end
                            else if(S_clk_bit_cnt == 'd2)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b1;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                    else
                        begin
                            O_iic_scl <= O_iic_scl;
                            O_iic_sda <= O_iic_sda;
                        end
                end
            else if(S_ack_bit_1_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b1;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b1;
                                end
                            else if(S_clk_bit_cnt == 'd2)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b1;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                end
            else if(S_ack_bit_0_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b0;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b0;
                                end
                            else if(S_clk_bit_cnt == 'd2)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b0;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                    else
                        begin
                            O_iic_scl <= O_iic_scl;
                            O_iic_sda <= O_iic_sda;
                        end
                end
            else if(S_data_1_bit_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b1;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b1;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                    else
                        begin
                            O_iic_scl <= O_iic_scl;
                            O_iic_sda <= O_iic_sda;
                        end
                end
            else if(S_data_0_bit_tx_en)
                begin
                    if(S_scl_clk_trig)
                        begin
                            if(S_clk_bit_cnt == 'd0)
                                begin
                                    O_iic_scl <= 1'b0;
                                    O_iic_sda <= 1'b0;
                                end
                            else if(S_clk_bit_cnt == 'd1)
                                begin
                                    O_iic_scl <= 1'b1;
                                    O_iic_sda <= 1'b0;
                                end
                            else
                                begin
                                    O_iic_scl <= O_iic_scl;
                                    O_iic_sda <= O_iic_sda;
                                end
                        end
                    else
                        begin
                            O_iic_scl <= O_iic_scl;
                            O_iic_sda <= O_iic_sda;
                        end
                end
            else
                begin
                    O_iic_scl <= O_iic_scl;
                    O_iic_sda <= O_iic_sda;
                end
    end


    always @(posedge I_clk) begin
        if((S_data_1_bit_tx_en || S_data_0_bit_tx_en) && S_scl_clk_trig && S_clk_bit_cnt == 'd1)
            O_rx_clk_data_trig <= 1'b1;
        else
            O_rx_clk_data_trig <= 1'b0;
    end


    always @(posedge I_clk) begin
        if((S_ack_bit_1_tx_en || S_ack_bit_0_tx_en) && S_scl_clk_trig && S_clk_bit_cnt == 'd1)
            O_rx_clk_ack_trig <= 1'b1;
        else
            O_rx_clk_ack_trig <= 1'b0;
    end


endmodule