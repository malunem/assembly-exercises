# s5.1

# Write a procedure that turns an input string to uppercase

.data 
string: .asciiz "Hello world"
endString: .asciiz "\0"

.text
main:
la $a0 string
jal upperCase
li $v0 4
la $a0 string
syscall
li $v0 10
syscall

upperCase: 
