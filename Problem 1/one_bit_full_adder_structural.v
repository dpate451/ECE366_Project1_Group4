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