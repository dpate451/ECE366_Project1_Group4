module one_bit_full_adder(A, B, Cin, S, Cout);
input A, B, Cin;
output S, Cout;
 
assign S = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
 
// 4-bit Ripple-Carry Adder from Problem 1(c) (addition only, no subtract XORs).
// Used as the building block of the 32-bit CLA.
module four_bit_RCA(A, B, Cin, S, Cout);
 
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;
 
wire C1, C2, C3;
 
one_bit_full_adder FA0(A[0], B[0], Cin, S[0], C1);
one_bit_full_adder FA1(A[1], B[1], C1,  S[1], C2);
one_bit_full_adder FA2(A[2], B[2], C2,  S[2], C3);
one_bit_full_adder FA3(A[3], B[3], C3,  S[3], Cout);
 
endmodule
 
 
// 32-bit Carry Lookahead Adder, block size 4 (Problem 2(a))
module CLA(A, B, Cin, S, Cout);
 
input [31:0] A, B;
input Cin;
output [31:0] S;
output Cout;
 
wire [31:0] g, p;        // bit-level generate / propagate
wire [7:0]  P_blk, G_blk; // block-level propagate / generate
wire [8:0]  C;           // carry into each block (C[8] = Cout)
 
assign C[0] = Cin;
 
genvar i;
generate
for (i = 0; i < 8; i = i + 1) begin : blk
 
    // ---- Bit-level generate (g = A & B) and propagate (p = A | B) ----
    and g0 (g[4*i+0], A[4*i+0], B[4*i+0]);
    and g1 (g[4*i+1], A[4*i+1], B[4*i+1]);
    and g2 (g[4*i+2], A[4*i+2], B[4*i+2]);
    and g3 (g[4*i+3], A[4*i+3], B[4*i+3]);
 
    or  p0 (p[4*i+0], A[4*i+0], B[4*i+0]);
    or  p1 (p[4*i+1], A[4*i+1], B[4*i+1]);
    or  p2 (p[4*i+2], A[4*i+2], B[4*i+2]);
    or  p3 (p[4*i+3], A[4*i+3], B[4*i+3]);
 
    // ---- Block propagate: P_blk = p3 & p2 & p1 & p0 ----
    wire p3_p2, p1_p0;
    and ap1 (p3_p2, p[4*i+3], p[4*i+2]);
    and ap2 (p1_p0, p[4*i+1], p[4*i+0]);
    and ap3 (P_blk[i], p3_p2, p1_p0);
 
    // ---- Block generate: G_blk = g3 | p3g2 | p3p2g1 | p3p2p1g0 ----
    wire p3_g2, p3_p2_g1, p3_p2_p1, p3_p2_p1_g0, og_term1, og_term2;
    and ag1 (p3_g2,       p[4*i+3], g[4*i+2]);
    and ag2 (p3_p2_g1,    p3_p2,    g[4*i+1]);
    and ag3 (p3_p2_p1,    p3_p2,    p[4*i+1]);
    and ag4 (p3_p2_p1_g0, p3_p2_p1, g[4*i+0]);
    or  og1 (og_term1, g[4*i+3], p3_g2);
    or  og2 (og_term2, p3_p2_g1, p3_p2_p1_g0);
    or  og3 (G_blk[i], og_term1, og_term2);
 
    // ---- Carry into next block: C[i+1] = G_blk[i] | (P_blk[i] & C[i]) ----
    wire p_and_c;
    and a_c (p_and_c, P_blk[i], C[i]);
    or  o_c (C[i+1],  G_blk[i], p_and_c);
 
    // ---- Sum bits from the 4-bit RCA of Problem 1 ----
    // Its own Cout is left unconnected; the lookahead carry C[i+1] is used instead.
    four_bit_RCA rca (A[4*i +: 4], B[4*i +: 4], C[i], S[4*i +: 4], );
 
end
endgenerate
 
assign Cout = C[8];
 
endmodule
