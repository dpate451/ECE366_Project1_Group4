# ECE 366: Computer Organization - Project 1

![Verilog](https://img.shields.io/badge/Language-Verilog-blue.svg)
![Platform](https://img.shields.io/badge/Simulator-EDA%20Playground-orange.svg)
![Status](https://img.shields.io/badge/Status-In%20Progress-green.svg)

---

## 📌 Project Overview
This repository contains the design, implementation, and simulation of various fast-adder digital architectures in Verilog HDL as required for **ECE 366 (Computer Organization)**. The project evaluates trade-offs between hardware complexity, delay, and gate counts across multiple adder implementations.

---

## 👥 Team Members & Responsibilities

| Team Member | Assigned Tasks & Deliverables |
| :--- | :--- |
| **Diya Patel** | • **Problem 1:** 1-bit & 4-bit Ripple-Carry Adder/Subtractor (RCA/RCS)<br>• **Problem 4 (Bonus):** 16-bit Kogge-Stone Adder (KS)<br>• **Final Report:** Compilation, analysis, and final submission lead |
| **Daniel** | • **Problem 2:** 32-bit Carry Lookahead Adder (CLA) Design & Testbench<br>• Multi-block carry propagation verification |
| **Daniall** | • **Problem 3:** 16-bit Parallel Prefix Adder (PPA) Design & Testbench<br>• Structural verification & waveform debugging |
| **Brice** | • **Progress Report 1:** Status summary & submission<br>• **Progress Report 2:** Status summary & submission<br>• **Repository Management:** Maintenance, code integration, and documentation |

---

## 📁 Repository Structure

```text
.
├── src/
│   ├── problem1_rca_rcs/
│   │   ├── one_bit_full_adder.v
│   │   ├── four_bit_RCA_RCS.v
│   │   └── tb_four_bit_RCA_RCS.v
│   ├── problem2_cla/
│   │   ├── CLA_32bit.v
│   │   └── tb_CLA_32bit.v
│   ├── problem3_ppa/
│   │   ├── PPA_16bit.v
│   │   └── tb_PPA_16bit.v
│   └── problem4_bonus_ks/
│       ├── KoggeStone_16bit.v
│       └── tb_KoggeStone_16bit.v
├── reports/
│   ├── Progress_Report_1.pdf
│   ├── Progress_Report_2.pdf
│   └── Final_Report.pdf
└── README.md
