#caps.asm

#DESC: le uma string e coloca todos os chars em caps e mostra a string


#DDA   10.01.2022


.data
	#char s[30];
	s:		.space 30
	s_sz:	.word  30
.text
		#le uma string do teclado
		
		addi	$v0, $zero, 8
		la		$a0, s
		la		$t0, s_sz
		lw		$a1, 0($t0)
		syscall
				
		#coloca a string em caps
		la		$s7, s
		addi	$s6, $zero, 10
		lb		$s0, 0($s7)			#carrega o primeiro byte da string
DW1:	beq		$s0, $s6, SAI1 
		#corpo do dowhile
						
		addi	$s0, $s0, -32
		sb		$s0, 0($s7)
		addi	$s7, $s7, 1
		lb		$s0, 0($s7)
		j		DW1				
SAI1:						
		#/corpo do dowhile				
		#apresenta a string em caps para o usuario
		addi	$v0, $zero, 4
		la		$a0, s
		syscall

		#return 0
		addi	$v0, $zero, 10
		syscall
