#Programa que multiplica uma constante por uma soma de um array de 5 elementos
.data
	A: .space 4
.text
	li $v0, 5
	syscall
	la $t0, A
	sw $v0, 0($t0)
	add $s0, $v0, $zero # a = 0
	add $s6, $zero, $zero # acc = 0
	add $s7, $zero, $zero # i =0 
	
FOR1: 	
	slti $t0, $s7, 5        #i<5
	beq $t0, $zero, SAI1
	li $v0, 5      #le um inteiro até o vetor acabar (acaba no tamanho 5)
	syscall
	add $s6, $s6, $v0 #acc += s6
	addi $s7, $s7, 1   #i++
	j FOR1
SAI1:
	#parametros da funcao
	add $a0, $s0, $zero
	add $a1, $s6, $zero
	
	jal MultConstArr
	
	add $a0, $v0, $zero # retorno da função
	li $v0, 1	#printa o resultado
	syscall
	
	
	
	li $v0, 10
	syscall
	 
MultConstArr: 
	 sw $s0, 0($sp)
	 sw $s1, -4($sp)
	 sw $s6, -8($sp)
	 sw $s7, -12($sp)
	 sw $a0, -16($sp)
	 sw $a1, -20($sp)
	 addi $sp, $sp, 24
	 
	 
	 mult $a0, $a1  #multiplica a cosntante A pela soma dos 5 numeros do vetor
	 mflo $v0	#pega o resultado de "low"
	 
	 
	 addi $sp, $sp, 24
	 lw $s0, 0($sp)
	 lw $s1, -4($sp)
	 lw $s6, -8($sp)
	 lw $s7, -12($sp)
	 lw $a0, -16($sp)
	 lw $a1, -20($sp)
	 
	 
	 jr $ra
	 
	 
	 
	
	
	
	
