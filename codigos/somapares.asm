#somapares.asm

#DESC: escreva um programa que leia n numeros do 
#teclado até que o num 0 seja digitado. A seguir 
#acumule todos os numeros pares digitados.
#
#DDA 23.05.22
#
#int main(void){
#  //dec de var estáticas
#  int x;
#  int acc = 0;
#  int temp;
#
#  //laco de 0 a n (n é arbitrário) 
#  do{
#    //le o prox num
#    scanf("%d", &x);
#    //testar se o num e impar  
#    temp = x & 1;
#    //acumula se for par
#    if (temp != 1)
#		acc = acc + x;
#  }while(x != 0);
#  printf("A soma dos pares eh: %d", acc);
#  return 0; 
#  }
.data
	x:		.space 4
	acc:	.word  0
	temp:	.space 4
	str1:   .asciiz "A soma dos pares eh: "
.text
main:
	la		$t0, x
	lw		$s0, 0($t0) #x
	la		$t0, acc
	lw		$s1, 0($t0) #acc
	la		$t0, temp
	lw		$s2, 0($t0) #temp

DO1: 
	#corpo do dowhile				
	li		$v0, 5    # addi $v0, $zero, 5
	syscall
	add     $s0, $v0, $zero
	
	andi    $s2, $s0, 0x01 
	bne     $s2, $zero, C1
	add		$s1, $s1, $s0 
    #\corpo do dowhile
C1: bne	$s0, $zero, DO1
	#return 0
	
	#printf
	la	$a0, str1
	li	$v0, 4
	syscall
	li  $v0, 1
	add $a0, $zero, $s1
	syscall
	
    addi	$v0, $zero, 10
    syscall

