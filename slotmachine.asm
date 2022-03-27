#s2.4

# ask user an integer NUM
# find a random integer R between -NUM and NUM 
# sum NUM and R
# print sum

.data
askInt: .asciiz "Insert an integer number: "

.text
.globl main

main:

# ask user an integer NUM
la $a0 askInt
li $v0 4
syscall

li $v0 5
syscall
move $t0 $v0

# find a random integer R between -NUM and NUM
# (find a random integer between 0 and NUM*2+1 and then sub NUM)
li $a0 5
move $a1 $t0
li $v0 42
syscall
sub $t1 $a0 $t0

# sum NUM and R and print result
add $a0 $t1 $t0
li $v0 1
syscall