module one_bit_full_adder(A, B, Cin, S, Cout);

input A, B, Cin;
output S, Cout;

wire x1;
wire x2;
wire x3;

xor gate1(x1, A, B);
xor gate2(S, x1, Cin);

and gate3(x2, A, B);
and gate4(x3, x1, Cin);

or gate5(Cout, x2, x3);

endmodule


module four_bit_RCA_RCS(A, B, Cin, S, Cout);

input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

wire C1;
wire C2;
wire C3;

one_bit_full_adder FA0(A[0], B[0] ^ Cin, Cin, S[0], C1);
one_bit_full_adder FA1(A[1], B[1] ^ Cin, C1, S[1], C2);
one_bit_full_adder FA2(A[2], B[2] ^ Cin, C2, S[2], C3);
one_bit_full_adder FA3(A[3], B[3] ^ Cin, C3, S[3], Cout);

endmodule