#memexemplos.asm
#
#
#DDA 06.01.2022



.data

	arr: .word 42,1,2,3,4,5,6,7,8,9

.text

	la	$t0, arr
	
	lw	$s0, 0($t0)
	lw	$s1, 4($t0)  # s1 <- MEM[t0+4]
	lw	$s2, 20($t0)
	
	li	$v0, 10
	syscall
	
	



