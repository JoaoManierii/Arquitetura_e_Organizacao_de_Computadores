#funcsimples.asm

#Desc: Um simples programa para exemplificar o
#funcionamento de funcoes. Ler dois inteiros de 
#1 a 10, nao repetidos, e um array de 10 inteiros 
#quaisquer. A funcao deve somar os valores de A a
#B e retornar o resultado.

#DDA 02.06.2022 
.data
	A:    .space 4
	B:    .space 4
	arr:  .space 40
	str1: .asciiz "Digite o valor de A: "
	str2: .asciiz "Digite o valor de B: "
	str3: .asciiz "Digite o prox. num: "
	str4: .asciiz "A soma da faixa eh: "	
.text
	#le o valor de A
	li		$v0, 4
	la		$a0, str1
	syscall
	li		$v0, 5
	syscall
	la		$t0, A
	sw		$v0,0($t0)
	add		$s0, $zero, $v0
	
	#le o valor de B
	li		$v0, 4
	la		$a0, str2
	syscall
	li		$v0, 5
	syscall
	la		$t0, B
	sw		$v0,0($t0)
	add		$s1, $zero, $v0
	#(E1)testar se A e B E [1,10]
	#(E2)colocar em s0 o menor e em s1 o maior
	
	#assumir que o primeiro digitado eh menor 
	#que o segundo 
	
	#le o array de 10 inteiros
	
	add 	$s7, $zero, $zero # i = 0 
FOR1:
	slti	$t0, $s7, 1      # i <10 ? 					
	beq     $t0, $zero, SAI1
	###
	li		$v0, 4
	la		$a0, str3
	syscall
	li		$v0, 5
	syscall
	la		$t0, arr
	sll		$t1, $s7, 2
	add		$t0, $t0, $t1
	sw		$v0, 0($t0)
	
	###
	addi	$s7, $s7, 1   #i++
	j		FOR1
SAI1:
	#chamar a funcao que calcula a soma da faixa
	#int SOMAFAIXA(int A, int B, int *arr)
	#resp = SOMAFAIXA(a, b, arr) 
	
	###argumentos
	add		$a0, $zero, $s0  #a0 = A
	add		$a1, $zero, $s1  #a1 = B
	la		$a2, arr         #a2 = &arr
	###\argumentos
	jal		SOMAFAIXA
	###valor de retorno
	add		$s6, $zero, $v0
	li		$v0, 4
	la		$a0, str4
	syscall
	li		$v0, 1
	add		$a0, $zero, $s6
	syscall
	
	
	#return 0
	li		$v0, 10
	syscall

SOMAFAIXA:
	addi	$v0, $zero, 42				
	jr		$ra		