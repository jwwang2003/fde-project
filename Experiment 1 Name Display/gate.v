
module name_display ( clk, rst, lcd_en, lcd_rst, lcd_db );
  output [7:0] lcd_db;
  input clk, rst;
  output lcd_en, lcd_rst;
  wire   lcd_rst, N318, N319, N320, N321, N322, N323, N324, N328, N329, N330,
         N331, N332, n143, n144, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298;
  wire   [6:1] cnt_lcd;
  wire   [1:0] sentence_sel;
  assign lcd_rst = rst;

  DFFRHQ \cnt_lcd_reg[0]  ( .D(n298), .CK(clk), .RN(n297), .Q(lcd_en) );
  DFFRHQ \cnt_lcd_reg[1]  ( .D(N328), .CK(clk), .RN(n297), .Q(cnt_lcd[1]) );
  DFFRHQ \cnt_lcd_reg[2]  ( .D(N329), .CK(clk), .RN(n297), .Q(cnt_lcd[2]) );
  DFFRHQ \cnt_lcd_reg[3]  ( .D(N330), .CK(clk), .RN(n297), .Q(cnt_lcd[3]) );
  DFFRHQ \cnt_lcd_reg[4]  ( .D(N331), .CK(clk), .RN(n297), .Q(cnt_lcd[4]) );
  DFFRHQ \cnt_lcd_reg[5]  ( .D(N332), .CK(clk), .RN(n297), .Q(cnt_lcd[5]) );
  DFFRHQ \sentence_sel_reg[0]  ( .D(n144), .CK(clk), .RN(n297), .Q(
        sentence_sel[0]) );
  DFFRHQ \sentence_sel_reg[1]  ( .D(n143), .CK(clk), .RN(n297), .Q(
        sentence_sel[1]) );
  DFFRHQ \lcd_db_reg[6]  ( .D(N324), .CK(clk), .RN(n297), .Q(lcd_db[6]) );
  DFFRHQ \lcd_db_reg[0]  ( .D(N318), .CK(clk), .RN(n297), .Q(lcd_db[0]) );
  DFFRHQ \lcd_db_reg[2]  ( .D(N320), .CK(clk), .RN(n297), .Q(lcd_db[2]) );
  DFFRHQ \lcd_db_reg[1]  ( .D(N319), .CK(clk), .RN(n297), .Q(lcd_db[1]) );
  DFFRHQ \lcd_db_reg[4]  ( .D(N322), .CK(clk), .RN(n297), .Q(lcd_db[4]) );
  DFFRHQ \lcd_db_reg[3]  ( .D(N321), .CK(clk), .RN(n297), .Q(lcd_db[3]) );
  DFFRHQ \lcd_db_reg[5]  ( .D(N323), .CK(clk), .RN(n297), .Q(lcd_db[5]) );
  LOGIC_0 U157 ( .LOGIC_0_PIN(lcd_db[7]) );
  INV U158 ( .A(cnt_lcd[4]), .Y(n148) );
  INV U159 ( .A(n148), .Y(n149) );
  INV U160 ( .A(cnt_lcd[1]), .Y(n150) );
  INV U161 ( .A(n150), .Y(n151) );
  INV U162 ( .A(lcd_rst), .Y(n297) );
  XOR2 U163 ( .A(sentence_sel[0]), .B(n152), .Y(n144) );
  NAND2B U164 ( .AN(n153), .B(n154), .Y(n143) );
  MX2 U165 ( .A(sentence_sel[1]), .B(n155), .S0(n152), .Y(n153) );
  NOR3B U166 ( .AN(n156), .B(n157), .C(n158), .Y(n152) );
  XNOR2 U167 ( .A(n159), .B(n157), .Y(N332) );
  NOR2B U168 ( .AN(n156), .B(n158), .Y(n159) );
  NAND2B U169 ( .AN(n160), .B(n161), .Y(N331) );
  MX2 U170 ( .A(n149), .B(n162), .S0(n156), .Y(n160) );
  XOR2 U171 ( .A(n156), .B(cnt_lcd[3]), .Y(N330) );
  NOR2B U172 ( .AN(n163), .B(n164), .Y(n156) );
  XNOR2 U173 ( .A(n163), .B(n164), .Y(N329) );
  NOR2 U174 ( .A(n298), .B(n150), .Y(n163) );
  XOR2 U175 ( .A(lcd_en), .B(n151), .Y(N328) );
  NOR2 U176 ( .A(n165), .B(n298), .Y(N324) );
  NOR4BB U177 ( .AN(n166), .BN(n167), .C(n168), .D(n169), .Y(n165) );
  MX2 U178 ( .A(n170), .B(n171), .S0(cnt_lcd[3]), .Y(n169) );
  NOR2 U179 ( .A(n151), .B(n172), .Y(n171) );
  NOR2 U180 ( .A(n173), .B(n174), .Y(n170) );
  OAI2BB2 U181 ( .B0(n175), .B1(n176), .A0N(n177), .A1N(n178), .Y(n168) );
  NOR4 U182 ( .A(n178), .B(n179), .C(n180), .D(n181), .Y(n175) );
  MX2 U183 ( .A(n182), .B(n183), .S0(n149), .Y(n181) );
  MX2 U184 ( .A(n184), .B(n185), .S0(cnt_lcd[2]), .Y(n180) );
  NOR4BB U185 ( .AN(n186), .BN(n187), .C(n188), .D(n189), .Y(n166) );
  AOI21 U186 ( .A0(n190), .A1(n191), .B0(n192), .Y(n186) );
  AOI21 U187 ( .A0(n193), .A1(n194), .B0(n298), .Y(N323) );
  AOI22 U188 ( .A0(n195), .A1(n196), .B0(n197), .B1(n158), .Y(n194) );
  AOI31 U189 ( .A0(cnt_lcd[5]), .A1(n164), .A2(n198), .B0(n199), .Y(n193) );
  OAI33 U190 ( .A0(n200), .A1(n201), .A2(n191), .B0(n148), .B1(n202), .B2(n203), .Y(n199) );
  NOR2 U191 ( .A(sentence_sel[0]), .B(n196), .Y(n201) );
  OAI31 U192 ( .A0(n151), .A1(n161), .A2(n176), .B0(n204), .Y(n198) );
  INV U193 ( .A(n205), .Y(n204) );
  NOR2B U194 ( .AN(n206), .B(n298), .Y(N322) );
  OAI211 U195 ( .A0(n207), .A1(n208), .B0(n209), .C0(n210), .Y(n206) );
  AOI31 U196 ( .A0(n192), .A1(n211), .A2(n148), .B0(n212), .Y(n210) );
  OAI33 U197 ( .A0(n213), .A1(n203), .A2(n158), .B0(n176), .B1(n214), .B2(n157), .Y(n212) );
  INV U198 ( .A(n215), .Y(n214) );
  INV U199 ( .A(n216), .Y(n158) );
  AOI22 U200 ( .A0(n151), .A1(n217), .B0(n218), .B1(n219), .Y(n209) );
  OAI2BB2 U201 ( .B0(n202), .B1(n220), .A0N(n183), .A1N(n221), .Y(n217) );
  INV U202 ( .A(n222), .Y(n220) );
  INV U203 ( .A(n197), .Y(n208) );
  AOI31 U204 ( .A0(n223), .A1(n224), .A2(n225), .B0(n298), .Y(N321) );
  AOI211 U205 ( .A0(n205), .A1(cnt_lcd[2]), .B0(n226), .C0(n227), .Y(n225) );
  OAI31 U206 ( .A0(n148), .A1(n200), .A2(n176), .B0(n187), .Y(n227) );
  NOR2B U207 ( .AN(n151), .B(n228), .Y(n226) );
  AOI211 U208 ( .A0(n218), .A1(n229), .B0(n230), .C0(n231), .Y(n228) );
  NOR2B U209 ( .AN(n190), .B(n149), .Y(n231) );
  NOR2B U210 ( .AN(n232), .B(n233), .Y(n230) );
  AOI2BB2 U211 ( .B0(n216), .B1(n157), .A0N(n234), .A1N(n235), .Y(n233) );
  NOR2B U212 ( .AN(n236), .B(n182), .Y(n229) );
  AOI2BB2 U213 ( .B0(n237), .B1(n221), .A0N(n238), .A1N(n191), .Y(n224) );
  NOR2B U214 ( .AN(n239), .B(n240), .Y(n238) );
  OAI2BB2 U215 ( .B0(n151), .B1(n174), .A0N(n241), .A1N(n232), .Y(n240) );
  AOI31 U216 ( .A0(n236), .A1(cnt_lcd[5]), .A2(n173), .B0(n197), .Y(n239) );
  NOR2B U217 ( .AN(n237), .B(n154), .Y(n197) );
  OAI21 U218 ( .A0(n149), .A1(n176), .B0(n242), .Y(n221) );
  AOI2BB2 U219 ( .B0(n243), .B1(n196), .A0N(cnt_lcd[3]), .A1N(n244), .Y(n223)
         );
  AOI222 U220 ( .A0(n155), .A1(n241), .B0(n196), .B1(n237), .C0(n236), .C1(
        n245), .Y(n244) );
  NOR2 U221 ( .A(n246), .B(n298), .Y(N320) );
  NOR4 U222 ( .A(n247), .B(n248), .C(n249), .D(n250), .Y(n246) );
  OAI222 U223 ( .A0(n174), .A1(n251), .B0(n252), .B1(n207), .C0(n154), .C1(
        n253), .Y(n249) );
  AOI211 U224 ( .A0(n241), .A1(n254), .B0(n243), .C0(n255), .Y(n253) );
  NOR2 U225 ( .A(n148), .B(n203), .Y(n255) );
  NOR2B U226 ( .AN(n162), .B(n235), .Y(n243) );
  INV U227 ( .A(n256), .Y(n252) );
  NOR2 U228 ( .A(n184), .B(n215), .Y(n251) );
  NOR2 U229 ( .A(n216), .B(n150), .Y(n184) );
  NOR2 U230 ( .A(n257), .B(n258), .Y(n248) );
  AOI211 U231 ( .A0(n241), .A1(n234), .B0(n259), .C0(n260), .Y(n257) );
  OAI2BB2 U232 ( .B0(n183), .B1(n261), .A0N(cnt_lcd[3]), .A1N(n245), .Y(n260)
         );
  INV U233 ( .A(n178), .Y(n261) );
  NOR2 U234 ( .A(n262), .B(n176), .Y(n247) );
  NOR4 U235 ( .A(n185), .B(n215), .C(n263), .D(n264), .Y(n262) );
  NOR2B U236 ( .AN(n179), .B(n164), .Y(n263) );
  INV U237 ( .A(cnt_lcd[2]), .Y(n164) );
  NOR2 U238 ( .A(n265), .B(n298), .Y(N319) );
  NOR4BB U239 ( .AN(n266), .BN(n267), .C(n189), .D(n268), .Y(n265) );
  NOR2 U240 ( .A(n269), .B(n176), .Y(n268) );
  AOI211 U241 ( .A0(n245), .A1(n148), .B0(n270), .C0(n271), .Y(n269) );
  MX2 U242 ( .A(n234), .B(n272), .S0(cnt_lcd[2]), .Y(n271) );
  NOR2 U243 ( .A(n157), .B(n161), .Y(n272) );
  INV U244 ( .A(n218), .Y(n161) );
  AOI2BB1 U245 ( .A0N(n222), .A1N(n264), .B0(n150), .Y(n270) );
  NOR2 U246 ( .A(cnt_lcd[3]), .B(n157), .Y(n264) );
  NOR2B U247 ( .AN(n219), .B(n273), .Y(n189) );
  INV U248 ( .A(n162), .Y(n273) );
  AOI211 U249 ( .A0(n205), .A1(cnt_lcd[5]), .B0(n274), .C0(n250), .Y(n267) );
  OAI31 U250 ( .A0(cnt_lcd[5]), .A1(n275), .A2(n154), .B0(n276), .Y(n250) );
  AOI33 U251 ( .A0(n149), .A1(n183), .A2(n236), .B0(n155), .B1(n179), .B2(n277), .Y(n276) );
  NOR2 U252 ( .A(cnt_lcd[2]), .B(n254), .Y(n277) );
  NOR3 U253 ( .A(n151), .B(n149), .C(n157), .Y(n179) );
  AOI21 U254 ( .A0(n216), .A1(cnt_lcd[2]), .B0(n278), .Y(n275) );
  NOR4 U255 ( .A(cnt_lcd[5]), .B(n202), .C(n150), .D(n148), .Y(n274) );
  NOR2B U256 ( .AN(n242), .B(n279), .Y(n202) );
  NOR2 U257 ( .A(n254), .B(n176), .Y(n279) );
  INV U258 ( .A(n236), .Y(n176) );
  NOR2B U259 ( .AN(n178), .B(n258), .Y(n205) );
  AOI22 U260 ( .A0(n192), .A1(n234), .B0(n237), .B1(n280), .Y(n266) );
  OAI211 U261 ( .A0(n207), .A1(n281), .B0(n154), .C0(n242), .Y(n280) );
  NAND2B U262 ( .AN(cnt_lcd[3]), .B(n155), .Y(n242) );
  INV U263 ( .A(n196), .Y(n281) );
  NOR2 U264 ( .A(n218), .B(n162), .Y(n207) );
  INV U265 ( .A(n191), .Y(n234) );
  NOR2 U266 ( .A(n154), .B(n235), .Y(n192) );
  AOI31 U267 ( .A0(n282), .A1(n283), .A2(n284), .B0(n298), .Y(N318) );
  INV U268 ( .A(lcd_en), .Y(n298) );
  OAI2BB1 U269 ( .A0N(n285), .A1N(n286), .B0(n236), .Y(n284) );
  NOR2B U270 ( .AN(sentence_sel[1]), .B(n213), .Y(n236) );
  INV U271 ( .A(sentence_sel[0]), .Y(n213) );
  AOI222 U272 ( .A0(n287), .A1(n288), .B0(n218), .B1(n183), .C0(n216), .C1(
        n237), .Y(n286) );
  NOR2B U273 ( .AN(cnt_lcd[5]), .B(n151), .Y(n288) );
  NAND2B U274 ( .AN(n218), .B(cnt_lcd[2]), .Y(n287) );
  MX2 U275 ( .A(n289), .B(n290), .S0(n149), .Y(n285) );
  INV U276 ( .A(n173), .Y(n290) );
  NOR2 U277 ( .A(n151), .B(cnt_lcd[2]), .Y(n173) );
  AOI211 U278 ( .A0(n211), .A1(cnt_lcd[2]), .B0(n245), .C0(n259), .Y(n289) );
  NOR2B U279 ( .AN(n278), .B(n235), .Y(n259) );
  NOR2B U280 ( .AN(n182), .B(n151), .Y(n245) );
  NOR4B U281 ( .AN(n187), .B(n190), .C(n188), .D(n291), .Y(n283) );
  OAI2BB2 U282 ( .B0(n292), .B1(n154), .A0N(n178), .A1N(n256), .Y(n291) );
  NOR2B U283 ( .AN(n196), .B(n235), .Y(n256) );
  NOR2B U284 ( .AN(n151), .B(n191), .Y(n178) );
  NOR2 U285 ( .A(n241), .B(n195), .Y(n292) );
  NOR2B U286 ( .AN(n162), .B(n203), .Y(n195) );
  INV U287 ( .A(n237), .Y(n203) );
  NOR2B U288 ( .AN(n182), .B(n150), .Y(n237) );
  NOR2B U289 ( .AN(cnt_lcd[2]), .B(cnt_lcd[5]), .Y(n182) );
  NOR2B U290 ( .AN(cnt_lcd[3]), .B(n149), .Y(n162) );
  NOR3B U291 ( .AN(n177), .B(n151), .C(n254), .Y(n188) );
  NOR2B U292 ( .AN(n155), .B(n235), .Y(n190) );
  NAND2 U293 ( .A(n216), .B(n177), .Y(n187) );
  NOR2B U294 ( .AN(n155), .B(cnt_lcd[5]), .Y(n177) );
  NOR2B U295 ( .AN(n149), .B(n254), .Y(n216) );
  AOI211 U296 ( .A0(n219), .A1(cnt_lcd[3]), .B0(n293), .C0(n294), .Y(n282) );
  NOR2 U297 ( .A(n151), .B(n167), .Y(n294) );
  AOI31 U298 ( .A0(n155), .A1(cnt_lcd[5]), .A2(n215), .B0(n295), .Y(n167) );
  NOR2B U299 ( .AN(n218), .B(n174), .Y(n295) );
  NAND2B U300 ( .AN(cnt_lcd[5]), .B(n196), .Y(n174) );
  NOR2B U301 ( .AN(n149), .B(cnt_lcd[3]), .Y(n218) );
  NOR2B U302 ( .AN(cnt_lcd[2]), .B(n191), .Y(n215) );
  OR2 U303 ( .A(cnt_lcd[3]), .B(n149), .Y(n191) );
  NOR2B U304 ( .AN(n211), .B(n172), .Y(n293) );
  AOI31 U305 ( .A0(n149), .A1(n232), .A2(n157), .B0(n296), .Y(n172) );
  NOR2B U306 ( .AN(n222), .B(n258), .Y(n296) );
  INV U307 ( .A(n155), .Y(n258) );
  NOR2B U308 ( .AN(sentence_sel[0]), .B(sentence_sel[1]), .Y(n155) );
  NOR2 U309 ( .A(cnt_lcd[2]), .B(n149), .Y(n222) );
  INV U310 ( .A(cnt_lcd[5]), .Y(n157) );
  INV U311 ( .A(n154), .Y(n232) );
  NAND2B U312 ( .AN(sentence_sel[0]), .B(sentence_sel[1]), .Y(n154) );
  NOR2 U313 ( .A(n185), .B(n278), .Y(n211) );
  NOR2 U314 ( .A(n150), .B(n254), .Y(n278) );
  INV U315 ( .A(cnt_lcd[3]), .Y(n254) );
  NOR2 U316 ( .A(n151), .B(cnt_lcd[3]), .Y(n185) );
  NOR2B U317 ( .AN(n196), .B(n200), .Y(n219) );
  INV U318 ( .A(n241), .Y(n200) );
  NOR2B U319 ( .AN(n183), .B(n151), .Y(n241) );
  INV U320 ( .A(n235), .Y(n183) );
  OR2 U321 ( .A(cnt_lcd[2]), .B(cnt_lcd[5]), .Y(n235) );
  NOR2 U322 ( .A(sentence_sel[0]), .B(sentence_sel[1]), .Y(n196) );
endmodule
