[org 0x7e00]

cmp si, byte 0x01
je KERNEL_MINI_MODE

; KERNEL NORMAL MODE

call EnableVideoMode

call ReadFromHDD

call SetUp

main:
	call SaveToHDD
	call Process_input
	jmp main

SaveData:
	db 0x01

MinimalMode:
	db 0x00

KERNEL_VER:
	db 'lcOS version 1.2',0x00

; KERNEL MINIMAL MODE

KERNEL_MINI_MODE:

mov [MinimalMode], byte 0x01

jmp minimal_main

%include "kernel_includes.asm"

times 3072-($-$$) db 0x00
db 0x0f,0x01
times 510 db 0x00