

module iic_master_wrapper (
    input wire       I_clk,
    input wire       I_rst,
 
    input wire       I_tx_valid,
    input wire[10:0] I_tx_data,
    input wire       I_tx_last,
    output reg       O_tx_ready,

    output wire      O_rx_valid,
    output wire[8:0] O_rx_data, 
    output wire      O_rx_last, 

    output wire      O_iic_scl,
    inout wire       IO_iic_sda
);


	parameter IIC_SCL_DIV = 100;
    
    wire      S_bit_tx_valid;
    wire[2:0] S_bit_tx_data_type;
    wire      S_bit_tx_ready;
    wire      S_rx_clk_data_trig;
    wire      S_rx_clk_ack_trig;
    wire      S_tx_end;
    wire      S_iic_sda_out;
    wire      S_iic_sda_in;



    assign IO_iic_sda   = S_iic_sda_out ? 1'bz : 1'b0;
    assign S_iic_sda_in = IO_iic_sda;


    always @(posedge I_clk or posedge I_rst) begin
        if(I_rst)
            O_tx_ready <= 1'b1;
        else
            if(I_tx_valid && I_tx_last)
                O_tx_ready <= 1'b0;
            else if(O_rx_valid && O_rx_last)
                O_tx_ready <= 1'b1;
            else
                O_tx_ready <= O_tx_ready;
    end
    

    iic_transmitter_controller u_iic_transmitter_controller(
        .I_clk                ( I_clk                ),
        .I_rst                ( I_rst                ),

        .I_tx_valid           ( I_tx_valid           ),
        .I_tx_data            ( I_tx_data            ),
        .I_tx_last            ( I_tx_last            ),
        .O_tx_ready           (  ),

        .O_tx_end             ( S_tx_end             ),

        .O_bit_tx_valid       ( S_bit_tx_valid       ),
        .O_bit_tx_data_type   ( S_bit_tx_data_type   ),
        .I_bit_tx_ready       ( S_bit_tx_ready       )
    );


    iic_receiver_controller u_iic_receiver_controller(
        .I_clk              ( I_clk              ),
        .I_rst              ( I_rst              ),

        .I_rx_clk_data_trig ( S_rx_clk_data_trig ),
        .I_rx_clk_ack_trig  ( S_rx_clk_ack_trig  ),
        .I_tx_end           ( S_tx_end           ),
        .I_iic_sda          ( S_iic_sda_in       ),

        .O_rx_valid         ( O_rx_valid         ),
        .O_rx_data          ( O_rx_data          ),
        .O_rx_last          ( O_rx_last          )
    );



    iic_bit_transmitter #(
        .IIC_SCL_DIV ( IIC_SCL_DIV )
    ) u_iic_bit_transmitter(
        .I_clk              ( I_clk              ),
        .I_rst              ( I_rst              ),

        .I_bit_tx_valid     ( S_bit_tx_valid     ),
        .I_bit_tx_data_type ( S_bit_tx_data_type ),
        .O_bit_tx_ready     ( S_bit_tx_ready     ),

        .O_rx_clk_data_trig ( S_rx_clk_data_trig ),
        .O_rx_clk_ack_trig  ( S_rx_clk_ack_trig  ),

        .O_iic_scl          ( O_iic_scl          ),
        .O_iic_sda          ( S_iic_sda_out      )
    );


endmodule