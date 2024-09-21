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
	cmp 8(%rdi), $0
	je	.L1
	pushq %rdi
	movq 8(%rdi), %r8
	movq %r8, %rdi
	call sort_tree
	popq %rdi
	movq %rax, %rsi

.L1:
	movl (%rdi), %r8
	movl %r8, (%rdx,%rsi,4)
	addq 1, %rsi

	cmp 16(%rdi), $0
	je .L2
	pushq %rdi
	movq 16(%rdi), %r8
	movq %r8, %rdi
	call sort_tree
	popq %rdi
	movq %rax, %rsi

.L2:
	movq %rsi, %rax

	leave
	ret
	.size	sort_tree, .-sort_tree
	.section	.note.GNU-stack,"",@progbits
	