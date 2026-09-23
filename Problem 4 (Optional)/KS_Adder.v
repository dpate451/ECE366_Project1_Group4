module KS_Adder(A, B, Cin, S, Cout);

input [15:0] A, B;
input Cin;

output [15:0] S;
output Cout;

wire [15:0] P;
wire [15:0] G;

wire [15:0] P1, G1;
wire [15:0] P2, G2;
wire [15:0] P3, G3;
wire [15:0] P4, G4;

wire [15:0] C;

wire [15:0] temp1;
wire [15:0] temp2;
wire [15:0] temp3;
wire [15:0] temp4;
wire [15:0] carry_temp;


// Initial propagate and generate
generate
    for (genvar i = 0; i < 16; i = i + 1) begin
        xor (P[i], A[i], B[i]);
        and (G[i], A[i], B[i]);
    end
endgenerate


// Stage 1
assign P1[0] = P[0];
assign G1[0] = G[0];

generate
    for (genvar i = 1; i < 16; i = i + 1) begin
        and (P1[i], P[i], P[i-1]);
        and (temp1[i], P[i], G[i-1]);
        or  (G1[i], G[i], temp1[i]);
    end
endgenerate


// Stage 2
assign P2[0] = P1[0];
assign G2[0] = G1[0];

assign P2[1] = P1[1];
assign G2[1] = G1[1];

generate
    for (genvar i = 2; i < 16; i = i + 1) begin
        and (P2[i], P1[i], P1[i-2]);
        and (temp2[i], P1[i], G1[i-2]);
        or  (G2[i], G1[i], temp2[i]);
    end
endgenerate


// Stage 3
assign P3[0] = P2[0];
assign G3[0] = G2[0];

assign P3[1] = P2[1];
assign G3[1] = G2[1];

assign P3[2] = P2[2];
assign G3[2] = G2[2];

assign P3[3] = P2[3];
assign G3[3] = G2[3];

generate
    for (genvar i = 4; i < 16; i = i + 1) begin
        and (P3[i], P2[i], P2[i-4]);
        and (temp3[i], P2[i], G2[i-4]);
        or  (G3[i], G2[i], temp3[i]);
    end
endgenerate


// Stage 4
assign P4[0] = P3[0];
assign G4[0] = G3[0];

assign P4[1] = P3[1];
assign G4[1] = G3[1];

assign P4[2] = P3[2];
assign G4[2] = G3[2];

assign P4[3] = P3[3];
assign G4[3] = G3[3];

assign P4[4] = P3[4];
assign G4[4] = G3[4];

assign P4[5] = P3[5];
assign G4[5] = G3[5];

assign P4[6] = P3[6];
assign G4[6] = G3[6];

assign P4[7] = P3[7];
assign G4[7] = G3[7];

generate
    for (genvar i = 8; i < 16; i = i + 1) begin
        and (P4[i], P3[i], P3[i-8]);
        and (temp4[i], P3[i], G3[i-8]);
        or  (G4[i], G3[i], temp4[i]);
    end
endgenerate


// Carry calculations
assign C[0] = Cin;

generate
    for (genvar i = 1; i < 16; i = i + 1) begin
        and (carry_temp[i], P4[i-1], Cin);
        or  (C[i], G4[i-1], carry_temp[i]);
    end
endgenerate


// Sum
generate
    for (genvar i = 0; i < 16; i = i + 1) begin
        xor (S[i], P[i], C[i]);
    end
endgenerate


// Final carry-out
and (carry_temp[0], P4[15], Cin);
or  (Cout, G4[15], carry_temp[0]);

endmodule