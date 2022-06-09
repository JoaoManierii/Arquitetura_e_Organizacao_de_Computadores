#um programa que le 10 inteiros dentro de um for
#data: 07/06/22

.data

#declarando o inteiro 1 que comeca em 0
 i: .word 0

.text
MAIN:

la $t0, i 
lw $s0, 0($t0)

FOR1: slti $t0, $s0, 10
beq $t0, $zero, SAI1

addi $v0, $zero, 1
add $a0, $zero, $s0
syscall

addi $s0, $s0, 1
j FOR1

SAI1:
li $v0, 10
syscall