#Pranav Kadam
#50140118
#CSE 341, Friday recitation
#Calculator Project
#Final submission


.data


firstint: .asciiz "  Enter the first int  "
operandval: .asciiz " Enter (+:addition, -:subtraction, *:multiplication, /:division): "
secondint: .asciiz "  Enter the second int: "
operatorinval: .asciiz " Invalid Operator! Try again "
outputstring: .asciiz " Your answer is: "
rerun: .asciiz " Calculate again? y or n ? : "
operationinval1: .asciiz "Invalid input! Please enter y or n."
endstring: .asciiz "Calculator program end."
zeroerror: .asciiz "Dont enter a zero if you are doing division"

.text
.globl main

main:
	
	function:

		li $v0,4
		la $a0, firstint

		syscall

		li $v0,5

		syscall

		move $s0,$v0  		#store first integer into s0
		li $v0 , 4
		la $a0 , operandval

		syscall 

		li $v0, 12 		#read operand

		syscall

		move $a1, $v0 		#store operand into a1
		li $v0, 4
		la $a0, secondint

		syscall 

		li $v0,5

		syscall

		move $s1,$v0 		#store second integer into s1

		addi $t1, $0, 0x2b						
		beq $a1, $t1, addition	

		addi $t1, $0, 0x2d
		beq $a1, $t1, subtraction	

		addi $t1, $0, 0x2a
		beq $a1, $t1, multiplication	

		addi $t1, $0, 0x2f
		beq $a1, $t1, division	

		li $v0, 4
		la $a0 operatorinval

		syscall
		j function


	addition:
		add $s2,$s0,$s1	
		j result

	subtraction:
		sub $s2,$s0,$s1
		j result

	multiplication:
		mult $s0, $s1
		mflo $s2
		j result

	division:
		addi $t3,$t3,1
		slti $t2, $s1, 1,				#for zero error

		bne $t2,$t3,ELSE

		li $v0,4
		la $a0, zeroerror
		syscall
		j function


	ELSE:
		div $s0,$s1	
		mflo $s2

		j result

	result:
		li $v0,4
		la $a0, outputstring


		syscall 

		li $v0, 1
		add $a0, $0, $s2

		syscall 

		j again

	again:
		li $v0,4
		la $a0, rerun

		syscall 

		li $v0,12

		syscall

		move $a1, $v0

		addi $9, $0, 0x79
		beq $a1, $9, function	

		addi $9, $0, 0x6e
		beq $a1, $9, exitcalc



		li $v0,4
		la $a0, operationinval1

		syscall
		j again
		
	exitcalc:
		li $v0, 4
		la $a0, endstring

	syscall
	jr $31




	


































