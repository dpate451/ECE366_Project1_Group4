module testbench;

reg [3:0] A, B;
reg Cin;
wire [3:0] S;
wire Cout;

four_bit_RCA_RCS uut(
    A, B, Cin, S, Cout
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    // 1. Unsigned addition: 3 + 2 = 5
    A = 4'b0011;
    B = 4'b0010;
    Cin = 0;
    #10;

    // 2. Unsigned subtraction: 5 - 2 = 3
    A = 4'b0101;
    B = 4'b0010;
    Cin = 1;
    #10;

    // 3. Signed addition: -3 + 2 = -1
    // -3 = 1101, 2 = 0010
    A = 4'b1101;
    B = 4'b0010;
    Cin = 0;
    #10;

    // 4. Signed subtraction: -2 - 3 = -5
    // -2 = 1110, 3 = 0011
    A = 4'b1110;
    B = 4'b0011;
    Cin = 1;
    #10;

    // 5. Carry-out: 15 + 1 = 16
    A = 4'b1111;
    B = 4'b0001;
    Cin = 0;
    #10;

    $finish;

end

endmodule