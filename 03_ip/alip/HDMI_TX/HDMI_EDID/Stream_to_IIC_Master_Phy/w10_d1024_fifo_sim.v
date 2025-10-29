// Verilog netlist created by Tang Dynasty v5.5.45522
// Thu Mar  3 09:48:25 2022

`timescale 1ns / 1ps
module w11_d1024_fifo  // w10_d1024_fifo.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  dout,
  empty_flag,
  full_flag,
  rdusedw,
  wrusedw
  );

  input clk;  // w10_d1024_fifo.v(24)
  input [10:0] di;  // w10_d1024_fifo.v(23)
  input re;  // w10_d1024_fifo.v(25)
  input rst;  // w10_d1024_fifo.v(22)
  input we;  // w10_d1024_fifo.v(24)
  output [10:0] dout;  // w10_d1024_fifo.v(27)
  output empty_flag;  // w10_d1024_fifo.v(28)
  output full_flag;  // w10_d1024_fifo.v(29)
  output [10:0] rdusedw;  // w10_d1024_fifo.v(30)
  output [10:0] wrusedw;  // w10_d1024_fifo.v(31)

  wire logic_ramfifo_syn_1;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_2;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_3;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_4;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_5;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_6;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_7;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_8;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_9;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_10;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_11;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_12;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_13;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_14;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_15;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_16;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_17;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_18;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_19;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_20;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_21;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_22;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_23;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_24;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_25;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_26;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_27;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_28;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_29;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_30;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_31;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_32;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_33;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_45;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_46;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_47;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_48;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_49;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_50;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_51;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_52;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_53;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_54;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_55;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_56;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_57;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_58;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_59;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_60;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_61;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_62;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_63;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_64;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_65;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_66;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_67;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_68;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_69;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_70;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_71;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_72;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_73;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_74;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_75;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_76;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_78;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_79;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_80;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_81;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_82;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_83;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_84;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_85;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_86;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_87;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_88;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_89;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_90;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_91;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_92;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_93;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_94;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_95;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_96;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_97;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_98;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_99;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_100;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_101;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_102;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_103;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_104;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_105;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_106;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_107;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_108;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_109;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_147;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_149;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_153;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_154;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_155;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_156;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_157;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_158;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_159;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_160;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_161;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_162;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_163;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_164;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_168;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_170;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_195;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_215;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_216;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_217;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_218;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_219;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_220;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_221;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_222;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_223;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_224;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_225;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_243;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_245;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_247;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_249;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_251;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_253;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_255;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_257;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_259;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_261;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_266;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_268;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_270;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_272;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_274;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_276;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_278;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_280;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_282;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_286;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_288;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_290;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_292;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_294;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_296;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_298;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_300;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_302;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_304;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_309;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_311;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_313;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_315;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_317;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_319;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_321;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_323;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_325;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_524;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_525;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_526;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_527;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_528;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_529;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_530;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_531;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_532;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_533;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_534;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_535;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_536;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_537;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_538;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_539;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_540;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_541;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_542;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_543;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_544;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_590;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_591;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_592;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_593;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_594;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_595;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_596;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_597;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_598;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_599;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_600;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_601;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_602;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_603;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_604;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_605;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_606;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_607;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_608;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_609;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_610;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_657;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_658;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_659;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_660;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_661;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_662;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_663;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_664;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_665;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_666;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_667;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_715;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_716;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_717;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_718;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_719;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_720;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_721;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_722;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_723;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_724;  // w10_d1024_fifo.v(39)
  wire logic_ramfifo_syn_725;  // w10_d1024_fifo.v(39)
  wire clk_syn_1;  // w10_d1024_fifo.v(24)
  wire clk_syn_2;  // w10_d1024_fifo.v(24)
  wire clk_syn_3;  // w10_d1024_fifo.v(24)
  wire clk_syn_4;  // w10_d1024_fifo.v(24)
  wire clk_syn_5;  // w10_d1024_fifo.v(24)
  wire clk_syn_6;  // w10_d1024_fifo.v(24)
  wire clk_syn_7;  // w10_d1024_fifo.v(24)
  wire clk_syn_8;  // w10_d1024_fifo.v(24)
  wire clk_syn_9;  // w10_d1024_fifo.v(24)
  wire clk_syn_10;  // w10_d1024_fifo.v(24)
  wire clk_syn_11;  // w10_d1024_fifo.v(24)
  wire clk_syn_12;  // w10_d1024_fifo.v(24)
  wire clk_syn_14;  // w10_d1024_fifo.v(24)
  wire clk_syn_16;  // w10_d1024_fifo.v(24)
  wire clk_syn_18;  // w10_d1024_fifo.v(24)
  wire clk_syn_20;  // w10_d1024_fifo.v(24)
  wire clk_syn_22;  // w10_d1024_fifo.v(24)
  wire clk_syn_24;  // w10_d1024_fifo.v(24)
  wire clk_syn_26;  // w10_d1024_fifo.v(24)
  wire clk_syn_28;  // w10_d1024_fifo.v(24)
  wire clk_syn_30;  // w10_d1024_fifo.v(24)
  wire clk_syn_32;  // w10_d1024_fifo.v(24)
  wire clk_syn_34;  // w10_d1024_fifo.v(24)
  wire clk_syn_40;  // w10_d1024_fifo.v(24)
  wire clk_syn_42;  // w10_d1024_fifo.v(24)
  wire clk_syn_44;  // w10_d1024_fifo.v(24)
  wire clk_syn_46;  // w10_d1024_fifo.v(24)
  wire clk_syn_48;  // w10_d1024_fifo.v(24)
  wire clk_syn_50;  // w10_d1024_fifo.v(24)
  wire clk_syn_52;  // w10_d1024_fifo.v(24)
  wire clk_syn_54;  // w10_d1024_fifo.v(24)
  wire clk_syn_56;  // w10_d1024_fifo.v(24)
  wire clk_syn_58;  // w10_d1024_fifo.v(24)
  wire clk_syn_60;  // w10_d1024_fifo.v(24)
  wire clk_syn_62;  // w10_d1024_fifo.v(24)
  wire clk_syn_64;  // w10_d1024_fifo.v(24)
  wire clk_syn_66;  // w10_d1024_fifo.v(24)
  wire clk_syn_68;  // w10_d1024_fifo.v(24)
  wire clk_syn_70;  // w10_d1024_fifo.v(24)
  wire clk_syn_72;  // w10_d1024_fifo.v(24)
  wire clk_syn_74;  // w10_d1024_fifo.v(24)
  wire clk_syn_76;  // w10_d1024_fifo.v(24)
  wire clk_syn_78;  // w10_d1024_fifo.v(24)
  wire clk_syn_80;  // w10_d1024_fifo.v(24)
  wire clk_syn_81;  // w10_d1024_fifo.v(24)
  wire clk_syn_82;  // w10_d1024_fifo.v(24)
  wire clk_syn_83;  // w10_d1024_fifo.v(24)
  wire clk_syn_84;  // w10_d1024_fifo.v(24)
  wire clk_syn_85;  // w10_d1024_fifo.v(24)
  wire clk_syn_86;  // w10_d1024_fifo.v(24)
  wire clk_syn_87;  // w10_d1024_fifo.v(24)
  wire clk_syn_88;  // w10_d1024_fifo.v(24)
  wire clk_syn_89;  // w10_d1024_fifo.v(24)
  wire clk_syn_90;  // w10_d1024_fifo.v(24)
  wire clk_syn_91;  // w10_d1024_fifo.v(24)
  wire clk_syn_92;  // w10_d1024_fifo.v(24)
  wire clk_syn_94;  // w10_d1024_fifo.v(24)
  wire clk_syn_95;  // w10_d1024_fifo.v(24)
  wire clk_syn_96;  // w10_d1024_fifo.v(24)
  wire clk_syn_97;  // w10_d1024_fifo.v(24)
  wire clk_syn_98;  // w10_d1024_fifo.v(24)
  wire clk_syn_99;  // w10_d1024_fifo.v(24)
  wire clk_syn_100;  // w10_d1024_fifo.v(24)
  wire clk_syn_101;  // w10_d1024_fifo.v(24)
  wire clk_syn_102;  // w10_d1024_fifo.v(24)
  wire clk_syn_103;  // w10_d1024_fifo.v(24)
  wire clk_syn_104;  // w10_d1024_fifo.v(24)
  wire clk_syn_105;  // w10_d1024_fifo.v(24)
  wire clk_syn_107;  // w10_d1024_fifo.v(24)
  wire clk_syn_109;  // w10_d1024_fifo.v(24)
  wire clk_syn_111;  // w10_d1024_fifo.v(24)
  wire clk_syn_113;  // w10_d1024_fifo.v(24)
  wire clk_syn_115;  // w10_d1024_fifo.v(24)
  wire clk_syn_117;  // w10_d1024_fifo.v(24)
  wire clk_syn_119;  // w10_d1024_fifo.v(24)
  wire clk_syn_121;  // w10_d1024_fifo.v(24)
  wire clk_syn_123;  // w10_d1024_fifo.v(24)
  wire clk_syn_125;  // w10_d1024_fifo.v(24)
  wire clk_syn_127;  // w10_d1024_fifo.v(24)
  wire clk_syn_133;  // w10_d1024_fifo.v(24)
  wire clk_syn_135;  // w10_d1024_fifo.v(24)
  wire clk_syn_137;  // w10_d1024_fifo.v(24)
  wire clk_syn_139;  // w10_d1024_fifo.v(24)
  wire clk_syn_141;  // w10_d1024_fifo.v(24)
  wire clk_syn_143;  // w10_d1024_fifo.v(24)
  wire clk_syn_145;  // w10_d1024_fifo.v(24)
  wire clk_syn_147;  // w10_d1024_fifo.v(24)
  wire clk_syn_149;  // w10_d1024_fifo.v(24)
  wire clk_syn_151;  // w10_d1024_fifo.v(24)
  wire clk_syn_153;  // w10_d1024_fifo.v(24)
  wire clk_syn_155;  // w10_d1024_fifo.v(24)
  wire clk_syn_157;  // w10_d1024_fifo.v(24)
  wire clk_syn_159;  // w10_d1024_fifo.v(24)
  wire clk_syn_161;  // w10_d1024_fifo.v(24)
  wire clk_syn_163;  // w10_d1024_fifo.v(24)
  wire clk_syn_165;  // w10_d1024_fifo.v(24)
  wire clk_syn_167;  // w10_d1024_fifo.v(24)
  wire clk_syn_169;  // w10_d1024_fifo.v(24)
  wire clk_syn_171;  // w10_d1024_fifo.v(24)
  wire clk_syn_173;  // w10_d1024_fifo.v(24)
  wire clk_syn_174;  // w10_d1024_fifo.v(24)
  wire clk_syn_175;  // w10_d1024_fifo.v(24)
  wire clk_syn_176;  // w10_d1024_fifo.v(24)
  wire clk_syn_177;  // w10_d1024_fifo.v(24)
  wire clk_syn_178;  // w10_d1024_fifo.v(24)
  wire clk_syn_179;  // w10_d1024_fifo.v(24)
  wire clk_syn_180;  // w10_d1024_fifo.v(24)
  wire clk_syn_181;  // w10_d1024_fifo.v(24)
  wire clk_syn_182;  // w10_d1024_fifo.v(24)
  wire clk_syn_183;  // w10_d1024_fifo.v(24)
  wire clk_syn_184;  // w10_d1024_fifo.v(24)
  wire clk_syn_185;  // w10_d1024_fifo.v(24)
  wire we_syn_2;  // w10_d1024_fifo.v(24)
  wire re_syn_2;  // w10_d1024_fifo.v(25)
  wire _al_n1_syn_4;
  wire _al_n1_syn_6;
  wire _al_n1_syn_8;
  wire _al_n1_syn_10;
  wire _al_n1_syn_12;
  wire _al_n1_syn_14;
  wire _al_n1_syn_16;
  wire _al_n1_syn_18;
  wire _al_n1_syn_20;
  wire _al_n1_syn_28;
  wire _al_n1_syn_30;
  wire _al_n1_syn_32;
  wire _al_n1_syn_34;
  wire _al_n1_syn_36;
  wire _al_n1_syn_38;
  wire _al_n1_syn_40;
  wire _al_n1_syn_42;
  wire _al_n1_syn_44;

  and _al_n1_syn_11 (_al_n1_syn_12, _al_n1_syn_10, clk_syn_26);
  and _al_n1_syn_13 (_al_n1_syn_14, _al_n1_syn_12, clk_syn_28);
  and _al_n1_syn_15 (_al_n1_syn_16, _al_n1_syn_14, clk_syn_30);
  and _al_n1_syn_17 (_al_n1_syn_18, _al_n1_syn_16, clk_syn_32);
  and _al_n1_syn_19 (_al_n1_syn_20, _al_n1_syn_18, clk_syn_34);
  and _al_n1_syn_27 (_al_n1_syn_28, clk_syn_109, clk_syn_111);
  and _al_n1_syn_29 (_al_n1_syn_30, _al_n1_syn_28, clk_syn_113);
  and _al_n1_syn_3 (_al_n1_syn_4, clk_syn_16, clk_syn_18);
  and _al_n1_syn_31 (_al_n1_syn_32, _al_n1_syn_30, clk_syn_115);
  and _al_n1_syn_33 (_al_n1_syn_34, _al_n1_syn_32, clk_syn_117);
  and _al_n1_syn_35 (_al_n1_syn_36, _al_n1_syn_34, clk_syn_119);
  and _al_n1_syn_37 (_al_n1_syn_38, _al_n1_syn_36, clk_syn_121);
  and _al_n1_syn_39 (_al_n1_syn_40, _al_n1_syn_38, clk_syn_123);
  and _al_n1_syn_41 (_al_n1_syn_42, _al_n1_syn_40, clk_syn_125);
  and _al_n1_syn_43 (_al_n1_syn_44, _al_n1_syn_42, clk_syn_127);
  and _al_n1_syn_5 (_al_n1_syn_6, _al_n1_syn_4, clk_syn_20);
  and _al_n1_syn_7 (_al_n1_syn_8, _al_n1_syn_6, clk_syn_22);
  and _al_n1_syn_9 (_al_n1_syn_10, _al_n1_syn_8, clk_syn_24);
  or clk_syn_106 (clk_syn_107, clk_syn_105, clk_syn_104);  // w10_d1024_fifo.v(24)
  not clk_syn_108 (clk_syn_109, clk_syn_94);  // w10_d1024_fifo.v(24)
  not clk_syn_110 (clk_syn_111, clk_syn_95);  // w10_d1024_fifo.v(24)
  not clk_syn_112 (clk_syn_113, clk_syn_96);  // w10_d1024_fifo.v(24)
  not clk_syn_114 (clk_syn_115, clk_syn_97);  // w10_d1024_fifo.v(24)
  not clk_syn_116 (clk_syn_117, clk_syn_98);  // w10_d1024_fifo.v(24)
  not clk_syn_118 (clk_syn_119, clk_syn_99);  // w10_d1024_fifo.v(24)
  not clk_syn_120 (clk_syn_121, clk_syn_100);  // w10_d1024_fifo.v(24)
  not clk_syn_122 (clk_syn_123, clk_syn_101);  // w10_d1024_fifo.v(24)
  not clk_syn_124 (clk_syn_125, clk_syn_102);  // w10_d1024_fifo.v(24)
  not clk_syn_126 (clk_syn_127, clk_syn_103);  // w10_d1024_fifo.v(24)
  or clk_syn_13 (clk_syn_14, clk_syn_12, clk_syn_11);  // w10_d1024_fifo.v(24)
  xor clk_syn_132 (clk_syn_133, clk_syn_95, clk_syn_94);  // w10_d1024_fifo.v(24)
  and clk_syn_134 (clk_syn_135, clk_syn_95, clk_syn_109);  // w10_d1024_fifo.v(24)
  xor clk_syn_136 (clk_syn_137, clk_syn_96, clk_syn_135);  // w10_d1024_fifo.v(24)
  and clk_syn_138 (clk_syn_139, clk_syn_96, _al_n1_syn_28);  // w10_d1024_fifo.v(24)
  xor clk_syn_140 (clk_syn_141, clk_syn_97, clk_syn_139);  // w10_d1024_fifo.v(24)
  and clk_syn_142 (clk_syn_143, clk_syn_97, _al_n1_syn_30);  // w10_d1024_fifo.v(24)
  xor clk_syn_144 (clk_syn_145, clk_syn_98, clk_syn_143);  // w10_d1024_fifo.v(24)
  and clk_syn_146 (clk_syn_147, clk_syn_98, _al_n1_syn_32);  // w10_d1024_fifo.v(24)
  xor clk_syn_148 (clk_syn_149, clk_syn_99, clk_syn_147);  // w10_d1024_fifo.v(24)
  not clk_syn_15 (clk_syn_16, clk_syn_1);  // w10_d1024_fifo.v(24)
  and clk_syn_150 (clk_syn_151, clk_syn_99, _al_n1_syn_34);  // w10_d1024_fifo.v(24)
  xor clk_syn_152 (clk_syn_153, clk_syn_100, clk_syn_151);  // w10_d1024_fifo.v(24)
  and clk_syn_154 (clk_syn_155, clk_syn_100, _al_n1_syn_36);  // w10_d1024_fifo.v(24)
  xor clk_syn_156 (clk_syn_157, clk_syn_101, clk_syn_155);  // w10_d1024_fifo.v(24)
  and clk_syn_158 (clk_syn_159, clk_syn_101, _al_n1_syn_38);  // w10_d1024_fifo.v(24)
  xor clk_syn_160 (clk_syn_161, clk_syn_102, clk_syn_159);  // w10_d1024_fifo.v(24)
  and clk_syn_162 (clk_syn_163, clk_syn_102, _al_n1_syn_40);  // w10_d1024_fifo.v(24)
  xor clk_syn_164 (clk_syn_165, clk_syn_103, clk_syn_163);  // w10_d1024_fifo.v(24)
  and clk_syn_166 (clk_syn_167, clk_syn_103, _al_n1_syn_42);  // w10_d1024_fifo.v(24)
  xor clk_syn_168 (clk_syn_169, clk_syn_104, clk_syn_167);  // w10_d1024_fifo.v(24)
  not clk_syn_17 (clk_syn_18, clk_syn_2);  // w10_d1024_fifo.v(24)
  and clk_syn_170 (clk_syn_171, clk_syn_107, _al_n1_syn_44);  // w10_d1024_fifo.v(24)
  xor clk_syn_172 (clk_syn_173, clk_syn_105, clk_syn_171);  // w10_d1024_fifo.v(24)
  not clk_syn_19 (clk_syn_20, clk_syn_3);  // w10_d1024_fifo.v(24)
  not clk_syn_21 (clk_syn_22, clk_syn_4);  // w10_d1024_fifo.v(24)
  not clk_syn_23 (clk_syn_24, clk_syn_5);  // w10_d1024_fifo.v(24)
  not clk_syn_25 (clk_syn_26, clk_syn_6);  // w10_d1024_fifo.v(24)
  not clk_syn_27 (clk_syn_28, clk_syn_7);  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_280 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_81),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_1));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_281 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_82),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_2));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_282 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_83),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_3));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_283 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_84),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_4));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_284 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_85),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_5));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_285 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_86),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_6));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_286 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_87),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_7));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_287 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_8));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_288 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_89),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_9));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_289 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_90),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_10));  // w10_d1024_fifo.v(24)
  not clk_syn_29 (clk_syn_30, clk_syn_8);  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_290 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_91),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_11));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_291 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_92),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_12));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_292 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_174),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_94));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_293 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_175),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_95));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_294 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_176),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_96));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_295 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_177),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_97));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_296 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_178),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_98));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_297 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_179),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_99));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_298 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_180),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_100));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_299 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_181),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_101));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_300 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_182),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_102));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_301 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_183),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_103));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_302 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_184),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_104));  // w10_d1024_fifo.v(24)
  AL_DFF_X clk_syn_303 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_185),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_105));  // w10_d1024_fifo.v(24)
  not clk_syn_31 (clk_syn_32, clk_syn_9);  // w10_d1024_fifo.v(24)
  not clk_syn_33 (clk_syn_34, clk_syn_10);  // w10_d1024_fifo.v(24)
  xor clk_syn_39 (clk_syn_40, clk_syn_2, clk_syn_1);  // w10_d1024_fifo.v(24)
  and clk_syn_41 (clk_syn_42, clk_syn_2, clk_syn_16);  // w10_d1024_fifo.v(24)
  xor clk_syn_43 (clk_syn_44, clk_syn_3, clk_syn_42);  // w10_d1024_fifo.v(24)
  and clk_syn_45 (clk_syn_46, clk_syn_3, _al_n1_syn_4);  // w10_d1024_fifo.v(24)
  xor clk_syn_47 (clk_syn_48, clk_syn_4, clk_syn_46);  // w10_d1024_fifo.v(24)
  and clk_syn_49 (clk_syn_50, clk_syn_4, _al_n1_syn_6);  // w10_d1024_fifo.v(24)
  xor clk_syn_51 (clk_syn_52, clk_syn_5, clk_syn_50);  // w10_d1024_fifo.v(24)
  and clk_syn_53 (clk_syn_54, clk_syn_5, _al_n1_syn_8);  // w10_d1024_fifo.v(24)
  xor clk_syn_55 (clk_syn_56, clk_syn_6, clk_syn_54);  // w10_d1024_fifo.v(24)
  and clk_syn_57 (clk_syn_58, clk_syn_6, _al_n1_syn_10);  // w10_d1024_fifo.v(24)
  xor clk_syn_59 (clk_syn_60, clk_syn_7, clk_syn_58);  // w10_d1024_fifo.v(24)
  and clk_syn_61 (clk_syn_62, clk_syn_7, _al_n1_syn_12);  // w10_d1024_fifo.v(24)
  xor clk_syn_63 (clk_syn_64, clk_syn_8, clk_syn_62);  // w10_d1024_fifo.v(24)
  and clk_syn_65 (clk_syn_66, clk_syn_8, _al_n1_syn_14);  // w10_d1024_fifo.v(24)
  xor clk_syn_67 (clk_syn_68, clk_syn_9, clk_syn_66);  // w10_d1024_fifo.v(24)
  and clk_syn_69 (clk_syn_70, clk_syn_9, _al_n1_syn_16);  // w10_d1024_fifo.v(24)
  xor clk_syn_71 (clk_syn_72, clk_syn_10, clk_syn_70);  // w10_d1024_fifo.v(24)
  and clk_syn_73 (clk_syn_74, clk_syn_10, _al_n1_syn_18);  // w10_d1024_fifo.v(24)
  xor clk_syn_75 (clk_syn_76, clk_syn_11, clk_syn_74);  // w10_d1024_fifo.v(24)
  and clk_syn_77 (clk_syn_78, clk_syn_14, _al_n1_syn_20);  // w10_d1024_fifo.v(24)
  xor clk_syn_79 (clk_syn_80, clk_syn_12, clk_syn_78);  // w10_d1024_fifo.v(24)
  PH1_PHY_CONFIG_V2 #(
    .JTAG_PERSISTN("DISABLE"),
    .SPIX4_PERSISTN("ENABLE"))
    config_inst ();
  not logic_ramfifo_syn_146 (logic_ramfifo_syn_147, logic_ramfifo_syn_54);  // w10_d1024_fifo.v(39)
  not logic_ramfifo_syn_148 (logic_ramfifo_syn_149, logic_ramfifo_syn_55);  // w10_d1024_fifo.v(39)
  not logic_ramfifo_syn_152 (logic_ramfifo_syn_153, full_flag);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_167 (logic_ramfifo_syn_168, logic_ramfifo_syn_33, logic_ramfifo_syn_32);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_169 (logic_ramfifo_syn_170, logic_ramfifo_syn_11, logic_ramfifo_syn_10);  // w10_d1024_fifo.v(39)
  not logic_ramfifo_syn_194 (logic_ramfifo_syn_195, empty_flag);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_242 (logic_ramfifo_syn_243, logic_ramfifo_syn_55, logic_ramfifo_syn_54);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_244 (logic_ramfifo_syn_245, logic_ramfifo_syn_243, logic_ramfifo_syn_53);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_246 (logic_ramfifo_syn_247, logic_ramfifo_syn_245, logic_ramfifo_syn_52);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_248 (logic_ramfifo_syn_249, logic_ramfifo_syn_247, logic_ramfifo_syn_51);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_250 (logic_ramfifo_syn_251, logic_ramfifo_syn_249, logic_ramfifo_syn_50);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_252 (logic_ramfifo_syn_253, logic_ramfifo_syn_251, logic_ramfifo_syn_49);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_254 (logic_ramfifo_syn_255, logic_ramfifo_syn_253, logic_ramfifo_syn_48);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_256 (logic_ramfifo_syn_257, logic_ramfifo_syn_255, logic_ramfifo_syn_47);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_258 (logic_ramfifo_syn_259, logic_ramfifo_syn_257, logic_ramfifo_syn_46);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_260 (logic_ramfifo_syn_261, logic_ramfifo_syn_259, logic_ramfifo_syn_45);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_265 (logic_ramfifo_syn_266, logic_ramfifo_syn_170, logic_ramfifo_syn_9);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_267 (logic_ramfifo_syn_268, logic_ramfifo_syn_266, logic_ramfifo_syn_8);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_269 (logic_ramfifo_syn_270, logic_ramfifo_syn_268, logic_ramfifo_syn_7);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_271 (logic_ramfifo_syn_272, logic_ramfifo_syn_270, logic_ramfifo_syn_6);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_273 (logic_ramfifo_syn_274, logic_ramfifo_syn_272, logic_ramfifo_syn_5);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_275 (logic_ramfifo_syn_276, logic_ramfifo_syn_274, logic_ramfifo_syn_4);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_277 (logic_ramfifo_syn_278, logic_ramfifo_syn_276, logic_ramfifo_syn_3);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_279 (logic_ramfifo_syn_280, logic_ramfifo_syn_278, logic_ramfifo_syn_2);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_281 (logic_ramfifo_syn_282, logic_ramfifo_syn_280, logic_ramfifo_syn_1);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_285 (logic_ramfifo_syn_286, logic_ramfifo_syn_88, logic_ramfifo_syn_87);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_287 (logic_ramfifo_syn_288, logic_ramfifo_syn_286, logic_ramfifo_syn_86);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_289 (logic_ramfifo_syn_290, logic_ramfifo_syn_288, logic_ramfifo_syn_85);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_291 (logic_ramfifo_syn_292, logic_ramfifo_syn_290, logic_ramfifo_syn_84);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_293 (logic_ramfifo_syn_294, logic_ramfifo_syn_292, logic_ramfifo_syn_83);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_295 (logic_ramfifo_syn_296, logic_ramfifo_syn_294, logic_ramfifo_syn_82);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_297 (logic_ramfifo_syn_298, logic_ramfifo_syn_296, logic_ramfifo_syn_81);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_299 (logic_ramfifo_syn_300, logic_ramfifo_syn_298, logic_ramfifo_syn_80);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_301 (logic_ramfifo_syn_302, logic_ramfifo_syn_300, logic_ramfifo_syn_79);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_303 (logic_ramfifo_syn_304, logic_ramfifo_syn_302, logic_ramfifo_syn_78);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_308 (logic_ramfifo_syn_309, logic_ramfifo_syn_168, logic_ramfifo_syn_31);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_310 (logic_ramfifo_syn_311, logic_ramfifo_syn_309, logic_ramfifo_syn_30);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_312 (logic_ramfifo_syn_313, logic_ramfifo_syn_311, logic_ramfifo_syn_29);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_314 (logic_ramfifo_syn_315, logic_ramfifo_syn_313, logic_ramfifo_syn_28);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_316 (logic_ramfifo_syn_317, logic_ramfifo_syn_315, logic_ramfifo_syn_27);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_318 (logic_ramfifo_syn_319, logic_ramfifo_syn_317, logic_ramfifo_syn_26);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_320 (logic_ramfifo_syn_321, logic_ramfifo_syn_319, logic_ramfifo_syn_25);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_322 (logic_ramfifo_syn_323, logic_ramfifo_syn_321, logic_ramfifo_syn_24);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_324 (logic_ramfifo_syn_325, logic_ramfifo_syn_323, logic_ramfifo_syn_23);  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_354 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_154),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_1));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_355 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_155),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_2));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_356 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_156),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_3));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_357 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_157),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_4));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_358 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_158),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_5));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_359 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_159),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_6));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_360 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_160),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_7));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_361 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_161),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_8));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_362 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_162),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_9));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_363 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_163),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_10));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_364 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_164),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_11));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_365 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_12));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_366 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_2),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_13));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_367 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_14));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_368 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_4),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_15));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_369 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_5),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_16));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_370 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_6),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_17));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_371 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_7),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_18));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_372 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_8),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_19));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_373 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_9),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_20));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_374 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_10),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_21));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_375 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_11),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_22));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_379 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_215),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_23));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_380 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_216),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_24));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_381 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_217),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_25));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_382 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_218),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_26));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_383 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_219),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_27));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_384 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_220),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_28));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_385 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_221),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_29));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_386 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_222),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_30));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_387 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_223),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_31));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_388 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_224),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_32));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_389 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_225),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_33));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_401 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_23),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_45));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_402 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_24),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_46));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_403 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_25),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_47));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_404 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_26),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_48));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_405 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_27),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_49));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_406 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_28),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_50));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_407 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_29),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_51));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_408 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_30),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_52));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_409 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_31),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_53));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_410 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_32),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_54));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_411 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_33),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_55));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_412 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_261),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_56));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_413 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_259),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_57));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_414 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_257),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_58));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_415 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_255),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_59));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_416 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_253),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_60));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_417 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_251),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_61));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_418 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_249),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_62));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_419 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_247),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_63));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_420 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_245),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_64));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_421 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_243),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_65));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_422 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_55),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_66));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_423 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_282),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_67));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_424 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_280),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_68));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_425 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_278),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_69));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_426 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_276),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_70));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_427 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_274),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_71));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_428 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_272),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_72));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_429 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_270),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_73));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_430 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_268),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_74));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_431 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_266),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_75));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_432 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_170),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_76));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_434 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_12),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_78));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_435 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_13),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_79));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_436 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_14),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_80));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_437 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_15),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_81));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_438 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_16),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_82));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_439 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_17),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_83));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_440 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_18),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_84));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_441 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_19),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_85));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_442 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_20),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_86));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_443 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_21),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_87));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_444 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_22),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_88));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_445 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_304),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_89));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_446 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_302),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_90));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_447 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_300),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_91));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_448 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_298),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_92));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_449 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_296),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_93));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_450 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_294),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_94));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_451 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_292),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_95));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_452 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_290),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_96));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_453 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_288),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_97));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_454 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_286),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_98));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_455 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_99));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_456 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_325),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_100));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_457 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_323),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_101));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_458 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_321),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_102));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_459 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_319),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_103));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_460 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_317),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_104));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_461 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_315),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_105));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_462 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_313),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_106));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_463 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_311),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_107));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_464 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_309),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_108));  // w10_d1024_fifo.v(39)
  AL_DFF_X logic_ramfifo_syn_465 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_168),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_109));  // w10_d1024_fifo.v(39)
  // address_offset=0;data_offset=0;depth=1024;width=11;num_section=1;width_per_section=11;section_size=11;working_depth=1024;working_width=20;working_numbyte=2;mode_ecc=0;address_step=1;bytes_in_per_section=1;
  // logic_ramfifo_syn_327_1024x11
  PH1_PHY_ERAM #(
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("20"),
    .DATA_WIDTH_B("20"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP20K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE_A("SYNC"),
    .RESETMODE_B("SYNC"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    logic_ramfifo_syn_467 (
    .addra({logic_ramfifo_syn_170,logic_ramfifo_syn_9,logic_ramfifo_syn_8,logic_ramfifo_syn_7,logic_ramfifo_syn_6,logic_ramfifo_syn_5,logic_ramfifo_syn_4,logic_ramfifo_syn_3,logic_ramfifo_syn_2,logic_ramfifo_syn_1,4'b1111}),
    .addrb({logic_ramfifo_syn_168,logic_ramfifo_syn_31,logic_ramfifo_syn_30,logic_ramfifo_syn_29,logic_ramfifo_syn_28,logic_ramfifo_syn_27,logic_ramfifo_syn_26,logic_ramfifo_syn_25,logic_ramfifo_syn_24,logic_ramfifo_syn_23,4'b1111}),
    .clka(clk),
    .clkb(clk),
    .csb({re_syn_2,open_n230,open_n231}),
    .dia({open_n232,open_n233,open_n234,open_n235,open_n236,open_n237,open_n238,di[10],di[8:5],di[3:0]}),
    .dia_extra({open_n239,open_n240,di[9],di[4]}),
    .ecc_dbiterrinj(1'b0),
    .ecc_sbiterrinj(1'b0),
    .orsta(rst),
    .orstb(rst),
    .wea(we_syn_2),
    .dob({open_n342,open_n343,open_n344,open_n345,open_n346,open_n347,open_n348,dout[10],dout[8:5],dout[3:0]}),
    .dob_extra({open_n349,open_n350,dout[9],dout[4]}));  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_479 (logic_ramfifo_syn_524, logic_ramfifo_syn_1, logic_ramfifo_syn_45);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_480 (logic_ramfifo_syn_525, logic_ramfifo_syn_2, logic_ramfifo_syn_46);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_481 (logic_ramfifo_syn_526, logic_ramfifo_syn_3, logic_ramfifo_syn_47);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_482 (logic_ramfifo_syn_527, logic_ramfifo_syn_4, logic_ramfifo_syn_48);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_483 (logic_ramfifo_syn_528, logic_ramfifo_syn_5, logic_ramfifo_syn_49);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_484 (logic_ramfifo_syn_529, logic_ramfifo_syn_6, logic_ramfifo_syn_50);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_485 (logic_ramfifo_syn_530, logic_ramfifo_syn_7, logic_ramfifo_syn_51);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_486 (logic_ramfifo_syn_531, logic_ramfifo_syn_8, logic_ramfifo_syn_52);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_487 (logic_ramfifo_syn_532, logic_ramfifo_syn_9, logic_ramfifo_syn_53);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_488 (logic_ramfifo_syn_533, logic_ramfifo_syn_10, logic_ramfifo_syn_147);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_489 (logic_ramfifo_syn_534, logic_ramfifo_syn_11, logic_ramfifo_syn_149);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_490 (logic_ramfifo_syn_535, logic_ramfifo_syn_524, logic_ramfifo_syn_525);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_491 (logic_ramfifo_syn_536, logic_ramfifo_syn_527, logic_ramfifo_syn_528);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_492 (logic_ramfifo_syn_537, logic_ramfifo_syn_526, logic_ramfifo_syn_536);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_493 (logic_ramfifo_syn_538, logic_ramfifo_syn_535, logic_ramfifo_syn_537);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_494 (logic_ramfifo_syn_539, logic_ramfifo_syn_530, logic_ramfifo_syn_531);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_495 (logic_ramfifo_syn_540, logic_ramfifo_syn_529, logic_ramfifo_syn_539);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_496 (logic_ramfifo_syn_541, logic_ramfifo_syn_533, logic_ramfifo_syn_534);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_497 (logic_ramfifo_syn_542, logic_ramfifo_syn_532, logic_ramfifo_syn_541);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_498 (logic_ramfifo_syn_543, logic_ramfifo_syn_540, logic_ramfifo_syn_542);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_499 (logic_ramfifo_syn_544, logic_ramfifo_syn_538, logic_ramfifo_syn_543);  // w10_d1024_fifo.v(39)
  not logic_ramfifo_syn_500 (full_flag, logic_ramfifo_syn_544);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_545 (logic_ramfifo_syn_590, logic_ramfifo_syn_78, logic_ramfifo_syn_23);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_546 (logic_ramfifo_syn_591, logic_ramfifo_syn_79, logic_ramfifo_syn_24);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_547 (logic_ramfifo_syn_592, logic_ramfifo_syn_80, logic_ramfifo_syn_25);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_548 (logic_ramfifo_syn_593, logic_ramfifo_syn_81, logic_ramfifo_syn_26);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_549 (logic_ramfifo_syn_594, logic_ramfifo_syn_82, logic_ramfifo_syn_27);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_550 (logic_ramfifo_syn_595, logic_ramfifo_syn_83, logic_ramfifo_syn_28);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_551 (logic_ramfifo_syn_596, logic_ramfifo_syn_84, logic_ramfifo_syn_29);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_552 (logic_ramfifo_syn_597, logic_ramfifo_syn_85, logic_ramfifo_syn_30);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_553 (logic_ramfifo_syn_598, logic_ramfifo_syn_86, logic_ramfifo_syn_31);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_554 (logic_ramfifo_syn_599, logic_ramfifo_syn_87, logic_ramfifo_syn_32);  // w10_d1024_fifo.v(39)
  xor logic_ramfifo_syn_555 (logic_ramfifo_syn_600, logic_ramfifo_syn_88, logic_ramfifo_syn_33);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_556 (logic_ramfifo_syn_601, logic_ramfifo_syn_590, logic_ramfifo_syn_591);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_557 (logic_ramfifo_syn_602, logic_ramfifo_syn_593, logic_ramfifo_syn_594);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_558 (logic_ramfifo_syn_603, logic_ramfifo_syn_592, logic_ramfifo_syn_602);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_559 (logic_ramfifo_syn_604, logic_ramfifo_syn_601, logic_ramfifo_syn_603);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_560 (logic_ramfifo_syn_605, logic_ramfifo_syn_596, logic_ramfifo_syn_597);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_561 (logic_ramfifo_syn_606, logic_ramfifo_syn_595, logic_ramfifo_syn_605);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_562 (logic_ramfifo_syn_607, logic_ramfifo_syn_599, logic_ramfifo_syn_600);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_563 (logic_ramfifo_syn_608, logic_ramfifo_syn_598, logic_ramfifo_syn_607);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_564 (logic_ramfifo_syn_609, logic_ramfifo_syn_606, logic_ramfifo_syn_608);  // w10_d1024_fifo.v(39)
  or logic_ramfifo_syn_565 (logic_ramfifo_syn_610, logic_ramfifo_syn_604, logic_ramfifo_syn_609);  // w10_d1024_fifo.v(39)
  not logic_ramfifo_syn_566 (empty_flag, logic_ramfifo_syn_610);  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_611 (
    .a(1'b0),
    .o({logic_ramfifo_syn_657,open_n355}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_612 (
    .a(logic_ramfifo_syn_67),
    .b(logic_ramfifo_syn_56),
    .c(logic_ramfifo_syn_657),
    .o({logic_ramfifo_syn_658,wrusedw[0]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_613 (
    .a(logic_ramfifo_syn_68),
    .b(logic_ramfifo_syn_57),
    .c(logic_ramfifo_syn_658),
    .o({logic_ramfifo_syn_659,wrusedw[1]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_614 (
    .a(logic_ramfifo_syn_69),
    .b(logic_ramfifo_syn_58),
    .c(logic_ramfifo_syn_659),
    .o({logic_ramfifo_syn_660,wrusedw[2]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_615 (
    .a(logic_ramfifo_syn_70),
    .b(logic_ramfifo_syn_59),
    .c(logic_ramfifo_syn_660),
    .o({logic_ramfifo_syn_661,wrusedw[3]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_616 (
    .a(logic_ramfifo_syn_71),
    .b(logic_ramfifo_syn_60),
    .c(logic_ramfifo_syn_661),
    .o({logic_ramfifo_syn_662,wrusedw[4]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_617 (
    .a(logic_ramfifo_syn_72),
    .b(logic_ramfifo_syn_61),
    .c(logic_ramfifo_syn_662),
    .o({logic_ramfifo_syn_663,wrusedw[5]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_618 (
    .a(logic_ramfifo_syn_73),
    .b(logic_ramfifo_syn_62),
    .c(logic_ramfifo_syn_663),
    .o({logic_ramfifo_syn_664,wrusedw[6]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_619 (
    .a(logic_ramfifo_syn_74),
    .b(logic_ramfifo_syn_63),
    .c(logic_ramfifo_syn_664),
    .o({logic_ramfifo_syn_665,wrusedw[7]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_620 (
    .a(logic_ramfifo_syn_75),
    .b(logic_ramfifo_syn_64),
    .c(logic_ramfifo_syn_665),
    .o({logic_ramfifo_syn_666,wrusedw[8]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_621 (
    .a(logic_ramfifo_syn_76),
    .b(logic_ramfifo_syn_65),
    .c(logic_ramfifo_syn_666),
    .o({logic_ramfifo_syn_667,wrusedw[9]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_622 (
    .a(logic_ramfifo_syn_22),
    .b(logic_ramfifo_syn_66),
    .c(logic_ramfifo_syn_667),
    .o({open_n356,wrusedw[10]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_669 (
    .a(1'b0),
    .o({logic_ramfifo_syn_715,open_n359}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_670 (
    .a(logic_ramfifo_syn_89),
    .b(logic_ramfifo_syn_100),
    .c(logic_ramfifo_syn_715),
    .o({logic_ramfifo_syn_716,rdusedw[0]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_671 (
    .a(logic_ramfifo_syn_90),
    .b(logic_ramfifo_syn_101),
    .c(logic_ramfifo_syn_716),
    .o({logic_ramfifo_syn_717,rdusedw[1]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_672 (
    .a(logic_ramfifo_syn_91),
    .b(logic_ramfifo_syn_102),
    .c(logic_ramfifo_syn_717),
    .o({logic_ramfifo_syn_718,rdusedw[2]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_673 (
    .a(logic_ramfifo_syn_92),
    .b(logic_ramfifo_syn_103),
    .c(logic_ramfifo_syn_718),
    .o({logic_ramfifo_syn_719,rdusedw[3]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_674 (
    .a(logic_ramfifo_syn_93),
    .b(logic_ramfifo_syn_104),
    .c(logic_ramfifo_syn_719),
    .o({logic_ramfifo_syn_720,rdusedw[4]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_675 (
    .a(logic_ramfifo_syn_94),
    .b(logic_ramfifo_syn_105),
    .c(logic_ramfifo_syn_720),
    .o({logic_ramfifo_syn_721,rdusedw[5]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_676 (
    .a(logic_ramfifo_syn_95),
    .b(logic_ramfifo_syn_106),
    .c(logic_ramfifo_syn_721),
    .o({logic_ramfifo_syn_722,rdusedw[6]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_677 (
    .a(logic_ramfifo_syn_96),
    .b(logic_ramfifo_syn_107),
    .c(logic_ramfifo_syn_722),
    .o({logic_ramfifo_syn_723,rdusedw[7]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_678 (
    .a(logic_ramfifo_syn_97),
    .b(logic_ramfifo_syn_108),
    .c(logic_ramfifo_syn_723),
    .o({logic_ramfifo_syn_724,rdusedw[8]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_679 (
    .a(logic_ramfifo_syn_98),
    .b(logic_ramfifo_syn_109),
    .c(logic_ramfifo_syn_724),
    .o({logic_ramfifo_syn_725,rdusedw[9]}));  // w10_d1024_fifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_680 (
    .a(logic_ramfifo_syn_99),
    .b(logic_ramfifo_syn_55),
    .c(logic_ramfifo_syn_725),
    .o({open_n360,rdusedw[10]}));  // w10_d1024_fifo.v(39)
  and re_syn_1 (re_syn_2, re, logic_ramfifo_syn_195);  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_196 (
    .i0(clk_syn_94),
    .i1(clk_syn_109),
    .sel(re_syn_2),
    .o(clk_syn_174));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_201 (
    .i0(clk_syn_95),
    .i1(clk_syn_133),
    .sel(re_syn_2),
    .o(clk_syn_175));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_206 (
    .i0(clk_syn_96),
    .i1(clk_syn_137),
    .sel(re_syn_2),
    .o(clk_syn_176));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_211 (
    .i0(clk_syn_97),
    .i1(clk_syn_141),
    .sel(re_syn_2),
    .o(clk_syn_177));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_216 (
    .i0(clk_syn_98),
    .i1(clk_syn_145),
    .sel(re_syn_2),
    .o(clk_syn_178));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_221 (
    .i0(clk_syn_99),
    .i1(clk_syn_149),
    .sel(re_syn_2),
    .o(clk_syn_179));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_226 (
    .i0(clk_syn_100),
    .i1(clk_syn_153),
    .sel(re_syn_2),
    .o(clk_syn_180));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_231 (
    .i0(clk_syn_101),
    .i1(clk_syn_157),
    .sel(re_syn_2),
    .o(clk_syn_181));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_236 (
    .i0(clk_syn_102),
    .i1(clk_syn_161),
    .sel(re_syn_2),
    .o(clk_syn_182));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_241 (
    .i0(clk_syn_103),
    .i1(clk_syn_165),
    .sel(re_syn_2),
    .o(clk_syn_183));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_246 (
    .i0(clk_syn_104),
    .i1(clk_syn_169),
    .sel(re_syn_2),
    .o(clk_syn_184));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_251 (
    .i0(clk_syn_105),
    .i1(clk_syn_173),
    .sel(re_syn_2),
    .o(clk_syn_185));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_256 (
    .i0(logic_ramfifo_syn_23),
    .i1(clk_syn_95),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_215));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_261 (
    .i0(logic_ramfifo_syn_24),
    .i1(clk_syn_96),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_216));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_266 (
    .i0(logic_ramfifo_syn_25),
    .i1(clk_syn_97),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_217));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_271 (
    .i0(logic_ramfifo_syn_26),
    .i1(clk_syn_98),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_218));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_276 (
    .i0(logic_ramfifo_syn_27),
    .i1(clk_syn_99),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_219));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_281 (
    .i0(logic_ramfifo_syn_28),
    .i1(clk_syn_100),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_220));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_286 (
    .i0(logic_ramfifo_syn_29),
    .i1(clk_syn_101),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_221));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_291 (
    .i0(logic_ramfifo_syn_30),
    .i1(clk_syn_102),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_222));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_296 (
    .i0(logic_ramfifo_syn_31),
    .i1(clk_syn_103),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_223));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_301 (
    .i0(logic_ramfifo_syn_32),
    .i1(clk_syn_104),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_224));  // w10_d1024_fifo.v(25)
  AL_MUX re_syn_306 (
    .i0(logic_ramfifo_syn_33),
    .i1(clk_syn_105),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_225));  // w10_d1024_fifo.v(25)
  and we_syn_1 (we_syn_2, we, logic_ramfifo_syn_153);  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_103 (
    .i0(logic_ramfifo_syn_4),
    .i1(clk_syn_5),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_157));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_108 (
    .i0(logic_ramfifo_syn_5),
    .i1(clk_syn_6),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_158));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_113 (
    .i0(logic_ramfifo_syn_6),
    .i1(clk_syn_7),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_159));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_118 (
    .i0(logic_ramfifo_syn_7),
    .i1(clk_syn_8),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_160));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_123 (
    .i0(logic_ramfifo_syn_8),
    .i1(clk_syn_9),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_161));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_128 (
    .i0(logic_ramfifo_syn_9),
    .i1(clk_syn_10),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_162));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_133 (
    .i0(logic_ramfifo_syn_10),
    .i1(clk_syn_11),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_163));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_138 (
    .i0(logic_ramfifo_syn_11),
    .i1(clk_syn_12),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_164));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_28 (
    .i0(clk_syn_1),
    .i1(clk_syn_16),
    .sel(we_syn_2),
    .o(clk_syn_81));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_33 (
    .i0(clk_syn_2),
    .i1(clk_syn_40),
    .sel(we_syn_2),
    .o(clk_syn_82));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_38 (
    .i0(clk_syn_3),
    .i1(clk_syn_44),
    .sel(we_syn_2),
    .o(clk_syn_83));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_43 (
    .i0(clk_syn_4),
    .i1(clk_syn_48),
    .sel(we_syn_2),
    .o(clk_syn_84));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_48 (
    .i0(clk_syn_5),
    .i1(clk_syn_52),
    .sel(we_syn_2),
    .o(clk_syn_85));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_53 (
    .i0(clk_syn_6),
    .i1(clk_syn_56),
    .sel(we_syn_2),
    .o(clk_syn_86));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_58 (
    .i0(clk_syn_7),
    .i1(clk_syn_60),
    .sel(we_syn_2),
    .o(clk_syn_87));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_63 (
    .i0(clk_syn_8),
    .i1(clk_syn_64),
    .sel(we_syn_2),
    .o(clk_syn_88));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_68 (
    .i0(clk_syn_9),
    .i1(clk_syn_68),
    .sel(we_syn_2),
    .o(clk_syn_89));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_73 (
    .i0(clk_syn_10),
    .i1(clk_syn_72),
    .sel(we_syn_2),
    .o(clk_syn_90));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_78 (
    .i0(clk_syn_11),
    .i1(clk_syn_76),
    .sel(we_syn_2),
    .o(clk_syn_91));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_83 (
    .i0(clk_syn_12),
    .i1(clk_syn_80),
    .sel(we_syn_2),
    .o(clk_syn_92));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_88 (
    .i0(logic_ramfifo_syn_1),
    .i1(clk_syn_2),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_154));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_93 (
    .i0(logic_ramfifo_syn_2),
    .i1(clk_syn_3),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_155));  // w10_d1024_fifo.v(24)
  AL_MUX we_syn_98 (
    .i0(logic_ramfifo_syn_3),
    .i1(clk_syn_4),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_156));  // w10_d1024_fifo.v(24)

  // synthesis translate_off
  glbl glbl();
  always @(*) begin
    glbl.gsr <= PH1_PHY_GSR.gsr;
    glbl.gsrn <= PH1_PHY_GSR.gsrn;
    glbl.done_gwe <= PH1_PHY_GSR.done_gwe;
    glbl.usr_gsrn_en <= PH1_PHY_GSR.usr_gsrn_en;
  end
  // synthesis translate_on

endmodule 

