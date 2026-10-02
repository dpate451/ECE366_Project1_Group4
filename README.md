# ECE 366: Computer Organization - Project 1
---

## 📌 Project Overview
This repository contains the design, implementation, and simulation of various fast-adder digital architectures in Verilog HDL as required for **ECE 366 (Computer Organization)**. The project evaluates trade-offs between hardware complexity, delay, and gate counts across multiple adder implementations.

---

## 👥 Team Members & Responsibilities

| Team Member | Assigned Tasks & Deliverables |
| :--- | :--- |
| **Diya Patel** | • Problem 1: Built and tested the Verilog code for the 1-bit full adder and the 4-bit Ripple-Carry Adder/Subtractor modules. Problem 2(a): Helped outline the 32-bit CLA setup and module structure before we started coding. Going Forward: Planning to take the lead on Problem 4 (Kogge-Stone Adder) and help pull the final report together.|
| **Daniall & Daniel** | • **Problem 2:** 32-bit Carry Lookahead Adder (CLA) Design & Testbench<br>• Multi-block carry propagation verification |
| **Brice** | • **Problem 3:** 16-bit Parallel Prefix Adder (PPA) Design & Testbench<br>• Structural verification & waveform debugging |
| **Everyone** | • **Progress Report 1:** Status summary & submission<br>• **Progress Report 2:** Status summary & submission<br>• **Repository Management:** Maintenance, code integration, and documentation |

---

## 📁 Repository Structure

```text
.
├── Problem 1/
│   ├── four_bit_RCA_RCS.v
│   ├── one_bit_full_adder.v
│   ├── one_bit_full_adder_structural.v
│   └── testbench.v
├── Problem 2/
│   ├── cla_32bit.v
│   └── cla_4bit_block.v
    └── one_bit_full_adder.v
    └── tb_cla_32bit.v
├── Problem 3/
│   ├── PPA_16bit.v
│   └── tb_PPA_16bit.v
├── Problem 4/
│   ├── tb_KS_Adder.v
│   └── KS_Adder.v
├── reports/
│   ├── Progress_Report_1.pdf
│   ├── Progress_Report_2.pdf
│   └── Final_Report.pdf
└── README.md
