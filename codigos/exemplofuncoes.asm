#exemplofuncoes.asm
#
#DESC: Exemplifica o funcionamento de funcoes
#
#
#DDA 13.01.2022

.include "utils.asm"

.data
	str1:	.asciiz "Digite o primeiro inteiro: "
	str2:	.asciiz "Digite o segundo inteiro: "


.text
	imprimeStr(str1)
	leInteiro
	add	$s0, $zero, $v0
	
	imprimeStr(str2)
	leInteiro
	add	$s1, $zero, $v0
	
	#1) setar os argumentos
	add	$a0, $zero, $s0
	add	$a1, $zero, $s1
	
	#2) chama a funcao
	jal		SOMA
	add	$s7, $zero, $v0
	
	imprimeInteiro($s7)
	return0


#int SOMA(int x, int y)
SOMA:	#3) salvar contexto
		PUSH
		#sw		$s0, 0($sp)
		#sw		$a0, -4($sp)
		#sw		$a1, -8($sp)
		#sw		$ra, -12($sp)
		#addi	$sp, $sp, -16
		
	
		#corpo da funcao	
		add	$s0, $a0, $a1


		#4) restaurar o contexto
		POP
		#addi	$sp, $sp, 16
		#lw		$s0, 0($sp)
		#lw		$a0, -4($sp)
		#lw		$a1, -8($sp)
		#lw		$ra, -12($sp)


		#5) definir o valor de retorno caso haja
		add	$v0, $zero, $s0
		#6) retornar para o prog principal
		jr	$ra