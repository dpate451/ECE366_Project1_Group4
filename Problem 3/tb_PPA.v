// File: tb_PPA.v
// Description: Testbench for 16-Bit Parallel Prefix Adder

`timescale 1ns / 1ps

module tb_PPA;
    // Testbench signals to drive inputs and monitor outputs
    reg  [15:0] A;
    reg  [15:0] B;
    reg         Cin;
    wire [15:0] Sum;
    wire        Cout;

    // Variables used to check results automatically during simulation
    reg [16:0] expected;
    integer i, errors;

    // the Unit Under Test (UUT)
    //connecting our PPA module
    PPA uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Set up the waveform dump file for simulation viewing 
        $dumpfile("problem3_waveform.vcd");
        $dumpvars(0, tb_PPA);

        errors = 0;
        
        $display("--------------------------------------------------");
        $display("Starting 16-Bit Parallel Prefix Adder Tests...");
        $display("--------------------------------------------------");

        // Test Case 1: Simple Addition without Carry
        A = 16'h0005; B = 16'h000A; Cin = 1'b0; #10;
        check_result();

        // Test Case 2: Addition with Cin
        A = 16'h0100; B = 16'h00FF; Cin = 1'b1; #10;
        check_result();

        // Test Case 3: Maximum values (Overflow check)
        A = 16'hFFFF; B = 16'hFFFF; Cin = 1'b1; #10;
        check_result();

        // Test Case 4: Alternating bit pattern
        A = 16'hAAAA; B = 16'h5555; Cin = 1'b0; #10;
        check_result();               //tests internal prefix wiring

        // Test Case 5: Randomized Testing
        for (i = 0; i < 20; i = i + 1) begin
            A = $random;
            B = $random;
            Cin = $random & 1'b1;
            #10;
            check_result();
        end

        // Final Results Summary
        $display("--------------------------------------------------");
        if (errors == 0) begin
            $display("SUCCESS: All test cases passed!");
        end else begin
            $display("FAILURE: %0d error(s) detected.", errors);
        end
        $display("--------------------------------------------------");
        $finish;
    end

    // Task to verify output
    //verifies if the hardware output matches expected math
    task check_result;
        begin
            expected = A + B + Cin; // Calculate what the result should be
            if ({Cout, Sum} !== expected) begin
                $display("ERROR at time %0t: A=%h, B=%h, Cin=%b | Expected: Cout=%b Sum=%h, Got: Cout=%b Sum=%h",
                         $time, A, B, Cin, expected[16], expected[15:0], Cout, Sum);
                errors = errors + 1; // Track total errors if any mismatch occurs
            end else begin
                $display("PASS at time %0t: A=%h, B=%h, Cin=%b => Sum=%h, Cout=%b",
                         $time, A, B, Cin, Sum, Cout);
            end
        end
    endtask

endmodule

