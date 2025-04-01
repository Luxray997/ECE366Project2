.data
prompt: .asciiz "Enter n: "
newline: .asciiz "\n"
.text
.globl main

main:
    # Prompt user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input (n)
    li $v0, 5
    syscall
    move $a0, $v0  # Store n in $a0

    # Call fibonacci(n)
    jal fibonacci

    # Print result
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

fibonacci:
    # Base case: if n <= 1, return n
    ble $a0, 1, base_case
    
    # Initialize a = 0, b = 1
    li $t0, 0   # a = 0
    li $t1, 1   # b = 1
    move $t2, $a0  # n in $t2
    sub $t2, $t2, 1 # n - 1

loop:
    beqz $t2, done
    move $t3, $t1   # temp = b
    add $t1, $t0, $t1  # b = a + b
    move $t0, $t3   # a = temp
    sub $t2, $t2, 1 # Decrement counter
    j loop

done:
    move $v0, $t1  # Return b
    jr $ra

base_case:
    move $v0, $a0  # Return n
    jr $ra


