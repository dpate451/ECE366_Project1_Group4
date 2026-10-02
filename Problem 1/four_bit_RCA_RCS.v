module one_bit_full_adder(A, B, Cin, S, Cout);

// Port Declarations
input A, B, Cin;
output S, Cout;

// Internal Wire Declarations
wire x1;          // Intermediate XOR result: A ^ B
wire x2;          // Intermediate AND result: A & B
wire x3;          // Intermediate AND result: (A ^ B) & Cin

// Gate-Level Structural Modeling
    // ------------------------------------------------------------------------
    // Sum Logic: S = (A ^ B) ^ Cin  
xor gate1(x1, A, B);
xor gate2(S, x1, Cin);

  // Carry-Out Logic: Cout = (A & B) | ((A ^ B) & Cin)
and gate3(x2, A, B);          // x2 = A & B
and gate4(x3, x1, Cin);       // x3 = (A ^ B) & Cin

or gate5(Cout, x2, x3);       // Cout = x2 | x3

endmodule


module four_bit_RCA_RCS(A, B, Cin, S, Cout);

// Port Declarations
input [3:0] A, B;          // 4-bit operand vectors A and B
input Cin;                 // Control signal / Carry-in: 0 = Add, 1 = Subtract
output [3:0] S;            // 4-bit result vector (Sum / Difference)
output Cout;               // Final carry-out / borrow-out

// Internal Carry Wires
wire C1;             // Carry from Bit 0 to Bit 1    
wire C2;             // Carry from Bit 1 to Bit 2
wire C3;             // Carry from Bit 2 to Bit 3

one_bit_full_adder FA0(A[0], B[0] ^ Cin, Cin, S[0], C1);
one_bit_full_adder FA1(A[1], B[1] ^ Cin, C1, S[1], C2);
one_bit_full_adder FA2(A[2], B[2] ^ Cin, C2, S[2], C3);
one_bit_full_adder FA3(A[3], B[3] ^ Cin, C3, S[3], Cout);

endmodule
