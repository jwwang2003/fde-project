
module lab0 ( clk, rst, sig, hold, line_val, fet_out );
  input clk, rst, sig, hold;
  output line_val, fet_out;
  wire   n1;

  DFFRHQ line_val_reg ( .D(sig), .CK(clk), .RN(n1), .Q(line_val) );
  DFFRHQ fet_out_reg ( .D(hold), .CK(clk), .RN(n1), .Q(fet_out) );
  INV U4 ( .A(rst), .Y(n1) );
endmodule
