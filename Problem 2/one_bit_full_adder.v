//below is just setting up the logic of an adder that has 3 inputs and a carry out that gives the sum of the inputs
module one_bit_full_adder(A, B, Cin, S, Cout);
input A, B, Cin;
output S, Cout;

//this shows the logic terms combined with XOR giving us the input of 1  
assign S = A ^ B ^ Cin;

  //this shows our knowledge on previous classes on gates that each term have AND gates(&) and combine them all with OR's as you can think of it as multiplication  
assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
