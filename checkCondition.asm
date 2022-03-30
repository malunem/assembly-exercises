# s3.2

# ask user 3 number a, b and c
# implement this logic:
# If ( (a>=b) && (c!=0) ){
# 	z=c(a+b);
# 	print z
# }
# else {
# 	print «error»
# }

.data
askNumbers: .asciiz "Write three numbers:\n"
askA: .asciiz "a: "
askB: .asciiz "b: "
askC: .asciiz "c: "
error: .asciiz "error"

.text
.globl main

main:

# ask 3 numbers
li $v0 4
la $a0 askNumbers
syscall

li $v0 4
la $a0 askA
syscall

li $v0 5
syscall
move $t0 $v0 # a

li $v0 4
la $a0 askB
syscall

li $v0 5
syscall
move $t1 $v0 # b

li $v0 4
la $a0 askC
syscall

li $v0 5
syscall
move $t2 $v0 # c

# if a>=b && c!=0
blt $t0 $t1 printError
beq $t2 $zero printError

# z = c(a+b)
add $t3 $t0 $t1
mult $t3 $t2
mflo $a0

# print z
li $v0 1
syscall

j end

# else 
printError:
li $v0 4
la $a0 error
syscall

end: