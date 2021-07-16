.data
	answer: .space 3
	str2: .asciiz ") = "
	str3: .asciiz "gcd("
	str4: .asciiz ","
	str5: .asciiz "\nWish to continue?:​ "
	str6: .asciiz "Enter m: "
	str7: .asciiz "Enter n: "

.text

main:
	#take m input
	la $a0 str6
	li $v0 4
	syscall

	li $v0 5
	syscall

	move $s0 $v0
	move $s2 $v0

	#take n input
	la $a0 str7
	li $v0 4
	syscall

	li $v0 5
	syscall

	move $s1 $v0
	move $s3 $v0

	sub $t0 $s0 $s1

	bgtz $t0 swap

gcd:
	beq $s1 $zero end
	div $s0 $s1
	move $s0 $s1
	mfhi $s1
	j gcd
end:
	la $a0 str3
	li $v0 4
	syscall

	move $a0 $s2
	li $v0 1
	syscall

	la $a0 str4
	li $v0 4
	syscall

	move $a0 $s3
	li $v0 1
	syscall

	la $a0 str2
	li $v0 4
	syscall

	move $a0 $s0
	li $v0 1
	syscall

	la $a0 str5
	li $v0 4
	syscall

	li $v0 8
	la $a0 answer
	li $a1 3
	move $t7 $a0
	syscall

	add $t0 $a0 $0
	lb $t0 0($t0)

	beq $t0 'Y' main

	li $v0 10
	syscall

swap:
	move $t0 $s0
	move $s0 $s1
	move $s1 $t0
	j gcd








