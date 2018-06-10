#Pranav Kadam
#50140118
#CSE 341, Friday recitation
#Hamming Distance Project
#Final submission
#The code works but console output is a little shabby, sorry

.data

message1: .asciiz "\nInput the first string: "
message2: .asciiz "\nInput the second string: "
space: .asciiz ""
buffer1: .space 3   #because inputs are 2 strings of 2 characters
buffer2: .space 3
answer: .asciiz "\nThe hamming distance is : "



.text
.globl main

main:
       addi $v0,$0,4
       la $a0, message1			
       syscall
       
       addi $v0,$0,8
       la $a0,buffer1
       li $a1,3
       move $s0,$a0
       syscall
	
       addi $v0,$0,4
       la $a0, message2
       syscall
       
       addi $v0,$0,8
       la $a0,buffer2
       li $a1,3
       move $s1,$a0
       syscall
       
       
       li $t1,0 #stores count to be returned
loop:
        lb $t2, 0($s0)
        lb $t3, 0($s1)
        
        beq $t2,$0,end	#in case string is empty
        
        bne $t2,$t3,hamming_count
        
        addi $s0,$s0,1
	addi $s1,$s1,1 
	j loop
	
hamming_count: 
	     addi $t1,$t1,1 
	     addi $s0,$s0,1 
	     addi $s1,$s1,1 
		
	     j loop  
        
        		
        
end:
	
	addi $v0,$0,4 
	la $a0,answer
	syscall 
		
	addi $v0,$0,1
	move $a0,$t1 
	syscall 
		
	addi $v0,$0,10 
	syscall
