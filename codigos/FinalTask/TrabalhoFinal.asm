.data

	str2: .asciiz "   "
	
	
.text 
	add $s0, $zero, $zero 
	addi $t2,$zero, 20 #slt
	addi	$s3, $zero, 0	
	addi	$s1, $zero, 1	
	addi	$s2, $zero, 1	
	
FOR1:
	slt $t1, $s0, $t2
	#slti $t1, $s0, 20 
	beq $t1, $zero, SAI1
	
	addi	$v0, $zero, 4
	la	$a0, str2
	syscall
	
	li $v0, 1
	add $a0, $s2, $zero
	syscall
	
	add $s2, $s1, $s3 
		
	add $s3, $zero, $s1 
		
	add $s1, $zero, $s2   
	
	addi	$s0, $s0, 1
	j FOR1
	
SAI1:
	addi	$v0, $zero, 10
	syscall
	
	
	
	
	
	
	
	
