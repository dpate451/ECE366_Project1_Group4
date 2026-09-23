module one_bit_full_adder(A, B, Cin, S, Cout);

input A, B, Cin;
output reg S, Cout;

always @(*) begin
    S = A ^ B ^ Cin;
    Cout = (A & B) | (A & Cin) | (B & Cin);
end

endmodule
