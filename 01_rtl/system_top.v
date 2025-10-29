`timescale 1ns / 1ns
/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2019/12/17
*Module Name:run_led
*File Name:run_led.v
*Description: 
*The reference demo provided by Milianke is only used for learning. 
*We cannot ensure that the demo itself is free of bugs, so users 
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 1.0
*Signal description
*1) I_ input
*2) O_ output
*3) IO_ input output
*3) _n activ low
*4) _dg debug signal 
*5) _r delay or register
*6) S_ state mechine
*********************************************************************/

`define DRAM_BYTE_NUM 4    // 1 = x8, 2 = x16,4 = x32,8=x64
`define DRAM_SIZE    "4G"     // AP106,AP102=2G ,AP104=4G    1G , 2G , 4G = 256x16bit, 8G    ,ONE DDR particle capacity

//`define XLNX_NATIVE
//`define ALC_NATIVE  
`define MC_AXI  
 
//`define AXI_ATG  
//`define ATG   
//`define DFI

module system_top#(
parameter DRAM_TYPE       = "DDR3"  ,            //"DDR4" "DDR3"
parameter ECC             = "OFF",
parameter APP_ADDR_WIDTH  = (`DRAM_SIZE=="1G")?26:(`DRAM_SIZE=="2G")?27:(`DRAM_SIZE == "4G")?28:(`DRAM_SIZE == "8G")?29:28, //512Mx16bit=29 ,256Mx16bit=28 ,128Mx16bit=27,64Mx16bit = 26,
parameter AXI_ID_WIDTH    =  4,                                                                                   
parameter APP_DATA_WIDTH  = (ECC == "ON")? (`DRAM_BYTE_NUM-1)*8*8 : `DRAM_BYTE_NUM*8*8,
parameter APP_MASK_WIDTH  = (ECC == "ON")? (`DRAM_BYTE_NUM-1)*8   : `DRAM_BYTE_NUM*8,
parameter AXI_ADDR_WIDTH  = APP_ADDR_WIDTH+3,
parameter AXI_DATA_WIDTH  = APP_DATA_WIDTH,
parameter DQ_WIDTH        = `DRAM_BYTE_NUM * 8,
parameter DQS_WIDTH       = `DRAM_BYTE_NUM,
parameter DM_WIDTH        = `DRAM_BYTE_NUM,
parameter ADDR_WIDTH      = (DRAM_TYPE=="DDR4")?17:(`DRAM_SIZE=="1G")?13:(`DRAM_SIZE=="2G")?14:(`DRAM_SIZE == "4G")?15:(`DRAM_SIZE == "8G")?16:15, // 512Mx16bit=16 ,256Mx16bit=15,128Mx16bit=14,64Mx16bit=13
parameter ROW_WIDTH       = (`DRAM_SIZE=="1G")?13:(`DRAM_SIZE=="2G")?14:(`DRAM_SIZE == "4G")?15:(`DRAM_SIZE == "8G")?16:15,                        // 512Mx16bit=16 ,256Mx16bit=15,128Mx16bit=14,64Mx16bit=13
parameter COL_WIDTH       = 10,                  //
parameter BA_WIDTH        = 3,                   //
parameter BG_WIDTH        = 1,                   //
parameter ODT_WIDTH       = 1,                   // PP phy 2, single phy 1
parameter CKE_WIDTH       = 1,                   // PP phy 2, single phy 1
parameter CS_WIDTH        = 1                    // PP phy 2, single phy 1
)
(
input wire            			I_sys_clk_25m,
input wire            			I_ddr_clk	,
output    [ADDR_WIDTH-1:0]      ddr_addr    , 
output    [  BA_WIDTH-1:0]      ddr_ba      ,
output    [ CKE_WIDTH-1:0]      ddr_cke     ,
output    [ ODT_WIDTH-1:0]      ddr_odt     ,
output    [  CS_WIDTH-1:0]      ddr_cs_n    ,
output                          ddr_ras_n   ,
output                          ddr_cas_n   ,
output                          ddr_we_n    ,
output                          ddr_ck_p    ,
output                          ddr_ck_n    ,
output                          ddr_reset_n ,
inout     [  DM_WIDTH-1:0]      ddr_dm  	,	
inout     [  DQ_WIDTH-1:0]      ddr_dq      ,
inout     [ DQS_WIDTH-1:0]      ddr_dqs_n   ,
inout     [ DQS_WIDTH-1:0]      ddr_dqs_p   ,

inout  wire            			IO_cam_sda	,
output wire           			O_cam_scl	,
output wire           			O_clk_24m	,
input  wire   [3:0]   			I_button	, 
output wire   [2:0]   			O_hdmi_tx_p	,
output wire           			O_hdmi_clk_p
);

wire 			S_pll_lock;
wire        	S_rst;
wire        	S_pclkx1;
wire        	S_pclkx5;
wire        	S_clk_24m;
wire        	S_clk_70m;
	
wire [15:0]		S_ae;
wire [15:0]		S_ag;
wire 			S_cam_cfg_done;
wire 			S_ae_cfg_done;
wire 			S_ae_req;
	
wire        	S_hs_rx_clk;            
wire        	S_hs_rx_valid;          
wire [15:0] 	S_hs_rx_data; 
	
wire        	S_csi_frame_start;       
wire        	S_csi_frame_end;         
wire        	S_csi_valid;             
wire[31:0]  	S_csi_data;  
	
wire        	S_raw10_frame_start; 
wire        	S_raw10_frame_end;   
wire        	S_raw10_valid;       
wire [39:0] 	S_raw10_data;
	
wire 			S_axis_tlast;  
wire 			S_axis_tuser;  
wire [39:0]		S_axis_tdata;  
wire 			S_axis_tvalid; 

wire			S_ISP_O_tready;
wire [127:0]	S_ISP_O_tdata ;
wire 			S_ISP_O_tlast ;
wire 			S_ISP_O_tuser ;
wire 			S_ISP_O_tvalid;

wire [7:0] 		wbuf_sync;
wire [7:0] 		rbuf_sync;

wire        	S_R_vrst;
wire      		S_video_in_ready; //synthesis keep  
wire      		S_video_in_vs; //synthesis keep  
wire [23:0]     S_video_in_data; //synthesis keep

assign S_rst = ~S_pll_lock;

pll u_pll(
.refclk   ( I_sys_clk_25m   ),//系统时钟
.lock     ( S_pll_lock      ),
 
.clk0_out ( S_pclkx1          ),//HDMI_1倍时钟
.clk1_out ( S_pclkx5          ),//HDMI_5倍时钟
.clk2_out ( S_clk_70m       ),//MIPI时钟
.clk3_out ( S_clk_24m         )//摄像头时钟
);

 PH1_LOGIC_ODDR CMOS_CLK (
.q  (O_clk_24m), 
.clk(S_clk_24m),
.d0 (1'b1),
.d1 (1'b0),
.rst(1'b0)
);


//手动配置相机AE
ae_set u_ae_set(
.I_clk(S_clk_24m),
.I_rst(S_rst),
.I_btn(I_button),
.I_cam_cfg_done(S_cam_cfg_done),
.I_ae_cfg_done(S_ae_cfg_done),
.O_ae_req(S_ae_req),
.O_ae(S_ae),
.O_ag(S_ag)
);


uicfgcs500#
(
.CLK_DIV(24_000_000/100_000-1)
)
u_uicfgcs500
(
.I_clk(S_clk_24m),  //时钟输入
.I_rst_n(S_pll_lock),  //复位输入
.I_ae_req(S_ae_req),
.I_ae(S_ae),
.I_ag(S_ag),
.O_cam_scl(O_cam_scl), //I2C总线，SCL时钟
.IO_cam_sda(IO_cam_sda), //I2C总线，SDA数据
.O_cfg_done(S_cam_cfg_done),//摄像头寄存器初始化完成
.O_ae_cfg_done(S_ae_cfg_done)//AE配置完成
);


mipi_dphy_rx_ph1a_mipiio_wrapper#(
.LANE_NUM              ( 2 ),
.BYTE_NUM              ( 1 )
)u_mipi_dphy_rx_ph1a_mipiio_wrapper(
.I_lp_clk              ( S_clk_70m    	),
.I_rst                 ( S_rst        	),

.I_clk_lane_in_delay   (  0  			),
.I_data_lane0_in_delay ( 20  			),
.I_data_lane1_in_delay ( 20  			),

.I_lane_invert         ( 4'b0000         ),

.O_hs_rx_clk           ( S_hs_rx_clk     ),
.O_hs_rx_valid         ( S_hs_rx_valid   ),
.O_hs_rx_data          ( S_hs_rx_data    ),

.I_lp_tx_en            (1'b0 ),
.I_lp_tx_lane0_p       (1'b0 ),
.I_lp_tx_lane0_n       (1'b0 ),

.O_lane_error          ( S_lane_error    )
);


//csi 解码为RAW数据
csi_unpacket_2lane u_csi_unpacket(
.I_clk                 ( S_hs_rx_clk       ),
.I_rst_n               ( S_pll_lock        ),
.I_hs_valid            ( S_hs_rx_valid     ),
.I_hs_data             ( S_hs_rx_data      ),

.O_csi_frame_start     ( S_csi_frame_start ),
.O_csi_frame_end       ( S_csi_frame_end   ),
.O_csi_valid           ( S_csi_valid       ),
.O_csi_data            ( S_csi_data        )
);


//解码为RAW8
raw10_unpacket_2lane u_raw10_unpacket (
.I_clk  (S_hs_rx_clk),
.I_rst_n(S_pll_lock),

.I_csi_frame_start(S_csi_frame_start),
.I_csi_frame_end  (S_csi_frame_end),
.I_csi_valid      (S_csi_valid),
.I_csi_data       (S_csi_data),

.O_raw10_frame_start(S_raw10_frame_start),
.O_raw10_frame_end  (S_raw10_frame_end),
.O_raw10_valid      (S_raw10_valid),
.O_raw10_data       (S_raw10_data)
  );

 
//将数据转为stream流
uial2axis #(
.IMG_WIDTH(1920),
.IMG_HEIGHT(1080),
.INPUT_DATA_WIDTH(40)
) 
u_uial2axis (
.I_native_clk(S_hs_rx_clk),
.I_rst_n     (S_pll_lock),
.I_data      (S_raw10_data       ),
.I_data_valid(S_raw10_valid      ),
.I_data_start(S_raw10_frame_start),
.I_data_end  (S_raw10_frame_end  ),
.axis_tvalid (S_axis_tvalid),
.axis_tdata  (S_axis_tdata ),
.axis_tuser  (S_axis_tuser ),
.axis_tlast  (S_axis_tlast )
);


//ISP算法顶层模块
isp_top u_isp_top (
.axi4s_video_aclk(S_hs_rx_clk),
.I_rst_n         (S_pll_lock),
.I_tlast         (S_axis_tlast),
.I_tuser         (S_axis_tuser),
.I_tdata         (S_axis_tdata),
.I_tvalid        (S_axis_tvalid),
.I_tdest         (),
.O_tready        (S_ISP_O_tready),
.O_tdata         (S_ISP_O_tdata ),
.O_tlast         (S_ISP_O_tlast ),
.O_tuser         (S_ISP_O_tuser ),
.O_tvalid        (S_ISP_O_tvalid),
.I_tready        ()
  );
 
//-------- User Clock --------//
wire                           pll_locked ;
wire                           ddr_init_cal_done  ;
wire                           dfi_clk;
wire    [  3:0]                dfi_reset_n ;
wire    [  CKE_WIDTH*4-1:0]    dfi_cke;
wire    [  ODT_WIDTH*4-1:0]    dfi_odt;
wire    [  CS_WIDTH *4-1:0]    dfi_cs_n;
wire    [  3:0]                dfi_ras_n;
wire    [  3:0]                dfi_cas_n;
wire    [  3:0]                dfi_act_n;
wire    [  3:0]                dfi_we_n;
wire    [  BA_WIDTH*4-1 :0]    dfi_bank;
wire    [  BG_WIDTH*4-1 :0]    dfi_bg;
wire    [  ADDR_WIDTH*4-1:0]   dfi_address;
wire    [  DQS_WIDTH*4-1:0]    dfi_wrdata_en;
wire    [  DQ_WIDTH*8-1:0]     dfi_wrdata;
wire    [  DM_WIDTH*8-1:0]     dfi_wrdata_mask;
wire    [  DQS_WIDTH*4-1:0]    dfi_rddata_en;
wire    [  DQS_WIDTH*4-1:0]    dfi_rddata_valid;
wire    [  DQ_WIDTH*8-1:0]     dfi_rddata;
wire    [  DM_WIDTH*8-1:0]     dfi_rddata_dbi_n;

reg                            init_cal_done_d;
reg                            init_cal_done;

// AXI Write Addr
wire [AXI_ADDR_WIDTH-1:0]      axi_awaddr  ;
wire                           axi_awvalid ;
wire                           axi_awready ;
wire   [AXI_ID_WIDTH-1:0]      axi_awid    ;
wire                [7:0]      axi_awlen   ; 
wire                [2:0]      axi_awsize  ; 
wire                [1:0]      axi_awburst ; 
wire                [0:0]      axi_awlock  ; 
wire                [3:0]      axi_awcache ; 
wire                [2:0]      axi_awprot  ; 
wire                [3:0]      axi_awqos   ;
// AXI Write Data              
wire [APP_DATA_WIDTH-1:0]      axi_wdata   ;
wire [APP_MASK_WIDTH-1:0]      axi_wstrb   ;
wire                           axi_wvalid  ;
wire                           axi_wlast   ;
wire                           axi_wready  ;
// Write Response Port         
wire   [AXI_ID_WIDTH-1:0]      axi_bid     ;    
wire                [1:0]      axi_bresp   ;    
wire                           axi_bvalid  ;    
wire                           axi_bready  ;    
                               
// AXI Read Addr               
wire [AXI_ADDR_WIDTH-1:0]      axi_araddr  ;
wire                           axi_arvalid ;
wire                           axi_arready ;
wire [  AXI_ID_WIDTH-1:0]      axi_arid    ;
wire                [7:0]      axi_arlen   ;
wire                [2:0]      axi_arsize  ;
wire                [1:0]      axi_arburst ;
wire                [0:0]      axi_arlock  ;
wire                [3:0]      axi_arcache ;
wire                [2:0]      axi_arprot  ;
wire                [3:0]      axi_arqos   ;
// AXI Read Data               
wire [APP_DATA_WIDTH-1:0]      axi_rdata   ;
wire                           axi_rlast   ;
wire                           axi_rvalid  ;
wire                           axi_rready  ;
wire   [AXI_ID_WIDTH-1:0]      axi_rid     ;
wire                [1:0]      axi_rresp   ;

//===== DDR3 PHY INS =====//
ddr_ip u_ddr_phy (
`ifndef DFI
        .sys_clk                    ( I_ddr_clk      ),
        .sys_rst_n                  (   1        	 ),
`else
        .sys_clk_p                  ( I_ddr_clk      ),
        .sys_rstn                   (   1        	 ),
`endif
        .dfi_clk                    ( dfi_clk          ), 
        .pll_locked                 ( pll_locked       ),
//        .user_clk0                  (                  ),
         //DDR bus signals                             
        .ddr_addr                   ( ddr_addr         ),
        .ddr_ba                     ( ddr_ba           ),
        //.ddr_bg                     ( ddr_bg           ),
        .ddr_ck_n                   ( ddr_ck_n         ),
        .ddr_ck_p                   ( ddr_ck_p         ),
        .ddr_ras_n                  ( ddr_ras_n        ),
        .ddr_cas_n                  ( ddr_cas_n        ),
        .ddr_we_n                   ( ddr_we_n         ),  
        //.ddr_act_n                  ( ddr_act_n        ),
        .ddr_cke                    ( ddr_cke          ),
        .ddr_cs_n                   ( ddr_cs_n         ),
        .ddr_dm                     ( ddr_dm ),        
        .ddr_odt                    ( ddr_odt          ),
        .ddr_reset_n                ( ddr_reset_n      ),
        .ddr_dq                     ( ddr_dq           ),
        .ddr_dqs_n                  ( ddr_dqs_n        ),
        .ddr_dqs_p                  ( ddr_dqs_p        ),  

        .uart_txd                   ( O_uart_txd         ),
        .uart_rxd                   ( I_uart_rxd         ),
        .ddr_init_cal_done          ( ddr_init_cal_done    ),

`ifdef DFI
         // DFI bus signals, between hard 
         // controller and users or top-level systems  
        .dfi_reset_n                ( dfi_reset_n      ),
        .dfi_cke                    ( dfi_cke          ),
        .dfi_odt                    ( dfi_odt          ),
        .dfi_cs_n                   ( dfi_cs_n         ),
        .dfi_ras_n                  ( dfi_ras_n        ),
        .dfi_cas_n                  ( dfi_cas_n        ),
        .dfi_we_n                   ( dfi_we_n         ),
        //.dfi_act_n                  ( dfi_act_n        ),
        .dfi_bank                   ( dfi_bank         ),
        //.dfi_bg                     ( dfi_bg           ),
        .dfi_address                ( dfi_address      ),
        .dfi_wrdata_en              ( dfi_wrdata_en    ),
        .dfi_wrdata                 ( dfi_wrdata       ),
        .dfi_wrdata_mask            ( dfi_wrdata_mask  ), 
        .dfi_rddata_en              ( dfi_rddata_en    ),
        .dfi_rddata_valid           ( dfi_rddata_valid ),
        .dfi_rddata                 ( dfi_rddata       ),
        .dfi_rddata_dbi_n           ( dfi_rddata_dbi_n ), 
        .dfi_ctrlupd_req            ( 2'b00            ),
        .dfi_ctrlupd_ack            (                  ),
        .dfi_phyupd_req             (                  ),
        .dfi_phyupd_ack             ( 2'h0             ),
        .dfi_phyupd_type            (                  )

`elsif MC_AXI  
 // Write Addr Ports                            
        .axi_awaddr                 ( axi_awaddr       ),
        .axi_awvalid                ( axi_awvalid      ),
        .axi_awready                ( axi_awready      ),
                                          
        .axi_awid                   ( axi_awid         ),
        .axi_awlen                  ( axi_awlen        ),
        .axi_awsize                 ( axi_awsize       ),
        .axi_awburst                ( axi_awburst      ),
        .axi_awlock                 ( axi_awlock       ),
        .axi_awcache                ( axi_awcache      ),
        .axi_awprot                 ( axi_awprot       ),
        .axi_awqos                  ( axi_awqos        ),
                                                
        // Write Data Port                             
        .axi_wdata                  ( axi_wdata        ),
        .axi_wstrb                  ( axi_wstrb        ),
        .axi_wvalid                 ( axi_wvalid       ),
        .axi_wlast                  ( axi_wlast        ),
        .axi_wready                 ( axi_wready       ),
        // Write Response Port                         
        .axi_bid                    ( axi_bid          ),
        .axi_bresp                  ( axi_bresp        ),
        .axi_bvalid                 ( axi_bvalid       ),
        .axi_bready                 ( axi_bready       ),
        // Read Address Ports                          
        .axi_araddr                 ( axi_araddr       ),
        .axi_arvalid                ( axi_arvalid      ),
        .axi_arready                ( axi_arready      ),
                                          
        .axi_arid                   ( axi_arid         ),
        .axi_arlen                  ( axi_arlen        ),
        .axi_arsize                 ( axi_arsize       ),
        .axi_arburst                ( axi_arburst      ),
        .axi_arlock                 ( axi_arlock       ),
        .axi_arcache                ( axi_arcache      ),
        .axi_arprot                 ( axi_arprot       ),
        .axi_arqos                  ( axi_arqos        ),
                                                 
        // Read Data Ports                                                         
        .axi_rid                    ( axi_rid          ),
        .axi_rresp                  ( axi_rresp        ),                                       
        .axi_rdata                  ( axi_rdata        ),
        .axi_rlast                  ( axi_rlast        ),
        .axi_rvalid                 ( axi_rvalid       ),
        .axi_rready                 ( axi_rready       )
  `else
        // Native
        .paxi_awaddr        ( axi_awaddr       ),
        .paxi_awvalid       ( axi_awvalid      ),
        .paxi_awready       ( axi_awready      ),
        
        .paxi_wdata         ( axi_wdata        ),
        .paxi_wstrb         ( axi_wstrb        ),
        .paxi_wvalid        ( axi_wvalid       ),
        .paxi_wlast         ( axi_wlast        ),
        .paxi_wready        ( axi_wready       ),
        
         // Write Response Port
        .paxi_bid           ( axi_bid          ),
        .paxi_bresp         ( axi_bresp        ),
        .paxi_bvalid        ( axi_bvalid       ),
        .paxi_bready        ( axi_bready       ),
         // Read Address Ports
        .paxi_araddr        ( axi_araddr       ),
        .paxi_arvalid       ( axi_arvalid      ),
        .paxi_arready       ( axi_arready      ),
        
         // Read Data Ports
        .paxi_rdata         ( axi_rdata        ),
        .paxi_rlast         ( axi_rlast        ),
        .paxi_rvalid        ( axi_rvalid       ),
        .paxi_rready        ( axi_rready       )

`endif 
);

wire [AXI_ADDR_WIDTH-1:  0]      fdma_waddr;    //FDMA写通道地址
wire                             fdma_wareq;    //FDMA写通道请求
wire [15: 0]                     fdma_wsize;    //FDMA写通道一次FDMA的传输大小                               
wire                             fdma_wbusy;    //FDMA处于BUSY状态，AXI总线正在写操作 	
wire [AXI_DATA_WIDTH-1 : 0]      fdma_wdata;    //FDMA写数据
wire                             fdma_wvalid;   //FDMA 写有效
wire                             fdma_wready;   //FDMA写准备好，用户可以写数据
                                                  
wire [AXI_ADDR_WIDTH-1:  0]      fdma_raddr;    //FDMA读通道地址
wire                             fdma_rareq;    //FDMA读通道请求
wire [15: 0]                     fdma_rsize;    //FDMA读通道一次FDMA的传输大小                                 
wire                             fdma_rbusy;    //FDMA处于BUSY状态，AXI总线正在读操作 		
wire [AXI_DATA_WIDTH-1 : 0]      fdma_rdata;    //FDMA读数据
wire                             fdma_rvalid;   //FDMA 读有效
wire                             fdma_rready;   //FDMA读准备好，用户可以读数据	
wire                             test_error;    

//例化米联客uiFDMA AXI 控制器 IP
uiFDMA#
(
.M_AXI_B2B_SET(1),
.M_AXI_ID_WIDTH(AXI_ID_WIDTH)           ,//ID位宽
.M_AXI_ADDR_WIDTH(AXI_ADDR_WIDTH)		,//内存地址位宽
.M_AXI_DATA_WIDTH(AXI_DATA_WIDTH)		,//AXI总线的数据位宽
.M_AXI_MAX_BURST_LEN (16)                //AXI总线的burst 大小，对于AXI4，支持任意长度，对于AXI3以下最大16
)
uiFDMA_inst
(
.I_fdma_waddr(fdma_waddr)          ,//FDMA写通道地址
.I_fdma_wareq(fdma_wareq)          ,//FDMA写通道请求
.I_fdma_wsize(fdma_wsize)          ,//FDMA写通道一次FDMA的传输大小                                   
.O_fdma_wbusy(fdma_wbusy)          ,//FDMA处于BUSY状态，AXI总线正在写操作   
				
.I_fdma_wdata(fdma_wdata)		   ,//FDMA写数据
.O_fdma_wvalid(fdma_wvalid)        ,//FDMA 写有效
.I_fdma_wready(1'b1)		       ,//FDMA写准备好，用户可以写数据

.I_fdma_raddr(fdma_raddr)          ,// FDMA读通道地址
.I_fdma_rareq(fdma_rareq)          ,// FDMA读通道请求
.I_fdma_rsize(fdma_rsize)          ,// FDMA读通道一次FDMA的传输大小                                     
.O_fdma_rbusy(fdma_rbusy)          ,// FDMA处于BUSY状态，AXI总线正在读操作 
				
.O_fdma_rdata(fdma_rdata)		   ,// FDMA读数据
.O_fdma_rvalid(fdma_rvalid)        ,// FDMA 读有效
.I_fdma_rready(1'b1)		       ,// FDMA读准备好，用户可以读数据

//以下为AXI总线信号			
.M_AXI_ACLK                             (dfi_clk),
.M_AXI_ARESETN                          (ddr_init_cal_done),
// Master Interface Write Address Ports
.M_AXI_AWID                             (axi_awid),
.M_AXI_AWADDR                           (axi_awaddr),
.M_AXI_AWLEN                            (axi_awlen),
.M_AXI_AWSIZE                           (axi_awsize),
.M_AXI_AWBURST                          (axi_awburst),
.M_AXI_AWLOCK                           (),
.M_AXI_AWCACHE                          (axi_awcache),
.M_AXI_AWPROT                           (axi_awprot),
.M_AXI_AWQOS                            (),
.M_AXI_AWVALID                          (axi_awvalid),
.M_AXI_AWREADY                          (axi_awready),
// Master Interface Write Data Ports
.M_AXI_WDATA                            (axi_wdata),
.M_AXI_WSTRB                            (axi_wstrb),
.M_AXI_WLAST                            (axi_wlast),
.M_AXI_WVALID                           (axi_wvalid),
.M_AXI_WREADY                           (axi_wready),
// Master Interface Write Response Ports
.M_AXI_BID                              (axi_bid),
.M_AXI_BRESP                            (axi_bresp),
.M_AXI_BVALID                           (axi_bvalid),
.M_AXI_BREADY                           (axi_bready),
// Master Interface Read Address Ports
.M_AXI_ARID                             (axi_arid),
.M_AXI_ARADDR                           (axi_araddr),
.M_AXI_ARLEN                            (axi_arlen),
.M_AXI_ARSIZE                           (axi_arsize),
.M_AXI_ARBURST                          (axi_arburst),
.M_AXI_ARLOCK                           (),
.M_AXI_ARCACHE                          (axi_arcache),
.M_AXI_ARPROT                           (),
.M_AXI_ARQOS                            (),
.M_AXI_ARVALID                          (axi_arvalid),
.M_AXI_ARREADY                          (axi_arready),
// Master Interface Read Data Ports
.M_AXI_RID                              (axi_rid),
.M_AXI_RDATA                            (axi_rdata),
.M_AXI_RRESP                            (axi_rresp),
.M_AXI_RLAST                            (axi_rlast),
.M_AXI_RVALID                           (axi_rvalid),
.M_AXI_RREADY                           (axi_rready)		
);


//设置3帧缓存，读延迟写1帧
uisetvbuf#(
.BUF_DELAY(1),
.BUF_LENTH(3)
)
uisetvbuf_u
(
.I_bufn(wbuf_sync),
.O_bufn(rbuf_sync)
);

//例化uidbuf 控制器
uidbuf# (
.AXI_DATA_WIDTH(AXI_DATA_WIDTH),
.AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),

.W_BUFDEPTH(2048),
.W_DATAWIDTH(128),
.W_BASEADDR(0),
.W_DSIZEBITS(23),
.W_XSIZE(480),
.W_XSTRIDE(480),
.W_YSIZE(1080),
.W_XDIV(2),
.W_BUFSIZE(3),

.R_BUFDEPTH(2048),
.R_DATAWIDTH(32),
.R_BASEADDR(0),
.R_DSIZEBITS(23),
.R_XSIZE(1920),
.R_XSTRIDE(1920),
.R_YSIZE(1080),
.R_XDIV(2),
.R_BUFSIZE(3)
)
uidbuf_u0
(
.I_ui_clk(dfi_clk),
.I_ui_rstn(ddr_init_cal_done),

.I_W_en      (1),
.I_W_wclk    (S_hs_rx_clk),
.I_W_tuser   (S_ISP_O_tuser),
.I_W_tvalid  (S_ISP_O_tvalid),
.I_W_tdata   (S_ISP_O_tdata),
.I_W_tlast   (S_ISP_O_tlast),
.O_W_tready  (S_ISP_O_tready),
.O_W_sync_cnt(wbuf_sync),
.I_W_buf     (wbuf_sync),

.I_R_en      (S_video_in_vs),
.I_R_rclk    (S_pclkx1),
.I_R_tready  (S_video_in_ready),
.O_R_tuser   (),
.O_R_tvalid  (),
.O_R_tdata   (S_video_in_data),
.O_R_tlast   (),
.O_R_sync_cnt(),
.I_R_buf     (rbuf_sync),
.O_R_vrst    (S_R_vrst),

.O_fdma_waddr (fdma_waddr),
.O_fdma_wareq (fdma_wareq),
.O_fdma_wsize (fdma_wsize),
.I_fdma_wbusy (fdma_wbusy),
.O_fdma_wdata (fdma_wdata),
.I_fdma_wvalid(fdma_wvalid),
.O_fdma_wready(fdma_wready),
.O_fdma_raddr (fdma_raddr),
.O_fdma_rareq (fdma_rareq),
.O_fdma_rsize (fdma_rsize),
.I_fdma_rbusy (fdma_rbusy),
.I_fdma_rdata (fdma_rdata),
.I_fdma_rvalid(fdma_rvalid),
.O_fdma_rready(fdma_rready)
//.O_fmda_wbuf  	(fdma_wbuf	),	
//.O_fdma_wirq  	(fdma_wirq	),		
//.O_fmda_rbuf  	(fdma_rbuf	),	
//.O_fdma_rirq  	(fdma_rirq	)
);


//hdmi 输出IP
hdmi_tx #(  
//1080P @ 137.5M
.H_ActiveSize       (1920), //视频时间参数,行视频信号，一行有效(需要显示的部分)像素所占的时钟数，一个时钟对应一个有效像素
.H_SyncStart        (1920+88), //视频时间参数,行同步开始，即多少时钟数后开始产生行同步信号 
.H_SyncEnd          (1920+88+44),//视频时间参数,行同步结束，即多少时钟数后停止产生行同步信号，之后就是行有效数据部分
.H_FrameSize        (1920+88+44+16), //视频时间参数,行视频信号，一行视频信号总计占用的时钟数
.V_ActiveSize       (1080),//视频时间参数,场视频信号，一帧图像所占用的有效(需要显示的部分)行数量，通常说的视频分辨率即H_ActiveSize*V_ActiveSize
.V_SyncStart        (1080+4),//视频时间参数,场同步开始，即多少行数后开始产生场同步信号 
.V_SyncEnd          (1080+4+5), //视频时间参数,场同步结束，多少行后停止产生长同步信号  
.V_FrameSize        (1080+4+5+19), //视频时间参数,场视频信号，一帧视频信号总计占用的行数量    

.VIDEO_VIC(16),
.VIDEO_TPG          ("Disable"                  ),
.VIDEO_FORMAT       ("RGB444"                   ), 
.DEVICE             ("PH1A_HP"                  ) //"EF2","EF3","EF4","SF1","EG","PH1A","PH1P","DR1","PH2A"
) u_hdmi_tx (
.I_pixel_clk        (S_pclkx1                   ),  
.I_serial_clk       (S_pclkx5                   ),  
.I_rst              (S_R_vrst                   ), 
.I_video_in_data    (S_video_in_data            ),  
.O_video_in_de      (S_video_in_ready           ),
.O_video_in_vs      (S_video_in_vs              ),
.O_hdmi_clk_p       (O_hdmi_clk_p               ),  
.O_hdmi_tx_p        (O_hdmi_tx_p                )  
) ;

    
endmodule
