#	Si scriva il codice Assembly che effettui:
#	A[99] = 5 + B[i] + C
#	Si assuma che:
#	• A e B siano vettori di 100 elementi, ogni elemento un intero a 32 bit;
#	• C e i siano variabili intere a 32 bit.
#	Si inizializzino unicamente questi dati:
#	i=3, C=2, B[i]=10.

	.data
	C: .word 2
	i: .word 3
	A: .space 400	# (32/8)*100
	B: .space 400
	
	.text
	.globl main
main:
	la $t1, A	# load address of A
	la $t2, B	# load address of B
	la $s1, i	# load address of i
	la $s2, C	# load address of C
	
	li $t6, 10	# load immediate
	li $s4, 4	# load immediate
	lw $s6, 0($s1)	# load word i
	mult $s4, $s6	# 4*3 offset
	mflo $s5	# move from lo (12)
	add $s7, $s5, $t2	# address of B[i] (base address + offset)
	sw $t6, 0($s7)	# store word 10 in B[i]
	
	# A[99] = 5 + B[i] + C
	lw $t7, 0($s7)		# load word B[i]
	addi $t4, $t7, 5		# 5 + B[i]
	lw $t2, 0($s2)		# load word C
	add $t4, $t4, $t2	# (5+B[i]) + C
	
	sw $t4, 396($t1)	# 99*4=396
