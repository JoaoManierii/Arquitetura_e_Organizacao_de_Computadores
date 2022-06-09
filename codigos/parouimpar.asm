#parouimpar.asm

#DESC: Testa se um numero lido do teclado eh par ou impar

#16.12.2021

#int main(){
#   printf("digite o num. a ser testado: ");
#	int n;
#	scanf("%d", &n);
#
#	int test = n % 2;
#   if (test == 0)
#		printf("O num eh par")
#	else
#		printf("O num eh impar")	
#}

#int main(){
#   printf("digite o num. a ser testado: ");
#	int n;
#	scanf("%d", &n);
#
#	unsigned int test = 1;      
#	test = test & n;	
#   if (test == 0)
#		printf("O num eh par")
#	else
#		printf("O num eh impar")	
#}

.data
	str1:	.asciiz "digite o num. a ser testado: "
	str2:	.asciiz "o num eh impar"
	str3:	.asciiz "o num eh par"
	
	n:		.word
	test:	.word

.text
		#imprime mensagem de req. de digitacao
		addi	$v0, $zero, 4
		la		$a0, str1
		syscall
		#ler o numero a ser testado
		addi	$v0, $zero, 5
		syscall
		#la		$t0, n
		#sw		$v0, 0($t0)		# MEM[t0+0] <- v0  (aula de acesso a memória)
		add		$s0, $zero, $v0	# s0 <- n
	
		#teste usando mascaras e eh logico
		#test = 1
		#addi	$s1, $zero, 1	#test
		#la		$t0, test
		#sw		$s1, 0($t0)		# MEM[t0+0] <- s1  (aula de acesso a memória)
		#and		$s1, $s1, $s0	# test <- test & n
	
		#teste usando mod
		addi	$t1, $zero, 2
		div		$s0, $t1
		mfhi	$s1
				
		beq		$s1, $zero, EHPAR				#  (aula de controle de fluxo)
		#imprime que eh impar eh sai
		addi	$v0, $zero, 4
		la		$a0, str2
		syscall
		j		SAI
EHPAR:	#imprime que eh par
		addi	$v0, $zero, 4
		la		$a0, str3
		syscall

		#return 0 
SAI:	addi	$v0, $zero 10
		syscall