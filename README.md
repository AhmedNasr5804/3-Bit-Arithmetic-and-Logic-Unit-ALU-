# 3-Bit Arithmetic and Logic Unit (ALU)

## Overview
This project involves the design and implementation of a **3-bit Arithmetic and Logic Unit (ALU)** using SystemVerilog, which is capable of performing various arithmetic and logical operations. The ALU is implemented using basic logic gates and modular design principles. It includes support for operations like addition, subtraction, 2's complement, increment, XOR, complement, OR, and AND, with the appropriate flags for overflow, negative, carry, and zero.

## Features
- **Arithmetic Operations**:
  - Addition
  - Subtraction
  - Increment
  - 2's Complement
- **Logical Operations**:
  - AND
  - OR
  - XOR
  - Complement
- **Output Flags**:
  - **V (Overflow)**: Indicates if an overflow occurred.
  - **N (Negative)**: Indicates if the result is negative.
  - **C (Carry)**: Indicates a carry out in addition or subtraction.
  - **Z (Zero)**: Indicates if the result is zero.

## Project Structure
1. **Gate Modules**:
   - **2's Complement**: Flips each bit and adds 1.
   - **AND Gate**: Performs bitwise AND operation.
   - **OR Gate**: Performs bitwise OR operation.
   - **XOR Gate**: Performs bitwise XOR operation.
   - **Complement Gate**: Flips all bits using a NOT gate.
   - **Add Gate**: Implements a ripple-carry adder for 3-bit inputs.
   - **Sub Gate**: Computes subtraction by adding the 2's complement.
   - **Increment Gate**: Increments a 3-bit input.

2. **Main ALU Module**:
   - Inputs:
     - `A`: 3-bit binary input.
     - `B`: 3-bit binary input.
     - `Sel`: 3-bit selector for choosing operations.
   - Outputs:
     - `F`: 3-bit result.
     - `V`, `N`, `C`, `Z`: Flags for overflow, negative, carry, and zero.

3. **Schematic and Simulation**:
   - Detailed schematic of the entire ALU circuit.
   - Simulations for all operations with and without overflow.

## Usage
The ALU module selects operations based on the 3-bit selector (`Sel`) as follows:
- `000`: Addition
- `001`: Subtraction
- `010`: Increment
- `011`: XOR
- `100`: Complement
- `101`: OR
- `110`: AND
- `111`: 2's Complement

## Implementation
### 2's Complement
- Flips each bit of the input and adds `001` to compute the 2's complement.

### AND Gate
- Performs a bitwise AND between two 3-bit inputs.

### OR Gate
- Performs a bitwise OR between two 3-bit inputs.

### XOR Gate
- Performs a bitwise XOR between two 3-bit inputs.

### Add Gate
- Implements a ripple-carry adder using three 1-bit full adders.

### Sub Gate
- Subtracts two 3-bit inputs by adding the 2's complement of one input to the other.

### Increment Gate
- Increments a 3-bit input by adding a constant `001`.

## Simulations
- **Without Overflow**: Demonstrates operations producing valid results within 3 bits.
- **With Overflow**: Highlights the overflow flag functionality during operations exceeding 3 bits.

## Acknowledgments
This project was developed as part of the **Digital Design and Computer Architecture** course at **Zewail City of Science and Technology** during August 2024.
