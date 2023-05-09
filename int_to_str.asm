res:
	times 10 db 0x00

IntToStr:
	mov cx, 10
	mov di, [res + 10]

.next_digit:
	dec di
	mov dx, 0x00
	div cx
	add dl, 0x30
	mov [di], dl
    test ax, ax
    jnz .next_digit
	mov si, di
	ret