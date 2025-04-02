Team Members and Contributions:

Akbar Aman (aaman7@uic.edu) – Tested code and added debugging lines to code to ensure correct implementation and displaying of fib(n) as well as Odd/Even output. 

Luke Abraham (lukeca3@uic.edu) – Developed core logic to blend both part a and b to complete the functioning of "fibparity". 

Ugo Alozie (ualoz2@uic.edu) –  Wrote README and assisted in coding.

GitHub Repository
Link: https://github.com/Luxray997/ECE366Project2

How to Run the MIPS Program
- Open file in MARS Simulator
- Since syscall and print are not allowed, the source must be edited for input and debugging is used to see the output
- Edit line 4 to set the input. The immediate value in the `addi` instruction will be the input `n`
- Save and assemble the file
- Set a breakpoint on the final `nop` to view the return value
- Run the program
- View register `v0` for the return value when the program halts at the breakpoint. If fibonacci(n) is odd, the output is `1` and if the input is even, the output is `0`. For debugging purposes, fibonacci(n) is stored in `v1`.
