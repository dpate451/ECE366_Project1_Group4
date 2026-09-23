# ECE 366: Computer Organization — Project 1

* **Instructor:** Prof. Debjit Pal (DP)[cite: 1]
* **Semester:** Fall 2026[cite: 1]
* **Simulation Environment:** EDA Playground / Verilog HDL[cite: 1]

---

## 👥 Team Members
* Diya
* Daniel
* Daniall
* Brice

---

## 📌 Project Overview
This project focuses on designing, modeling, and verifying arithmetic logic units (ALUs) and addition/subtraction architectures using Verilog HDL[cite: 1]. The designs span structural and behavioral modeling, ranging from basic 1-bit building blocks up to complex 32-bit Carry Lookahead and 16-bit Parallel Prefix Adders[cite: 1].

---

## 📑 Project Structure & Hardware Implementations

### Problem 1: 1-Bit & 4-Bit Adder / Subtractor
* **1-bit Full Adder:** Implemented using both Behavioral (`one_bit_full_adder`) and Structural modeling techniques[cite: 1].
* **4-bit Ripple-Carry Adder/Subtractor (RCA/RCS):** Cascades 1-bit full adders to implement a 4-bit addition and two's-complement subtraction module (`four_bit_RCA_RCS`)[cite: 1].
* **Testbench:** `tb_four_bit_RCA_RCS` verifies unsigned addition/subtraction, two's-complement signed operations with negative operands, and carry-out overflow conditions[cite: 1].

### Problem 2: 32-Bit Carry Lookahead Adder (CLA)
* **32-Bit CLA (`CLA`):** Constructed using 4-bit block sizes backed by the 4-bit RCA module from Problem 1[cite: 1]. Block-level carry-propagate and carry-generate logic are realized strictly using 2-input AND and OR gates[cite: 1].
* **Testbench:** `tb_CLA` verifies 32-bit operations and tests multi-block carry propagation across all eight 4-bit blocks[cite: 1].

### Problem 3: 16-Bit Parallel Prefix Adder (PPA)
* **16-Bit PPA (`PPA`):** Implements a tree-based parallel prefix network consisting of:
  * **Pre-computation stage:** Bit-level propagate ($P_{i:i} = A_i \mid B_i$) and generate ($G_{i:i} = A_i \ \& \ B_i$) signals[cite: 1].
  * **Prefix network stage:** Block-level propagate ($P_{i:j}$) and generate ($G_{i:j}$) logic built exclusively using 2-input AND and OR gates[cite: 1].
  * **Post-computation stage:** Sum generation ($S_i = G_{(i-1):-1} \oplus (A_i \oplus B_i)$)[cite: 1].
* **Testbench:** `tb_PPA` validates prefix carry computation and output sum accuracy across edge cases[cite: 1].

### Problem 4 (Bonus): 16-Bit Kogge-Stone Adder (KS)
* **16-Bit KS Adder:** Implements a high-speed Kogge-Stone parallel prefix architecture using $\log_2(N)$ stages for maximum concurrency[cite: 1].
* **Testbench:** `tb_KS` evaluates performance and correctness against the CLA/PPA test suites[cite: 1].
