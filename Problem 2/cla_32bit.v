module cla_32bit(
input [31:0] A,
input [31:0] B,
input Cin,
output [31:0] S,
output Cout
);
wire [7:0] P_blk, G_blk;
wire [8:0] C;

assign C[0] = Cin;

// Generate inter-block carries using 2-input AND/OR gates
genvar i;
generate
for (i = 0; i < 8; i = i + 1) begin: carry_gen
wire p_and_c;
and a_c (p_and_c, P_blk[i], C[i]);
or o_c (C[i+1], G_blk[i], p_and_c);
end
endgenerate

// This is to initilize 4 bit blocks so that all 32 bits are covered 
generate
for (i = 0; i < 8; i = i + 1) begin: block_inst
  cla_4bit_block b (.A(A[4*i +: 4]), .B(B[4*i +: 4]), .Cin(C[i]), .S(S[4*i +: 4]), .P_blk(P_blk[i]), .G_blk(G_blk[i]));
end
endgenerate

// This is to show the logic of the whole adder carrying out with the last block
assign Cout = C[8];

endmodule
