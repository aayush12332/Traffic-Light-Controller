# 🚦 Traffic Light Controller using Verilog

This project implements a **Traffic Light Controller** using **Verilog HDL** for a **four-way intersection with North–South priority**. The system is designed using **Finite State Machine (FSM)** and **timing-based control logic** to ensure safe and smooth traffic flow. The design is simulated and verified using **Vivado**.

---

## 🔷 Project Description

- Designed a traffic light controller for a four-way intersection with **North–South priority** to optimize traffic flow.
- Implemented **timing rules** such as Green (25s) and Yellow (4s) signals to ensure smooth and safe vehicle movement.
- Used **Finite State Machine (FSM)** and **counters** to control signal transitions in a proper sequence and avoid conflicts.
- Simulated and verified the design using **Vivado**, ensuring correct functionality and reliable system performance.

---

## 🔷 Table of Contents

1. [Introduction](#introduction)
2. [Methodology](#methodology)
3. [System Design](#system-design)
4. [State Diagram](#state-diagram)
5. [State Table](#state-table)
6. [Timing Configuration](#timing-configuration)
7. [RTL Code](#rtl-code)
8. [Testbench](#testbench)
9. [Output Waveforms](#output-waveforms)
10. [Result](#result)
11. [Limitations](#limitations)
12. [Future Improvements](#future-improvements)
13. [Tools & Technologies](#tools--technologies)
14. [Key Concepts](#key-concepts)

---

## 🔷 Introduction

Traffic congestion and accidents are common problems at road intersections. A properly designed traffic light controller ensures safe and efficient movement of vehicles.  

This project demonstrates how **digital design concepts** like FSM and counters can be used to control traffic signals effectively.

---

## 🔷 Methodology

The system is implemented using a **Finite State Machine (FSM)** approach.

### Directions Considered

- **M1, M2** → Main road directions  
- **MT** → Turning direction  
- **S** → Side road  

### Signal Encoding

| Signal | Binary Value |
|--------|-------------|
| Red    | 100         |
| Yellow | 010         |
| Green  | 001         |

---

## 🔷 System Design

- The controller uses **6 states (S1 to S6)**.
- Each state defines signal conditions for all directions.
- A **counter** is used to implement timing delays.
- State transitions occur after a specific time duration.

---

## 🔷 State Diagram

The FSM cycles through the following states:

- **S1:** Main road (M1, M2) → Green  
- **S2:** Transition → Yellow  
- **S3:** M1 & MT → Green  
- **S4:** Transition → Yellow  
- **S5:** Side road → Green  
- **S6:** Side road → Yellow  

After S6, the system returns to S1.

---

## 🔷 State Table

Example states:

### S1:
- M1 → Green  
- M2 → Green  
- MT → Red  
- S → Red  

### S3:
- M1 → Green  
- MT → Green  
- M2 → Red  
- S → Red  

### S5:
- M1 → Red  
- M2 → Red  
- MT → Red  
- S → Green  

---

## 🔷 Timing Configuration

| Signal Phase | Time Duration |
|-------------|--------------|
| Green       | 25 seconds   |
| Yellow      | 4 seconds    |

(Implemented using counters in simulation)

---

## 🔷 RTL Code

The system is implemented using Verilog HDL.

Key components:
- **FSM using `case` statement**
- **Counter for timing**
- **Sequential logic using clock**

```verilog
// Your original Verilog code goes here
