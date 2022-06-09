#exemplosAcessoMem.asm
#
#DESC: exemplifica as instruções de acesso a memória

# DDA 10.01.2022

.data
	arr:	.word 0xffff7b7d,43,44,45,46,47,48
	arr_sz:	.word 42

.text
		la		$t7, arr		
		add		$s0, $zero, $zero  #i= 0
FOR1:	slti	$t0, $s0, 10
		beq		$t0, $zero, SAI1
		###
		sw		$s0, 0($t7)
		addi	$t7, $t7, 4
		###
		addi	$s0, $s0, 1
		j 		FOR1	
SAI1:
	
	la		$t0, arr
	lb		$s0, 0($t0)
	
	lh		$s0, 0($t0)
	
	#lw		$s0, 0($t0)
	#addi	$t0, $t0, 4
	#lw		$s1, 0($t0)
	#lw		$s1, 4($t0)

	#return 0
	addi	$v0, $zero, 10
	syscall
