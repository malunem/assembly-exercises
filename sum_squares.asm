# s3.3

# Ask user two integers V and N
# Sum = V;
# for (i = 1; i < N; i++) {
# 	If ( (i*i)%V == 0 ) {
# 		print «break»;
# 		break;
# 	}
# 	Sum += i*i;
# }
# print Sum

.data
askNumbers: .asciiz "Write two numbers:\n"
askV: .asciiz "V: "
askN: .asciiz "N: "
breakMessage: .asciiz "Break"

.text 
.globl main

main:
li $v0 4
la $a0 askNumbers
syscall 

li $v0 4
la $a0 askV
syscall 

li $v0 5
syscall
move $t0 $v0 # $t0 = V

li $v0 4
la $a0 askN
syscall 

li $v0 5
syscall
move $t1 $v0 # $t1 = N

# for (i = 1; i < N; i++) {
li $t2 1 # $t2 = i

forLoop:
beq $t1 $t2 printSum
blt $t1 $t2 printSum

# 	If ( (i*i)%V == 0 ) 
mult $t2 $t2
mflo $t3 # $t3 = i*i

div $t3 $t0
mfhi $t4 # $t4 = (i*i)%V

beq $t4 $zero printBreak 

# 	Sum += i*i;
add $t0 $t0 $t3

addi $t2 $t2 1
j forLoop

# print Sum
printSum: 
li $v0 1
move $a0 $t0
syscall

j exit

#	print «break»;
printBreak:
li $v0 4
la $a0 breakMessage

j exit

exit:
li $v0 10
syscall