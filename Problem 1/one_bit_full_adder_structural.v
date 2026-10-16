module one_bit_full_adder(A, B, Cin, S, Cout);
// the port declarations
input A, B, Cin; //inputs A, B and Cin
output S, Cout; // outputs sum(s) and cout

wire x1; // wire for A XOR B
wire x2; // wire for A AND B
wire x3; // wire for (A XOR B) AND Cin
// S = (A ^ B) ^ Cin
xor gate1(x1, A, B); // x1 = A ^ B
xor gate2(S, x1, Cin); // S  = x1 ^ Cin

and gate3(x2, A, B); // x2 = A and B
and gate4(x3, x1, Cin); // x3 = (A ^ B) and Cin

or gate5(Cout, x2, x3); // Cout = x2 | x3

endmodule
