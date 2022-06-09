
.include	"utils.asm"

.data

	str1: .asciiz	"yupi!!!!!!"

.text

	imprimeStr(str1)

	#le um inteiro
	leInteiro
	add	$s7, $zero, $v0
	
	imprimeInteiro($s7)
	
	#return0
	return0
	
	