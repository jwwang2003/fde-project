
module lab1 ( clk, rst, nReset, clk_cnt, ena, scl_in, scl_oen, scl_o, test, 
        slave_wait, scl_sSignal, scl_dSignal, scl_doen );
  input [15:0] clk_cnt;
  input clk, rst, nReset, ena, scl_in;
  output scl_oen, scl_o, test, slave_wait, scl_sSignal, scl_dSignal, scl_doen;
  wire   test, N4, clk_en, N8, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, scl_en, \scl_tbuf/N53 ,
         \scl_tbuf/N52 , \scl_tbuf/N51 , \scl_tbuf/N50 , \scl_tbuf/fSignal[0] ,
         \scl_tbuf/fSignal[1] , \scl_tbuf/fSignal[2] , \scl_tbuf/N39 ,
         \scl_tbuf/N38 , \scl_tbuf/N37 , \scl_tbuf/N36 , \scl_tbuf/N35 ,
         \scl_tbuf/N34 , \scl_tbuf/N33 , \scl_tbuf/N32 , \scl_tbuf/N31 ,
         \scl_tbuf/N30 , \scl_tbuf/N29 , \scl_tbuf/N28 , \scl_tbuf/N27 ,
         \scl_tbuf/N26 , \scl_tbuf/filter_cnt[0] , \scl_tbuf/filter_cnt[1] ,
         \scl_tbuf/filter_cnt[2] , \scl_tbuf/filter_cnt[3] ,
         \scl_tbuf/filter_cnt[4] , \scl_tbuf/filter_cnt[5] ,
         \scl_tbuf/filter_cnt[6] , \scl_tbuf/filter_cnt[7] ,
         \scl_tbuf/filter_cnt[8] , \scl_tbuf/filter_cnt[9] ,
         \scl_tbuf/filter_cnt[10] , \scl_tbuf/filter_cnt[11] ,
         \scl_tbuf/filter_cnt[12] , \scl_tbuf/filter_cnt[13] , \scl_tbuf/N6 ,
         \scl_tbuf/N5 , \scl_tbuf/cSignal[0] , \scl_tbuf/cSignal[1] ,
         \scl_tbuf/*Logic0* , n44, n45, n46, n47, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151;
  wire   [15:0] cnt;
  assign test = scl_in;
  assign scl_o = \scl_tbuf/*Logic0* ;

  DFFRHQ \cnt_reg[0]  ( .D(N26), .CK(clk), .RN(nReset), .Q(cnt[0]) );
  DFFSHQ clk_en_reg ( .D(n51), .CK(clk), .SN(nReset), .Q(clk_en) );
  DFFRHQ \cnt_reg[15]  ( .D(N41), .CK(clk), .RN(nReset), .Q(cnt[15]) );
  DFFRHQ \cnt_reg[1]  ( .D(N27), .CK(clk), .RN(nReset), .Q(cnt[1]) );
  DFFRHQ \cnt_reg[2]  ( .D(N28), .CK(clk), .RN(nReset), .Q(cnt[2]) );
  DFFRHQ \cnt_reg[3]  ( .D(N29), .CK(clk), .RN(nReset), .Q(cnt[3]) );
  DFFRHQ \cnt_reg[4]  ( .D(N30), .CK(clk), .RN(nReset), .Q(cnt[4]) );
  DFFRHQ \cnt_reg[5]  ( .D(N31), .CK(clk), .RN(nReset), .Q(cnt[5]) );
  DFFRHQ \cnt_reg[6]  ( .D(N32), .CK(clk), .RN(nReset), .Q(cnt[6]) );
  DFFRHQ \cnt_reg[7]  ( .D(N33), .CK(clk), .RN(nReset), .Q(cnt[7]) );
  DFFRHQ \cnt_reg[8]  ( .D(N34), .CK(clk), .RN(nReset), .Q(cnt[8]) );
  DFFRHQ \cnt_reg[9]  ( .D(N35), .CK(clk), .RN(nReset), .Q(cnt[9]) );
  DFFRHQ \cnt_reg[10]  ( .D(N36), .CK(clk), .RN(nReset), .Q(cnt[10]) );
  DFFRHQ \cnt_reg[11]  ( .D(N37), .CK(clk), .RN(nReset), .Q(cnt[11]) );
  DFFRHQ \cnt_reg[12]  ( .D(N38), .CK(clk), .RN(nReset), .Q(cnt[12]) );
  DFFRHQ \cnt_reg[13]  ( .D(N39), .CK(clk), .RN(nReset), .Q(cnt[13]) );
  DFFRHQ \cnt_reg[14]  ( .D(N40), .CK(clk), .RN(nReset), .Q(cnt[14]) );
  DFFRHQ scl_en_reg ( .D(n47), .CK(clk), .RN(nReset), .Q(scl_en) );
  DFFSHQ \scl_tbuf/oen_reg  ( .D(\scl_tbuf/N52 ), .CK(clk), .SN(nReset), .Q(
        scl_oen) );
  DFFSHQ \scl_tbuf/doen_reg  ( .D(\scl_tbuf/N53 ), .CK(clk), .SN(nReset), .Q(
        scl_doen) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[13]  ( .D(\scl_tbuf/N39 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[13] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[0]  ( .D(\scl_tbuf/N26 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[0] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[1]  ( .D(\scl_tbuf/N27 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[1] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[2]  ( .D(\scl_tbuf/N28 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[2] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[3]  ( .D(\scl_tbuf/N29 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[3] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[4]  ( .D(\scl_tbuf/N30 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[4] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[5]  ( .D(\scl_tbuf/N31 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[5] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[6]  ( .D(\scl_tbuf/N32 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[6] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[7]  ( .D(\scl_tbuf/N33 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[7] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[8]  ( .D(\scl_tbuf/N34 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[8] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[9]  ( .D(\scl_tbuf/N35 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[9] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[10]  ( .D(\scl_tbuf/N36 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[10] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[11]  ( .D(\scl_tbuf/N37 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[11] ) );
  DFFRHQ \scl_tbuf/filter_cnt_reg[12]  ( .D(\scl_tbuf/N38 ), .CK(clk), .RN(
        nReset), .Q(\scl_tbuf/filter_cnt[12] ) );
  DFFRHQ \scl_tbuf/cSignal_reg[0]  ( .D(\scl_tbuf/N5 ), .CK(clk), .RN(nReset), 
        .Q(\scl_tbuf/cSignal[0] ) );
  DFFSHQ \scl_tbuf/fSignal_reg[0]  ( .D(n46), .CK(clk), .SN(nReset), .Q(
        \scl_tbuf/fSignal[0] ) );
  DFFSHQ \scl_tbuf/fSignal_reg[2]  ( .D(n44), .CK(clk), .SN(nReset), .Q(
        \scl_tbuf/fSignal[2] ) );
  DFFRHQ \scl_tbuf/cSignal_reg[1]  ( .D(\scl_tbuf/N6 ), .CK(clk), .RN(nReset), 
        .Q(\scl_tbuf/cSignal[1] ) );
  DFFSHQ \scl_tbuf/fSignal_reg[1]  ( .D(n45), .CK(clk), .SN(nReset), .Q(
        \scl_tbuf/fSignal[1] ) );
  DFFSHQ \scl_tbuf/sSignal_reg  ( .D(\scl_tbuf/N50 ), .CK(clk), .SN(nReset), 
        .Q(scl_sSignal) );
  DFFRHQ slave_wait_reg ( .D(N4), .CK(clk), .RN(nReset), .Q(slave_wait) );
  DFFSHQ \scl_tbuf/dSignal_reg  ( .D(\scl_tbuf/N51 ), .CK(clk), .SN(nReset), 
        .Q(scl_dSignal) );
  INV U90 ( .A(N8), .Y(n50) );
  INV U91 ( .A(n50), .Y(n51) );
  LOGIC_0 U92 ( .LOGIC_0_PIN(\scl_tbuf/*Logic0* ) );
  NOR2B U93 ( .AN(\scl_tbuf/cSignal[0] ), .B(rst), .Y(\scl_tbuf/N6 ) );
  NAND2B U94 ( .AN(scl_oen), .B(n52), .Y(\scl_tbuf/N53 ) );
  NAND2B U95 ( .AN(scl_sSignal), .B(n52), .Y(\scl_tbuf/N51 ) );
  OAI211 U96 ( .A0(n53), .A1(n54), .B0(n52), .C0(n55), .Y(\scl_tbuf/N50 ) );
  OAI21 U97 ( .A0(\scl_tbuf/fSignal[1] ), .A1(\scl_tbuf/fSignal[2] ), .B0(
        \scl_tbuf/fSignal[0] ), .Y(n55) );
  INV U98 ( .A(\scl_tbuf/fSignal[2] ), .Y(n54) );
  INV U99 ( .A(\scl_tbuf/fSignal[1] ), .Y(n53) );
  NOR2B U100 ( .AN(test), .B(rst), .Y(\scl_tbuf/N5 ) );
  OAI2BB2 U101 ( .B0(n56), .B1(n57), .A0N(n58), .A1N(n59), .Y(\scl_tbuf/N39 )
         );
  NOR2B U102 ( .AN(\scl_tbuf/filter_cnt[13] ), .B(n60), .Y(n59) );
  INV U103 ( .A(clk_cnt[15]), .Y(n57) );
  OAI2BB2 U104 ( .B0(n61), .B1(n62), .A0N(n63), .A1N(clk_cnt[14]), .Y(
        \scl_tbuf/N38 ) );
  NOR2 U105 ( .A(n60), .B(n64), .Y(n61) );
  NOR2B U106 ( .AN(\scl_tbuf/filter_cnt[12] ), .B(n65), .Y(n64) );
  OAI2BB2 U107 ( .B0(n66), .B1(n62), .A0N(n63), .A1N(clk_cnt[13]), .Y(
        \scl_tbuf/N37 ) );
  NOR2 U108 ( .A(n65), .B(n67), .Y(n66) );
  NOR2B U109 ( .AN(\scl_tbuf/filter_cnt[11] ), .B(n68), .Y(n67) );
  OAI2BB2 U110 ( .B0(n69), .B1(n62), .A0N(n63), .A1N(clk_cnt[12]), .Y(
        \scl_tbuf/N36 ) );
  NOR2 U111 ( .A(n68), .B(n70), .Y(n69) );
  NOR2B U112 ( .AN(\scl_tbuf/filter_cnt[10] ), .B(n71), .Y(n70) );
  OAI2BB2 U113 ( .B0(n72), .B1(n62), .A0N(n63), .A1N(clk_cnt[11]), .Y(
        \scl_tbuf/N35 ) );
  NOR2 U114 ( .A(n71), .B(n73), .Y(n72) );
  NOR2B U115 ( .AN(\scl_tbuf/filter_cnt[9] ), .B(n74), .Y(n73) );
  OAI2BB2 U116 ( .B0(n75), .B1(n62), .A0N(n63), .A1N(clk_cnt[10]), .Y(
        \scl_tbuf/N34 ) );
  NOR2 U117 ( .A(n74), .B(n76), .Y(n75) );
  NOR2B U118 ( .AN(\scl_tbuf/filter_cnt[8] ), .B(n77), .Y(n76) );
  OAI2BB2 U119 ( .B0(n78), .B1(n62), .A0N(n63), .A1N(clk_cnt[9]), .Y(
        \scl_tbuf/N33 ) );
  NOR2 U120 ( .A(n77), .B(n79), .Y(n78) );
  NOR2B U121 ( .AN(\scl_tbuf/filter_cnt[7] ), .B(n80), .Y(n79) );
  OAI2BB2 U122 ( .B0(n81), .B1(n62), .A0N(n63), .A1N(clk_cnt[8]), .Y(
        \scl_tbuf/N32 ) );
  NOR2 U123 ( .A(n80), .B(n82), .Y(n81) );
  NOR2B U124 ( .AN(\scl_tbuf/filter_cnt[6] ), .B(n83), .Y(n82) );
  OAI2BB2 U125 ( .B0(n84), .B1(n62), .A0N(n63), .A1N(clk_cnt[7]), .Y(
        \scl_tbuf/N31 ) );
  NOR2 U126 ( .A(n83), .B(n85), .Y(n84) );
  NOR2B U127 ( .AN(\scl_tbuf/filter_cnt[5] ), .B(n86), .Y(n85) );
  OAI2BB2 U128 ( .B0(n87), .B1(n62), .A0N(n63), .A1N(clk_cnt[6]), .Y(
        \scl_tbuf/N30 ) );
  NOR2 U129 ( .A(n86), .B(n88), .Y(n87) );
  NOR2B U130 ( .AN(\scl_tbuf/filter_cnt[4] ), .B(n89), .Y(n88) );
  OAI2BB2 U131 ( .B0(n90), .B1(n62), .A0N(n63), .A1N(clk_cnt[5]), .Y(
        \scl_tbuf/N29 ) );
  NOR2 U132 ( .A(n89), .B(n91), .Y(n90) );
  NOR2B U133 ( .AN(\scl_tbuf/filter_cnt[3] ), .B(n92), .Y(n91) );
  OAI2BB2 U134 ( .B0(n93), .B1(n62), .A0N(n63), .A1N(clk_cnt[4]), .Y(
        \scl_tbuf/N28 ) );
  NOR2 U135 ( .A(n92), .B(n94), .Y(n93) );
  NOR2B U136 ( .AN(\scl_tbuf/filter_cnt[2] ), .B(n95), .Y(n94) );
  OAI2BB2 U137 ( .B0(n96), .B1(n62), .A0N(n63), .A1N(clk_cnt[3]), .Y(
        \scl_tbuf/N27 ) );
  AOI21 U138 ( .A0(\scl_tbuf/filter_cnt[1] ), .A1(\scl_tbuf/filter_cnt[0] ), 
        .B0(n95), .Y(n96) );
  OAI2BB2 U139 ( .B0(\scl_tbuf/filter_cnt[0] ), .B1(n62), .A0N(clk_cnt[2]), 
        .A1N(n63), .Y(\scl_tbuf/N26 ) );
  INV U140 ( .A(n56), .Y(n63) );
  NAND2 U141 ( .A(ena), .B(n97), .Y(n56) );
  INV U142 ( .A(n58), .Y(n62) );
  NOR2B U143 ( .AN(n98), .B(n99), .Y(n58) );
  MX2 U144 ( .A(n100), .B(n101), .S0(n102), .Y(n47) );
  NOR2B U145 ( .AN(clk_en), .B(n103), .Y(n102) );
  INV U146 ( .A(ena), .Y(n103) );
  INV U147 ( .A(\scl_tbuf/N52 ), .Y(n101) );
  NAND2B U148 ( .AN(scl_en), .B(n52), .Y(\scl_tbuf/N52 ) );
  NOR2B U149 ( .AN(scl_en), .B(rst), .Y(n100) );
  NAND2B U150 ( .AN(n104), .B(n52), .Y(n46) );
  MX2 U151 ( .A(\scl_tbuf/fSignal[0] ), .B(\scl_tbuf/cSignal[0] ), .S0(n97), 
        .Y(n104) );
  NAND2B U152 ( .AN(n105), .B(n52), .Y(n45) );
  MX2 U153 ( .A(\scl_tbuf/fSignal[1] ), .B(\scl_tbuf/cSignal[1] ), .S0(n97), 
        .Y(n105) );
  NAND2B U154 ( .AN(n106), .B(n52), .Y(n44) );
  INV U155 ( .A(rst), .Y(n52) );
  MX2 U156 ( .A(\scl_tbuf/fSignal[2] ), .B(\scl_tbuf/fSignal[0] ), .S0(n97), 
        .Y(n106) );
  NOR2B U157 ( .AN(n99), .B(rst), .Y(n97) );
  NOR2B U158 ( .AN(n60), .B(\scl_tbuf/filter_cnt[13] ), .Y(n99) );
  NOR2B U159 ( .AN(n65), .B(\scl_tbuf/filter_cnt[12] ), .Y(n60) );
  NOR2B U160 ( .AN(n68), .B(\scl_tbuf/filter_cnt[11] ), .Y(n65) );
  NOR2B U161 ( .AN(n71), .B(\scl_tbuf/filter_cnt[10] ), .Y(n68) );
  NOR2B U162 ( .AN(n74), .B(\scl_tbuf/filter_cnt[9] ), .Y(n71) );
  NOR2B U163 ( .AN(n77), .B(\scl_tbuf/filter_cnt[8] ), .Y(n74) );
  NOR2B U164 ( .AN(n80), .B(\scl_tbuf/filter_cnt[7] ), .Y(n77) );
  NOR2B U165 ( .AN(n83), .B(\scl_tbuf/filter_cnt[6] ), .Y(n80) );
  NOR2B U166 ( .AN(n86), .B(\scl_tbuf/filter_cnt[5] ), .Y(n83) );
  NOR2B U167 ( .AN(n89), .B(\scl_tbuf/filter_cnt[4] ), .Y(n86) );
  NOR2B U168 ( .AN(n92), .B(\scl_tbuf/filter_cnt[3] ), .Y(n89) );
  NOR2B U169 ( .AN(n95), .B(\scl_tbuf/filter_cnt[2] ), .Y(n92) );
  NOR2 U170 ( .A(\scl_tbuf/filter_cnt[0] ), .B(\scl_tbuf/filter_cnt[1] ), .Y(
        n95) );
  MX2 U171 ( .A(n107), .B(clk_cnt[15]), .S0(n51), .Y(N41) );
  NOR2B U172 ( .AN(cnt[15]), .B(n108), .Y(n107) );
  INV U173 ( .A(n109), .Y(n108) );
  MX2 U174 ( .A(n110), .B(clk_cnt[14]), .S0(n51), .Y(N40) );
  OAI2BB1 U175 ( .A0N(cnt[14]), .A1N(n111), .B0(n109), .Y(n110) );
  AOI2BB1 U176 ( .A0N(n112), .A1N(slave_wait), .B0(scl_sSignal), .Y(N4) );
  NOR2B U177 ( .AN(scl_oen), .B(scl_doen), .Y(n112) );
  MX2 U178 ( .A(n113), .B(clk_cnt[13]), .S0(n51), .Y(N39) );
  OAI2BB1 U179 ( .A0N(cnt[13]), .A1N(n114), .B0(n111), .Y(n113) );
  INV U180 ( .A(n115), .Y(n111) );
  MX2 U181 ( .A(n116), .B(clk_cnt[12]), .S0(n51), .Y(N38) );
  OAI2BB1 U182 ( .A0N(cnt[12]), .A1N(n117), .B0(n114), .Y(n116) );
  INV U183 ( .A(n118), .Y(n114) );
  MX2 U184 ( .A(n119), .B(clk_cnt[11]), .S0(n51), .Y(N37) );
  OAI2BB1 U185 ( .A0N(cnt[11]), .A1N(n120), .B0(n117), .Y(n119) );
  INV U186 ( .A(n121), .Y(n117) );
  MX2 U187 ( .A(n122), .B(clk_cnt[10]), .S0(n51), .Y(N36) );
  OAI2BB1 U188 ( .A0N(cnt[10]), .A1N(n123), .B0(n120), .Y(n122) );
  INV U189 ( .A(n124), .Y(n120) );
  MX2 U190 ( .A(n125), .B(clk_cnt[9]), .S0(n51), .Y(N35) );
  OAI2BB1 U191 ( .A0N(cnt[9]), .A1N(n126), .B0(n123), .Y(n125) );
  INV U192 ( .A(n127), .Y(n123) );
  MX2 U193 ( .A(n128), .B(clk_cnt[8]), .S0(n51), .Y(N34) );
  OAI2BB1 U194 ( .A0N(cnt[8]), .A1N(n129), .B0(n126), .Y(n128) );
  INV U195 ( .A(n130), .Y(n126) );
  MX2 U196 ( .A(n131), .B(clk_cnt[7]), .S0(n51), .Y(N33) );
  OAI2BB1 U197 ( .A0N(cnt[7]), .A1N(n132), .B0(n129), .Y(n131) );
  INV U198 ( .A(n133), .Y(n129) );
  MX2 U199 ( .A(n134), .B(clk_cnt[6]), .S0(n51), .Y(N32) );
  OAI2BB1 U200 ( .A0N(cnt[6]), .A1N(n135), .B0(n132), .Y(n134) );
  INV U201 ( .A(n136), .Y(n132) );
  MX2 U202 ( .A(n137), .B(clk_cnt[5]), .S0(n51), .Y(N31) );
  OAI2BB1 U203 ( .A0N(cnt[5]), .A1N(n138), .B0(n135), .Y(n137) );
  INV U204 ( .A(n139), .Y(n135) );
  MX2 U205 ( .A(n140), .B(clk_cnt[4]), .S0(n51), .Y(N30) );
  OAI2BB1 U206 ( .A0N(cnt[4]), .A1N(n141), .B0(n138), .Y(n140) );
  INV U207 ( .A(n142), .Y(n138) );
  MX2 U208 ( .A(n143), .B(clk_cnt[3]), .S0(n51), .Y(N29) );
  OAI2BB1 U209 ( .A0N(cnt[3]), .A1N(n144), .B0(n141), .Y(n143) );
  INV U210 ( .A(n145), .Y(n141) );
  MX2 U211 ( .A(n146), .B(clk_cnt[2]), .S0(n51), .Y(N28) );
  OAI2BB1 U212 ( .A0N(cnt[2]), .A1N(n147), .B0(n144), .Y(n146) );
  INV U213 ( .A(n148), .Y(n144) );
  MX2 U214 ( .A(n149), .B(clk_cnt[1]), .S0(n51), .Y(N27) );
  OAI2BB1 U215 ( .A0N(cnt[1]), .A1N(cnt[0]), .B0(n147), .Y(n149) );
  INV U216 ( .A(n150), .Y(n147) );
  MX2 U217 ( .A(n151), .B(clk_cnt[0]), .S0(n51), .Y(N26) );
  OAI21 U218 ( .A0(cnt[15]), .A1(n109), .B0(n98), .Y(N8) );
  NOR2B U219 ( .AN(ena), .B(rst), .Y(n98) );
  NAND2B U220 ( .AN(cnt[14]), .B(n115), .Y(n109) );
  NOR2B U221 ( .AN(n118), .B(cnt[13]), .Y(n115) );
  NOR2B U222 ( .AN(n121), .B(cnt[12]), .Y(n118) );
  NOR2B U223 ( .AN(n124), .B(cnt[11]), .Y(n121) );
  NOR2B U224 ( .AN(n127), .B(cnt[10]), .Y(n124) );
  NOR2B U225 ( .AN(n130), .B(cnt[9]), .Y(n127) );
  NOR2B U226 ( .AN(n133), .B(cnt[8]), .Y(n130) );
  NOR2B U227 ( .AN(n136), .B(cnt[7]), .Y(n133) );
  NOR2B U228 ( .AN(n139), .B(cnt[6]), .Y(n136) );
  NOR2B U229 ( .AN(n142), .B(cnt[5]), .Y(n139) );
  NOR2B U230 ( .AN(n145), .B(cnt[4]), .Y(n142) );
  NOR2B U231 ( .AN(n148), .B(cnt[3]), .Y(n145) );
  NOR2B U232 ( .AN(n150), .B(cnt[2]), .Y(n148) );
  NOR2 U233 ( .A(cnt[0]), .B(cnt[1]), .Y(n150) );
  INV U234 ( .A(cnt[0]), .Y(n151) );
endmodule
