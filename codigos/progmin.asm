
.data
	#a:  .word 0,1,2,3,4,5,6,7,8,9
	#a100: .space 400
	y:	.word 42
	c:	.word 2
	n:	.word 33
	
	#int y = 42;
	#int c = 2;
	#int n = 33;


.text
	
	addi	$t1, $zero, 42  # t1 <= 0 + 42
	addi	$t2, $zero, 2
	addi	$t3, $zero, 33
	# x = y+4*(n/c);
	addi	$t0,$t1, 4
	div		$s0, $t3, $t2 
	mul		$s7, $t0, $s0


	#la		$at, y
	#lw		$s1, 0($at)
	#x -> s0
	#y -> s1
	#x = (x+y)-(x-y)
	add	$t0, $s0, $s1
	sub	$t1, $s0, $s1	
	sub	$s0, $t0, $t1

	#return 0
	addi	$v0, $zero, 10
	syscall