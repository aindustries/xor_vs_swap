	.text
	.globl main

	main:
	pushq %rbp
	movq %rsp, %rbp

	movl $0, %r8d
	movl $1, %r9d

	xorl %r8d, %r9d
	xorl %r9d, %r8d
	xorl %r8d, %r9d

	popq %rbp
	retq

# vim: ft=gas
