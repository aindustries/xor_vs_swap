## Tested against Debian Jessie.
	.text
	.globl main

	main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movl $0, %r8d
	movl $1, %r9d

	rdtscp ## writes processor time into edx:eax
	movl %edx, %r11d # high order bits
	movl %eax, %r12d

#	movl $10000, %ecx # loop counter

start:
	# actual work
	xorl %r8d, %r9d
	xorl %r9d, %r8d
	xorl %r8d, %r9d
	#end actual work
	#loop start ## uncomment to do with looping to sanity check. Overstates time of course due to the jump time

	rdtscp
	# move original readings onto stack
	movl %r11d, -4(%rbp) ## high order bits
	movl %r12d, -8(%rbp) ## low order

	# new reading
	movl %edx, -12(%rbp) ## again, high order
	movl %eax, -16(%rbp) ## low order

	movq -8(%rbp), %rdx # load back as 64bit
	movq -16(%rbp), %rsi
	subq %rdx, %rsi  #into rsi since we'll print it next

	leaq runtime(%rip), %rdi
	xorl %eax, %eax
	callq printf

	addq $16, %rsp

	popq %rbp
	retq

	.section .data
runtime:
.asciz "Processor time elapsed %lld\n"

# vim: ft=gas
