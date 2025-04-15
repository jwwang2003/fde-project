
module lab2 ( clk, rst, nReset, ena, clk_cnt, cmd, cmd_ack, busy, al, din, 
        dout, scl_i, scl_o, scl_OEN, sda_i, sda_o, sda_OEN );
  input [15:0] clk_cnt;
  input [3:0] cmd;
  input clk, rst, nReset, ena, din, scl_i, sda_i;
  output cmd_ack, busy, al, dout, scl_o, scl_OEN, sda_o, sda_OEN;
  wire   \*Logic0* , sda_oen, scl_oen, dscl_oen, sSCL, slave_wait, N29, dSCL,
         clk_en, N31, N69, N70, N71, N72, N91, N92, N93, N94, N95, N96, N97,
         N98, N99, N100, N101, N102, N103, N104, dSDA, sSDA, N119, N120, N121,
         N122, sta_condition, sto_condition, N126, N128, cmd_stop, sda_chk,
         N133, N134, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362;
  wire   [15:0] cnt;
  wire   [1:0] cSCL;
  wire   [1:0] cSDA;
  wire   [13:0] filter_cnt;
  wire   [2:0] fSCL;
  wire   [2:0] fSDA;
  wire   [17:0] c_state;
  assign sda_o = \*Logic0* ;
  assign scl_o = \*Logic0* ;

  DFFRHQ \cSDA_reg[0]  ( .D(N71), .CK(clk), .RN(nReset), .Q(cSDA[0]) );
  DFFRHQ \cSDA_reg[1]  ( .D(N72), .CK(clk), .RN(nReset), .Q(cSDA[1]) );
  DFFRHQ \cSCL_reg[0]  ( .D(N69), .CK(clk), .RN(nReset), .Q(cSCL[0]) );
  DFFRHQ \cSCL_reg[1]  ( .D(N70), .CK(clk), .RN(nReset), .Q(cSCL[1]) );
  DFFRHQ \filter_cnt_reg[0]  ( .D(N91), .CK(clk), .RN(nReset), .Q(
        filter_cnt[0]) );
  DFFRHQ \filter_cnt_reg[9]  ( .D(N100), .CK(clk), .RN(nReset), .Q(
        filter_cnt[9]) );
  DFFRHQ \filter_cnt_reg[1]  ( .D(N92), .CK(clk), .RN(nReset), .Q(
        filter_cnt[1]) );
  DFFRHQ \filter_cnt_reg[2]  ( .D(N93), .CK(clk), .RN(nReset), .Q(
        filter_cnt[2]) );
  DFFRHQ \filter_cnt_reg[3]  ( .D(N94), .CK(clk), .RN(nReset), .Q(
        filter_cnt[3]) );
  DFFRHQ \filter_cnt_reg[4]  ( .D(N95), .CK(clk), .RN(nReset), .Q(
        filter_cnt[4]) );
  DFFRHQ \filter_cnt_reg[5]  ( .D(N96), .CK(clk), .RN(nReset), .Q(
        filter_cnt[5]) );
  DFFRHQ \filter_cnt_reg[6]  ( .D(N97), .CK(clk), .RN(nReset), .Q(
        filter_cnt[6]) );
  DFFRHQ \filter_cnt_reg[7]  ( .D(N98), .CK(clk), .RN(nReset), .Q(
        filter_cnt[7]) );
  DFFRHQ \filter_cnt_reg[8]  ( .D(N99), .CK(clk), .RN(nReset), .Q(
        filter_cnt[8]) );
  DFFRHQ \filter_cnt_reg[10]  ( .D(N101), .CK(clk), .RN(nReset), .Q(
        filter_cnt[10]) );
  DFFRHQ \filter_cnt_reg[11]  ( .D(N102), .CK(clk), .RN(nReset), .Q(
        filter_cnt[11]) );
  DFFRHQ \filter_cnt_reg[12]  ( .D(N103), .CK(clk), .RN(nReset), .Q(
        filter_cnt[12]) );
  DFFRHQ \filter_cnt_reg[13]  ( .D(N104), .CK(clk), .RN(nReset), .Q(
        filter_cnt[13]) );
  DFFSHQ \fSCL_reg[0]  ( .D(n173), .CK(clk), .SN(nReset), .Q(fSCL[0]) );
  DFFSHQ \fSCL_reg[1]  ( .D(n172), .CK(clk), .SN(nReset), .Q(fSCL[1]) );
  DFFSHQ \fSCL_reg[2]  ( .D(n171), .CK(clk), .SN(nReset), .Q(fSCL[2]) );
  DFFSHQ \fSDA_reg[0]  ( .D(n170), .CK(clk), .SN(nReset), .Q(fSDA[0]) );
  DFFSHQ \fSDA_reg[1]  ( .D(n169), .CK(clk), .SN(nReset), .Q(fSDA[1]) );
  DFFSHQ \fSDA_reg[2]  ( .D(n168), .CK(clk), .SN(nReset), .Q(fSDA[2]) );
  DFFSHQ sSCL_reg ( .D(N119), .CK(clk), .SN(nReset), .Q(sSCL) );
  DFFSHQ dSCL_reg ( .D(N121), .CK(clk), .SN(nReset), .Q(dSCL) );
  DFFSHQ sSDA_reg ( .D(N120), .CK(clk), .SN(nReset), .Q(sSDA) );
  DFFSHQ dSDA_reg ( .D(N122), .CK(clk), .SN(nReset), .Q(dSDA) );
  DFFRHQ sta_condition_reg ( .D(n344), .CK(clk), .RN(nReset), .Q(sta_condition) );
  DFFRHQ sto_condition_reg ( .D(N126), .CK(clk), .RN(nReset), .Q(sto_condition) );
  DFFRHQ busy_reg ( .D(N128), .CK(clk), .RN(nReset), .Q(busy) );
  EDFFHQ dout_reg ( .D(sSDA), .E(N134), .CK(clk), .Q(dout) );
  DFFRHQ \c_state_reg[0]  ( .D(n167), .CK(clk), .RN(nReset), .Q(c_state[0]) );
  DFFRHQ \c_state_reg[1]  ( .D(n162), .CK(clk), .RN(nReset), .Q(c_state[1]) );
  DFFRHQ \c_state_reg[2]  ( .D(n161), .CK(clk), .RN(nReset), .Q(c_state[2]) );
  DFFRHQ \c_state_reg[3]  ( .D(n160), .CK(clk), .RN(nReset), .Q(c_state[3]) );
  DFFRHQ \c_state_reg[4]  ( .D(n159), .CK(clk), .RN(nReset), .Q(c_state[4]) );
  DFFRHQ \c_state_reg[13]  ( .D(n151), .CK(clk), .RN(nReset), .Q(c_state[13])
         );
  DFFRHQ \c_state_reg[14]  ( .D(n150), .CK(clk), .RN(nReset), .Q(c_state[14])
         );
  DFFSHQ scl_oen_reg ( .D(n164), .CK(clk), .SN(nReset), .Q(scl_oen) );
  DFFHQ dscl_oen_reg ( .D(scl_oen), .CK(clk), .Q(dscl_oen) );
  DFFRHQ slave_wait_reg ( .D(N29), .CK(clk), .RN(nReset), .Q(slave_wait) );
  DFFRHQ \cnt_reg[15]  ( .D(n360), .CK(clk), .RN(nReset), .Q(cnt[15]) );
  DFFSHQ clk_en_reg ( .D(n181), .CK(clk), .SN(nReset), .Q(clk_en) );
  DFFRHQ cmd_stop_reg ( .D(n163), .CK(clk), .RN(nReset), .Q(cmd_stop) );
  DFFRHQ \c_state_reg[9]  ( .D(n155), .CK(clk), .RN(nReset), .Q(c_state[9]) );
  DFFRHQ \c_state_reg[5]  ( .D(n361), .CK(clk), .RN(nReset), .Q(c_state[5]) );
  DFFRHQ \c_state_reg[6]  ( .D(n158), .CK(clk), .RN(nReset), .Q(c_state[6]) );
  DFFRHQ \c_state_reg[7]  ( .D(n157), .CK(clk), .RN(nReset), .Q(c_state[7]) );
  DFFRHQ \c_state_reg[8]  ( .D(n156), .CK(clk), .RN(nReset), .Q(c_state[8]) );
  DFFSHQ sda_oen_reg ( .D(n165), .CK(clk), .SN(nReset), .Q(sda_oen) );
  DFFRHQ al_reg ( .D(N133), .CK(clk), .RN(nReset), .Q(al) );
  DFFRHQ \c_state_reg[10]  ( .D(n154), .CK(clk), .RN(nReset), .Q(c_state[10])
         );
  DFFRHQ \c_state_reg[11]  ( .D(n153), .CK(clk), .RN(nReset), .Q(c_state[11])
         );
  DFFRHQ \c_state_reg[12]  ( .D(n152), .CK(clk), .RN(nReset), .Q(c_state[12])
         );
  DFFRHQ \c_state_reg[15]  ( .D(n149), .CK(clk), .RN(nReset), .Q(c_state[15])
         );
  DFFRHQ \c_state_reg[16]  ( .D(n166), .CK(clk), .RN(nReset), .Q(c_state[16])
         );
  DFFRHQ sda_chk_reg ( .D(n148), .CK(clk), .RN(nReset), .Q(sda_chk) );
  DFFRHQ cmd_ack_reg ( .D(n362), .CK(clk), .RN(nReset), .Q(cmd_ack) );
  DFFRHQ \cnt_reg[14]  ( .D(n345), .CK(clk), .RN(nReset), .Q(cnt[14]) );
  DFFRHQ \cnt_reg[0]  ( .D(n359), .CK(clk), .RN(nReset), .Q(cnt[0]) );
  DFFRHQ \cnt_reg[1]  ( .D(n358), .CK(clk), .RN(nReset), .Q(cnt[1]) );
  DFFRHQ \cnt_reg[2]  ( .D(n357), .CK(clk), .RN(nReset), .Q(cnt[2]) );
  DFFRHQ \cnt_reg[3]  ( .D(n356), .CK(clk), .RN(nReset), .Q(cnt[3]) );
  DFFRHQ \cnt_reg[4]  ( .D(n355), .CK(clk), .RN(nReset), .Q(cnt[4]) );
  DFFRHQ \cnt_reg[5]  ( .D(n354), .CK(clk), .RN(nReset), .Q(cnt[5]) );
  DFFRHQ \cnt_reg[6]  ( .D(n353), .CK(clk), .RN(nReset), .Q(cnt[6]) );
  DFFRHQ \cnt_reg[7]  ( .D(n352), .CK(clk), .RN(nReset), .Q(cnt[7]) );
  DFFRHQ \cnt_reg[8]  ( .D(n351), .CK(clk), .RN(nReset), .Q(cnt[8]) );
  DFFRHQ \cnt_reg[9]  ( .D(n350), .CK(clk), .RN(nReset), .Q(cnt[9]) );
  DFFRHQ \cnt_reg[10]  ( .D(n349), .CK(clk), .RN(nReset), .Q(cnt[10]) );
  DFFRHQ \cnt_reg[11]  ( .D(n348), .CK(clk), .RN(nReset), .Q(cnt[11]) );
  DFFRHQ \cnt_reg[12]  ( .D(n347), .CK(clk), .RN(nReset), .Q(cnt[12]) );
  DFFRHQ \cnt_reg[13]  ( .D(n346), .CK(clk), .RN(nReset), .Q(cnt[13]) );
  INV U209 ( .A(n268), .Y(n176) );
  INV U210 ( .A(n176), .Y(n177) );
  INV U211 ( .A(n296), .Y(n178) );
  INV U212 ( .A(n178), .Y(n179) );
  INV U213 ( .A(N31), .Y(n180) );
  INV U214 ( .A(n180), .Y(n181) );
  LOGIC_0 U215 ( .LOGIC_0_PIN(\*Logic0* ) );
  NOR3B U216 ( .AN(dSDA), .B(N122), .C(n182), .Y(n344) );
  OAI2BB1 U217 ( .A0N(clk_cnt[14]), .A1N(n181), .B0(n183), .Y(n345) );
  MX2 U218 ( .A(n184), .B(n185), .S0(cnt[14]), .Y(n183) );
  NAND2B U219 ( .AN(n186), .B(n187), .Y(n184) );
  OAI222 U220 ( .A0(n188), .A1(n186), .B0(n189), .B1(n180), .C0(n190), .C1(
        n191), .Y(n346) );
  OAI222 U221 ( .A0(n188), .A1(n192), .B0(n193), .B1(n180), .C0(n194), .C1(
        n195), .Y(n347) );
  INV U222 ( .A(cnt[12]), .Y(n194) );
  AOI21 U223 ( .A0(cnt[11]), .A1(cnt[12]), .B0(n196), .Y(n192) );
  OAI2BB1 U224 ( .A0N(clk_cnt[11]), .A1N(n181), .B0(n197), .Y(n348) );
  MX2 U225 ( .A(n198), .B(n195), .S0(cnt[11]), .Y(n197) );
  AOI2BB1 U226 ( .A0N(n199), .A1N(n188), .B0(n200), .Y(n195) );
  NAND2 U227 ( .A(n199), .B(n187), .Y(n198) );
  OAI222 U228 ( .A0(n188), .A1(n201), .B0(n202), .B1(n180), .C0(n203), .C1(
        n204), .Y(n349) );
  INV U229 ( .A(cnt[10]), .Y(n203) );
  INV U230 ( .A(clk_cnt[10]), .Y(n202) );
  AOI21 U231 ( .A0(cnt[9]), .A1(cnt[10]), .B0(n199), .Y(n201) );
  OAI2BB1 U232 ( .A0N(clk_cnt[9]), .A1N(n181), .B0(n205), .Y(n350) );
  MX2 U233 ( .A(n206), .B(n204), .S0(cnt[9]), .Y(n205) );
  AOI2BB1 U234 ( .A0N(n207), .A1N(n188), .B0(n200), .Y(n204) );
  NAND2 U235 ( .A(n207), .B(n187), .Y(n206) );
  OAI222 U236 ( .A0(n188), .A1(n208), .B0(n209), .B1(n180), .C0(n210), .C1(
        n211), .Y(n351) );
  INV U237 ( .A(cnt[8]), .Y(n210) );
  INV U238 ( .A(clk_cnt[8]), .Y(n209) );
  AOI21 U239 ( .A0(cnt[7]), .A1(cnt[8]), .B0(n207), .Y(n208) );
  OAI2BB1 U240 ( .A0N(clk_cnt[7]), .A1N(n181), .B0(n212), .Y(n352) );
  MX2 U241 ( .A(n213), .B(n211), .S0(cnt[7]), .Y(n212) );
  AOI2BB1 U242 ( .A0N(n214), .A1N(n188), .B0(n200), .Y(n211) );
  NAND2 U243 ( .A(n214), .B(n187), .Y(n213) );
  OAI222 U244 ( .A0(n188), .A1(n215), .B0(n216), .B1(n180), .C0(n217), .C1(
        n218), .Y(n353) );
  INV U245 ( .A(cnt[6]), .Y(n217) );
  INV U246 ( .A(clk_cnt[6]), .Y(n216) );
  AOI21 U247 ( .A0(cnt[5]), .A1(cnt[6]), .B0(n214), .Y(n215) );
  OAI2BB1 U248 ( .A0N(clk_cnt[5]), .A1N(n181), .B0(n219), .Y(n354) );
  MX2 U249 ( .A(n220), .B(n218), .S0(cnt[5]), .Y(n219) );
  AOI2BB1 U250 ( .A0N(n221), .A1N(n188), .B0(n200), .Y(n218) );
  NAND2 U251 ( .A(n221), .B(n187), .Y(n220) );
  OAI222 U252 ( .A0(n188), .A1(n222), .B0(n223), .B1(n180), .C0(n224), .C1(
        n225), .Y(n355) );
  INV U253 ( .A(cnt[4]), .Y(n224) );
  INV U254 ( .A(clk_cnt[4]), .Y(n223) );
  AOI21 U255 ( .A0(cnt[3]), .A1(cnt[4]), .B0(n221), .Y(n222) );
  OAI2BB1 U256 ( .A0N(clk_cnt[3]), .A1N(n181), .B0(n226), .Y(n356) );
  MX2 U257 ( .A(n227), .B(n225), .S0(cnt[3]), .Y(n226) );
  AOI2BB1 U258 ( .A0N(n228), .A1N(n188), .B0(n200), .Y(n225) );
  NAND2 U259 ( .A(n228), .B(n187), .Y(n227) );
  OAI222 U260 ( .A0(n188), .A1(n229), .B0(n230), .B1(n180), .C0(n231), .C1(
        n232), .Y(n357) );
  INV U261 ( .A(cnt[2]), .Y(n231) );
  INV U262 ( .A(clk_cnt[2]), .Y(n230) );
  AOI21 U263 ( .A0(cnt[1]), .A1(cnt[2]), .B0(n228), .Y(n229) );
  OAI2BB1 U264 ( .A0N(clk_cnt[1]), .A1N(n181), .B0(n233), .Y(n358) );
  MX2 U265 ( .A(n234), .B(n232), .S0(cnt[1]), .Y(n233) );
  AOI21 U266 ( .A0(n187), .A1(cnt[0]), .B0(n200), .Y(n232) );
  OAI2BB1 U267 ( .A0N(clk_cnt[0]), .A1N(n181), .B0(n235), .Y(n359) );
  NOR2B U268 ( .AN(n234), .B(n236), .Y(n235) );
  NOR2B U269 ( .AN(cnt[0]), .B(n237), .Y(n236) );
  INV U270 ( .A(n200), .Y(n237) );
  NAND2B U271 ( .AN(cnt[0]), .B(n187), .Y(n234) );
  OAI222 U272 ( .A0(n188), .A1(n238), .B0(n239), .B1(n185), .C0(n240), .C1(
        n180), .Y(n360) );
  NOR2B U273 ( .AN(n191), .B(n241), .Y(n185) );
  NOR2 U274 ( .A(n188), .B(n190), .Y(n241) );
  INV U275 ( .A(cnt[13]), .Y(n190) );
  NOR2 U276 ( .A(n242), .B(n200), .Y(n191) );
  NOR2B U277 ( .AN(slave_wait), .B(n181), .Y(n200) );
  NOR2B U278 ( .AN(n187), .B(n196), .Y(n242) );
  INV U279 ( .A(n188), .Y(n187) );
  INV U280 ( .A(cnt[15]), .Y(n239) );
  NAND2 U281 ( .A(cnt[14]), .B(cnt[15]), .Y(n238) );
  OR2 U282 ( .A(slave_wait), .B(n181), .Y(n188) );
  OAI2BB2 U283 ( .B0(n243), .B1(n244), .A0N(n245), .A1N(n246), .Y(n361) );
  NOR2B U284 ( .AN(cmd[1]), .B(n247), .Y(n246) );
  NOR2 U285 ( .A(n248), .B(n249), .Y(n362) );
  NAND2B U286 ( .AN(n250), .B(n251), .Y(n173) );
  MX2 U287 ( .A(cSCL[1]), .B(fSCL[0]), .S0(n252), .Y(n250) );
  NAND2B U288 ( .AN(n253), .B(n251), .Y(n172) );
  MX2 U289 ( .A(fSCL[0]), .B(fSCL[1]), .S0(n252), .Y(n253) );
  NAND2 U290 ( .A(n254), .B(n251), .Y(n171) );
  MX2 U291 ( .A(n255), .B(n256), .S0(n252), .Y(n254) );
  NAND2B U292 ( .AN(n257), .B(n251), .Y(n170) );
  MX2 U293 ( .A(cSDA[1]), .B(fSDA[0]), .S0(n252), .Y(n257) );
  NAND2B U294 ( .AN(n258), .B(n251), .Y(n169) );
  MX2 U295 ( .A(fSDA[0]), .B(fSDA[1]), .S0(n252), .Y(n258) );
  NAND2 U296 ( .A(n259), .B(n251), .Y(n168) );
  MX2 U297 ( .A(n260), .B(n261), .S0(n252), .Y(n259) );
  OAI2BB2 U298 ( .B0(n243), .B1(n262), .A0N(n245), .A1N(n263), .Y(n167) );
  NOR3B U299 ( .AN(cmd[0]), .B(cmd[2]), .C(cmd[1]), .Y(n263) );
  OAI2BB1 U300 ( .A0N(n264), .A1N(c_state[16]), .B0(n265), .Y(n166) );
  OAI22 U301 ( .A0(n264), .A1(n266), .B0(n267), .B1(sda_OEN), .Y(n165) );
  NOR2B U302 ( .AN(n243), .B(n177), .Y(n267) );
  NOR4BB U303 ( .AN(n269), .BN(n270), .C(c_state[0]), .D(n271), .Y(n266) );
  NOR2B U304 ( .AN(din), .B(n272), .Y(n271) );
  NOR4 U305 ( .A(c_state[13]), .B(c_state[14]), .C(c_state[15]), .D(
        c_state[16]), .Y(n272) );
  NOR2 U306 ( .A(c_state[9]), .B(c_state[12]), .Y(n270) );
  MX2 U307 ( .A(scl_oen), .B(n273), .S0(n274), .Y(n164) );
  OAI31 U308 ( .A0(c_state[0]), .A1(n177), .A2(n264), .B0(n275), .Y(n274) );
  NAND2 U309 ( .A(n276), .B(n269), .Y(n273) );
  NOR4BB U310 ( .AN(n275), .BN(n277), .C(c_state[1]), .D(c_state[8]), .Y(n269)
         );
  NOR2 U311 ( .A(c_state[11]), .B(c_state[10]), .Y(n277) );
  NOR2B U312 ( .AN(n278), .B(rst), .Y(n163) );
  MX2 U313 ( .A(cmd_stop), .B(n279), .S0(clk_en), .Y(n278) );
  NOR3B U314 ( .AN(cmd[1]), .B(cmd[3]), .C(n247), .Y(n279) );
  OAI2BB2 U315 ( .B0(n249), .B1(n262), .A0N(n264), .A1N(c_state[1]), .Y(n162)
         );
  INV U316 ( .A(c_state[0]), .Y(n262) );
  OAI2BB2 U317 ( .B0(n249), .B1(n280), .A0N(n264), .A1N(c_state[2]), .Y(n161)
         );
  INV U318 ( .A(c_state[1]), .Y(n280) );
  OAI2BB2 U319 ( .B0(n249), .B1(n281), .A0N(n264), .A1N(c_state[3]), .Y(n160)
         );
  INV U320 ( .A(c_state[2]), .Y(n281) );
  OAI2BB2 U321 ( .B0(n249), .B1(n282), .A0N(c_state[4]), .A1N(n264), .Y(n159)
         );
  INV U322 ( .A(c_state[3]), .Y(n282) );
  OAI2BB2 U323 ( .B0(n249), .B1(n244), .A0N(n264), .A1N(c_state[6]), .Y(n158)
         );
  INV U324 ( .A(c_state[5]), .Y(n244) );
  OAI2BB2 U325 ( .B0(n249), .B1(n283), .A0N(n264), .A1N(c_state[7]), .Y(n157)
         );
  INV U326 ( .A(c_state[6]), .Y(n283) );
  OAI2BB2 U327 ( .B0(n284), .B1(n243), .A0N(n285), .A1N(c_state[7]), .Y(n156)
         );
  INV U328 ( .A(c_state[8]), .Y(n284) );
  OAI2BB2 U329 ( .B0(n243), .B1(n286), .A0N(n177), .A1N(n287), .Y(n155) );
  NOR4B U330 ( .AN(cmd[3]), .B(cmd[1]), .C(n249), .D(n247), .Y(n287) );
  OR2 U331 ( .A(cmd[2]), .B(cmd[0]), .Y(n247) );
  OAI2BB2 U332 ( .B0(n249), .B1(n286), .A0N(n264), .A1N(c_state[10]), .Y(n154)
         );
  INV U333 ( .A(c_state[9]), .Y(n286) );
  OAI2BB2 U334 ( .B0(n249), .B1(n288), .A0N(n264), .A1N(c_state[11]), .Y(n153)
         );
  INV U335 ( .A(c_state[10]), .Y(n288) );
  OAI2BB2 U336 ( .B0(n289), .B1(n243), .A0N(n285), .A1N(c_state[11]), .Y(n152)
         );
  INV U337 ( .A(c_state[12]), .Y(n289) );
  OAI2BB2 U338 ( .B0(n243), .B1(n290), .A0N(n245), .A1N(n291), .Y(n151) );
  NOR3B U339 ( .AN(cmd[2]), .B(cmd[0]), .C(cmd[1]), .Y(n291) );
  NOR3B U340 ( .AN(n177), .B(cmd[3]), .C(n249), .Y(n245) );
  OAI2BB2 U341 ( .B0(n249), .B1(n290), .A0N(n264), .A1N(c_state[14]), .Y(n150)
         );
  INV U342 ( .A(c_state[13]), .Y(n290) );
  OAI2BB2 U343 ( .B0(n249), .B1(n292), .A0N(n264), .A1N(c_state[15]), .Y(n149)
         );
  INV U344 ( .A(n243), .Y(n264) );
  INV U345 ( .A(c_state[14]), .Y(n292) );
  OAI21 U346 ( .A0(n243), .A1(n293), .B0(n265), .Y(n148) );
  NAND2 U347 ( .A(n285), .B(c_state[15]), .Y(n265) );
  INV U348 ( .A(n249), .Y(n285) );
  NAND2 U349 ( .A(n275), .B(clk_en), .Y(n249) );
  NAND2B U350 ( .AN(clk_en), .B(n275), .Y(n243) );
  NOR2 U351 ( .A(rst), .B(al), .Y(n275) );
  OAI2BB2 U352 ( .B0(n294), .B1(n295), .A0N(clk_cnt[10]), .A1N(n179), .Y(N99)
         );
  NOR2 U353 ( .A(n297), .B(n298), .Y(n294) );
  NOR2B U354 ( .AN(filter_cnt[8]), .B(n299), .Y(n298) );
  OAI2BB2 U355 ( .B0(n300), .B1(n295), .A0N(clk_cnt[9]), .A1N(n179), .Y(N98)
         );
  NOR2 U356 ( .A(n299), .B(n301), .Y(n300) );
  NOR2B U357 ( .AN(filter_cnt[7]), .B(n302), .Y(n301) );
  OAI2BB2 U358 ( .B0(n303), .B1(n295), .A0N(clk_cnt[8]), .A1N(n179), .Y(N97)
         );
  NOR2 U359 ( .A(n302), .B(n304), .Y(n303) );
  NOR2B U360 ( .AN(filter_cnt[6]), .B(n305), .Y(n304) );
  OAI2BB2 U361 ( .B0(n306), .B1(n295), .A0N(clk_cnt[7]), .A1N(n179), .Y(N96)
         );
  NOR2 U362 ( .A(n305), .B(n307), .Y(n306) );
  NOR2B U363 ( .AN(filter_cnt[5]), .B(n308), .Y(n307) );
  OAI2BB2 U364 ( .B0(n309), .B1(n295), .A0N(clk_cnt[6]), .A1N(n179), .Y(N95)
         );
  NOR2 U365 ( .A(n308), .B(n310), .Y(n309) );
  NOR2B U366 ( .AN(filter_cnt[4]), .B(n311), .Y(n310) );
  OAI2BB2 U367 ( .B0(n312), .B1(n295), .A0N(clk_cnt[5]), .A1N(n179), .Y(N94)
         );
  NOR2 U368 ( .A(n311), .B(n313), .Y(n312) );
  NOR2B U369 ( .AN(filter_cnt[3]), .B(n314), .Y(n313) );
  OAI2BB2 U370 ( .B0(n315), .B1(n295), .A0N(clk_cnt[4]), .A1N(n179), .Y(N93)
         );
  NOR2 U371 ( .A(n314), .B(n316), .Y(n315) );
  NOR2B U372 ( .AN(filter_cnt[2]), .B(n317), .Y(n316) );
  OAI2BB2 U373 ( .B0(n318), .B1(n295), .A0N(clk_cnt[3]), .A1N(n179), .Y(N92)
         );
  AOI21 U374 ( .A0(filter_cnt[1]), .A1(filter_cnt[0]), .B0(n317), .Y(n318) );
  OAI2BB2 U375 ( .B0(filter_cnt[0]), .B1(n295), .A0N(clk_cnt[2]), .A1N(n179), 
        .Y(N91) );
  NOR2B U376 ( .AN(cSDA[0]), .B(rst), .Y(N72) );
  NOR2B U377 ( .AN(sda_i), .B(rst), .Y(N71) );
  NOR2B U378 ( .AN(cSCL[0]), .B(rst), .Y(N70) );
  NOR2B U379 ( .AN(scl_i), .B(rst), .Y(N69) );
  OAI31 U380 ( .A0(cnt[15]), .A1(cnt[14]), .A2(n186), .B0(n319), .Y(N31) );
  AOI31 U381 ( .A0(scl_oen), .A1(dSCL), .A2(n182), .B0(n320), .Y(n319) );
  NAND2B U382 ( .AN(cnt[13]), .B(n196), .Y(n186) );
  NOR3B U383 ( .AN(n199), .B(cnt[12]), .C(cnt[11]), .Y(n196) );
  NOR3B U384 ( .AN(n207), .B(cnt[9]), .C(cnt[10]), .Y(n199) );
  NOR3B U385 ( .AN(n214), .B(cnt[8]), .C(cnt[7]), .Y(n207) );
  NOR3B U386 ( .AN(n221), .B(cnt[6]), .C(cnt[5]), .Y(n214) );
  NOR3B U387 ( .AN(n228), .B(cnt[4]), .C(cnt[3]), .Y(n221) );
  NOR3 U388 ( .A(cnt[0]), .B(cnt[2]), .C(cnt[1]), .Y(n228) );
  NOR2 U389 ( .A(sSCL), .B(n321), .Y(N29) );
  AOI2BB1 U390 ( .A0N(dscl_oen), .A1N(scl_OEN), .B0(slave_wait), .Y(n321) );
  INV U391 ( .A(scl_oen), .Y(scl_OEN) );
  NOR2 U392 ( .A(dSCL), .B(n182), .Y(N134) );
  OAI33 U393 ( .A0(N122), .A1(n293), .A2(sda_OEN), .B0(rst), .B1(n322), .B2(
        n177), .Y(N133) );
  NOR4BB U394 ( .AN(n323), .BN(n324), .C(c_state[11]), .D(c_state[13]), .Y(
        n268) );
  NOR4BB U395 ( .AN(n276), .BN(n248), .C(c_state[0]), .D(c_state[10]), .Y(n324) );
  NOR4 U396 ( .A(c_state[8]), .B(c_state[4]), .C(c_state[16]), .D(c_state[12]), 
        .Y(n248) );
  NOR4B U397 ( .AN(n325), .B(c_state[3]), .C(c_state[7]), .D(c_state[6]), .Y(
        n276) );
  NOR3 U398 ( .A(c_state[14]), .B(c_state[2]), .C(c_state[15]), .Y(n325) );
  NOR3 U399 ( .A(c_state[1]), .B(c_state[9]), .C(c_state[5]), .Y(n323) );
  NAND2B U400 ( .AN(cmd_stop), .B(sto_condition), .Y(n322) );
  INV U401 ( .A(sda_oen), .Y(sda_OEN) );
  INV U402 ( .A(sda_chk), .Y(n293) );
  NOR2B U403 ( .AN(n326), .B(rst), .Y(N128) );
  AOI2BB1 U404 ( .A0N(busy), .A1N(sta_condition), .B0(sto_condition), .Y(n326)
         );
  NOR4BB U405 ( .AN(sSDA), .BN(sSCL), .C(rst), .D(dSDA), .Y(N126) );
  OR2 U406 ( .A(rst), .B(sSDA), .Y(N122) );
  NAND2 U407 ( .A(n251), .B(n182), .Y(N121) );
  INV U408 ( .A(sSCL), .Y(n182) );
  OAI211 U409 ( .A0(n260), .A1(n261), .B0(n251), .C0(n327), .Y(N120) );
  OAI21 U410 ( .A0(fSDA[1]), .A1(fSDA[2]), .B0(fSDA[0]), .Y(n327) );
  INV U411 ( .A(fSDA[2]), .Y(n261) );
  INV U412 ( .A(fSDA[1]), .Y(n260) );
  OAI211 U413 ( .A0(n255), .A1(n256), .B0(n251), .C0(n328), .Y(N119) );
  OAI21 U414 ( .A0(fSCL[1]), .A1(fSCL[2]), .B0(fSCL[0]), .Y(n328) );
  INV U415 ( .A(rst), .Y(n251) );
  INV U416 ( .A(fSCL[2]), .Y(n256) );
  INV U417 ( .A(fSCL[1]), .Y(n255) );
  OAI2BB2 U418 ( .B0(n240), .B1(n178), .A0N(n329), .A1N(n330), .Y(N104) );
  NOR2B U419 ( .AN(filter_cnt[13]), .B(n331), .Y(n330) );
  INV U420 ( .A(n295), .Y(n329) );
  INV U421 ( .A(clk_cnt[15]), .Y(n240) );
  OAI2BB2 U422 ( .B0(n332), .B1(n295), .A0N(clk_cnt[14]), .A1N(n179), .Y(N103)
         );
  NOR2 U423 ( .A(n331), .B(n333), .Y(n332) );
  NOR2B U424 ( .AN(filter_cnt[12]), .B(n334), .Y(n333) );
  OAI22 U425 ( .A0(n335), .A1(n295), .B0(n189), .B1(n178), .Y(N102) );
  INV U426 ( .A(clk_cnt[13]), .Y(n189) );
  NOR2 U427 ( .A(n334), .B(n336), .Y(n335) );
  NOR2B U428 ( .AN(filter_cnt[11]), .B(n337), .Y(n336) );
  OAI22 U429 ( .A0(n338), .A1(n295), .B0(n193), .B1(n178), .Y(N101) );
  INV U430 ( .A(clk_cnt[12]), .Y(n193) );
  NOR2 U431 ( .A(n337), .B(n339), .Y(n338) );
  NOR2B U432 ( .AN(filter_cnt[10]), .B(n340), .Y(n339) );
  OAI2BB2 U433 ( .B0(n341), .B1(n295), .A0N(clk_cnt[11]), .A1N(n179), .Y(N100)
         );
  NOR2B U434 ( .AN(ena), .B(n252), .Y(n296) );
  NAND2B U435 ( .AN(rst), .B(n342), .Y(n252) );
  OR2 U436 ( .A(n342), .B(n320), .Y(n295) );
  NAND2B U437 ( .AN(rst), .B(ena), .Y(n320) );
  NOR2B U438 ( .AN(n331), .B(filter_cnt[13]), .Y(n342) );
  NOR2B U439 ( .AN(n334), .B(filter_cnt[12]), .Y(n331) );
  NOR2B U440 ( .AN(n337), .B(filter_cnt[11]), .Y(n334) );
  NOR2B U441 ( .AN(n340), .B(filter_cnt[10]), .Y(n337) );
  NOR2 U442 ( .A(n340), .B(n343), .Y(n341) );
  NOR2B U443 ( .AN(filter_cnt[9]), .B(n297), .Y(n343) );
  NOR2B U444 ( .AN(n297), .B(filter_cnt[9]), .Y(n340) );
  NOR2B U445 ( .AN(n299), .B(filter_cnt[8]), .Y(n297) );
  NOR2B U446 ( .AN(n302), .B(filter_cnt[7]), .Y(n299) );
  NOR2B U447 ( .AN(n305), .B(filter_cnt[6]), .Y(n302) );
  NOR2B U448 ( .AN(n308), .B(filter_cnt[5]), .Y(n305) );
  NOR2B U449 ( .AN(n311), .B(filter_cnt[4]), .Y(n308) );
  NOR2B U450 ( .AN(n314), .B(filter_cnt[3]), .Y(n311) );
  NOR2B U451 ( .AN(n317), .B(filter_cnt[2]), .Y(n314) );
  NOR2 U452 ( .A(filter_cnt[0]), .B(filter_cnt[1]), .Y(n317) );
endmodule
