module cla_4bit_block(
input [3:0] A,
input [3:0] B,
input Cin,
output [3:0] S,
output P_blk,
output G_blk
);
wire [3:0] g, p;
wire [3:1] c;

// this makes a carry and also lets a carry go through
and g0 (g[0], A[0], B[0]);
and g1 (g[1], A[1], B[1]);
and g2 (g[2], A[2], B[2]);
and g3 (g[3], A[3], B[3]);

or p0 (p[0], A[0], B[0]);
or p1 (p[1], A[1], B[1]);
or p2 (p[2], A[2], B[2]);
or p3 (p[3], A[3], B[3]);

// This carries between the bits
wire p0_cin;
and a1 (p0_cin, p[0], Cin);
or o1 (c[1], g[0], p0_cin);

wire p1_c1;
and a2 (p1_c1, p[1], c[1]);
or o2 (c[2], g[1], p1_c1);

wire p2_c2;
and a3 (p2_c2, p[2], c[2]);
or o3 (c[3], g[2], p2_c2);

// the entirety of the full adder comes out to be the sum of bits
one_bit_full_adder fa0 (A[0], B[0], Cin, S[0], );
one_bit_full_adder fa1 (A[1], B[1], c[1], S[1], );
one_bit_full_adder fa2 (A[2], B[2], c[2], S[2], );
one_bit_full_adder fa3 (A[3], B[3], c[3], S[3], );

// Block Propagatation is for all 4 p's to be 1
wire p3_p2, p1_p0;
and ap1 (p3_p2, p[3], p[2]);
and ap2 (p1_p0, p[1], p[0]);
and ap3 (P_blk, p3_p2, p1_p0);

// Blocks make a carry out at the top
wire p3_g2;
and ag1 (p3_g2, p[3], g[2]);

wire p3_p2_g1;
and ag2 (p3_p2_g1, p3_p2, g[1]);

wire p3_p2_p1, p3_p2_p1_g0;
and ag3 (p3_p2_p1, p3_p2, p[1]);
and ag4 (p3_p2_p1_g0, p3_p2_p1, g[0]);

wire og_term1, og_term2;
or og1 (og_term1, g[3], p3_g2);
or og2 (og_term2, p3_p2_g1, p3_p2_p1_g0);
or og3 (G_blk, og_term1, og_term2);

endmodule
