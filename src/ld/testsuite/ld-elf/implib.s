.ifndef NO_GLOBAL
	.comm	exported1,1

	.data
	.global	exported2
	.type	exported2, %object
	.size	exported2, 1
exported2:
	.byte	21
.endif

	.section ".bss", "aw", %nobits
not_exported1:
	.space	1
	.size	not_exported1, 1

	.data
	.type	not_exported2, %object
	.size	not_exported2, 1
not_exported2:
	.byte	42
