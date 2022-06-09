#for.asm
#DESC: Demonstra como construir a estrutura for
#DDA 20.12.2021

#int i = 0;
#for(i =0; i <10; i++){
#	printf("%d", i);
#}

.data
		i:		.word 0

.text
		#isso seria o certo a fazer
		#la		$t0, i
		#lw		$s0, 0($t0)
		#ateh a aula que vem faremos direto
		add		$s0, $zero, $zero # s0 -> i
FOR1:	slti	$t0, $s0, 10
		beq		$t0, $zero, SAIFOR1
		#corpo do for
		addi		$ v0, $zero, 1
		add			$a0, $zero, $s0
		syscall	
		
		#/corpo do for
		addi	$s0, $s0, 1
		j		FOR1
SAIFOR1:
		#return 0
		addi	$v0, $zero, 10
		syscall
		
		
		
	
