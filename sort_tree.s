	.text
	.globl	sort_tree
	.type	sort_tree, @function
sort_tree:
	pushq	%rbp
	movq	%rsp, %rbp

        /* TODO: Write your code! */
				/* rdi 1 *node */
				/* rsi 2 idx */
				/* rdx 3 *list */
	cmpq $0, 8(%rdi)
	je	.L1
	pushq %rdi
	movq 8(%rdi), %rdi
	call sort_tree
	popq %rdi
	movq %rax, %rsi

.L1:
	movl (%rdi), %r8d
	movl %r8d, (%rdx,%rsi,4)
	addq $1, %rsi

	cmpq $0, 16(%rdi)
	je .L2
	pushq %rdi
	movq 16(%rdi), %rdi
	call sort_tree
	popq %rdi
	movq %rax, %rsi

.L2:
	movq %rsi, %rax

	leave
	ret
	.size	sort_tree, .-sort_tree
	.section	.note.GNU-stack,"",@progbits
	