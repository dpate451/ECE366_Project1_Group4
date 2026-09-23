module tb_KS_Adder;

reg [15:0] A;
reg [15:0] B;
reg Cin;

wire [15:0] S;
wire Cout;

KS_Adder uut(
    A, B, Cin, S, Cout
);

initial begin

    $dumpfile("problem4_waveform.vcd");
    $dumpvars(0, tb_KS_Adder);

    // Test 1: Basic addition
    // 3 + 2 = 5
    A = 16'h0003;
    B = 16'h0002;
    Cin = 0;
    #10;

    // Test 2: Addition with carry-in
    // 7 + 4 + 1 = 12
    A = 16'h0007;
    B = 16'h0004;
    Cin = 1;
    #10;

    // Test 3: Carry-out
    // FFFF + 0001 = 10000
    A = 16'hFFFF;
    B = 16'h0001;
    Cin = 0;
    #10;

    // Test 4: Carry propagation
    // 00FF + 0001 = 0100
    A = 16'h00FF;
    B = 16'h0001;
    Cin = 0;
    #10;

    // Test 5: Carry propagation across multiple bits
    // 0FFF + 0001 = 1000
    A = 16'h0FFF;
    B = 16'h0001;
    Cin = 0;
    #10;

    // Test 6: Larger addition
    // 1234 + 4321 = 5555
    A = 16'h1234;
    B = 16'h4321;
    Cin = 0;
    #10;

    // Test 7: Addition with carry-in
    // AAAA + 1111 + 1 = BBBC
    A = 16'hAAAA;
    B = 16'h1111;
    Cin = 1;
    #10;

    $finish;

end

endmodule