module tb_cla_32bit;

reg [31:0] A, B;
reg Cin;
wire [31:0] S;
wire Cout;

  cla_32bit uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb_cla_32bit);

// Testing for simple addition like 5 + 10 getting us 15
A = 32'h00000005; B = 32'h0000000A; Cin = 0; #10;

// Testing for blocks carrying through propagation
A = 32'h0FFFFFFF; B = 32'h00000001; Cin = 0; #10;

// Testing for most significant byte's carry out
A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; #10;

// Testing once again for addition
A = 32'h12345678; B = 32'h87654321; Cin = 1; #10;

$finish;
end

endmodule
