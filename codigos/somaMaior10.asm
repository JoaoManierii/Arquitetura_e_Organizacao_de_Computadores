#somaMaior10.asm

#Desc: Escreva um programa que leia 20 inteiros. 
#acumule todos os valores lidos maiores que 10 e 
#entao imprima o resultado final.
#DDA 26.05.2022
.data
	str1: .asciiz "O Acumulo de maiores que 10 eh: "
.text
MAIN:	
	add		$s7, $zero, $zero   # acc = 0

#for(i=0; i<20;i++)
	add		$s0, $zero, $zero # i <- 0 + 0
FOR1:	
	slti	$t0, $s0, 20      # se i <20 t0 <- 1 semap t0 <- 0
	beq		$t0, $zero, SAI1
	#corpo do for
	#le um inteiro
	li		$v0, 5
	syscall
	add		$s1, $v0, $zero  # move o val lido para s1		
	slti	$t1, $s1, 11	 # num < 11 t1 <- 1  # em outras palavras , se for 1 ignore!!!
	bne		$t1, $zero, C1
	add		$s7, $s7, $s1
	
	#####
C1:	addi	$s0, $s0, 1
	j 		FOR1		
SAI1:
	li		$v0, 4
	la		$a0, str1
	syscall
	li		$v0, 1
	add		$a0, $s7, $zero
	syscall
	#return 0
	li	$v0, 10
	syscall