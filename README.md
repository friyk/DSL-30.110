# DSL-30.110 — Digital Systems Lab

Course repository for **30.110 Digital Systems Lab** at the Singapore University of Technology and Design (SUTD).

This repository spans coursework across logic gates, combinational/sequential circuits, and culminates in **T04** — an original hardware security project published at IEEE TENCON 2025.

## ⭐ Featured: T04 — Cryptographically Secure Random Number Generator (CSRNG)

A hardware CSRNG that harvests environmental radiation as a true entropy source, implemented on an FPGA. The architecture and statistical validation findings were co-authored and published at **IEEE TENCON 2025**.

📄 **IEEE Publication:** [doi.org/10.1109/TENCON66050.2025.11375162](https://doi.org/10.1109/TENCON66050.2025.11375162)

### T04 Directory Structure

| Directory | Description |
|---|---|
| `T04/` | VHDL source — top-level CSRNG hardware design |
| `T04_Validation/` | Statistical validation scripts and test results |
| `T04_bitstreams/` | Compiled FPGA bitstreams for deployment |

## Repository Structure

| Directory / File | Description |
|---|---|
| `T02/` | Sequential logic and FSM design |
| `T03/` | Intermediate digital design exercises |
| `T04/` | **CSRNG — IEEE TENCON 2025 submission** |
| `T04_Validation/` | Randomness validation (NIST / statistical tests) |
| `T04_bitstreams/` | FPGA bitstreams |
| `HW3/` | Homework assignment 3 |
| `LogicGate/` | Logic gate fundamentals |
| `T01_Basys3_LogicGate.ipynb` | T01 notebook — Basys3 logic gate implementation |

## Tech Stack

- **Language:** VHDL, Verilog
- **Hardware:** FPGA (Basys3)
- **Tools:** Vivado, Jupyter Notebook
- **Validation:** Statistical randomness testing
