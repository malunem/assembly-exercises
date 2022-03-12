	.data
	h: .word 100
	A: .word 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14

	.text
	.globl main
main:
	#A[12] = h + A[8];
	la $s1, A
	
	lw $t1, h
	lw $t2, 32($s1)
	
	add $t3, $t1, $t2
	
	sw $t3, 48($s1)