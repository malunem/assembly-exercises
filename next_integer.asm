# s2.1

.data 
askInt: .asciiz "Insert an integer number: "
printResult: .asciiz "The next integer is: " 

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
addi $t0 $t0 1

# print result message (syscall code 4) and result integer (syscall 1)
la $a0 printResult
li $v0 4
syscall
move $a0 $t0
li $v0 1
syscall