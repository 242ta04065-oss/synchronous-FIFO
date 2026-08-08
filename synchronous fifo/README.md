# Synchronous FIFO using Verilog

## 📌 Overview

This project implements a **Synchronous FIFO (First-In First-Out)** memory using Verilog HDL.

A FIFO stores data in the order it is written. The first data written into the FIFO is the first data read from it.

The FIFO uses a **single clock** for both read and write operations.

---

## Features

- Synchronous FIFO design
- Single clock domain
- Parameterized data width and depth
- Read and write operations
- Full and empty status flags
- Read and write pointers
- Counter for tracking stored data
- Complete Verilog testbench
- Simulation-ready design

---

## FIFO Parameters

| Parameter | Value |
|---|---:|
| Data Width | 8 bits |
| FIFO Depth | 16 |
| Address Width | 4 bits |

---

## Inputs

| Signal | Description |
|---|---|
| `clk` | System clock |
| `rst` | Synchronous reset |
| `wr_en` | Write enable |
| `rd_en` | Read enable |
| `din[7:0]` | Input data |

---

## Outputs

| Signal | Description |
|---|---|
| `dout[7:0]` | Output data |
| `full` | Indicates FIFO is full |
| `empty` | Indicates FIFO is empty |

---

## Working Principle

### Write Operation

When `wr_en` is HIGH and the FIFO is not full:

```text
din → Memory → Write Pointer
```

The data is stored at the current write pointer and the pointer is incremented.

### Read Operation

When `rd_en` is HIGH and the FIFO is not empty:

```text
Read Pointer → Memory → dout
```

The data is read from the current read pointer and the pointer is incremented.

---

## FIFO Operation

```text
             WRITE
               |
               v
        +---------------+
        |               |
din --->|     FIFO      |---> dout
        |    MEMORY     |
        |               |
        +---------------+
               ^
               |
              READ

       full       empty
        |           |
        v           v
      STATUS      STATUS
```

---

## Project Files

```text
Synchronous-FIFO-Verilog/
│
├── README.md
├── synchronous_fifo.v
├── synchronous_fifo_tb.v
├── simulation_result.png
├── waveform.png
└── LICENSE
```

---

## Simulation

The testbench verifies:

1. FIFO reset
2. Writing data into FIFO
3. Reading data from FIFO
4. FIFO empty condition
5. FIFO full condition
6. First-In First-Out behavior

---

## Expected FIFO Behavior

If the following data is written:

```text
10
20
30
40
```

The data should be read in the same order:

```text
10
20
30
40
```

This demonstrates the FIFO principle.

---

## Applications

- Data buffering
- Processor systems
- Communication interfaces
- UART data buffering
- Digital signal processing
- FPGA designs
- ASIC designs
- Clock-domain data storage

---

## Tools Used

- Verilog HDL
- ModelSim
- Vivado
- Icarus Verilog
- GTKWave

---

## Author

**Sravani C**

Electronics and Communication Engineering (ECE)