# funcao que le 2 valores inteiros e realiza a soma entre eles mais um 
# data: 07/06/22 

.data
# declaracao de dados estaticos
i: .word 0
a: .word 0
str1: .asciiz "Digite o valor de A: "
str2: .asciiz "Digite o valor de B: "
.text
MAIN:
# printf "digite valor valor de A"
li $v0, 4
la $a0, str1
syscall
# scanf de 1 inteiro 
li $v0, 5
syscall
# armazendando o valor de v0 em s0
la $s0, i

add $s0, $zero ,$v0
# printf "Digite o valor de B"
li $v0, 4
la $a0, str2
syscall
# scanf do 2 inteiro
li $v0, 5
syscall
# armazendando o balor de v0 em s1
la $s1, a

add $s1, $zero ,$v0

# pula pra funcao de soma chamada multi
jal MULT

# printf
li $v0, 1
add $a0,  $zero, $s2
syscall

# return 0
li $v0, 10
syscall

MULT:
sw $s0, 0($sp)
	sw $s1, -4($sp)
	sw $a0, -8($sp)
	sw $a1, -12($sp)
	sw $s6, -16($sp)
	addi $sp, $sp, -20

add $s2, $s0, $s1

	addi $sp, $sp, 20
	lw $s0, 0($sp)
	lw $s1, -4($sp)
	lw $a0, -8($sp)
	lw $a1, -12($sp)
	lw $s6, -16($sp)

jr $ra
