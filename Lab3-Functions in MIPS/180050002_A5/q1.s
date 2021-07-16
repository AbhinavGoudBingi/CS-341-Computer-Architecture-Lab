.data
	buffer: .space 14
	answer: .space 3
	str2: .asciiz "Enter string of 12 decimal digits: "
	str3: .asciiz "mod "
	str4: .asciiz " = "
	str5: .asciiz "\nWish to continue?:​ "
	str6: .asciiz "Enter modulus: "
	str7: .asciiz "\n"

.text

main:
	#take modulo input
	la $a0 str6
	li $v0 4
	syscall

	li $v0 5
	syscall

	#calculate 10^4 and 10^8 modulo
	addi $s0 $zero 10000
	div $s0 $v0
	mfhi $s0
	mul $s1 $s0 $s0
	div $s1 $v0
	mfhi $s1

	move $t4 $v0

	#take string number input
	la $a0 str2
	li $v0 4
	syscall

	li $v0 8
	la $a0 buffer
	li $a1 14
	move $t0 $a0
	syscall

	add $s2 $a0 $zero

	#initialise req var
	addi $t1 $zero 3
	addi $t2 $zero 0
	addi $t3 $zero 0

modulus:
	beq $t2 $t1 end

	jal submodulo

	addi $t2 $t2 1
	addi $s2 $s2 4

	j modulus

submodulo:

	addi $t6 $zero 0

	lb $t5, 3($s2)  # load one number
    sub $t5 $t5 '0'
    addi $t6 $t5 0

    lb $t5, 2($s2)  # load one number
    sub $t5 $t5 '0'
    addi $s3 $zero 10
    mul $t5 $t5 $s3
    add $t6 $t5 $t6

    lb $t5, 1($s2)  # load one number
    sub $t5 $t5 '0'
    addi $s3 $zero 100
    mul $t5 $t5 $s3
    add $t6 $t5 $t6

    lb $t5, 0($s2)  # load one number
    sub $t5 $t5 '0'
    addi $s3 $zero 1000
    mul $t5 $t5 $s3
    add $t6 $t5 $t6

    div $t6 $t4
    mfhi $t5

    addi $s4 $zero 1
    addi $s5 $zero 2

    seq $t6 $zero $t2

    mul $t6 $s1 $t6
    mul $t6 $t5 $t6
    div $t6 $t4
    mfhi $t6
    add $t3 $t3 $t6

    seq $t6 $s4 $t2

    mul $t6 $s0 $t6
    mul $t6 $t5 $t6
    div $t6 $t4
    mfhi $t6
    add $t3 $t3 $t6

    seq $t6 $s5 $t2

    mul $t6 $t6 $t5
    add $t3 $t3 $t6

    div $t3 $t4
    mfhi $t3

    jr $ra

end:
	la $a0, buffer
	li $s2 ' '
	sb $s2 12($a0)   # reload byte space to primary address
    move $a0, $t0   # primary address = t0 address (load pointer)
    li $v0, 4       # print string
    syscall

    la $a0 str3
	li $v0 4
	syscall

	move $a0 $t4
	li $v0 1
	syscall

	la $a0 str4
	li $v0 4
	syscall

	move $a0 $t3
    li $v0, 1       # print
    syscall

    la $a0 str5
	li $v0 4
	syscall

	li $v0 8
	la $a0 answer
	li $a1 3
	move $t7 $a0
	syscall

	add $s2 $a0 $0
	lb $s2 0($s2)

	beq $s2 'Y' main

    li $v0, 10      # end program
    syscall


