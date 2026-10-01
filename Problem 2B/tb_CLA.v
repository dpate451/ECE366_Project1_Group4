module tb_CLA;
 
reg [31:0] A, B;
reg Cin;
wire [31:0] S;
wire Cout;
 
CLA uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));
 
// Signed copies, only so $monitor can print two's-complement values in decimal
wire signed [31:0] sA = A, sB = B, sS = S;
 
initial begin
 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_CLA);
 
    // Print every input change and the resulting output (unsigned hex and signed decimal)
    $monitor("t=%0t  A=%h  B=%h  Cin=%b  ->  S=%h  Cout=%b   (signed: A=%0d B=%0d S=%0d)",
             $time, A, B, Cin, S, Cout, sA, sB, sS);
 
    // ===== Test types carried over from Problem 1(e) =====
 
    // 1. Unsigned addition: 5 + 10 = 15
    A = 32'd5;  B = 32'd10;  Cin = 0;  #10;
 
    // 2. Unsigned subtraction: 25 - 7 = 18
    //    computed as 25 + (~7) + 1
    A = 32'd25;  B = ~32'd7;  Cin = 1;  #10;
 
    // 3. Signed addition with a negative operand: -3 + 2 = -1
    //    -3 = 0xFFFFFFFD, expected S = 0xFFFFFFFF
    A = -32'sd3;  B = 32'd2;  Cin = 0;  #10;
 
    // 4. Signed subtraction with a negative operand: -2 - 3 = -5
    //    computed as -2 + (~3) + 1, expected S = 0xFFFFFFFB
    A = -32'sd2;  B = ~32'd3;  Cin = 1;  #10;
 
    // 5. Carry-out: 0xFFFFFFFF + 1 = 0x00000000 with Cout = 1
    A = 32'hFFFFFFFF;  B = 32'h00000001;  Cin = 0;  #10;
 
    // ===== Carry propagation across multiple 4-bit blocks =====
 
    // 6. Carry ripples through blocks 0-6: 0x0FFFFFFF + 1 = 0x10000000
    A = 32'h0FFFFFFF;  B = 32'h00000001;  Cin = 0;  #10;
 
    // 7. Cin alone propagates through all 8 blocks: 0xFFFFFFFF + 0 + 1 = 0, Cout = 1
    A = 32'hFFFFFFFF;  B = 32'h00000000;  Cin = 1;  #10;
 
    // 8. Carry generated in block 0, propagated by blocks 1-7: 0xF0F0F0F0 + 0x0F0F0F10 = 0, Cout = 1
    A = 32'hF0F0F0F0;  B = 32'h0F0F0F10;  Cin = 0;  #10;
 
    // ===== Additional cases =====
 
    // 9. General addition with carry-in: 0x12345678 + 0x87654321 + 1 = 0x9999999A
    A = 32'h12345678;  B = 32'h87654321;  Cin = 1;  #10;
 
    // 10. Largest values: 0xFFFFFFFF + 0xFFFFFFFF = 0xFFFFFFFE, Cout = 1
    A = 32'hFFFFFFFF;  B = 32'hFFFFFFFF;  Cin = 0;  #10;
 
    $finish;
 
end
 
endmodule
