#mem1.asm
#
#DESC: exemplifica acesso a memoria

#DDA 30.05.2022

#int main(void){
# int a = 42;
# int *p;
# int arr[10];
# p = arr;
# for(int i = 0; i<10; i++){
#    *p = a + i;
#    p++;  	
# }
# a = a - 40;
#}

.data
	a:   .word 42
	p:   .space 4
	arr: .space 40

.text
	# aponta p para o inicio do arr
	la		$t0, arr
	la 		$t1, p
	sw 	 	$t0, 0($t1) #p = arr
	
	la		$t7, a
	lw		$s1, 0($t7)  # s1 <= MEM[t7 + 0]
	add		$s0, $zero, $zero #i = 0
FOR1:
	slti	$t2, $s0, 10
	beq		$t2, $zero, SAI1
	###
	#temp <= a + i
	add		$t3, $s1, $s0 
	#*p = a + i;  
	sw		$t3, 0($t0)
	
	addi	$t0, $t0, 4
	sw		$t0, 0($t1)	            
	###
	addi	$s0, $s0, 1
	j		FOR1
SAI1:	     
	li	$v0, 10
	syscall	