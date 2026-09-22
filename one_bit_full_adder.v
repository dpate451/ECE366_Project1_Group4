module one_bit_full_adder (A, B, Cin, S, Cout);
    // Inputs defined by project spec
    input A, B, Cin;
    
    // Outputs defined by project spec
    output S, Cout;

    // Behavioral logic for 1-bit addition
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
