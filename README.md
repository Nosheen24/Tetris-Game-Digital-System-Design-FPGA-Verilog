# 🎮 FPGA Tetris Game (Verilog)

## 📖 Project Overview
This project implements the classic **Tetris game on the Nexys 3 FPGA board** using Verilog HDL.  
The system uses VGA display output, finite state machines, and hardware-based logic to simulate real-time gameplay.

The main objective was to gain hands-on experience in:
- FPGA design
- Digital system implementation
- VGA interfacing
- FSM-based control systems

---

## ⚙️ Features
- 🎮 Fully playable Tetris game on FPGA
- 🧠 FSM-based game control (IDLE, PLAY, PAUSE, DROP, SHIFT)
- 🎲 Random tetromino generation
- 🧱 Collision detection system
- 🖥️ VGA output (640×480 resolution)
- 🔢 4-digit 7-segment score display
- 🎛️ Button-based user control (move, rotate, drop, pause)

---

## 🏗️ System Architecture

### 1. Clock System
- 100 MHz FPGA clock
- Divided to 25 MHz for VGA timing
- 1 Hz game clock for block movement

### 2. Game Logic
- Board size: 10 × 22 grid
- Each cell represented by 1-bit memory
- FSM controls game flow and transitions

### 3. Tetromino Handling
- 7 standard Tetris pieces
- Rotation + position tracking
- Collision detection before movement

### 4. VGA Controller
- Generates HSYNC and VSYNC signals
- Renders board, blocks, and background in real time

### 5. Score System
- Score increases when a row is completed
- Displayed using multiplexed 7-segment display

---

## 🎮 Controls
| Button | Function |
|--------|----------|
| Left | Move block left |
| Right | Move block right |
| Rotate | Rotate block |
| Down | Soft drop |
| Drop | Hard drop |
| Switch | Pause / Reset |

---

## 🧾 Hardware / Software Used
- FPGA Board: Nexys 3
- Language: Verilog HDL
- Tool: Xilinx ISE Design Suite
- Simulation: ISim

---

## 📊 Simulation
- Verified using ISim waveform simulation
- VGA timing signals validated (HSYNC/VSYNC)
- Game logic tested via testbench stimulus

---

## 🎥 Output
- Working VGA Tetris gameplay on FPGA hardware
- Real-time block movement and scoring
- Stable FPGA implementation without glitches

---

## 📌 Key Learning Outcomes
- FPGA-based game development
- VGA signal generation
- FSM design for complex systems
- Real-time digital system debugging
- Hardware-software integration

---

## 🚀 Conclusion
This project successfully demonstrates a hardware implementation of the classic Tetris game using Verilog on an FPGA platform. It combines digital design principles with real-time graphics and control systems.

---

## 📎 Note
This project is designed for educational purposes as part of Digital System Design coursework at NUST.
