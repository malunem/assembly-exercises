# s3.4

# create an array of 13 integers
.data 
numbers: .word 0 1 2 3 4 5 6 7 8 9 10 11 12
askA: .asciiz "a: "
askB: .asciiz "b: "
askC: .asciiz "c: "
unknown: .asciiz "unknown command"

.text 
.globl main

main: 
# ask user 3 integers a b c
li $v0 4
la $a0 askA
syscall

li $v0 5
syscall
move $s0 $v0 # $s0 = a

li $v0 4
la $a0 askB
syscall

li $v0 5
syscall
move $s1 $v0 # $s1 = b

li $v0 4
la $a0 askC
syscall

li $v0 5
syscall
move $s2 $v0 # $s2 = c

# save numbers[a] and numbers[b] addresses and values
la $t0 numbers # base address
li $s3 4 

mult $s0 $s3 # offset
mflo $t8
add $s4 $t0 $t8 # $s4 = numbers[a] address
lw $s5 0($s4) # $s5 = numbers[a]

mult $s1 $s3 # offset
mflo $t8
add $s6 $t0 $t8 # $s6 = numbers[b] address
lw $s7 0($s6) # $s7 = numbers[b]

# if c=0, switch numers[a] with numbers[b]
beq $s2 $zero switchAandB

# if c=1 copy numbers[a] to numbers[b]
li $t8 1
beq $s2 $t8 copyAtoB

# if c=1 copy numbers[a] to numbers[b]
li $t8 -1
beq $s2 $t8 copyBtoA

# if c has another value print string "unknown command" and do nothing with array
li $v0 4
la $a0 unknown
syscall

j exit

# switch numers[a] with numbers[b]
switchAandB:
sw $s7 0($s4)
sw $s5 0($s6)

j exit

# copy numbers[a] to numbers[b]
copyAtoB:
sw $s5 0($s6)

j exit

# copy numbers[b] to numbers[a]
copyBtoA:
sw $s7 0($s4)

j exit

exit:
li $v0 10
syscall