module PPA (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    // Stage 0: Figure out the base generate (g) and propagate (p) for every single bit
    wire [15:0] g0, p0;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_stage0
            and g_gate (g0[i], A[i], B[i]);
            or  p_gate (p0[i], A[i], B[i]);
        end
    endgenerate

    // Black Cell helper module using 2-input AND/OR gates
    // Computes: G_out = G_hi | (P_hi and G_lo), P_out = P_hi and P_lo
    // Stage 1: Combine carries with a distance of 1 using black cell logic
    wire [15:0] g1, p1;
    assign g1[0] = g0[0];
    assign p1[0] = p0[0];
    generate
        for (i = 1; i < 16; i = i + 1) begin : gen_stage1
            wire p_and_g;
            and a1 (p_and_g, p0[i], g0[i-1]);
            or  o1 (g1[i], g0[i], p_and_g);
            and a2 (p1[i], p0[i], p0[i-1]);
        end
    endgenerate

    // stage 2: Combine carries with a distance of 2
    wire [15:0] g2, p2;
    assign g2[1:0] = g1[1:0];
    assign p2[1:0] = p1[1:0];
    generate
        for (i = 2; i < 16; i = i + 1) begin : gen_stage2
            wire p_and_g;
            and a1 (p_and_g, p1[i], g1[i-2]);
            or  o1 (g2[i], g1[i], p_and_g);
            and a2 (p2[i], p1[i], p1[i-2]);
        end
    endgenerate

    // Stage 3: Combine carries with a distance of 4
    wire [15:0] g3, p3;
    assign g3[3:0] = g2[3:0];
    assign p3[3:0] = p2[3:0];
    generate
        for (i = 4; i < 16; i = i + 1) begin : gen_stage3
            wire p_and_g;
            and a1 (p_and_g, p2[i], g2[i-4]);
            or  o1 (g3[i], g2[i], p_and_g);
            and a2 (p3[i], p2[i], p2[i-4]);
        end
    endgenerate

    // Stage 4: Combine carries with a distance of 8 -finishes the prefix tree
    wire [15:0] g4, p4;
    assign g4[7:0] = g3[7:0];
    assign p4[7:0] = p3[7:0];
    generate
        for (i = 8; i < 16; i = i + 1) begin : gen_stage4
            wire p_and_g;
            and a1 (p_and_g, p3[i], g3[i-8]);
            or  o1 (g4[i], g3[i], p_and_g);
            and a2 (p4[i], p3[i], p3[i-8]);
        end
    endgenerate

    // Carry computation incorporate Cin
    //Bring in the initial carry-in (Cin) to calculate all actual carry bits
    wire [16:0] C;
    assign C[0] = Cin;
    
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_carries
            wire p_and_cin;
            and a_cin (p_and_cin, p4[i], Cin);
            or  o_cin (C[i+1], g4[i], p_and_cin);
        end
    endgenerate

    assign Cout = C[16];

    // Final Sum calculation: Sum[i] = A[i] ^ B[i] ^ C[i]
    // XOR Built using basic 2-input AND, OR, and NOT gates
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_sum
            wire p_xor;
            wire c_not, p_not;
            wire term1, term2;

            // Step A: Calculate (A[i] ^ B[i]) using the gates
            // p_xor = A[i] ^ B[i]
            wire a_not, b_not, a_and_b_not, b_and_a_not;
            not (a_not, A[i]);
            not (b_not, B[i]);
            and (a_and_b_not, A[i], b_not);
            and (b_and_a_not, B[i], a_not);
            or  (p_xor, a_and_b_not, b_and_a_not);

            // Step B: Calculate final sum bit by XORing the propagate result with the carry bit
            // Sum[i] = p_xor ^ C[i]
            
            not (c_not, C[i]);
            not (p_not, p_xor);
            and (term1, p_xor, c_not);
            and (term2, C[i], p_not);
            or  (Sum[i], term1, term2);
        end
    endgenerate

endmodule
