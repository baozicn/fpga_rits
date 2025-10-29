

module hdmi_edid_read_controller(
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_edid_read_trig,
    output reg       O_edid_read_valid,
    output reg[7:0]  O_edid_read_data, 

    output reg       O_iic_tx_valid,
    output wire[10:0]O_iic_tx_data,
    output wire      O_iic_tx_last,
    input wire       I_iic_tx_ready,

    input wire       I_iic_rx_valid,
    input wire[8:0]  I_iic_rx_data,
    input wire       I_iic_rx_last
);
    


    reg[9:0]  S_tx_data_cnt;
    reg[7:0]  S_rx_data_cnt;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            O_iic_tx_valid <= 'd0;
        else
            if(I_edid_read_trig)
                O_iic_tx_valid <= 1'b1;
            else if(O_iic_tx_last)
                O_iic_tx_valid <= 1'b0;
            else
                O_iic_tx_valid <= O_iic_tx_valid;
    end

    always @(posedge I_clk) begin
        if(O_iic_tx_valid)
            S_tx_data_cnt <= S_tx_data_cnt + 1'b1;
        else
            S_tx_data_cnt <= 'd0;
    end

    assign O_iic_tx_last = O_iic_tx_valid && S_tx_data_cnt == 'd130 ? 1'b1 : 1'b0;

    assign O_iic_tx_data = O_iic_tx_valid && S_tx_data_cnt == 'd0   ? {3'b101,8'hA0} :
                           O_iic_tx_valid && S_tx_data_cnt == 'd1   ? {3'b001,8'h00} :
                           O_iic_tx_valid && S_tx_data_cnt == 'd2   ? {3'b101,8'hA1} :
                           O_iic_tx_valid && S_tx_data_cnt == 'd130 ? {3'b011,8'hFF} : {3'b000,8'hFF};


    always @(posedge I_clk) begin
        if(I_iic_rx_valid)
            S_rx_data_cnt <= S_rx_data_cnt + 1'b1;
        else
            S_rx_data_cnt <= 'd0;
    end

    always @(posedge I_clk) begin
        if(I_iic_rx_valid && S_rx_data_cnt >= 'd3)
            begin
                O_edid_read_valid <= I_iic_rx_valid;
                O_edid_read_data  <= I_iic_rx_data[7:0];
            end
        else
            begin
                O_edid_read_valid <= 1'b0;
                O_edid_read_data  <= 'd0;
            end
    end

endmodule