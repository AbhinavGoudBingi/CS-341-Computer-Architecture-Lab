# read n from console
.data
	str1: .asciiz "Enter No. of integers in list\n"
	str2: .asciiz "Enter list\n"
	str3: .asciiz "Enter k\n"


.text

main:
	la $a0 str1
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $t0 $v0

# allocate dynamic memory
	sll $a0 $v0 2    # sll performs $a0 = $v0 x 2^2
	li $v0 9    #9 is the system code for service(sbrk) whose work is        
	syscall     #to allocate dynamic memory

	move $t1 $zero
	move $t2 $v0
	move $s0 $v0  

	addi $t4 $zero 5
	sll $a0 $t4 2
	li $v0 9
	syscall
	move $s1 $v0

	la $a0 str2
	li $v0 4
	syscall
	jal loop

loop:
    bge $t1 $t0 inputk

    # read in and store int
    li $v0 5
    syscall
    sw $v0 0($t2)

    addi $t1 $t1 1
    addi $t2 $t2 4
    j loop

inputk:
	la $a0 str3
	li $v0 4
	syscall
	li $v0 5
    syscall
    move $t6 $v0
    addi $t6 $t6 -1
    addi $t7 $zero 4
    mul $t6 $t6 $t7
    jal initialise1

setmax1:
	move $s2 $s5
	sw $s2 0($s1)
	j increment1
setmax2:
	move $s2 $s5
	sw $s2 4($s1)
	j increment2
setmax3:
	move $s2 $s5
	sw $s2 8($s1)
	j increment3
setmax4:
	move $s2 $s5
	sw $s2 12($s1)
	j increment4
setmax5:
	move $s2 $s5
	sw $s2 16($s1)
	j increment5

initialise1:
	move $t1 $zero
	li $t3 -2147483648
	li $s2 -2147483648
	sw $t3 0($s1)
	move $t2 $s0
	jal loop1

loop1:
	bge $t1 $t0 initialise2
	lw $s5 0($t2)
	blt $s2 $s5 setmax1
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop1

initialise2:
	move $t1 $zero
	li $s2 -2147483648
	sw $t3 4($s1)
	lw $t5 0($s1)
	move $t2 $s0
	jal loop2

increment1:
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop1

increment2:
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop2

increment3:
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop3

increment4:
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop4

increment5:
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop5

loop2:
	bge $t1 $t0 initialise3
	lw $s5 0($t2)
	ble $t5 $s5 increment2
	blt $s2 $s5 setmax2
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop2

initialise3:
	move $t1 $zero
	li $s2 -2147483648
	sw $t3 8($s1)
	lw $t5 4($s1)
	move $t2 $s0
	jal loop3

loop3:
	bge $t1 $t0 initialise4
	lw $s5 0($t2)
	ble $t5 $s5 increment3
	blt $s2 $s5 setmax3
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop3

initialise4:
	move $t1 $zero
	li $s2 -2147483648
	sw $t3 12($s1)
	lw $t5 8($s1)
	move $t2 $s0
	jal loop4

loop4:
	bge $t1 $t0 initialise5
	lw $s5 0($t2)
	ble $t5 $s5 increment4
	blt $s2 $s5 setmax4
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop4

initialise5:
	move $t1 $zero
	li $s2 -2147483648
	sw $t3 16($s1)
	lw $t5 12($s1)
	move $t2 $s0
	jal loop5

loop5:
	bge $t1 $t0 decide
	lw $s5 0($t2)
	ble $t5 $s5 increment5
	blt $s2 $s5 setmax5
	addi $t1 $t1 1
    addi $t2 $t2 4
    j loop5

decide:
	beq $t6 0 end1
	beq $t6 4 end2
	beq $t6 8 end3
	beq $t6 12 end4
	beq $t6 16 end5

end1:
	li $v0 1
	lw $a0 0($s1)
	syscall
	li $v0 10
	syscall

end2:
	li $v0 1
	lw $a0 4($s1)
	syscall
	li $v0 10
	syscall

end3:
	li $v0 1
	lw $a0 8($s1)
	syscall
	li $v0 10
	syscall

end4:
	li $v0 1
	lw $a0 12($s1)
	syscall
	li $v0 10
	syscall

end5:
	li $v0 1
	lw $a0 16($s1)
	syscall
	li $v0 10
	syscall