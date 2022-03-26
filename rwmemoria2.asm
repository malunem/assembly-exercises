# A[c-1] = c*(B[A[c]] + c)/A[2*c-1]

# c=2
# A[0]=-1
# A[1]=-1
# A[2]= 1
# A[3]= 4
# B[0]=-1
# B[1]= 6
# B[2]=-1
# B[3]=-1

.data 
c: .word 2
A: .word -1 -1 1 4
B: .word -1 6 -1 -1 

.text
# load C value
lw $t1 c	# $t1 = 2
# load A base address
la $t2 A
# load immediate 4
li $t3 4
# calc c*4 offset
mult $t1 $t3 
mflo $t4 # $t4 = 16
# calc A[c] address
add $t4 $t4 $t2
# load A[c]
lw $t4 0($t4) # $t4 = 1
# load B base address
la $t5 B
# calc A[c] offset
mult $t4 $t3
mflo $t6 # $t6 = 4
# calc B[A[C]] address
add $t6 $t6 $t5
# load B[A[c]] = B[1] value
lw $t6 0($t6) # $t6 = 6 
# calc B[A[c]] + c
add $t6 $t6 $t1 # $t6 = 8
# calc c*(B[A[c]] + c)
mult $t1 $t6
mflo $t6 # $t6 = 16
# load immediate 2
li $t7 2
# calc 2*c
mult $t7 $t1
mflo $t8 # $t8 = 4
# load immediate 1
li $t9 1
# calc 2*c-1
sub $t9 $t8 $t9 # $t9 = 3
# calc 2*c-1 offset
mult $t3 $t9
mflo $t9 # t9 = 12
# calc A[2*c-1] = A[3] address
add $t9 $t9 $t2
# load A[2*c-1] = A[3] value
lw $t9 0($t9) # $t9 = 4
# calc c*(B[A[c]] + c)/A[2*c-1]
div $t6 $t9 # 16/4 = 4
mflo $s1 # $s1 = 4
# load immediate 1
li $t4 1 # $t4 = 1
# calc c-1
sub $t4 $t1 $t4 # $t4 = 1
# calc c-1 offset
mult $t3 $t4
mflo $t4 # $t4 = 4
# calc A[c-1] = A[1] address
add $t4 $t2 $t4
# load in A[c-1] = c*(B[A[c]] + c)/A[2*c-1]
sw $s1 0($t4)