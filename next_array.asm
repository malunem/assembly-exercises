# s2.2

.data 
askInt: .asciiz "Insert an integer number: "
printResult: .asciiz "Your number and the next are: "
space: .asciiz " "
.align 2
resultArray: .space 8

.text
.globl main

main:

# ask user for an integer (syscall code 4)
la $a0 askInt
li $v0 4
syscall

# read user input (syscall code 5) and save it in $t0
li $v0 5
syscall
move $t0 $v0

# calculate input+1
addi $t1 $t0 1

# move input and next number in resultArray
la $t2 resultArray
sw $t0 0($t2)
sw $t1 4($t2)

# print result message (syscall code 4) and result array (2x syscall 1) with spacing (syscall 4)
la $a0 printResult
li $v0 4
syscall

lw $a0 0($t2)
li $v0 1
syscall

la $a0 space
li $v0 4
syscall

lw $a0 4($t2)
li $v0 1
syscall