#conversao.asm   
#
#DESC: escreva um programa que leia um número x do
#teclado e verifique se ele eh par ou impar. Caso 
#seja par, o reg $v0 deve conter o num 0 e caso
#contrário ele deve conter o num 1
#
#em c...
##include <stdlib.h>
#
#int main(void){
#  int x;
#  scanf("%d", &x); 
#  x = x & 1; 	
#
#  return 0;
#}
# DDA 19.05.2022


.data
	x:  .space 4

.text
main:
	li	$v0, 5 # cod de leitura de int.
	syscall 
	andi $v0, $v0, 0x0001
	add	 $s0, $v0, $zero	
	li	$v0, 1
	add	$a0, $zero, $s0
	syscall
	
	#addi	$v0, zero, 10
	li		$v0, 10
    syscall