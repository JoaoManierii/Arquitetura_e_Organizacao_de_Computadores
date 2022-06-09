#iobasico2.asm

#DESC: Exemplifica a entrada e saida básica de dados

#DDA 16.12.2021

.data
	str1: .asciiz "forty two!"	


.text
	#impressao de inteiros
	addi	$v0, $zero, 1
	addi	$a0, $zero, 42
	syscall

	#impressao de strings
	addi	$v0, $zero, 4
	la		$a0, str1
	syscall
	
	#leitura de inteiros
	addi	$v0, $zero, 5
	syscall
	

	#return 0
	addi	$v0, $zero, 10
	syscall
	
	

	
