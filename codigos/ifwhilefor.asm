#ifwhilefor.asm

#DESC: Demonstra como construir a estrutura if

#DDA 20.12.2021

#int x;
#scanf("%d", &x);
#if(x == 0){
#	print("entrou no if");
#}

.data
		x:		.space 4
		str1:	.asciiz "entrou no if"
.text
		#le x		
		addi	$v0, $zero, 5
		syscall
		add		$s0, $zero, $v0
		
		bne		$s0, $zero, SAIIF1
		#corpo do if
		addi	$v0, $zero, 4
		la		$a0, str1
		syscall
		#/corpo do if
SAIIF1:		
		#return 0
		addi	$v0, $zero, 10
		syscall

