# s4.2

# Write "max" procedure:
# • Input: an int N and an array A of N integers 
# • Output: the max value in A

# Write "min" procedure:
# • Input: an int N and an array A of N integers 
# • Output: the min value in A

# Write "main" that asks input data, calls max/min and prints results.

.data 
askN: .asciiz "Write the amount of numbers: "
askNumbers: .asciiz "Write one number per line:\n"
minValue: .asciiz "\nMin: "
maxValue: .asciiz "\nMax: "
.align 2
numbers: .space 4

.text 

main:
# ask N
li $v0 4
la $a0 askN
syscall

li $v0 5
syscall
move $s0 $v0

# ask numbers
li $v0 4
la $a0 askNumbers
syscall

la $a0 numbers
j askNumbersLoop

# ask N numbers
askNumbersLoop:
li $v0 5
syscall

li $t1 4
mult $t1 $t0
mflo $t2 # offset
add $t3 $t2 $a0 # current address
sw $v0 0($t3)

addi $t0 $t0 1
blt $t0 $s0 askNumbersLoop
j checkAndPrint

checkAndPrint:
# check max value
move $a0 $s0
la $a1 numbers
move $t0 $zero
jal max

# print max value
move $s1 $v0 
li $v0 4
la $a0 maxValue
syscall
li $v0 1
move $a0 $s1
syscall

# check min value
move $a0 $s0
la $a1 numbers
move $t0 $zero
jal min

# print min value
move $s1 $v0 
li $v0 4
la $a0 minValue
syscall
li $v0 1
move $a0 $s1
syscall

j exit

max:
# $a0 = N and $a1 = A base address
# $t0 = counter
# $v0 = max value

li $t1 4
mult $t1 $t0
mflo $t2 # offset
add $t3 $t2 $a1 # current address
lw $t4 0($t3)
blt $v0 $t4 saveMaxValue
j continueMax

saveMaxValue:
move $v0 $t4
j continueMax

continueMax:
addi $t0 $t0 1
blt $t0 $a0 max
jr $ra

min:
# $a0 = N and $a1 = A base address
# $t0 = counter
# $v0 = min value

li $t1 4
mult $t1 $t0
mflo $t2 # offset
add $t3 $t2 $a1 # current address
lw $t4 0($t3)
beq $t0 $zero saveFirstValue
j checkIfMinValue

checkIfMinValue:
blt $t4 $v0 saveMinValue
j continueMin

saveFirstValue:
move $v0 $t4
j checkIfMinValue

saveMinValue:
move $v0 $t4
j continueMin

continueMin:
addi $t0 $t0 1
blt $t0 $a0 min
jr $ra

exit:
li $v0 10
syscall 
