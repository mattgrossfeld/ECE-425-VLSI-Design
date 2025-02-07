// ECE 425 MP2: Verilog RTL for Am2901 controller
// Rev 2/17/08

module controller(
	i,					// opcode (add your decoded signals)
	a,b,select_a_hi,select_b_hi,		// decoding of register addresses
	f,c,p,g_lo,p_lo,ovr,z,			// generation of ALU outputs
	y_tri,y_data,oe,			// tristate control of y bus
	ram0,ram3,		// tristate control of RAM shifter
	q0,q3,q0_data,q3_data			// tristate control of Q shifter
	//,reg_wr      //add additiona signals for your design here
);

 // define I/O for synthesized control
input [8:0] i;
input [3:0] a, b;
output [15:0] select_a_hi, select_b_hi;
input [3:0] f, c, p;
output g_lo, p_lo, ovr, z;
inout [3:0] y_tri;
input [3:0] y_data;
input oe;
inout ram0, ram3, q0, q3;
input q0_data, q3_data;
//output reg_wr    //define additional I/Os for your design



 // named internal wires carry reusable subexpressions
wire shift_left, shift_right;

 // "assign" statements give us algebraic expressions
assign select_a_hi = 16'h0001 << a;
assign select_b_hi = 16'h0001 << b;
assign shift_left = i[8] & i[7];
assign shift_right = i[8] & ~ i[7];

 // simpler functionality is better implemented directly in logic gates
buf calcg(	g_lo,	~c[3] ); // glitchy with lookahead carry propagation, but shouldn't matter for us :v)
nand calcp(	p_lo,	p[3], p[2], p[1], p[0] );
xor calcovr(	ovr,	c[3], c[2] );
nor calczero(	z,	f[3], f[2], f[1], f[0] );

bufif1 drvy3(	y_tri[3],y_data[3], oe );
bufif1 drvy2(	y_tri[2],y_data[2], oe );
bufif1 drvy1(	y_tri[1],y_data[1], oe );
bufif1 drvy0(	y_tri[0],y_data[0], oe );
bufif1 drvraml( ram3,	f[3], shift_left );
bufif1 drvramr( ram0,	f[0], shift_right );
bufif1 drvqshl( q3,	q3_data, shift_left );
bufif1 drvqshr( q0,	q0_data, shift_right );


 // add your control signals here...
//assign reg_wr = ;
//end

endmodule

