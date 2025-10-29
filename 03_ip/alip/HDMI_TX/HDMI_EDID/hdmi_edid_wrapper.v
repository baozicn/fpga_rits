

module hdmi_edid_wrapper#(
    parameter IIC_SCL_DIV = 125
)(
    input wire       I_clk,
    input wire       I_rst,

    input wire       I_edid_read_trig,
    output wire      O_edid_read_valid,
    output wire[7:0] O_edid_read_data, 
	
    output wire      O_iic_scl,
    inout wire       IO_iic_sda
);


    wire      S_iic_tx_valid;   
    wire[10:0]S_iic_tx_data;    
    wire      S_iic_tx_last;    
    wire      S_iic_tx_ready;   

    wire      S_iic_rx_valid;   
    wire[8:0] S_iic_rx_data;    
    wire      S_iic_rx_last;    


    hdmi_edid_read_controller u_hdmi_edid_read_controller(
        .I_clk             ( I_clk             ),
        .I_rst             ( I_rst             ),

        .I_edid_read_trig  ( I_edid_read_trig  ),
        .O_edid_read_valid ( O_edid_read_valid ),
        .O_edid_read_data  ( O_edid_read_data  ),

        .O_iic_tx_valid    ( S_iic_tx_valid    ),
        .O_iic_tx_data     ( S_iic_tx_data     ),
        .O_iic_tx_last     ( S_iic_tx_last     ),
        .I_iic_tx_ready    ( S_iic_tx_ready    ),
  
        .I_iic_rx_valid    ( S_iic_rx_valid    ),
        .I_iic_rx_data     ( S_iic_rx_data     ),
        .I_iic_rx_last     ( S_iic_rx_last     )
    );



    iic_master_wrapper #(
        .IIC_SCL_DIV ( IIC_SCL_DIV )
    ) u_iic_master_wrapper(
        .I_clk      ( I_clk          ),
        .I_rst      ( I_rst          ),
    
        .I_tx_valid ( S_iic_tx_valid ),
        .I_tx_data  ( S_iic_tx_data  ),
        .I_tx_last  ( S_iic_tx_last  ),
        .O_tx_ready ( S_iic_tx_ready ),

        .O_rx_valid ( S_iic_rx_valid ),
        .O_rx_data  ( S_iic_rx_data  ),
        .O_rx_last  ( S_iic_rx_last  ),

        .O_iic_scl  ( O_iic_scl      ),
        .IO_iic_sda ( IO_iic_sda     )
    );
    
endmodule