ReadKernelFromHDD:
	mov ah, 0x02
	mov bx, 0x7e00
	mov al, 6
	mov cl, 0x02
	int 0x13
	ret