module one_bit_full_adder(A, B, Cin, S, Cout);

// Port Declaration
input A, B, Cin;
output S, Cout;

// Dataflow Modeling (Continuous Assignments)
// Sum Logic: Generates 1 when an odd number of inputs are 1
assign S = A ^ B ^ Cin;

// Majority function (generates 1 if at least two inputs are 1)
assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule
