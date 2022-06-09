#multiplicar todos valores que forem pares de um vetor de N elementos
.data 
	A: .space 4
	B: .space 4
.text 
	li $v0, 5 #lendo um inteiro(A)
	syscall
	la $t0, A
	sw $v0, 0($t0)
	add $s0, $v0, $zero
	
	li $v0, 5 #lendo um inteiro(B)
	syscall
	la $t0, B
	sw $v0, 0($t0)
	add $s1, $v0, $zero
	
	add $a0, $zero, $s0  #a0 = A
	add $a1, $zero, $s1  #a1 = B
	
	jal MULT2
	
	
	#retorno da func:
	#add $s6, $v0, $zero
	#add $a0, $zero, $s6
	add $a0, $zero, $v0
	li $v0, 1
	
	syscall
	
	
	#add $s7, $zero, $zero #i = 0
	
#FOR1 : 
	#slti $t0, $s7, 10  #i< N?
	#beq $t0, $zero, SAI1
	#li $v0, 5
	#syscall
	
#SAI1:
	

#return 0
	li	$v0, 10
	syscall
	
MULT2: 
	sw $s0, 0($sp)
	sw $s1, -4($sp)
	sw $a0, -8($sp)
	sw $a1, -12($sp)
	sw $s6, -16($sp)
	addi $sp, $sp, -20
	
	#corpo da func
	mult $a0, $a1
	mflo $v0
	
	addi $sp, $sp, 20
	lw $s0, 0($sp)
	lw $s1, -4($sp)
	lw $a0, -8($sp)
	lw $a1, -12($sp)
	lw $s6, -16($sp)
	
	
	
	jr $ra
	
