# ECE 366: Computer Organization - Project 1

---

## 📌 Project Overview

This repository contains the design, implementation, and simulation of digital adder architectures in **Verilog HDL** for **ECE 366 (Computer Organization)**.

The project currently includes the completed work for **Problem 1** and the partial implementation of **Problem 2(a)**. Our team has focused on writing and testing Verilog modules, analyzing simulation waveforms, and verifying carry propagation.

---

## 👥 Team Members & Responsibilities

| Team Member          | Assigned Tasks & Deliverables                                                                                                                                                                                                                                                                                                                                           |
| :------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Diya Patel**       | **Problem 1:** Built and tested the Verilog code for the 1-bit Full Adder and the 4-bit Ripple-Carry Adder/Subtractor modules.<br><br>**Problem 2(a):** Helped outline the 32-bit CLA setup and module structure before coding began.<br><br>**Going Forward:** Planning to take the lead on **Problem 4 (Kogge-Stone Adder)** and help pull the final report together. |
| **Daniell & Daniel** | **Problem 1:** Helped check the waveform outputs for the 1-bit and 4-bit Adder/Subtractor testbenches.<br><br>**Problem 2(a):** Wrote and finished the 32-bit CLA Verilog design and 4-bit blocks, created the testbench to check multi-block carry propagation, and handled pushing the code to GitHub.                                                                |
| **Brice**            | **Problem 1 & 2(a):** Worked with the team on analyzing waveforms, double-checking carry logic, and brainstorming test cases.<br><br>**Environment Setup:** Helped test and debug our simulation tools so everyone could run simulations smoothly.                                                                                                                      |
| **Everyone**         | **Collaboration:** All team members met at the library on different days and collaborated on the problems together.<br><br>**Progress Report 1:** Helped write and organize the report.<br><br>**Repository Management:** Managed code updates and made sure our local setups synced up cleanly with the team GitHub repository.                                        |

---

## 📁 Repository Structure

```text
.
├── Problem 1/
│   ├── four_bit_RCA_RCS.v
│   ├── one_bit_full_adder.v
│   ├── one_bit_full_adder_structural.v
│   └── testbench.v
│
├── Problem 2/
│   ├── cla_32bit.v
│   ├── cla_4bit_block.v
│   ├── one_bit_full_adder.v
│   └── tb_cla_32bit.v
│
├── reports/
│   └── Progress_Report_1.pdf
│
└── README.md
```

---

## 🧮 Problems Completed

### Problem 1: 1-bit Full Adder and 4-bit Ripple-Carry Adder/Subtractor

Problem 1 has been completed and tested.

The team implemented:

* **1-bit Full Adder**
* **Structural 1-bit Full Adder**
* **4-bit Ripple-Carry Adder/Subtractor**
* Testbenches for functional verification
* Waveform analysis and verification

The team tested different input combinations and analyzed the resulting sum, carry, and subtraction outputs to verify the designs.

---

### Problem 2(a): 32-bit Carry Lookahead Adder

Problem 2(a) is **partially completed**.

The current work includes:

* **4-bit CLA block design**
* Initial **32-bit CLA structure**
* Carry propagation between CLA blocks
* Testbench development
* Initial waveform verification

The team is continuing to verify the design and ensure that carry propagation works correctly across the 32-bit implementation.

---

## 🛠️ Tools & Technologies

* **Verilog HDL**
* **Riviera-PRO**
* **EDA Playground**
* **GitHub**
* **Waveform Simulation**

---

## 🤝 Collaboration

All team members contributed to the project through collaborative problem solving, code review, simulation testing, waveform analysis, and repository management.

Team members met at the library on different days to work through problems together. While individual members took primary responsibility for certain tasks, the team worked together to review code, analyze waveforms, troubleshoot issues, and verify results.

---

## 📊 Project Status

| Problem                             | Status                 |
| :---------------------------------- | :--------------------- |
| **Problem 1: Full Adder & RCA/RCS** | ✅ Completed            |
| **Problem 2(a): 32-bit CLA**        | 🔄 Partially Completed |
| **Problem 3**                       | ⏳ Not Started          |
| **Problem 4**                       | ⏳ Not Started          |
| **Final Report**                    | 🔄 In Progress         |

---

## 📄 Reports

Progress reports and other project documentation will be added to the `reports/` directory as they are completed.
