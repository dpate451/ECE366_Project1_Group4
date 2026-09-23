# ECE366_Project1_Group4

ECE 366: Computer Organization — Project 1Instructor: Prof. Debjit Pal (DP)Semester: Fall 2026Simulation Environment: EDA Playground / Verilog HDL👥 Team MembersDiyaDanielDaniallBrice

📌 Project OverviewThis project focuses on designing, modeling, and verifying arithmetic logic units (ALUs) and addition/subtraction architectures using Verilog HDL. The designs span structural and behavioral modeling, ranging from basic 1-bit building blocks up to complex 32-bit Carry Lookahead and 16-bit Parallel Prefix Adders.

📑 Project Structure & Hardware Implementations

Problem 1: 1-Bit & 4-Bit Adder / Subtractor1-bit Full Adder: Implemented using both Behavioral (one_bit_full_adder) and Structural modeling techniques.4-bit Ripple-Carry Adder/Subtractor (RCA/RCS): Cascades 1-bit full adders to implement a 4-bit addition and two's-complement subtraction module (four_bit_RCA_RCS).Testbench: tb_four_bit_RCA_RCS verifies unsigned addition/subtraction, two's-complement signed operations with negative operands, and carry-out overflow conditions.

Problem 2: 32-Bit Carry Lookahead Adder (CLA)32-Bit CLA (CLA): Constructed using 4-bit block sizes backed by the 4-bit RCA module from Problem 1. Block-level carry-propagate and carry-generate logic are realized strictly using 2-input AND and OR gates.Testbench: tb_CLA verifies 32-bit operations and tests multi-block carry propagation across all eight 4-bit blocks.

Problem 3: 16-Bit Parallel Prefix Adder (PPA)16-Bit PPA (PPA): Implements a tree-based parallel prefix network consisting of:Pre-computation stage: Bit-level propagate ($P_{i:i} = A_i \mid B_i$) and generate ($G_{i:i} = A_i \& B_i$) signals.Prefix network stage: Block-level propagate ($P_{i:j}$) and generate ($G_{i:j}$) logic built exclusively using 2-input AND and OR gates.Post-computation stage: Sum generation ($S_i = G_{(i-1):-1} \oplus (A_i \oplus B_i)$).Testbench: tb_PPA validates prefix carry computation and output sum accuracy across edge cases.

Problem 4 (Bonus): 16-Bit Kogge-Stone Adder (KS)16-Bit KS Adder: Implements a high-speed Kogge-Stone parallel prefix architecture using $\log_2(N)$ stages for maximum concurrency.Testbench: tb_KS evaluates performance and correctness against the CLA/PPA test suites.📂 Repository File Directory.
├── src/
│   ├── one_bit_full_adder.v   # Behavioral and structural 1-bit adders
│   ├── four_bit_RCA_RCS.v     # 4-bit Ripple-Carry Adder/Subtractor
│   ├── CLA.v                  # 32-bit Carry Lookahead Adder
│   ├── PPA.v                  # 16-bit Parallel Prefix Adder
│   └── KS_adder.v             # (Bonus) 16-bit Kogge-Stone Adder
├── tb/
│   ├── tb_four_bit_RCA_RCS.v  # Testbench for Problem 1
│   ├── tb_CLA.v               # Testbench for Problem 2
│   ├── tb_PPA.v               # Testbench for Problem 3
│   └── tb_KS.v                # Testbench for Problem 4
├── doc/
│   ├── Progress_Report_1.pdf
│   ├── Progress_Report_2.pdf
│   └── Final_Report.pdf
└── README.md
🛠️ Simulation & Verification InstructionsOpen EDA Playground (or your local Verilog simulator such as Icarus Verilog / ModelSim).Upload the desired design file from src/ alongside its corresponding testbench from tb/.Set the top-level module to the testbench name (e.g., tb_CLA).Select Icarus Verilog or EPWave to view waveform signals.Run the simulation and verify that output waveforms match expected arithmetic outputs.📅 Project Milestones & Progress TrackMilestoneTarget DeadlineDeliverables / StatusProgress Report 1Oct 1, 2026 (11:59 PM)Completion of Problem 1; initial work on Problem 2Progress Report 2Oct 8, 2026 (11:59 PM)Completion of Problem 2; initial work on Problem 3Final ReportOct 15, 2026 (11:59 PM)All designs complete (P1–P3 + Bonus P4), source tarball, final document🤝 Team Member Responsibilities📜 ReferencesHarris, D. A Taxonomy of Parallel Prefix Networks.Harris, S. L., & Harris, D. Digital Design and Computer Architecture, 2nd ed. (Section 5.2.1: Prefix Adders).ASIC World Verilog Tutorials & EDA Playground Documentation.
