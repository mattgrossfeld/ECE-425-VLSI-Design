/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5
// Date      : Thu May  2 16:47:50 2019
/////////////////////////////////////////////////////////////


module controller ( i, a, b, select_a_hi, select_b_hi, f, c, p, g_lo, p_lo, 
        ovr, z, y_tri, y_data, oe, ram0, ram3, q0, q3, q0_data, q3_data, 
        reg_wr, r_sel, s_sel, func_sel, y_sel, f_sel, q_sel, zero, q_en, inv_s, 
        inv_r, q_master_en, q_slave_en, iq_master_en, iq_slave_en, ireg_wr, 
        reg_a_wr, ireg_a_wr, reg_b_wr, ireg_b_wr, cp );
  input [8:0] i;
  input [3:0] a;
  input [3:0] b;
  output [15:0] select_a_hi;
  output [15:0] select_b_hi;
  input [3:0] f;
  input [3:0] c;
  input [3:0] p;
  inout [3:0] y_tri;
  input [3:0] y_data;
  output [1:0] r_sel;
  output [1:0] s_sel;
  output [2:0] func_sel;
  output [1:0] f_sel;
  output [1:0] q_sel;
  input oe, q0_data, q3_data, cp;
  output g_lo, p_lo, ovr, z, reg_wr, y_sel, zero, q_en, inv_s, inv_r,
         q_master_en, q_slave_en, iq_master_en, iq_slave_en, ireg_wr, reg_a_wr,
         ireg_a_wr, reg_b_wr, ireg_b_wr;
  inout ram0,  ram3,  q0,  q3;
  wire   i_2, i_1, i_0, reg_a_wr, N23, N24, N25, N33, N34, N35, n3, n5, n7, n9,
         n11, n13, n15, n17, n19, n20, n48, ireg_a_wr, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90;
  tri   [3:0] y_tri;
  tri   ram0;
  tri   ram3;
  tri   q0;
  tri   q3;
  assign zero = 1'b0;
  assign i_2 = i[2];
  assign i_1 = i[1];
  assign i_0 = i[0];
  assign func_sel[2] = i[5];
  assign func_sel[1] = i[4];
  assign func_sel[0] = i[3];
  assign reg_b_wr = reg_a_wr;
  assign reg_a_wr = cp;
  assign f_sel[1] = N23;
  assign r_sel[0] = N24;
  assign r_sel[1] = N25;
  assign f_sel[0] = N33;
  assign q_sel[0] = N34;
  assign q_sel[1] = N35;
  assign ireg_b_wr = ireg_a_wr;

  invzp_1 drvy0 ( .ip(n9), .c(n19), .op(y_tri[0]) );
  invzp_1 drvy1 ( .ip(n7), .c(n19), .op(y_tri[1]) );
  invzp_1 drvy2 ( .ip(n5), .c(n19), .op(y_tri[2]) );
  invzp_1 drvy3 ( .ip(n3), .c(n19), .op(y_tri[3]) );
  invzp_1 drvqshr ( .ip(n17), .c(n20), .op(q0) );
  invzp_1 drvramr ( .ip(n13), .c(n20), .op(ram0) );
  invzp_1 drvqshl ( .ip(n15), .c(n48), .op(q3) );
  invzp_1 drvraml ( .ip(n11), .c(n48), .op(ram3) );
  nand2_2 U92 ( .ip1(n64), .ip2(b[0]), .op(n65) );
  nand2_2 U93 ( .ip1(n68), .ip2(a[0]), .op(n69) );
  nand2_2 U94 ( .ip1(b[0]), .ip2(b[1]), .op(n61) );
  nand2_2 U95 ( .ip1(a[0]), .ip2(a[1]), .op(n63) );
  nand2_2 U96 ( .ip1(n66), .ip2(b[1]), .op(n67) );
  nand2_2 U97 ( .ip1(n70), .ip2(a[1]), .op(n71) );
  nor2_1 U98 ( .ip1(n61), .ip2(n73), .op(select_b_hi[7]) );
  nor2_1 U99 ( .ip1(n61), .ip2(n74), .op(select_b_hi[11]) );
  nor2_1 U100 ( .ip1(n67), .ip2(n75), .op(select_b_hi[14]) );
  nor2_1 U101 ( .ip1(n63), .ip2(n78), .op(select_a_hi[7]) );
  nor2_1 U102 ( .ip1(n63), .ip2(n79), .op(select_a_hi[11]) );
  nor2_1 U103 ( .ip1(n71), .ip2(n80), .op(select_a_hi[14]) );
  inv_4 U104 ( .ip(b[2]), .op(n52) );
  inv_4 U105 ( .ip(b[3]), .op(n53) );
  inv_4 U106 ( .ip(a[2]), .op(n54) );
  inv_4 U107 ( .ip(a[3]), .op(n55) );
  nand2_2 U108 ( .ip1(n52), .ip2(b[3]), .op(n74) );
  nand2_2 U109 ( .ip1(n53), .ip2(b[2]), .op(n73) );
  nand2_2 U110 ( .ip1(n54), .ip2(a[3]), .op(n79) );
  nand2_2 U111 ( .ip1(n55), .ip2(a[2]), .op(n78) );
  nand2_2 U112 ( .ip1(b[3]), .ip2(b[2]), .op(n75) );
  nand2_2 U113 ( .ip1(a[3]), .ip2(a[2]), .op(n80) );
  nor2_2 U114 ( .ip1(n72), .ip2(n76), .op(select_b_hi[0]) );
  nor2_2 U115 ( .ip1(n76), .ip2(n74), .op(select_b_hi[8]) );
  nor2_2 U116 ( .ip1(n76), .ip2(n73), .op(select_b_hi[4]) );
  nor2_2 U117 ( .ip1(n77), .ip2(n81), .op(select_a_hi[0]) );
  nor2_2 U118 ( .ip1(n81), .ip2(n79), .op(select_a_hi[8]) );
  nor2_2 U119 ( .ip1(n81), .ip2(n78), .op(select_a_hi[4]) );
  inv_4 U120 ( .ip(b[1]), .op(n64) );
  inv_4 U121 ( .ip(a[1]), .op(n68) );
  nor2_2 U122 ( .ip1(n76), .ip2(n75), .op(select_b_hi[12]) );
  nor2_2 U123 ( .ip1(n81), .ip2(n80), .op(select_a_hi[12]) );
  inv_2 U124 ( .ip(n56), .op(n76) );
  nor2_4 U125 ( .ip1(b[1]), .ip2(b[0]), .op(n56) );
  inv_2 U126 ( .ip(n57), .op(n81) );
  nor2_4 U127 ( .ip1(a[1]), .ip2(a[0]), .op(n57) );
  inv_1 U128 ( .ip(reg_a_wr), .op(ireg_a_wr) );
  inv_1 U129 ( .ip(y_data[2]), .op(n5) );
  inv_1 U130 ( .ip(f[3]), .op(n11) );
  inv_1 U131 ( .ip(y_data[1]), .op(n7) );
  inv_1 U132 ( .ip(q3_data), .op(n15) );
  inv_1 U133 ( .ip(y_data[0]), .op(n9) );
  inv_1 U134 ( .ip(f[0]), .op(n13) );
  inv_1 U135 ( .ip(q0_data), .op(n17) );
  inv_1 U136 ( .ip(y_data[3]), .op(n3) );
  inv_1 U137 ( .ip(oe), .op(n19) );
  nand4_1 U138 ( .ip1(p[2]), .ip2(p[3]), .ip3(p[0]), .ip4(p[1]), .op(p_lo) );
  nor4_1 U139 ( .ip1(f[3]), .ip2(f[0]), .ip3(f[2]), .ip4(f[1]), .op(z) );
  or2_1 U140 ( .ip1(i[8]), .ip2(i[7]), .op(n58) );
  nand2_1 U141 ( .ip1(n58), .ip2(ireg_a_wr), .op(ireg_wr) );
  inv_1 U142 ( .ip(ireg_wr), .op(reg_wr) );
  nand2_1 U143 ( .ip1(i[8]), .ip2(i[7]), .op(n48) );
  inv_1 U144 ( .ip(n48), .op(N23) );
  inv_1 U145 ( .ip(c[3]), .op(g_lo) );
  inv_1 U146 ( .ip(i[7]), .op(n90) );
  nor2_1 U147 ( .ip1(i[8]), .ip2(n90), .op(N33) );
  nor2_1 U148 ( .ip1(i[6]), .ip2(N33), .op(n59) );
  nand2_1 U149 ( .ip1(n59), .ip2(ireg_a_wr), .op(iq_master_en) );
  inv_1 U150 ( .ip(iq_master_en), .op(q_master_en) );
  nand2_1 U151 ( .ip1(reg_a_wr), .ip2(n59), .op(iq_slave_en) );
  inv_1 U152 ( .ip(iq_slave_en), .op(q_slave_en) );
  nor2_1 U153 ( .ip1(n61), .ip2(n75), .op(select_b_hi[15]) );
  nor2_4 U154 ( .ip1(b[2]), .ip2(b[3]), .op(n60) );
  inv_2 U155 ( .ip(n60), .op(n72) );
  nor2_1 U156 ( .ip1(n72), .ip2(n61), .op(select_b_hi[3]) );
  nor2_1 U157 ( .ip1(n63), .ip2(n80), .op(select_a_hi[15]) );
  nor2_4 U158 ( .ip1(a[2]), .ip2(a[3]), .op(n62) );
  inv_2 U159 ( .ip(n62), .op(n77) );
  nor2_1 U160 ( .ip1(n77), .ip2(n63), .op(select_a_hi[3]) );
  nor2_1 U161 ( .ip1(n65), .ip2(n75), .op(select_b_hi[13]) );
  nor2_1 U162 ( .ip1(n65), .ip2(n74), .op(select_b_hi[9]) );
  nor2_1 U163 ( .ip1(n65), .ip2(n73), .op(select_b_hi[5]) );
  nor2_1 U164 ( .ip1(n72), .ip2(n65), .op(select_b_hi[1]) );
  inv_2 U165 ( .ip(b[0]), .op(n66) );
  nor2_1 U166 ( .ip1(n67), .ip2(n74), .op(select_b_hi[10]) );
  nor2_1 U167 ( .ip1(n67), .ip2(n73), .op(select_b_hi[6]) );
  nor2_1 U168 ( .ip1(n72), .ip2(n67), .op(select_b_hi[2]) );
  nor2_1 U169 ( .ip1(n69), .ip2(n80), .op(select_a_hi[13]) );
  nor2_1 U170 ( .ip1(n69), .ip2(n79), .op(select_a_hi[9]) );
  nor2_1 U171 ( .ip1(n69), .ip2(n78), .op(select_a_hi[5]) );
  nor2_1 U172 ( .ip1(n77), .ip2(n69), .op(select_a_hi[1]) );
  inv_2 U173 ( .ip(a[0]), .op(n70) );
  nor2_1 U174 ( .ip1(n71), .ip2(n79), .op(select_a_hi[10]) );
  nor2_1 U175 ( .ip1(n71), .ip2(n78), .op(select_a_hi[6]) );
  nor2_1 U176 ( .ip1(n77), .ip2(n71), .op(select_a_hi[2]) );
  mux2_1 U177 ( .ip1(c[3]), .ip2(g_lo), .s(c[2]), .op(ovr) );
  nor2_1 U179 ( .ip1(i_1), .ip2(i_2), .op(N24) );
  nor2_1 U180 ( .ip1(i_1), .ip2(i_0), .op(n82) );
  inv_1 U181 ( .ip(i_2), .op(n85) );
  mux2_1 U182 ( .ip1(n82), .ip2(i_1), .s(n85), .op(N25) );
  nor3_1 U183 ( .ip1(i[6]), .ip2(i[8]), .ip3(i[7]), .op(N34) );
  nor2_1 U184 ( .ip1(i[6]), .ip2(n48), .op(N35) );
  inv_1 U185 ( .ip(func_sel[1]), .op(n83) );
  mux2_1 U186 ( .ip1(n83), .ip2(func_sel[1]), .s(func_sel[2]), .op(inv_s) );
  nand2_1 U187 ( .ip1(func_sel[2]), .ip2(n83), .op(n84) );
  mux2_1 U188 ( .ip1(n84), .ip2(func_sel[2]), .s(func_sel[0]), .op(inv_r) );
  nor2_1 U189 ( .ip1(i_1), .ip2(n85), .op(n88) );
  inv_1 U190 ( .ip(i_0), .op(n86) );
  nor2_1 U191 ( .ip1(n88), .ip2(n86), .op(s_sel[0]) );
  nor2_1 U192 ( .ip1(i_2), .ip2(n86), .op(n87) );
  nor2_1 U193 ( .ip1(n88), .ip2(n87), .op(s_sel[1]) );
  inv_1 U194 ( .ip(i[6]), .op(n89) );
  nand2_1 U195 ( .ip1(N33), .ip2(n89), .op(y_sel) );
  nand2_1 U196 ( .ip1(i[8]), .ip2(n90), .op(n20) );
endmodule

