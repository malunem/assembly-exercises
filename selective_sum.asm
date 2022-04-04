# s4.4

# ask user for an array of ints (with max length)
# call procedure P and print its result
# procedure P:
# - input: the array, array length and int K
# - output: sum of the even indexed ints of the array if k=0, sum of the odd indexed ints of the array if k=1

.data
intAmount: .asciiz "Write amount of numbers to use: "
int: .asciiz "Insert number: "
k: .asciiz "write 0 to sum even indexed or 1 to sum odd indexed: "
result: .asciiz "Result: "
array: .space 4

.text
main:
# ask int amount (array length)
li $v0 4
la $a0 intAmount
syscall
# listen int 
li $v0 5
syscall
move $s0 $v0 # K
#set $t1 control and $t2 counter 
slt $t1 $t2 $s0
# enter loop
jal askNumbersLoop
# ask operator K
li $v0 4
la $a0 k
syscall
# listen k
li $v0 5
syscall 
move $s1 $v0
# call procedure P
la $a0 array #array
move $a1 $s0 # length
move $a2 $s1 # operator K
jal P
# print result
move $s2 $v0
li $v0 4
la $a0 result
syscall
li $v0 1
move $a0 $s2
syscall
j exit

askNumbersLoop:
# exit if counter >= K
beq $t1 0 return
# ask int
li $v0 4
la $a0 int
syscall
# listen int
li $v0 5
syscall
move $t0 $v0
# array offset
li $t3 4 
mult $t2 $t3
mflo $t3 
# array address
la $t4 array
add $t4 $t4 $t3
# store int
sw $t0 0($t4)
# set control
addi $t2 $t2 1
slt $t1 $t2 $s0
# loop
j askNumbersLoop

P: 
move $t0 $a0 # array base address
move $t1 $a1 # array length
move $t2 $a2 # operator K
#set $t3 control and $t4 counter 
li $t3 0
li $t4 0
slt $t3 $t4 $t1
li $v0 0
# enter loop
beq $t2 0 sumEvensLoop
beq $t2 1 sumOddsLoop
j exit

sumEvensLoop:
beq $t3 0 return
li $t5 2
div $t4 $t5
mfhi $t5
beq $t5 1 continueEvensLoop
# array offset
li $t5 4 
mult $t4 $t5
mflo $t5 
# array address
la $t6 array
add $t6 $t6 $t5
# load int
lw $t6 0($t6)
add $v0 $v0 $t6
j continueEvensLoop

continueEvensLoop:
# set control
addi $t4 $t4 1
slt $t3 $t4 $t1
# loop
j sumEvensLoop

sumOddsLoop:
beq $t3 0 return
li $t5 2
div $t4 $t5
mfhi $t5
beq $t5 0 continueOddsLoop
# array offset
li $t5 4 
mult $t4 $t5
mflo $t5 
# array address
la $t6 array
add $t6 $t6 $t5
# load int
lw $t6 0($t6)
add $v0 $v0 $t6
j continueOddsLoop

continueOddsLoop:
# set control
addi $t4 $t4 1
slt $t3 $t4 $t1
# loop
j sumOddsLoop

return:
jr $ra

exit:
li $v0 10
syscall