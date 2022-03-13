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
	A: .space 400	# (32/4)*100
	B: .space 400
	
	.text
	.globl main
main:
	la $t1, A
	la $t2, B
	la $s1, i
	la $s2, C
	
	li $t6, 10
	sw $t6, i($t2)
	
	addi $t4, $s2, 5
	la $s3, i+16($t2)
	add $t4, $t4, $s3 
	
	sw $t4, 99($t1)