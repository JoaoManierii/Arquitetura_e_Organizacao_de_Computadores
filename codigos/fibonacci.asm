#fibonacci.asm

#DESC: escreva um programa que leia um inteiro da entrada de dados padrao representando o elemento
#da serie de Fibonacci desejado. O programa deve entao calcular a serie de fib até o termo especifi-
#ficado (iterativamente) e imprimir seu valor.

#EX:  fib(7) = {1 1 2 3 5 8 13 (21)}
#               0 1 2 3 4 5  6  7  8  9  10
#EX: fib(10) = {1 1 2 3 5 8 13 21 34 55 (89)}

# fib(0) = 1 def  (tautologia)
# fib(1) = 1 def
# fib(n) = fib(n-1) + fib(n-2)
#
# DDA 06.01.2022

.data
	str1: .asciiz "Digite o termo desejado(inteiro): "
	str2: .asciiz "O termo desejado tem o valor: "
.text
		#imprime a mensagem de requisicao de dados
		addi	$v0, $zero, 4
		la		$a0, str1
		syscall
		
		#le o termo a ser calculado
		addi	$v0, $zero, 5
		syscall
		#move o inteiro lido para um registrador seguro
		addi	$s7, $v0, 1
	
		addi	$s0, $zero, 1	#fib(0)	/ anterioranterior
		addi	$s1, $zero, 1	#fib(1)	/ anterior
		addi	$s2, $zero, 1	#fib(n=0v1) = 1 / atual
		addi	$s6, $zero, 2	#i=2 
FOR1:	slt		$t0, $s6, $s7
		beq		$t0, $zero, SAI1		
		#corpo do for
		add		$s2, $s1, $s0 # atual = anterior + anterioranterior
		
		#atualiza o anterioranterior
		add		$s0, $zero, $s1		#anterioranterior <= anterior
		
		#atualiza o anterior
		add		$s1, $zero, $s2		#anterior <= atual  
		
		#/corpo do for
		addi	$s6, $s6, 1
		j		FOR1
SAI1:	#imprime a mensagem de resultado e o fib(n)
		addi	$v0, $zero, 4
		la		$a0, str2
		syscall
		addi	$v0, $zero, 1
		add		$a0, $zero, $s2
		syscall

		#return 0
		addi	$v0, $zero, 10
		syscall
