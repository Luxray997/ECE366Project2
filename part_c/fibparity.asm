.data
prompt: .asciiz "Enter n: "
result_msg: .asciiz "Fibonacci("
close_paren: .asciiz ") = "
odd_msg: .asciiz " is Odd"
even_msg: .asciiz " is Even"
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
    move $s0, $v0  # Store n in $s0 for later use
    
    # Call fibonacci(n)
    move $a0, $s0
    jal fibonacci
    move $s1, $v0  # Store fibonacci result in $s1
    
    # Display "Fibonacci(n) = "
    li $v0, 4
    la $a0, result_msg
    syscall
    
    # Display the value of n
    li $v0, 1
    move $a0, $s0
    syscall
    
    # Display ")"
    li $v0, 4
    la $a0, close_paren
    syscall
    
    # Display the Fibonacci number
    li $v0, 1
    move $a0, $s1
    syscall
    
    # Check if fibonacci(n) is odd
    move $a0, $s1
    jal odd
    move $s2, $v0  # Store odd/even result
    
    # Print whether the result is odd or even
    beqz $s2, print_even
    li $v0, 4
    la $a0, odd_msg
    j print_result
    
print_even:
    li $v0, 4
    la $a0, even_msg
    
print_result:
    syscall
    
    # Exit
    li $v0, 10
    syscall

# Function: fibonacci(n)
# Returns the nth Fibonacci number
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

# Function: odd(m)
# Determines if m is odd by checking the remainder of m / 2
# Returns 1 if odd, 0 if even
odd:
    # Save return address
    subu $sp, $sp, 4
    sw $ra, 0($sp)
    
    # Pass number to division function
    move $a1, $a0   # First argument is the number
    li $a2, 2       # Second argument is 2 (for mod 2)
    
    # Call division by subtraction
    jal division
    
    # Result (remainder) is in $v0
    # If remainder is 0, it's even (return 0)
    # If remainder is 1, it's odd (return 1)
    move $v0, $v0   # The remainder is already the result we want
    
    # Restore return address
    lw $ra, 0($sp)
    addu $sp, $sp, 4
    
    jr $ra

# Function: division(x,y)
# Implements division by repeated subtraction
# Returns remainder (x % y)
division:
    move $t0, $a1   # x (dividend)
    move $t1, $a2   # y (divisor)
    li $t2, 0       # quotient = 0
    
div_loop:
    blt $t0, $t1, div_done   # If x < y, we are done
    sub $t0, $t0, $t1        # x = x - y
    addi $t2, $t2, 1         # quotient = quotient + 1
    j div_loop
    
div_done:
    move $v0, $t0   # Return remainder (x)
    jr $ra


