
module lab0_v2 ( clk, rst, nReset, ena, clk_cnt, signal, in, out, oen, dout, 
        sSignal );
  input [4:0] clk_cnt;
  input clk, rst, nReset, ena, signal, in;
  output out, oen, dout, sSignal;
  wire   \*Logic0* , N6, N7, N51, N52, N53, n36, n37, n38, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88;
  wire   [1:0] cSignal;
  wire   [13:0] filter_cnt;
  wire   [2:0] fSignal;
  assign out = \*Logic0* ;

  DFFRHQ \cSignal_reg[0]  ( .D(N6), .CK(clk), .RN(nReset), .Q(cSignal[0]) );
  DFFRHQ \cSignal_reg[1]  ( .D(N7), .CK(clk), .RN(nReset), .Q(cSignal[1]) );
  DFFRHQ \filter_cnt_reg[0]  ( .D(n76), .CK(clk), .RN(nReset), .Q(
        filter_cnt[0]) );
  DFFRHQ \filter_cnt_reg[1]  ( .D(n77), .CK(clk), .RN(nReset), .Q(
        filter_cnt[1]) );
  DFFRHQ \filter_cnt_reg[2]  ( .D(n78), .CK(clk), .RN(nReset), .Q(
        filter_cnt[2]) );
  DFFRHQ \filter_cnt_reg[3]  ( .D(n88), .CK(clk), .RN(nReset), .Q(
        filter_cnt[3]) );
  DFFRHQ \filter_cnt_reg[4]  ( .D(n87), .CK(clk), .RN(nReset), .Q(
        filter_cnt[4]) );
  DFFRHQ \filter_cnt_reg[5]  ( .D(n86), .CK(clk), .RN(nReset), .Q(
        filter_cnt[5]) );
  DFFRHQ \filter_cnt_reg[6]  ( .D(n85), .CK(clk), .RN(nReset), .Q(
        filter_cnt[6]) );
  DFFRHQ \filter_cnt_reg[7]  ( .D(n84), .CK(clk), .RN(nReset), .Q(
        filter_cnt[7]) );
  DFFRHQ \filter_cnt_reg[8]  ( .D(n83), .CK(clk), .RN(nReset), .Q(
        filter_cnt[8]) );
  DFFRHQ \filter_cnt_reg[9]  ( .D(n82), .CK(clk), .RN(nReset), .Q(
        filter_cnt[9]) );
  DFFRHQ \filter_cnt_reg[10]  ( .D(n81), .CK(clk), .RN(nReset), .Q(
        filter_cnt[10]) );
  DFFRHQ \filter_cnt_reg[11]  ( .D(n80), .CK(clk), .RN(nReset), .Q(
        filter_cnt[11]) );
  DFFRHQ \filter_cnt_reg[12]  ( .D(n79), .CK(clk), .RN(nReset), .Q(
        filter_cnt[12]) );
  DFFSHQ \fSignal_reg[1]  ( .D(n37), .CK(clk), .SN(nReset), .Q(fSignal[1]) );
  DFFSHQ \fSignal_reg[0]  ( .D(n38), .CK(clk), .SN(nReset), .Q(fSignal[0]) );
  DFFSHQ \fSignal_reg[2]  ( .D(n36), .CK(clk), .SN(nReset), .Q(fSignal[2]) );
  DFFSHQ sSignal_reg ( .D(N51), .CK(clk), .SN(nReset), .Q(sSignal) );
  DFFSHQ oen_reg ( .D(N52), .CK(clk), .SN(nReset), .Q(oen) );
  DFFSHQ dout_reg ( .D(N53), .CK(clk), .SN(nReset), .Q(dout) );
  LOGIC_0 U58 ( .LOGIC_0_PIN(\*Logic0* ) );
  OAI2BB2 U59 ( .B0(filter_cnt[0]), .B1(n40), .A0N(clk_cnt[2]), .A1N(n41), .Y(
        n76) );
  OAI2BB2 U60 ( .B0(n42), .B1(n40), .A0N(n41), .A1N(clk_cnt[3]), .Y(n77) );
  AOI21 U61 ( .A0(filter_cnt[1]), .A1(filter_cnt[0]), .B0(n43), .Y(n42) );
  OAI2BB2 U62 ( .B0(n44), .B1(n40), .A0N(n41), .A1N(clk_cnt[4]), .Y(n78) );
  NOR2B U63 ( .AN(ena), .B(n45), .Y(n41) );
  NOR2 U64 ( .A(n46), .B(n47), .Y(n44) );
  NOR2B U65 ( .AN(filter_cnt[2]), .B(n43), .Y(n47) );
  AOI2BB1 U66 ( .A0N(n68), .A1N(n48), .B0(n40), .Y(n79) );
  NOR2B U67 ( .AN(filter_cnt[12]), .B(n49), .Y(n48) );
  AOI2BB1 U68 ( .A0N(n49), .A1N(n50), .B0(n40), .Y(n80) );
  NOR2B U69 ( .AN(filter_cnt[11]), .B(n51), .Y(n50) );
  AOI2BB1 U70 ( .A0N(n51), .A1N(n52), .B0(n40), .Y(n81) );
  NOR2B U71 ( .AN(filter_cnt[10]), .B(n53), .Y(n52) );
  AOI2BB1 U72 ( .A0N(n53), .A1N(n54), .B0(n40), .Y(n82) );
  NOR2B U73 ( .AN(filter_cnt[9]), .B(n55), .Y(n54) );
  AOI2BB1 U74 ( .A0N(n55), .A1N(n56), .B0(n40), .Y(n83) );
  NOR2B U75 ( .AN(filter_cnt[8]), .B(n57), .Y(n56) );
  AOI2BB1 U76 ( .A0N(n57), .A1N(n58), .B0(n40), .Y(n84) );
  NOR2B U77 ( .AN(filter_cnt[7]), .B(n59), .Y(n58) );
  AOI2BB1 U78 ( .A0N(n59), .A1N(n60), .B0(n40), .Y(n85) );
  NOR2B U79 ( .AN(filter_cnt[6]), .B(n61), .Y(n60) );
  AOI2BB1 U80 ( .A0N(n61), .A1N(n62), .B0(n40), .Y(n86) );
  NOR2B U81 ( .AN(filter_cnt[5]), .B(n63), .Y(n62) );
  AOI2BB1 U82 ( .A0N(n63), .A1N(n64), .B0(n40), .Y(n87) );
  NOR2B U83 ( .AN(filter_cnt[4]), .B(n65), .Y(n64) );
  AOI2BB1 U84 ( .A0N(n65), .A1N(n66), .B0(n40), .Y(n88) );
  INV U85 ( .A(n67), .Y(n40) );
  NOR3B U86 ( .AN(ena), .B(rst), .C(n68), .Y(n67) );
  NOR2B U87 ( .AN(filter_cnt[3]), .B(n46), .Y(n66) );
  NAND2B U88 ( .AN(n69), .B(n70), .Y(n38) );
  MX2 U89 ( .A(cSignal[0]), .B(fSignal[0]), .S0(n45), .Y(n69) );
  NAND2B U90 ( .AN(n71), .B(n70), .Y(n37) );
  MX2 U91 ( .A(cSignal[1]), .B(fSignal[1]), .S0(n45), .Y(n71) );
  NAND2B U92 ( .AN(n72), .B(n70), .Y(n36) );
  MX2 U93 ( .A(fSignal[0]), .B(fSignal[2]), .S0(n45), .Y(n72) );
  NAND2B U94 ( .AN(rst), .B(n68), .Y(n45) );
  NOR2B U95 ( .AN(n49), .B(filter_cnt[12]), .Y(n68) );
  NOR2B U96 ( .AN(n51), .B(filter_cnt[11]), .Y(n49) );
  NOR2B U97 ( .AN(n53), .B(filter_cnt[10]), .Y(n51) );
  NOR2B U98 ( .AN(n55), .B(filter_cnt[9]), .Y(n53) );
  NOR2B U99 ( .AN(n57), .B(filter_cnt[8]), .Y(n55) );
  NOR2B U100 ( .AN(n59), .B(filter_cnt[7]), .Y(n57) );
  NOR2B U101 ( .AN(n61), .B(filter_cnt[6]), .Y(n59) );
  NOR2B U102 ( .AN(n63), .B(filter_cnt[5]), .Y(n61) );
  NOR2B U103 ( .AN(n65), .B(filter_cnt[4]), .Y(n63) );
  NOR2B U104 ( .AN(n46), .B(filter_cnt[3]), .Y(n65) );
  NOR2B U105 ( .AN(n43), .B(filter_cnt[2]), .Y(n46) );
  NOR2 U106 ( .A(filter_cnt[0]), .B(filter_cnt[1]), .Y(n43) );
  NOR2B U107 ( .AN(cSignal[0]), .B(rst), .Y(N7) );
  NOR2B U108 ( .AN(in), .B(rst), .Y(N6) );
  NAND2B U109 ( .AN(oen), .B(n70), .Y(N53) );
  NAND2B U110 ( .AN(signal), .B(n70), .Y(N52) );
  OAI211 U111 ( .A0(n73), .A1(n74), .B0(n70), .C0(n75), .Y(N51) );
  OAI21 U112 ( .A0(fSignal[1]), .A1(fSignal[2]), .B0(fSignal[0]), .Y(n75) );
  INV U113 ( .A(rst), .Y(n70) );
  INV U114 ( .A(fSignal[2]), .Y(n74) );
  INV U115 ( .A(fSignal[1]), .Y(n73) );
endmodule
