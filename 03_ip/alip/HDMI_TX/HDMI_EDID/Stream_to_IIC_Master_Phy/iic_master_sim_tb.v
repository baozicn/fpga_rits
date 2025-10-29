`timescale 1ns/1ps



module iic_master_sim_tb;
    
    reg       S_clk;
    reg       S_rst;

    reg       S_tx_start;
    reg       S_tx_valid;
    wire[9:0] S_tx_data;
    wire      S_tx_last;
    wire      S_tx_ready;
    wire      S_bit_tx_valid;
    wire[2:0] S_bit_tx_data_type;
    wire      S_bit_tx_ready;
    reg[9:0]  S_tx_cnt;
    reg[9:0]  S_ready_wait_cnt;
    wire      S_iic_scl;
    wire      S_iic_sda;


    initial begin
        S_clk = 1'b0;
        S_rst = 1'b0;

        #10
        S_rst = 1'b1;
        #100
        S_rst = 1'b0;
        #100
        S_tx_start = 1'b1;
        #20
        S_tx_start = 1'b0;
    end


    always #5 S_clk = ~S_clk;


    always @(posedge S_clk or posedge S_rst) begin
        if(S_rst)
            S_tx_valid <= 1'b0;
        else
            if(S_tx_start)
                S_tx_valid <= 1'b1;
            else if(S_tx_last)
                S_tx_valid <= 1'b0;
            else
                S_tx_valid <= S_tx_valid;
    end


    always @(posedge S_clk) begin
        if(S_tx_valid)
            S_tx_cnt <= S_tx_cnt + 1'b1;
        else
            S_tx_cnt <= 'd0;
    end


    assign S_tx_last = S_tx_cnt == 'd9 && S_tx_valid ? 1'b1 : 1'b0;


    assign S_tx_data = S_tx_cnt == 'd0 && S_tx_valid ? {2'b10,8'hA0} :
                       S_tx_cnt == 'd1 && S_tx_valid ? {2'b00,8'h00} :
                       S_tx_cnt == 'd2 && S_tx_valid ? {2'b10,8'hA1} :
                       S_tx_cnt == 'd3 && S_tx_valid ? {2'b00,8'h00} :
                       S_tx_cnt == 'd4 && S_tx_valid ? {2'b00,8'hFF} :
                       S_tx_cnt == 'd5 && S_tx_valid ? {2'b00,8'hFF} :
                       S_tx_cnt == 'd6 && S_tx_valid ? {2'b00,8'hFF} :
                       S_tx_cnt == 'd7 && S_tx_valid ? {2'b00,8'hEE} :
                       S_tx_cnt == 'd8 && S_tx_valid ? {2'b00,8'h00} :
                       S_tx_cnt == 'd9 && S_tx_valid ? {2'b01,8'hEA} : 'd0;


    iic_master_wrapper u_iic_master_wrapper(
        .I_clk      ( S_clk      ),
        .I_rst      ( S_rst      ),

        .I_tx_valid ( S_tx_valid ),
        .I_tx_data  ( S_tx_data  ),
        .I_tx_last  ( S_tx_last  ),
        .O_tx_ready ( S_tx_ready ),

        .O_rx_valid (  ),
        .O_rx_data  (  ),
        .O_rx_last  (  ),

        .O_iic_scl  ( S_iic_scl  ),
        .O_iic_sda  ( S_iic_sda  )
    );


    // iic_master_controller u_iic_master_controller(
    //     .I_clk                ( S_clk                ),
    //     .I_rst                ( S_rst                ),
    //     .I_tx_valid           ( S_tx_valid           ),
    //     .I_tx_data            ( S_tx_data            ),
    //     .I_tx_last            ( S_tx_last            ),
    //     .O_tx_ready           ( S_tx_ready           ),
    //     .O_bit_tx_valid       ( S_bit_tx_valid       ),
    //     .O_bit_tx_data_type   ( S_bit_tx_data_type   ),
    //     .I_bit_tx_ready       ( S_bit_tx_ready       )
    // );


    // iic_bit_transmitter #(
    //     .IIC_SCL_DIV( 10 )
    // ) u_iic_bit_transmitter(
    //     .I_clk              ( S_clk              ),
    //     .I_rst              ( S_rst              ),

    //     .I_bit_tx_valid     ( S_bit_tx_valid     ),
    //     .I_bit_tx_data_type ( S_bit_tx_data_type ),
    //     .O_bit_tx_ready     ( S_bit_tx_ready     ),

    //     .O_iic_scl          ( S_iic_scl          ),
    //     .O_iic_sda          ( S_iic_sda          )
    // );


    // always @(posedge S_clk or posedge S_rst) begin
    //     if(S_rst)
    //         S_bit_tx_ready <= 1'b1;
    //     else
    //         if(S_bit_tx_valid)
    //             S_bit_tx_ready <= 1'b0;
    //         else if(S_ready_wait_cnt == 'd20)
    //             S_bit_tx_ready <= 1'b1;
    //         else
    //             S_bit_tx_ready <= S_bit_tx_ready;
    // end

    // always @(posedge S_clk) begin
    //     if(!S_bit_tx_ready)
    //         S_ready_wait_cnt <= S_ready_wait_cnt + 1'b1;
    //     else
    //         S_ready_wait_cnt <= 'd0;
    // end


endmodule