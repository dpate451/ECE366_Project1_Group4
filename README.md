ECE 366: Computer Organization - Project 1

Welcome to the GitHub repository for ECE 366 Project 1. This project focuses on designing, implementing, and testing various hardware adders and subtractors using Verilog HDL and simulating them on EDA Playground.

👥 Team Members

Diya

Daniel

Daniall

Brice

📌 Project Overview

This project involves building arithmetic digital logic circuits of increasing complexity in Verilog, ranging from basic gate-level modules to advanced parallel prefix adders.

Objectives:

Problem 1: 1-bit Full Adder (Behavioral & Structural), 4-bit Ripple-Carry Adder (RCA), and 4-bit Ripple-Carry Subtractor (RCS).

Problem 2: 32-bit Carry Lookahead Adder (CLA) using 4-bit block sizes.

Problem 3: 16-bit Parallel Prefix Adder (PPA).

Problem 4 (Bonus): 16-bit Kogge-Stone (KS) Adder.

📂 Repository Structure

├── src/                        # Verilog source code modules
│   ├── one_bit_full_adder.v    # 1-bit Full Adder
│   ├── four_bit_RCA_RCS.v      # 4-bit RCA / RCS
│   ├── CLA.v                   # 32-bit Carry Lookahead Adder
│   ├── PPA.v                   # 16-bit Parallel Prefix Adder
│   └── KS_Adder.v              # 16-bit Kogge-Stone Adder (Bonus)
│
├── tb/                         # Testbenches
│   ├── tb_four_bit_RCA_RCS.v   # Testbench for Problem 1
│   ├── tb_CLA.v                # Testbench for Problem 2
│   ├── tb_PPA.v                # Testbench for Problem 3
│   └── tb_KS_Adder.v           # Testbench for Problem 4
│
├── docs/                       # Reports and documentation
│   ├── Progress_Report_1.pdf
│   ├── Progress_Report_2.pdf
│   └── Final_Report.pdf
│
└── README.md                   # Project overview and guidelines


🛠️ Simulation & Tools

Language: Verilog HDL

Simulator Environment: EDA Playground

Waveform Viewer: EPWave (via EDA Playground)

How to Run Simulations

Copy the desired module from src/ and testbench from tb/.

Open EDA Playground.

Set the design language to Verilog/SystemVerilog.

Choose a simulator (e.g., Icarus Verilog or Riviera-PRO).

Paste the testbench into the testbench.sv panel and the design module into the design.sv panel.

Check Open EPWave after run to display output waveforms.

Click Run.

📅 Project Deadlines

[ ] Progress Report 1: October 1, 2026 (11:59 PM Chicago Time)

[ ] Progress Report 2: October 8, 2026 (11:59 PM Chicago Time)

[ ] Final Report & Code Submission: October 15, 2026 (11:59 PM Chicago Time)

📝 Team Contributions & Responsibilities

Team Member

Assigned Tasks & Deliverables

Diya

• Problem 1: 1-bit/4-bit RCA & RCS Modules & Testbench



• Problem 4 (Optional Bonus): 16-bit Kogge-Stone Adder Design & Testbench



• Final Report Compilation & Formatting Lead

Daniel

• Problem 2: 32-bit Carry Lookahead Adder (CLA) Verilog Design



• Problem 2 Testbench & Carry Propagation Verification

Daniall

• Problem 3: 16-bit Parallel Prefix Adder (PPA) Verilog Design



• Problem 3 Testbench & Verification

Brice

• Progress Report 1 Preparation (Status Summary & Team Responsibilities)



• Progress Report 2 Preparation (Status Summary & Team Responsibilities)



• Repository Maintenance & Integration Support
