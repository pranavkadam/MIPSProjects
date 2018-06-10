#Pranav Kadam
#50140118
#CSE 341, Friday recitation
#Euclidean Distance Project
#Final submission

.data
mssgx1: .asciiz "\nEnter x1: "
mssgy1: .asciiz "\nEnter y1: "
mssgx2: .asciiz "\nEnter x2: "
mssgy2: .asciiz "\nEnter y2: "
result: .asciiz "\nThe Euclidean distance is: "
newline: .asciiz "\n"

.text

main:
	li $v0,4	#Enter x1
	la $a0,mssgx1	 
	syscall		
		
	li $v0,5	
	syscall 	
	move $t1,$v0
	
	li $v0,4	#Enter x2
	la $a0,mssgx2	
	syscall		
		
	li $v0,5	
	syscall		
	move $t3,$v0	
		
	li $v0,4	#Enter y1
	la $a0,mssgy1	
	syscall		
		
	li $v0,5	
	syscall		
	move $t2,$v0	
		
		
	li $v0,4	
	la $a0,mssgy2	#Enter y2
	syscall		
		
	li $v0,5	
	syscall		
	move $t4,$v0	
		
	
	sub $s0,$t1,$t2 	#x1-y1
	sub $s1,$t3,$t4 	#x2-y2
		
	mul $s0,$s0,$s0 	#(x1-y1)^2
	mul $s1,$s1,$s1 	#(x2-y2)^2
		
	add $s2,$s0,$s1 	#(x1-y1)^2 + (x2-y2)^2
		
	move $t4, $zero			
	move $t1, $s2				#$t1 stores the value of the radicand			
	
	addi $t0, $zero, 1		
	sll $t0, $t0, 30	
	
	
	firstloop:
		slt $t5, $t1, $t0
		beq $t5, $0, secondloop			#radication
		nop
		
		srl $t0, $t0, 2			
		j firstloop
		
	secondloop:
		beq $t0, $0, end	
		nop
		
		add $t6, $t4, $t0	 	
		slt $t5, $t1, $t6		
		beq $t5, $zero, else	
		nop
		
		srl $t4, $t4, 1			
		j last
		
	else:
		sub $t1, $t1, $t6		
		srl $t4, $t4, 1			
		add $t4, $t4, $t0		
		
	last:
		srl $t0, $t0, 2			
		j secondloop
		
	end:
		li $v0, 4				
		la $a0,result
		syscall
	
		li $v0, 1
		move $a0, $t4
		syscall
		
		li $v0, 10
   		syscall
