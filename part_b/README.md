Team Members and Contributions:

Akbar Aman (aaman7@uic.edu) – Developed the core MIPS assembly code for the Fibonacci(n) program and wrote structured pseudocode in Python to guide the implementation.

Luke Abraham (lukeca3@uic.edu) – Contributed to coding the MIPS assembly program, set up the GitHub repository, and ensured proper version control for collaboration.

Ugo Alozie (ualoz2@uic.edu) – Assisted in coding and debugging the Fibonacci program to ensure correctness and efficiency.

All members contributed equally, with each person responsible for approximately 33% of the project.

GitHub Repository
Link: https://github.com/Luxray997/ECE366Project2

How to Run the MIPS Program
- Open file in MARS Simulator
- Since syscall and print are not allowed, the source must be edited for input and debugging is used to see the output
- Edit line 2 to set the input. The immediate value in the `addi` instruction will be the input `n`
- Save and assemble the file
- Set a breakpoint on the final `nop` to view the return value
- Run the program
- View register `v0` for the return value when the program halts at the breakpoint. If the input is odd, the output should be `1` and if the input is even, the output should be `0`