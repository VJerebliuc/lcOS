Reboot:
	cmp [MinimalMode], byte 0x01
	je .Exit
	call SaveToHDD
	.Exit:
	int 0x19
	ret

Shutdown:
	cmp [MinimalMode], byte 0x01
	je .Exit
	call SaveToHDD
	.Exit:
	mov ax, 0x5307
	mov bx, 0x01
	mov cx, 0x03
	int 0x15
	ret

Goodbye:
	db 'Goodbye!', 3, 0