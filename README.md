
# Synchronous FIFO (64x8) using Verilog HDL

## Project Overview

This project implements a 64-depth, 8-bit Synchronous FIFO (First-In First-Out) using Verilog HDL.

The FIFO acts as a temporary storage buffer between a data producer and consumer operating in the same clock domain.

---

## Features

- 64 Memory Locations
- 8-bit Data Width
- Single Clock Operation
- Circular Buffer Architecture
- Full Flag Detection
- Empty Flag Detection
- Simultaneous Read/Write Support
- Asynchronous Active-High Reset

---

## Problem Statement

In digital systems, producer and consumer modules may not process data at the same rate.

A FIFO provides temporary storage to prevent data loss while maintaining First-In First-Out ordering.

---

## Architecture

Components:

- Memory Array (64 x 8)
- Write Pointer
- Read Pointer
- FIFO Counter
- Full/Empty Logic

---

## Verification

Verified using Verilog Testbench.

Test Cases:

- Reset Verification
- Write Operation
- Read Operation
- FIFO Ordering
- Simultaneous Read/Write
- Full Condition
- Empty Condition
- Overflow Protection
- Underflow Protection

---

## Tools Used

- Verilog HDL
- Xilinx ISE / ModelSim

---

## Author

Yuvesh R Menghare
Electronic Engineering
