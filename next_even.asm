# s3.1

# given a number, return the next even

.data
askNumber: .asciiz "Write a number: "
printResult: .asciiz "The next even number is: " 

.text
.globl main

main:

	# ask for a number
	li $v0 4
	la $a0 askNumber
	syscall

	li $v0 5
	syscall
	move $t0 $v0
	
	j nextNumber

nextNumber:
	addi $t0 $t0 1
	
	j checkEven

checkEven:
	li $t8 2
	div $t0 $t8
	mfhi $t1
	
	beq $t1 $zero result
	j nextNumber
	
result:
	li $v0 4
	la $a0 printResult
	syscall 
	
	li $v0 1
	move $a0 $t0
	syscall
	