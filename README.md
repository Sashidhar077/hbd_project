# 🎂 Happy Birthday Design Problem

A Verilog HDL project implementing a serial transmitter and receiver system that detects a predefined birthday pattern in a continuous serial bit stream.

---

## 📖 Project Overview

This project was developed as part of a Digital Design / RTL Design assignment.

The system consists of two major blocks:

- **Transmitter**
  - Generates a 10-bit binary count (0–1023)
  - Sends each value serially (LSB first)
  - Generates one bit every clock cycle

- **Receiver**
  - Receives the serial bit stream
  - Stores the last 9 received bits
  - Detects a predefined birthday pattern
  - Counts every successful match
  - Updates a seven-segment display every second

---



---

                    +----------------------+
                    |     Top Module       |
                    +----------+-----------+
                               |
        +----------------------+--------------------+
        |                                           |
        |                                           |
+-------v-------+                         +---------v---------+
| 10-bit Counter|                         | Clock Divider     |
+-------+-------+                         +---------+---------+
        |                                           |
        |                                           |
+-------v-------+                         +---------v---------+
| Serial TX     |------------------------>| Receiver          |
+---------------+        Serial Data      +---------+---------+
                                                |
                                        +-------v-------+
                                        | Shift Register|
                                        +-------+-------+
                                                |
                                        +-------v-------+
                                        | Comparator    |
                                        +-------+-------+
                                                |
                                        +-------v-------+
                                        | Hit Counter   |
                                        +-------+-------+
                                                |
                                        +-------v-------+
                                        |BCD Encoder    |
                                        +-------+-------+
                                                |
                                        +-------v-------+
                                        |7-Segment Disp |
                                        +---------------+


## 📋 Modules

| Module | Description |
|----------|-------------|
| Data Generator Counter | Generates 10-bit binary values |
| Serial Transmitter | Sends data serially (LSB first) |
| Shift Register | Stores last 9 received bits |
| Pattern Detector | Detects birthday pattern |
| Hit Counter | Counts successful detections |
| Clock Divider | Generates 1-second pulse |
| Binary to BCD | Converts binary count to decimal |
| Seven Segment Driver | Drives the display |
| Top Module | Integrates the complete system |

---

## ⏱ Timing

| Parameter | Value |
|-----------|-------|
| Clock Frequency | 10 kHz |
| Bit Rate | 10 kbps |
| Frame Length | 10 bits |
| Frame Time | 1 ms |
| Display Update | 1 second |

---

## 🛠 Tools Used

- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave
- Git
- GitHub

---

## ▶️ Simulation

Compile:

```bash
iverilog -o top.out rtl/**/*.v testbench/tb_top.v
```

Run:

```bash
vvp top.out
```

Open waveform:

```bash
gtkwave top.vcd
```

---

## 📚 Learning Goals

This project demonstrates:

- RTL Design
- Sequential Logic
- Counters
- Shift Registers
- Finite State Machines (optional)
- Pattern Detection
- Serial Communication
- Seven Segment Display Driving
- Testbench Development
- Digital System Integration

---


