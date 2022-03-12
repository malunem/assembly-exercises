.text
.globl main

main:

	addi $s2, $zero, 100
	addi $s3, $zero, 45
	
	mult $s2, $s3
	mflo $s0
	
	div $s2, $s3
	mflo $s1