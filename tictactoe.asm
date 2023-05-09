;not working

a1_filled:
	db 0x00
a2_filled:
	db 0x00
a3_filled:
	db 0x00

b1_filled:
	db 0x00
b2_filled:
	db 0x00
b3_filled:
	db 0x00

c1_filled:
	db 0x00
c2_filled:
	db 0x00
c3_filled:
	db 0x00

Player_queue:
	db 0x00

RunTicTacToe:
	call EnableTextMode
	mov si, TicTacToe_help
	call PrintString
	call GetChar
	cmp al, 0x03
	je .Exit

	.PrepareField:
		call ClearScreen
		mov ah, 0x02
		mov bh, 0
		mov dh, 0x0a
		mov dl, 0
		int 0x10
		mov si, Field
		call PrintString
		mov si, Input
		call PrintString
		mov [Player_queue], byte 0x00

		mov [a1_filled], byte 0x00
		mov [a2_filled], byte 0x00
		mov [a3_filled], byte 0x00
		mov [b1_filled], byte 0x00
		mov [b2_filled], byte 0x00
		mov [b3_filled], byte 0x00
		mov [c1_filled], byte 0x00
		mov [c2_filled], byte 0x00
		mov [c3_filled], byte 0x00

	.Game:
		mov ah, 0x02
		mov bh, 0
		mov dh, 0x0f
		mov dl, 33
		int 0x10
		mov ah, 0x0e
		mov al, ' '
		int 0x10
		int 0x10

		mov ah, 0x02
		mov bh, 0
		mov dh, 0x0f
		mov dl, 33
		int 0x10

		call GetChar
		cmp al, 0x03
		je .Exit
		mov [Move], al
		mov ah, 0x0e
		int 0x10
		call GetChar
		cmp al, 0x03
		je .Exit
		mov [Move+1], al
		mov ah, 0x0e
		int 0x10

		cmp [Move+1], byte 49
		je .SetOne
		cmp [Move+1], byte 50
		je .SetTwo
		cmp [Move+1], byte 51
		je .SetThree

		jmp .UnknownMove

	.DetectMoveLetter:
		cmp [Move], byte 65
		je .MoveA
		cmp [Move], byte 66
		je .MoveB
		cmp [Move], byte 67
		je .MoveC
		cmp [Move], byte 97
		je .MoveA
		cmp [Move], byte 98
		je .MoveB
		cmp [Move], byte 99
		je .MoveC

		jmp .UnknownMove

		jmp .Game

	.SetOne:
		mov [Move+1], byte 0x01
		jmp .DetectMoveLetter
	.SetTwo:
		mov [Move+1], byte 0x02
		jmp .DetectMoveLetter
	.SetThree:
		mov [Move+1], byte 0x03
		jmp .DetectMoveLetter

	.UnknownMove:
		call ClearScreen
		mov si, Unknown_move
		call PrintString
		call GetChar
		cmp al, 0x03
		je .Exit
		jmp .PrepareField

	.MoveA:
		mov ah, 0x02
		mov bh, 0
		mov dl, [Move+1]
		mov dh, 0x0b
		int 0x10
		mov ah, 0x0e
		cmp [Move+1], byte 0x01
		je .CheckA1
		cmp [Move+1], byte 0x02
		je .CheckA2
		cmp [Move+1], byte 0x03
		je .CheckA3
	.MoveB:
		mov ah, 0x02
		mov bh, 0
		mov dl, [Move+1]
		mov dh, 0x0c
		int 0x10
		mov ah, 0x0e
		cmp [Move+1], byte 0x01
		je .CheckB1
		cmp [Move+1], byte 0x02
		je .CheckB2
		cmp [Move+1], byte 0x03
		je .CheckB3
	.MoveC:
		mov ah, 0x02
		mov bh, 0
		mov dl, [Move+1]
		mov dh, 0x0d
		int 0x10
		mov ah, 0x0e
		cmp [Move+1], byte 0x01
		je .CheckC1
		cmp [Move+1], byte 0x02
		je .CheckC2
		cmp [Move+1], byte 0x03
		je .CheckC3
	.MoveO:
		mov al, 'O'
		int 0x10
		mov [Player_queue], byte 0x01
		jmp .Game
	.MoveX:
		mov al, 'X'
		int 0x10
		mov [Player_queue], byte 0x00
		jmp .Game

	.CheckA1:
		cmp [a1_filled], byte 0x01
		je .Game
		mov [a1_filled], byte 0x01

		mov di, [a2_filled]
		and di, [a3_filled]
		cmp di, byte 0x01
		je .WinO
		
		mov di, [b2_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [b1_filled]
		and di, [c1_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckA2:
		cmp [a2_filled], byte 0x01
		je .Game
		mov [a2_filled], byte 0x01

		mov di, [a1_filled]
		and di, [a3_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [b2_filled]
		and di, [c2_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckA3:
		cmp [a3_filled], byte 0x01
		je .Game
		mov [a3_filled], byte 0x01

		mov di, [a1_filled]
		and di, [a2_filled]
		cmp di, byte 0x01
		je .WinO
		
		mov di, [b2_filled]
		and di, [c1_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [b3_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
		
	.CheckB1:
		cmp [b1_filled], byte 0x01
		je .Game
		mov [b1_filled], byte 0x01

		mov di, [b2_filled]
		and di, [b3_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [a1_filled]
		and di, [c1_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckB2:
		cmp [b2_filled], byte 0x01
		je .Game
		mov [b2_filled], byte 0x01

		mov di, [b1_filled]
		and di, [b3_filled]
		cmp di, byte 0x01
		je .WinO
		
		mov di, [a1_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [a3_filled]
		and di, [c1_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [a2_filled]
		and di, [c2_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckB3:
		cmp [b3_filled], byte 0x01
		je .Game
		mov [b3_filled], byte 0x01

		mov di, [b1_filled]
		and di, [b2_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [a3_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
		
	.CheckC1:
		cmp [c1_filled], byte 0x01
		je .Game
		mov [c1_filled], byte 0x01

		mov di, [c2_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO
		
		mov di, [b2_filled]
		and di, [a1_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [b1_filled]
		and di, [a1_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckC2:
		cmp [c2_filled], byte 0x01
		je .Game
		mov [c2_filled], byte 0x01

		mov di, [c1_filled]
		and di, [c3_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [a2_filled]
		and di, [b2_filled]
		cmp di, byte 0x01
		je .WinO
		
		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
	.CheckC3:
		cmp [c3_filled], byte 0x01
		je .Game
		mov [c3_filled], byte 0x01

		mov di, [c2_filled]
		and di, [c1_filled]
		cmp di, byte 0x01
		je .WinO
		
		mov di, [b2_filled]
		and di, [a1_filled]
		cmp di, byte 0x01
		je .WinO

		mov di, [b3_filled]
		and di, [a3_filled]
		cmp di, byte 0x01
		je .WinO

		cmp [Player_queue], byte 0x00
		je .MoveO
		cmp [Player_queue], byte 0x01
		je .MoveX
		
	.WinO:
		call ClearScreen
		mov si, WinO_msg
		call PrintString
		call GetChar
		jmp .Exit

	.Exit:
	mov di, 5
	call Draw_headbar
	ret

TicTacToe_help:
	db 'Tic Tac Toe 1.0. Press Ctrl+C to exit. Press any key to start...', 0x00

Field:
	db ' 123', 0x0a,0x0d, 'A###', 0x0a,0x0d,'B###',0x0a,0x0d,'C###',0x00

Input:
	db 0x0a,0x0d,0x0a,'Your move(Example: a1, c2, b3): ',0x00

Unknown_move:
	db 'Unknown move!', 0x00

Move:
	db 0x00, 0x00

WinO_msg:
	db 'O wins!',0x00
WinX_msg:
	db 'X wins!',0x00