.data
prompt: .asciiz "Enter a number: "
odd_msg: .asciiz " is Odd"
even_msg: .asciiz " is Even"
.text
.globl main
main:
    # Print prompt message
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read integer input m
    li $v0, 5
    syscall
    move $s0, $v0          # Store input in $s0
    
    # Call odd function to check if m is odd
    move $a0, $s0          # Pass the input to the odd function
    jal odd
    move $t0, $v0          # Save the result (1 = odd, 0 = even)
    
    # Print the number entered
    li $v0, 1              # syscall for print_int
    move $a0, $s0          # Load the original input value
    syscall
    
    # Print " is Odd" or " is Even" based on the result in $t0
    beqz $t0, print_even    # If $t0 == 0, print "is Even"
    li $v0, 4
    la $a0, odd_msg        # Load address of "is Odd"
    j print_result
    
print_even:
    li $v0, 4
    la $a0, even_msg        # Load address of "is Even"
    
print_result:
    syscall
    
    # Exit program
    li $v0, 10
    syscall

# Function: odd(m)
# Determines if m is odd by checking the remainder of m / 2
odd:
    # Preserve return address
    subu $sp, $sp, 4
    sw $ra, 0($sp)
    
    move $a0, $a0          # Input m is already in $a0
    li $a1, 2              # Divisor is 2
    
    # Call division by repeated subtraction
    jal divide_by_subtraction
    
    # Check remainder
    # If remainder is 0, return 0 (even)
    # If remainder is 1, return 1 (odd)
    # Note: The pseudocode has a bug - odd numbers should return True, not False
    
    # Result (remainder) is already in $v0
    
    # Restore return address
    lw $ra, 0($sp)
    addu $sp, $sp, 4
    
    jr $ra

# Function: divide_by_subtraction(dividend, divisor)
# Computes dividend % divisor using repeated subtraction
# Result (remainder) is stored in $v0
divide_by_subtraction:
    move $t0, $a0          # dividend (m)
    move $t1, $a1          # divisor (2)
    
    # Initialize remainder with the dividend
    move $v0, $t0
    
subtract_loop:
    blt $v0, $t1, subtract_done  # If remainder < divisor, we are done
    sub $v0, $v0, $t1           # remainder = remainder - divisor
    j subtract_loop
    
subtract_done:
    jr $ra


