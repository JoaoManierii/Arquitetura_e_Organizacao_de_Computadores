#while.asm
#DESC: Demonstra como construir a estrutura while
#DDA 20.12.2021

#int x = 0;
#while (x < 10){
#  printf("%d", x);
#  x++;	
#}

.data
		x:		.word 0

.text
		#isso seria o certo a fazer
		#la		$t0, x
		#lw		$s0, 0($t0)
		#ateh a aula que vem faremos direto
		add		$s0, $zero, $zero

		#(x<10)
WHILE1:	slti		$t1, $s0, 10   # se x <10; t1 = 1 senao t1 = 0
		beq			$t1, $zero, SAIWHILE1	
		#corpo do while
		addi		$v0, $zero, 1
		add			$a0, $zero, $s0
		syscall

		addi		$s0, $s0, 1
		#/corpo do while
		j			WHILE1
SAIWHILE1:
		#return 0
		addi	$v0, $zero, 10
		syscall
