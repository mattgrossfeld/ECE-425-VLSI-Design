
`timescale 1ns / 1ns

`include "../ece425mp2/Am2901.v"
`include "../ece425mp2/controller.v"
//module Am2901(cp,i,cin,cout,g_lo,p_lo,ovr,z,f3,d,y,a,b,ram0,ram3,q0,q3,oe);

module test;

reg cp;
reg [8:0] i;
reg cin_hi, q0reg, q3reg, ram0reg, ram3reg;
wire cout_hi, g_lo, p_lo, ovr, z, f3;
reg [3:0] d, a, b;
wire [3:0] y;
wire ram0, ram3, q0, q3;
reg oe;
wire [3:0] data_a, data_b;
wire [3:0] data_q, alu_r, alu_s;
wire [3:0] alu_out;
wire [3:0] y_out;
wire [3:0] r_out, s_out;
wire [3:0] f_out, q_out;
wire [3:0] q_right, q_left, q_b;
wire [3:0] sum, cout, cin;
wire [3:0] logic_nand, logic_xor, logic_nor;
assign data_a = {top2901.data.I0.regfile.data_a,top2901.data.I1.regfile.data_a,top2901.data.I2.regfile.data_a,top2901.data.I3.regfile.data_a};
assign data_b = {top2901.data.I0.regfile.data_b,top2901.data.I1.regfile.data_b,top2901.data.I2.regfile.data_b,top2901.data.I3.regfile.data_b};
assign data_q = {top2901.data.I0.q_reg.q,top2901.data.I1.q_reg.q,top2901.data.I2.q_reg.q,top2901.data.I3.q_reg.q};
assign alu_r = {top2901.data.I0.alu.r,top2901.data.I1.alu.r,top2901.data.I2.alu.r,top2901.data.I3.alu.r};
assign alu_s = {top2901.data.I0.alu.s,top2901.data.I1.alu.s,top2901.data.I2.alu.s,top2901.data.I3.alu.s};
assign alu_out = {top2901.data.I0.alu.f,top2901.data.I1.alu.f,top2901.data.I2.alu.f,top2901.data.I3.alu.f};

assign sum = {top2901.data.I0.alu.add.sum,top2901.data.I1.alu.add.sum,top2901.data.I2.alu.add.sum,top2901.data.I3.alu.add.sum};
assign cout = {top2901.data.I0.alu.add.cout,top2901.data.I1.alu.add.cout,top2901.data.I2.alu.add.cout,top2901.data.I3.alu.add.cout};
assign cin = {top2901.data.I0.alu.add.cin,top2901.data.I1.alu.add.cin,top2901.data.I2.alu.add.cin,top2901.data.I3.alu.add.cin};

assign logic_nand = {top2901.data.I0.alu.add.gen_lo,top2901.data.I1.alu.add.gen_lo,top2901.data.I2.alu.add.gen_lo,top2901.data.I3.alu.add.gen_lo};
assign logic_nor = {top2901.data.I0.alu.add.kill_hi,top2901.data.I1.alu.add.kill_hi,top2901.data.I2.alu.add.kill_hi,top2901.data.I3.alu.add.kill_hi};
assign logic_xor = {top2901.data.I0.alu.add.prop_hi,top2901.data.I1.alu.add.prop_hi,top2901.data.I2.alu.add.prop_hi,top2901.data.I3.alu.add.prop_hi};

assign q_left = {top2901.data.I0.q_mux.c,top2901.data.I1.q_mux.c,top2901.data.I2.q_mux.c,top2901.data.I3.q_mux.c};
assign q_right = {top2901.data.I0.q_mux.a,top2901.data.I1.q_mux.a,top2901.data.I2.q_mux.a,top2901.data.I3.q_mux.a};
assign q_b = {top2901.data.I0.q_mux.b,top2901.data.I1.q_mux.b,top2901.data.I2.q_mux.b,top2901.data.I3.q_mux.b};



assign y_out = {top2901.data.I0.y_mux.y,top2901.data.I1.y_mux.y,top2901.data.I2.y_mux.y,top2901.data.I3.y_mux.y};
assign r_out = {top2901.data.I0.r_mux.y,top2901.data.I1.r_mux.y,top2901.data.I2.r_mux.y,top2901.data.I3.r_mux.y};
assign s_out = {top2901.data.I0.s_mux.y,top2901.data.I1.s_mux.y,top2901.data.I2.s_mux.y,top2901.data.I3.s_mux.y};
assign f_out = {top2901.data.I0.f_mux.y,top2901.data.I1.f_mux.y,top2901.data.I2.f_mux.y,top2901.data.I3.f_mux.y};
assign q_out = {top2901.data.I0.q_mux.y,top2901.data.I1.q_mux.y,top2901.data.I2.q_mux.y,top2901.data.I3.q_mux.y};

assign q0 = q0reg;
assign q3 = q3reg;
assign ram0 = ram0reg;
assign ram3 = ram3reg;

Am2901 top2901(cp,i,cin_hi,cout_hi,g_lo,p_lo,ovr,z,f3,d,y,a,b,ram0,ram3,q0,q3,oe);

`include "testfixture.verilog"

endmodule
