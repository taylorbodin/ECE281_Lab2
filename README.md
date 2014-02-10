ECE281_Lab2
===========

In this lab you will build an adder/subtractor. This block is a critical piece of an Arithmetic Logic Unit (ALU), which is the computational “brain” of a computer. 

## Design Process

To implement the full 4bit adder/subtractor I broke the problem down into its basic pieces. These pieces came from the ALU design discussed in class. My design left out the AND, OR, XOR and comperator function of a the aforementioned ALU. This simplified ALU consisted of an adding component, a multiplexer component, and an overflow detecting component. The inputs were two 4bit numbers and a toggle for subtraction. The outputs were a carry out, an overflow indicator, and the sum. 

### 1bit Full Adder Design

The 1bit full adder was a necessary subcomponent of the final 4bit full adder. This component was designed according to the schematic discussed in class. Its truth table and schematic follow:

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |   0  |
| 0 | 0 |  0  |  0  |   0  |
| 0 | 0 |  0  |  0  |   0  |
