SaveToHDD:
	cmp [SaveData], byte 0x00
	je .Exit
	mov ah, 0x03
	mov al, 1
	mov cl, 0x08
	mov bx, 0x882a
	int 0x13
	.Exit:
	mov bl, [Headbar_Color]
	ret

ReadFromHDD:
	mov ah, 0x02
	mov al, 1
	mov cl, 0x08
	mov bx, 0x8a00
	int 0x13

	mov bl, [0x8a00]
	mov [Headbar_Color], bl
	mov si, [0x8a01]
	mov [First_start], si
	xor si, si
	ret