# s4.3 

# procedure branch3equal:
# Input: 3 integers, 2 addresses from text area 
# Output: none (only execute jump to the right address)
# If 3 integers are all equal, jump to the first address
# Else if 3 integers are all different, jump to the second address
# Else continue main execution from pc+4

.data
allEqual: .asciiz "All integers are equal"
allDifferent: .asciiz "All integers are different"
noJump: .asciiz "No jump"

.text

main:
li $a0 2
li $a1 2
li $a2 2
la $a3 ifAllEqual
la $t0 ifAllDifferent

addi $sp $sp 4
sw $t0 0($sp)

jal branch3equal

li $v0 4
la $a0 noJump
syscall
j exit 

ifAllEqual:
li $v0 4
la $a0 allEqual
syscall
j exit 

ifAllDifferent:
li $v0 4
la $a0 allDifferent
syscall
j exit 

branch3equal:
lw $t0 0($sp)
subi $sp $sp 1

seq $t2 $a0 $a1
seq $t3 $a0 $a2
seq $t4 $a1 $a2

add $t5 $t2 $t3
add $t5 $t5 $t4

beq $t5 3 goToFirstAddress
beq $t5 0 goToSecondAddress

jr $ra

goToFirstAddress:
jr $a3

goToSecondAddress:
jr $t0

exit:
li $v0 10
syscall