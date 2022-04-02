# s4.1

# Write a procedure called Computer that calculates sum, difference, multiplication and division betweeen two integers
# Input: two operands and a third parameter to select operation
# Output: the result (for division return remainder too)
# Write main where:
# user is asked for operands and operator
# the result is printed

.data
askOperand1: .asciiz "Write first operand: "
askOperand2: .asciiz "Write second operand: "
askOperator: .asciiz "Operators available:\n1: sum\n2: difference\n3: multiplication\n4: division\nWrite operator: "
result: .asciiz "Result: "
remainder: .asciiz "\nRemainder: "

.text
.globl main

main:
li $v0 4
la $a0 askOperand1
syscall

li $v0 5
syscall
move $a1 $v0

li $v0 4
la $a0 askOperand2
syscall

li $v0 5
syscall
move $a2 $v0

li $v0 4
la $a0 askOperator
syscall

li $v0 5
syscall
move $a0 $v0

jal computer

# print result
move $t8 $a0
move $t0 $v0
li $v0 4
la $a0 result
syscall 
li $v0 1
move $a0 $t0
syscall

# if $t8 = 4 print remainder
bne $t8 4 exit
li $v0 4
la $a0 remainder
syscall 
li $v0 1
move $a0 $v1
syscall

j exit

computer:
# $a0 = operator
# $a1 = first operand
# $a2 = second operand
# $v0 = result
# $v1 = remainder

beq $a0 1 sum
beq $a0 2 difference
beq $a0 3 multiplication
beq $a0 4 division
j exit

sum:
add $v0 $a1 $a2
jr $ra

difference:
sub $v0 $a1 $a2
jr $ra

multiplication:
mult $a1 $a2
mflo $v0
jr $ra

division:
div $a1 $a2
mflo $v0
mfhi $v1
jr $ra

exit:
li $v0 10
syscall