#fat.asm

#DESC: fatorial de n ~.~


#DDA 13.01.2022

.include "utils.asm"
.data
	str1: .asciiz	"Digite n: "
	str2: .asciiz   "O fatorial de n eh: "

.text
		imprimeStr(str1)
		leInteiro
		add		$s7, $v0, $zero
		
		#Argumentos
		add		$a0, $zero, $s7
		#chama funcao
		jal 	FAT
		#valor de retorno
		add		$s6, $v0, $zero

		imprimeStr(str2)
		imprimeInteiro($s6)
		return0
		
FAT:	#SC
		PUSH
		
		#CORPO
		#fat(n) = n * fat(n-1)
		#fat(1) = 1
		addi	$s5, $zero, 1 
		addi	$s0, $zero, 1
		beq		$a0, $s0, SAI1
		
		add		$s7, $zero, $a0
		addi	$a0, $a0, -1
		jal		FAT
		add 	$s6, $zero, $v0
		mul		$s5, $s7, $s6
	
				
		#VR
SAI1:	add		$v0, $zero, $s5
		
		#RC
		POP
		
		#RETORNO
		jr		$ra