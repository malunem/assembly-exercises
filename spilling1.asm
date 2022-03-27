# s2.3

# use only $t0 and $s0
# calc the sum of 1, 2, 3 each of them multiplied by 3

.text
.globl main

main: 

# load 1 and multiply by 3
li $t0 1
li $s0 3
mult $t0 $s0
mflo $t0

# push $t0 to stack
subi $sp $sp 4
sw $t0 0($sp)

# load 2 and multiply by 3
li $t0 2
mult $t0 $s0
mflo $t0

# push $t0 to stack
subi $sp $sp 4
sw $t0 0($sp)

# multiply 3 by itself
mult $s0 $s0
mflo $s0

# pop from stack to $t0
lw $t0 0($sp)
addi $sp $sp 4

# sum $s0 and $t0
add $s0 $s0 $t0

# pop from stack to $t0
lw $t0 0($sp)
addi $sp $sp 4

# sum $s0 and $t0
add $s0 $s0 $t0