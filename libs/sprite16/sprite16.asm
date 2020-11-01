; This is a rebranded version of Promisence Soft's SPRITE16.COM driver,
; version 0.04, which was bundled with the sample game "StormySpace".
; See SPRITE16.DOC for API documentation.
;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |        Copyright (c) 2009 by Hex-Rays, <support@hex-rays.com>           |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	712EDD4642948A68F70365DC4DB06C62

; File Name   :	th04/ZUN.COM:ZUNSP (-4)
; Format      :	MS-DOS COM-file
; Base Address:	0h Range: 100h-1180h Loaded length: 1080h
; OS type	  :  MS	DOS
; Application type:  Executable	16bit

		.286 ; Force the .model directive to create 16-bit default segments...
		.model tiny
		.386 ; ... then switch to what we actually need.
		; And yes, we can't move this to an include file for some reason.

include libs/master.lib/macros.inc
include th01/hardware/egc.inc

; ===========================================================================

; Segment type:	Pure code
_TEXT		segment use16
		assume cs:_TEXT
		org 100h
		assume es:nothing, ss:nothing, ds:_TEXT, fs:nothing, gs:nothing

		public start
start:
		jmp	short sub_10C
; ---------------------------------------------------------------------------
aSprite16	db 'SPRITE16',0
		db    4

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_10C		proc near

		cld
		push	offset aHeader
		call	sub_676
		push	es
		mov	ax, 0
		mov	es, ax
		assume es:_TEXT
		mov	bx, word ptr es:start
		mov	es, word ptr es:aSprite16 ; "SPRITE16"
		assume es:nothing
		mov	ax, es:[bx+2]
		xchg	al, ah
		pop	es
		assume es:nothing
		cmp	ax, 'OK'
		jnz	short loc_137
		mov	word_F40, 1
		jmp	short loc_13D
; ---------------------------------------------------------------------------

loc_137:
		mov	word_F40, 0

loc_13D:
		mov	ax, 1180h
		shr	ax, 4
		inc	ax
		mov	word_F43, ax
		mov	sp, offset word_F38
		push	ds
		pop	es
		assume es:_TEXT
		mov	bx, word_F43
		mov	ah, 4Ah
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		jnb	short loc_161
		push	offset aGbgvgkpkpmvOFs ; "メモリ縮小に失敗しました。\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_161:
		mov	di, 81h
		mov	al, 0Dh
		mov	cx, 80h
		repne scasb
		mov	byte ptr [di-1], 0
		mov	si, 81h
		call	sub_920
		cmp	word_1070, 0
		jbe	short loc_186
		call	sub_A36
		mov	ax, 4C00h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------
		jmp	short loc_191
; ---------------------------------------------------------------------------

loc_186:
		push	offset aUsage
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code

loc_191:
		cmp	cs:word_F40, 0
		jz	short locret_19B
		int	40h		; Hard disk - Relocated	Floppy Handler (original INT 13h)

locret_19B:
		retn
sub_10C		endp

; =============== S U B	R O U T	I N E =======================================


sub_19C		proc near
		mov	bx, 1000
		mov	ah, 48h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jnb	short loc_1B0
		push	offset aGbgvgkvkslvsvV ; "メモリが足りません。\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_1B0:
		mov	word_F3C, ax
		add	word_F43, 1000
		mov	bx, 1000
		mov	ah, 48h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jnb	short loc_1CD
		push	offset aGbgvgkvkslvsvV ; "メモリが足りません。\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_1CD:
		mov	word_F3E, ax
		add	word_F43, 1000
		retn
sub_19C		endp


; =============== S U B	R O U T	I N E =======================================


sub_1D7		proc near
		call	sub_A0A
		mov	byte_F42, al
		retn
sub_1D7		endp


; =============== S U B	R O U T	I N E =======================================


sub_1DE		proc near
		call	sub_19C
		call	sub_520
		call	sub_540
		call	sub_610
		push	ds
		push	es
		mov	ds, word_F3C
		xor	si, si
		mov	ax, 0A800h
		mov	es, ax
		assume es:nothing
		xor	di, di
		mov	cx, 1F40h
		rep movsw
		pop	es
		assume es:nothing
		pop	ds
		retn
sub_1DE		endp


; =============== S U B	R O U T	I N E =======================================


sub_201		proc near
		call	sub_19C
		call	sub_540
		call	sub_A0A
		mov	dx, ax
		call	sub_A0A
		mov	bx, ax
		call	sub_A0A
		mov	di, ax
		call	sub_A0A
		push	ax
		call	sub_A0A
		mov	cx, ax
		pop	ax
		call	sub_BD0
		call	sub_364
		call	sub_C10
		retn
sub_201		endp


; =============== S U B	R O U T	I N E =======================================


sub_22A		proc far
		push	bx
		mov	bl, ah
		xor	bh, bh
		shl	bx, 1
		mov	bx, cs:off_103E[bx]
		mov	cs:word_F45, bx
		pop	bx
		sti
		call	cs:word_F45
		iret
sub_22A		endp


; =============== S U B	R O U T	I N E =======================================


sub_243		proc near
		push	es
		xor	ax, ax
		mov	es, ax
		assume es:_TEXT
		mov	bl, byte_F42
		xor	bh, bh
		shl	bx, 2
		mov	es, word ptr es:[bx+2]
		assume es:nothing
		mov	di, 102h
		mov	si, 102h
		mov	cx, 0Ah
		repe cmpsb
		pop	es
		jz	short loc_2A6
		call	sub_19C
		push	es
		xor	ax, ax
		mov	es, ax
		assume es:_TEXT
		mov	dx, cs
		mov	ax, offset sub_22A
		mov	bl, byte_F42
		xor	bh, bh
		shl	bx, 2
		xchg	dx, es:[bx+2]
		xchg	ax, es:[bx]
		mov	word_F38, dx
		mov	word_F3A, ax
		pop	es
		assume es:nothing
		movzx	eax, byte_F42
		push	eax
		mov	bx, sp
		mov	dx, offset aPatuvVVVBbInt0 ; "常駐しました。(int %02Xh)\r\n"
		call	sub_640
		add	sp, 4
		mov	dx, word_F43
		mov	ax, 3100h
		int	21h		; DOS -	DOS 2+ - TERMINATE BUT STAY RESIDENT
					; AL = exit code, DX = program size, in	paragraphs
; ---------------------------------------------------------------------------
		jmp	short locret_2AC
; ---------------------------------------------------------------------------

loc_2A6:
		push	offset aVVVPatuvVVvvVB ; "すでに常駐しています。\r\n"
		call	sub_676

locret_2AC:
		retn
sub_243		endp


; =============== S U B	R O U T	I N E =======================================


sub_2AD		proc near
		xor	ax, ax
		mov	es, ax
		assume es:_TEXT
		mov	bl, byte_F42
		xor	bh, bh
		shl	bx, 2
		mov	es, word ptr es:[bx+2]
		assume es:nothing
		mov	di, 102h
		mov	si, 102h
		mov	cx, 0Ah
		repe cmpsb
		jnz	short loc_339
		mov	dx, es:word_F38
		mov	ax, es:word_F3A
		push	es
		xor	ax, ax
		mov	es, ax
		assume es:_TEXT
		mov	bl, byte_F42
		xor	bh, bh
		shl	bx, 2
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		pop	es
		assume es:nothing
		push	es
		mov	es, word ptr es:2Ch
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jnb	short loc_2FC
		push	offset aKLlcIci	; "環境領域解放失敗\r\n"
		call	sub_676

loc_2FC:
		pop	es
		push	es
		mov	es, word ptr es:0F3Ch
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jnb	short loc_30F
		push	offset aGGxgngfbGCIci ;	"マスクデータ領域解放失敗\r\n"
		call	sub_676

loc_30F:
		pop	es
		push	es
		mov	es, word ptr es:0F3Eh
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jnb	short loc_322
		push	offset aGxgGfbGCIci ; "ベタデータ領域解放失敗\r\n"
		call	sub_676

loc_322:
		pop	es
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jnb	short loc_331
		push	offset aGrbGhcIci ; "コード領域解放失敗\r\n"
		call	sub_676
		jmp	short locret_33F
; ---------------------------------------------------------------------------

loc_331:
		push	offset aI	; "解放しました。\r\n"
		call	sub_676
		jmp	short locret_33F
; ---------------------------------------------------------------------------

loc_339:
		push	offset aPatuvVVvvVV ; "常駐していません。\r\n"
		call	sub_676

locret_33F:
		retn
sub_2AD		endp


; =============== S U B	R O U T	I N E =======================================


sub_340		proc near
		mov	cs:word_1064, dx
		retn
sub_340		endp


; =============== S U B	R O U T	I N E =======================================


sub_346		proc near
		mov	cs:word_1066, dx
		retn
sub_346		endp


; =============== S U B	R O U T	I N E =======================================


sub_34C		proc near
		mov	cs:word_1068, dx
		retn
sub_34C		endp


; =============== S U B	R O U T	I N E =======================================


sub_352		proc near
		mov	cs:word_106E, dx
		retn
sub_352		endp


; =============== S U B	R O U T	I N E =======================================


sub_358		proc near
		mov	cs:word_106A, dx
		retn
sub_358		endp


; =============== S U B	R O U T	I N E =======================================


sub_35E		proc near
		mov	cs:word_106C, dx
		retn
sub_35E		endp


; =============== S U B	R O U T	I N E =======================================


sub_364		proc near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	ds
		push	es
		push	cs
		pop	ds
		xor	ah, ah
		mov	word_105A, dx
		mov	word_105C, bx
		mov	word_105E, di
		mov	word_1060, ax
		mov	word_1062, cx
		mov	word_1054, 0
		cmp	word_105C, 0
		jge	short loc_3C1
		mov	ax, word_105C
		add	ax, word_1062
		cmp	ax, 0
		jg	short loc_3A1
		jmp	short loc_3F8
; ---------------------------------------------------------------------------
		jmp	short loc_3EE
; ---------------------------------------------------------------------------

loc_3A1:
		mov	ax, 0
		sub	ax, word_105C
		mov	word_1054, ax
		shl	ax, 4
		mov	dx, ax
		shl	ax, 2
		add	ax, dx
		add	word_105E, ax
		mov	word_105C, 0
		jmp	short loc_3EE
; ---------------------------------------------------------------------------

loc_3C1:
		cmp	word_105C, 0C8h
		jb	short loc_3CD
		jmp	short loc_3F8
; ---------------------------------------------------------------------------
		jmp	short loc_3EE
; ---------------------------------------------------------------------------

loc_3CD:
		mov	dx, word_105C
		add	dx, word_1062
		cmp	dx, 0C8h
		jle	short loc_3EE
		mov	ax, 0C8h
		sub	ax, word_105C
		mov	dx, word_1062
		sub	dx, ax
		mov	word_1054, dx
		jmp	short $+2

loc_3EE:
		mov	ax, word_1054
		sub	word_1062, ax
		call	sub_402

loc_3F8:
		pop	es
		pop	ds
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_364		endp


; =============== S U B	R O U T	I N E =======================================


sub_402		proc near
		mov	si, word_105E
		mov	ax, word_105A
		shr	ax, 3
		and	ax, 0FFFEh
		xor	dx, dx
		mov	cx, word_105C
		imul	di, cx,	50h
		add	di, ax
		mov	ax, word_105A
		and	ax, 0Fh
		mov	word_1050, ax
		mov	dx, EGC_ADDRRESSREG
		mov	ax, word_1050
		shl	ax, 4
		out	dx, ax
		mov	word_1052, 0
		xor	ax, ax
		cmp	word_1050, 0
		setnz	al
		mov	word_1052, ax
		mov	ax, 0A800h
		mov	es, ax
		assume es:nothing
		mov	dx, EGC_BITLENGTHREG
		mov	ax, word_1060
		shl	ax, 4
		dec	ax
		out	dx, ax
		mov	ax, word_1060
		add	ax, word_1052
		mov	word_1058, ax
		mov	ax, word_1058
		shl	ax, 1
		mov	dx, 50h
		sub	dx, ax
		mov	word_1056, dx
		cmp	cs:word_1064, 0
		jz	short loc_49C
		outw	EGC_READPLANEREG, 0FFh
		outw	EGC_MASKREG, cs:word_106C
		outw	EGC_READPLANEREG, 40FFh
		outw	EGC_MODE_ROP_REG, EGC_WS_ROP or EGC_SHIFT_CPU or 0ACh
		outw	EGC_FGCOLORREG, cs:word_1066
		mov	ds, cs:word_F3E
		jmp	short loc_4EB
; ---------------------------------------------------------------------------

loc_49C:
		cmp	cs:word_1068, 0
		jz	short loc_4CB
		outw	EGC_ACTIVEPLANEREG, 0FFF0h
		outw	EGC_READPLANEREG, 0FFh
		outw	EGC_MODE_ROP_REG, EGC_WS_ROP or EGC_SHIFT_CPU or 0C0h
		outw	EGC_MASKREG, cs:word_106C
		mov	ds, cs:word_F3C
		call	sub_4F8
		jmp	short loc_4DA
; ---------------------------------------------------------------------------

loc_4CB:
		outw	EGC_READPLANEREG, 0FFh
		outw	EGC_MASKREG, cs:word_106C

loc_4DA:
		outw	EGC_MODE_ROP_REG, cs:word_106A
		mov	ax, 0A800h
		mov	ds, ax
		assume ds:nothing
		add	si, 3E80h

loc_4EB:
		outw	EGC_ACTIVEPLANEREG, cs:word_106E
		call	sub_4F8
		retn
sub_402		endp

; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================


sub_4F8		proc near
		push	si
		push	di
		mov	bx, cs:word_1062
		mov	dx, cs:word_1058
		mov	ax, cs:word_1056

loc_508:
		mov	cx, dx
		rep movsw
		add	si, ax
		add	di, ax
		dec	bx
		jnz	short loc_508
		pop	di
		pop	si
		retn
sub_4F8		endp

; ---------------------------------------------------------------------------
		db 10 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_520		proc near
		push	ds
		push	es
		pusha
		mov	al, 1
		out	6Ah, al		; PC-98	GDC (6a):
					;
		xor	al, al
		out	0A6h, al	; Interrupt Controller #2, 8259A
		call	sub_5D0
		call	sub_5F7
		call	sub_5A4
		xor	al, al
		out	0A4h, al	; Interrupt Controller #2, 8259A
		xor	al, al
		out	0A6h, al	; Interrupt Controller #2, 8259A
		popa
		pop	es
		assume es:nothing
		pop	ds
		assume ds:_TEXT
		retn
sub_520		endp


; =============== S U B	R O U T	I N E =======================================


sub_540		proc near
		push	ds
		push	es
		pusha
		call	sub_C10
		xor	al, al
		out	0A6h, al	; Interrupt Controller #2, 8259A
		mov	es, cs:word_F3E
		xor	di, di
		xor	ax, ax
		mov	cx, 1F40h
		rep stosw
		mov	es, cs:word_F3E
		mov	ax, 0A800h
		call	sub_590
		mov	ax, 0B000h
		call	sub_590
		mov	ax, 0B800h
		call	sub_590
		mov	ax, 0E000h
		call	sub_590
		mov	ds, cs:word_F3E
		mov	es, cs:word_F3C
		xor	si, si
		xor	di, di
		mov	cx, 1F40h

loc_586:
		lodsw
		not	ax
		stosw
		loop	loc_586
		popa
		pop	es
		pop	ds
		retn
sub_540		endp


; =============== S U B	R O U T	I N E =======================================


sub_590		proc near
		mov	ds, ax
		xor	bx, bx
		mov	cx, 1F40h

loc_597:
		mov	ax, [bx+3E80h]
		or	es:[bx], ax
		add	bx, 2
		loop	loc_597
		retn
sub_590		endp


; =============== S U B	R O U T	I N E =======================================


sub_5A4		proc near
		push	ds
		push	es
		pusha
		call	sub_BD0
		mov	ax, 0A800h
		mov	ds, ax
		assume ds:nothing
		mov	bl, 0
		mov	bh, 1
		mov	di, 3E80h
		mov	cx, 1F40h

loc_5B9:
		mov	al, bl
		out	0A6h, al	; Interrupt Controller #2, 8259A
		mov	dx, [di]
		mov	al, bh
		out	0A6h, al	; Interrupt Controller #2, 8259A
		mov	[di], dx
		inc	di
		inc	di
		loop	loc_5B9
		call	sub_C10
		popa
		pop	es
		pop	ds
		assume ds:_TEXT
		retn
sub_5A4		endp


; =============== S U B	R O U T	I N E =======================================


sub_5D0		proc near
		push	ds
		push	es
		pusha
		call	sub_BD0
		mov	ax, 0A800h
		mov	ds, ax
		assume ds:nothing
		mov	es, ax
		assume es:nothing
		xor	si, si
		xor	di, di
		mov	cx, 0C8h

loc_5E4:
		push	cx
		mov	cx, 28h
		rep movsw
		pop	cx
		add	si, 50h
		loop	loc_5E4
		call	sub_C10
		popa
		pop	es
		assume es:nothing
		pop	ds
		assume ds:_TEXT
		retn
sub_5D0		endp


; =============== S U B	R O U T	I N E =======================================


sub_5F7		proc near
		call	sub_BD0
		mov	ax, 0A800h
		mov	ds, ax
		assume ds:nothing
		mov	es, ax
		assume es:nothing
		mov	si, 0
		mov	di, 3E80h
		mov	cx, 1F40h
		rep movsw
		call	sub_C10
		retn
sub_5F7		endp


; =============== S U B	R O U T	I N E =======================================


sub_610		proc near
		push	es
		pusha
		call	sub_BD0
		outw	EGC_MODE_ROP_REG, 0
		mov	ax, 0A800h
		mov	es, ax
		xor	di, di
		mov	ax, 0
		mov	cx, 1F40h
		rep stosw
		call	sub_C10
		popa
		pop	es
		assume es:nothing
		retn
sub_610		endp

; ---------------------------------------------------------------------------
		db 15 dup(0)

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_640		proc near

var_D0		= byte ptr -0D0h

		enter	0D0h, 0
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_D0]
		call	sub_6B0
		push	ds
		push	dx
		push	ss
		pop	ds
		assume ds:_TEXT
		lea	dx, [bp+var_D0]
		call	sub_660
		pop	dx
		pop	ds
		pop	di
		pop	es
		leave
		retn
sub_640		endp


; =============== S U B	R O U T	I N E =======================================


sub_660		proc near
		push	ax
		push	dx
		push	si
		mov	si, dx

loc_665:
		mov	dl, [si]
		or	dl, dl
		jz	short loc_672
		mov	ah, 2
		int	21h		; DOS -	DISPLAY	OUTPUT
					; DL = character to send to standard output
		inc	si
		jmp	short loc_665
; ---------------------------------------------------------------------------

loc_672:
		pop	si
		pop	dx
		pop	ax
		retn
sub_660		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_676		proc near

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	dx
		push	ds
		mov	dx, [bp+arg_0]
		push	ss
		pop	ds
		call	sub_660
		pop	ds
		pop	dx
		pop	bp
		retn	2
sub_676		endp


; =============== S U B	R O U T	I N E =======================================


sub_689		proc near
		cmp	dl, 30h
		jb	short loc_692
		cmp	dl, 3Ah
		retn
; ---------------------------------------------------------------------------

loc_692:
		clc
		retn
sub_689		endp


; =============== S U B	R O U T	I N E =======================================


sub_694		proc near
		cmp	al, 61h
		jb	short loc_69B
		cmp	al, 7Bh
		retn
; ---------------------------------------------------------------------------

loc_69B:
		clc
		retn
sub_694		endp


; =============== S U B	R O U T	I N E =======================================


sub_69D		proc near
		call	sub_694
		jnb	short locret_6A4
		and	al, 0DFh

locret_6A4:
		retn
sub_69D		endp

; ---------------------------------------------------------------------------
		db 11 dup(0)

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_6B0		proc near

var_50		= byte ptr -50h
var_18		= word ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4

		enter	50h, 0
		pusha
		push	ds
		push	es
		mov	si, dx
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_6BC:
		cmp	byte ptr [si], 25h
		jnz	loc_83F
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0
		inc	si
		cmp	byte ptr [si], 2Dh
		jnz	short loc_6E3
		inc	si
		mov	[bp+var_C], 1

loc_6E3:
		cmp	byte ptr [si], 30h
		jnz	short loc_6EE
		inc	si
		mov	[bp+var_10], 1

loc_6EE:
		xor	ax, ax
		xor	dx, dx
		jmp	short loc_701
; ---------------------------------------------------------------------------

loc_6F4:
		imul	ax, 0Ah
		xor	dx, dx
		mov	dl, [si]
		sub	dl, 30h
		add	ax, dx
		inc	si

loc_701:
		cmp	byte ptr [si], 30h
		jb	short loc_70B
		cmp	byte ptr [si], 39h
		jbe	short loc_6F4

loc_70B:
		mov	[bp+var_4], ax
		cmp	byte ptr [si], 75h
		jnz	short loc_779
		inc	si
		mov	edx, ss:[bx]
		add	bx, 4
		mov	[bp+var_14], 0Ah

loc_723:
		push	ds
		push	bx
		push	ss
		pop	ds
		lea	bx, [bp+var_50]
		mov	ecx, [bp+var_14]
		call	sub_89F
		lea	dx, [bp+var_50]
		call	sub_C40
		add	[bp+var_8], ax
		pop	bx
		pop	ds
		cmp	[bp+var_C], 0
		jnz	short loc_75F
		cmp	[bp+var_10], 0
		jz	short loc_74D
		call	sub_87D
		jmp	short loc_750
; ---------------------------------------------------------------------------

loc_74D:
		call	sub_883

loc_750:
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_50]
		call	sub_897
		pop	si
		pop	ds
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_75F:
		cmp	[bp+var_C], 1
		jnz	loc_86D
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_50]
		call	sub_897
		pop	si
		pop	ds
		call	sub_883
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_779:
		cmp	byte ptr [si], 64h
		jnz	short loc_7A3
		inc	si
		mov	edx, ss:[bx]
		add	bx, 4
		or	edx, edx
		jns	short loc_796
		neg	edx
		mov	byte ptr es:[di], 2Dh
		inc	di
		inc	[bp+var_8]

loc_796:
		mov	[bp+var_14], 0Ah
		jmp	short loc_723
; ---------------------------------------------------------------------------
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_7A3:
		cmp	byte ptr [si], 78h
		jnz	short loc_7C3
		inc	si
		mov	edx, ss:[bx]
		add	bx, 4
		mov	[bp+var_14], 10h
		mov	[bp+var_18], 1
		jmp	loc_723
; ---------------------------------------------------------------------------
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_7C3:
		cmp	byte ptr [si], 58h
		jnz	short loc_7E3
		inc	si
		mov	edx, ss:[bx]
		add	bx, 4
		mov	[bp+var_14], 10h
		mov	[bp+var_18], 0
		jmp	loc_723
; ---------------------------------------------------------------------------
		jmp	loc_86D
; ---------------------------------------------------------------------------

loc_7E3:
		cmp	byte ptr [si], 62h
		jnz	short loc_802
		inc	si
		mov	edx, ss:[bx]
		add	bx, 4
		mov	[bp+var_14], 2
		mov	[bp+var_18], 0
		jmp	loc_723
; ---------------------------------------------------------------------------
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_802:
		cmp	byte ptr [si], 73h
		jnz	short loc_830
		inc	si
		push	ds
		push	si
		lds	si, ss:[bx]
		add	bx, 4
		mov	dx, si
		call	sub_C40
		mov	[bp+var_8], ax
		cmp	[bp+var_C], 0
		jnz	short loc_826
		call	sub_883
		call	sub_897
		jmp	short loc_82C
; ---------------------------------------------------------------------------

loc_826:
		call	sub_897
		call	sub_883

loc_82C:
		pop	si
		pop	ds
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_830:
		cmp	byte ptr [si], 'c'
		jnz	short loc_86D
		inc	si
		mov	al, ss:[bx]
		add	bx, 4
		stosb
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_83F:
		cmp	word ptr [si], 'n\'
		jnz	short loc_850
		add	si, 2
		mov	al, 0Dh
		stosb
		mov	al, 0Ah
		stosb
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_850:
		cmp	word ptr [si], 'r\'
		jnz	short loc_85E
		add	si, 2
		mov	al, 0Dh
		stosb
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_85E:
		cmp	word ptr [si], 't\'
		jnz	short loc_86C
		add	si, 2
		mov	al, 9
		stosb
		jmp	short loc_86D
; ---------------------------------------------------------------------------

loc_86C:
		movsb

loc_86D:
		cmp	byte ptr [si], 0
		jnz	loc_6BC
		mov	byte ptr es:[di], 0
		pop	es
		pop	ds
		popa
		leave
		retn
sub_6B0		endp


; =============== S U B	R O U T	I N E =======================================


sub_87D		proc near
		mov	al, 30h
		call	sub_889
		retn
sub_87D		endp


; =============== S U B	R O U T	I N E =======================================


sub_883		proc near
		mov	al, 20h
		call	sub_889
		retn
sub_883		endp


; =============== S U B	R O U T	I N E =======================================


sub_889		proc near
		mov	cx, [bp-4]
		sub	cx, [bp-8]
		cmp	cx, 1
		jl	short locret_896
		rep stosb

locret_896:
		retn
sub_889		endp


; =============== S U B	R O U T	I N E =======================================


sub_897		proc near
		lodsb
		stosb
		or	al, al
		jnz	short sub_897
		dec	di
		retn
sub_897		endp


; =============== S U B	R O U T	I N E =======================================


sub_89F		proc near
		push	eax
		push	ebx
		push	ecx
		push	edx
		mov	eax, edx
		push	bx

loc_8AB:
		xor	edx, edx
		div	ecx
		mov	dl, byte ptr cs:a0123456789abcd[edx] ; "0123456789ABCDEF"
		cmp	word ptr [bp-18h], 0
		jz	short loc_8C2
		or	dl, 20h

loc_8C2:
		mov	[bx], dl
		inc	bx
		or	eax, eax
		jnz	short loc_8AB
		mov	byte ptr [bx], 0
		pop	bx
		mov	dx, bx
		call	sub_8EC
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		retn
sub_89F		endp

; ---------------------------------------------------------------------------
a0123456789abcd	db '0123456789ABCDEF'

; =============== S U B	R O U T	I N E =======================================


sub_8EC		proc near
		push	es
		push	ax
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		pop	es
		assume es:_TEXT
		mov	di, dx
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		sub	di, 2
		mov	si, dx
		jmp	short loc_90C
; ---------------------------------------------------------------------------

loc_904:
		mov	al, [si]
		xchg	al, [di]
		mov	[si], al
		inc	si
		dec	di

loc_90C:
		cmp	si, di
		jnb	short loc_915
		cmp	byte ptr [si], 0
		jnz	short loc_904

loc_915:
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	ax
		pop	es
		assume es:nothing
		retn
sub_8EC		endp

; ---------------------------------------------------------------------------
		db 4 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_920		proc near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		mov	word_1070, 0
		mov	di, offset byte_1072

loc_92F:
		call	sub_982
		mov	al, [si]
		or	al, al
		jz	short loc_940
		cmp	al, 0Dh
		jz	short loc_940
		cmp	al, 3Bh
		jnz	short loc_945

loc_940:
		mov	byte ptr [si], 0
		jmp	short loc_97B
; ---------------------------------------------------------------------------

loc_945:
		cmp	byte ptr [si], 22h
		jnz	short loc_96D
		inc	si
		mov	[di], si
		add	di, 2
		inc	word_1070
		call	sub_9B5
		jnb	short loc_964
		push	offset aSVVVsVkmivVivs ; "対になる \" が見つかりません。\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_964:
		mov	byte ptr [si], 0
		inc	si
		call	sub_999
		jmp	short loc_92F
; ---------------------------------------------------------------------------

loc_96D:
		mov	[di], si
		add	di, 2
		inc	word_1070
		call	sub_999
		jmp	short loc_92F
; ---------------------------------------------------------------------------

loc_97B:
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_920		endp


; =============== S U B	R O U T	I N E =======================================


sub_982		proc near
		mov	al, [si]
		cmp	al, 20h
		jz	short loc_992
		cmp	al, 2Ch
		jz	short loc_992
		cmp	al, 9
		jz	short loc_992
		jmp	short locret_998
; ---------------------------------------------------------------------------

loc_992:
		mov	byte ptr [si], 0
		inc	si
		jmp	short sub_982
; ---------------------------------------------------------------------------

locret_998:
		retn
sub_982		endp


; =============== S U B	R O U T	I N E =======================================


sub_999		proc near
		mov	al, [si]
		cmp	al, 20h
		jz	short loc_9AF
		cmp	al, 2Ch
		jz	short loc_9AF
		cmp	al, 9
		jz	short loc_9AF
		or	al, al
		jz	short loc_9AF
		cmp	al, 0Dh
		jnz	short loc_9B1

loc_9AF:
		jmp	short locret_9B4
; ---------------------------------------------------------------------------

loc_9B1:
		inc	si
		jmp	short sub_999
; ---------------------------------------------------------------------------

locret_9B4:
		retn
sub_999		endp


; =============== S U B	R O U T	I N E =======================================


sub_9B5		proc near
		mov	al, [si]
		cmp	al, 22h
		jnz	short loc_9BE
		clc
		jmp	short locret_9CC
; ---------------------------------------------------------------------------

loc_9BE:
		or	al, al
		jz	short loc_9C6
		cmp	al, 0Dh
		jnz	short loc_9C9

loc_9C6:
		stc
		jmp	short locret_9CC
; ---------------------------------------------------------------------------

loc_9C9:
		inc	si
		jmp	short sub_9B5
; ---------------------------------------------------------------------------

locret_9CC:
		retn
sub_9B5		endp


; =============== S U B	R O U T	I N E =======================================


sub_9CD		proc near
		cmp	word_1070, 0
		jnz	short loc_9DF
		push	offset aI_0	; "引数が足りません。\r\n\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_9DF:
		dec	word_1070
		mov	si, word_10F2
		add	word_10F2, 2
		mov	si, [si]
		retn
sub_9CD		endp


; =============== S U B	R O U T	I N E =======================================


sub_9EF		proc near
		cmp	word_1070, 0
		jnz	short loc_9F9
		stc
		jmp	short locret_A09
; ---------------------------------------------------------------------------

loc_9F9:
		dec	word_1070
		mov	si, word_10F2
		add	word_10F2, 2
		mov	si, [si]
		clc

locret_A09:
		retn
sub_9EF		endp


; =============== S U B	R O U T	I N E =======================================


sub_A0A		proc near
		push	si
		push	dx
		call	sub_9CD
		mov	dx, si
		call	sub_A90
		jnb	short loc_A21
		push	offset aRftlvVCVvtlvko ; "数値では無い値が指定されています。\r\n\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_A21:
		pop	dx
		pop	si
		retn
sub_A0A		endp


; =============== S U B	R O U T	I N E =======================================


sub_A24		proc near
		push	si
		push	dx
		mov	ax, 0
		call	sub_9EF
		jnb	short loc_A33
		mov	dx, si
		call	sub_A90

loc_A33:
		pop	dx
		pop	si
		retn
sub_A24		endp


; =============== S U B	R O U T	I N E =======================================


sub_A36		proc near
		mov	word_10F2, offset byte_1072

loc_A3C:
		mov	si, word_10F2
		add	word_10F2, 2
		mov	si, [si]
		cmp	word_1070, 0
		jnz	short loc_A50
		jmp	short locret_A88
; ---------------------------------------------------------------------------

loc_A50:
		dec	word_1070
		mov	al, [si]
		cmp	al, 2Dh
		jnz	short loc_A5E
		mov	al, 2Fh
		mov	[si], al

loc_A5E:
		mov	bx, offset off_101C

loc_A61:
		cmp	word ptr [bx], 0
		jnz	short loc_A71
		push	offset aGigvgvgzguvkcM ; "オプションが無効です。\r\n\r\n"
		call	sub_676
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_A71:
		mov	di, [bx]
		call	sub_C52
		jnz	short loc_A81
		pusha
		push	es
		call	word ptr [bx+2]
		pop	es
		popa
		jmp	short loc_A86
; ---------------------------------------------------------------------------

loc_A81:
		add	bx, 4
		jmp	short loc_A61
; ---------------------------------------------------------------------------

loc_A86:
		jmp	short loc_A3C
; ---------------------------------------------------------------------------

locret_A88:
		retn
sub_A36		endp

; ---------------------------------------------------------------------------
		db 7 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_A90		proc near
		push	bx
		push	dx
		push	si
		mov	si, dx
		cmp	byte ptr [si], 27h
		jnz	short loc_ABB
		cmp	word ptr [si+2], 27h
		jnz	short loc_AA8
		mov	al, [si+1]
		xor	ah, ah
		clc
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_AA8:
		cmp	word ptr [si+3], 27h
		jnz	short loc_AB6
		mov	ax, [si+1]
		xchg	ah, al
		clc
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_AB6:
		xor	ax, ax
		stc
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_ABB:
		cmp	byte ptr [si], 24h
		jnz	short loc_AC6
		inc	si
		call	sub_B4B
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_AC6:
		mov	dx, si
		call	sub_C40
		mov	bx, ax
		mov	al, [bx+si-1]
		call	sub_69D
		cmp	al, 48h
		jnz	short loc_AE6
		mov	dl, [bx+si-1]
		mov	byte ptr [bx+si-1], 0
		call	sub_B4B
		mov	[bx+si-1], dl
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_AE6:
		cmp	al, 42h
		jnz	short loc_AF9
		mov	dl, [bx+si-1]
		mov	byte ptr [bx+si-1], 0
		call	sub_B75
		mov	[bx+si-1], dl
		jmp	short loc_B01
; ---------------------------------------------------------------------------

loc_AF9:
		call	sub_B05
		jnb	short loc_B01
		call	sub_BA2

loc_B01:
		pop	si
		pop	dx
		pop	bx
		retn
sub_A90		endp


; =============== S U B	R O U T	I N E =======================================


sub_B05		proc near
		push	si
		push	dx
		push	cx
		push	bp
		xor	ax, ax
		xor	dx, dx
		mov	bp, 0
		cmp	byte ptr [si], 2Dh
		jnz	short loc_B1B
		inc	si
		mov	bp, 0FFFFh
		jmp	short loc_B21
; ---------------------------------------------------------------------------

loc_B1B:
		cmp	byte ptr [si], 2Bh
		jnz	short loc_B21
		inc	si

loc_B21:
		mov	dl, [si]
		inc	si
		or	dl, dl
		jz	short loc_B3E
		call	sub_689
		jb	short loc_B30
		stc
		jmp	short loc_B46
; ---------------------------------------------------------------------------

loc_B30:
		push	dx
		mov	cx, 0Ah
		mul	cx
		pop	dx
		sub	dl, 30h
		add	ax, dx
		jmp	short loc_B21
; ---------------------------------------------------------------------------

loc_B3E:
		cmp	bp, 0FFFFh
		jnz	short loc_B45
		neg	ax

loc_B45:
		clc

loc_B46:
		pop	bp
		pop	cx
		pop	dx
		pop	si
		retn
sub_B05		endp


; =============== S U B	R O U T	I N E =======================================


sub_B4B		proc near
		push	si
		push	dx
		xor	dx, dx

loc_B4F:
		lodsb
		or	al, al
		jz	short loc_B70
		cmp	al, 5Bh
		jb	short loc_B5A
		sub	al, 20h

loc_B5A:
		sub	al, 30h
		cmp	al, 0Ah
		jb	short loc_B66
		sub	al, 7
		cmp	al, 10h
		jnb	short loc_B6F

loc_B66:
		xor	ah, ah
		shl	dx, 4
		add	dx, ax
		jmp	short loc_B4F
; ---------------------------------------------------------------------------

loc_B6F:
		stc

loc_B70:
		mov	ax, dx
		pop	dx
		pop	si
		retn
sub_B4B		endp


; =============== S U B	R O U T	I N E =======================================


sub_B75		proc near
		push	si
		push	bx
		push	dx
		mov	dx, si
		call	sub_C40
		mov	bx, si
		add	bx, ax
		xor	ax, ax
		jmp	short loc_B99
; ---------------------------------------------------------------------------

loc_B85:
		mov	dl, [si]
		cmp	dl, 30h
		jz	short loc_B94
		cmp	dl, 31h
		jz	short loc_B94
		stc
		jmp	short loc_B9E
; ---------------------------------------------------------------------------

loc_B94:
		shr	dl, 1
		rcl	ax, 1
		inc	si

loc_B99:
		cmp	si, bx
		jnz	short loc_B85
		clc

loc_B9E:
		pop	dx
		pop	bx
		pop	si
		retn
sub_B75		endp


; =============== S U B	R O U T	I N E =======================================


sub_BA2		proc near
		push	di
		push	es
		push	cs
		pop	es
		assume es:_TEXT
		mov	ax, 1
		mov	di, offset aOn	; "ON"
		call	sub_C52
		jz	short loc_BC2
		mov	ax, 0
		mov	di, offset aOff	; "OFF"
		call	sub_C52
		jz	short loc_BC2
		mov	ax, 0
		stc
		jmp	short loc_BC3
; ---------------------------------------------------------------------------

loc_BC2:
		clc

loc_BC3:
		pop	es
		assume es:nothing
		pop	di
		retn
sub_BA2		endp

; ---------------------------------------------------------------------------
		db 10 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_BD0		proc near
		push	ax
		push	dx
		cli
		graph_egc	1
		GRCG_SETMODE_VIA_MOV al, GC_TDW
		outw	EGC_ACTIVEPLANEREG, 0FFF0h
		outw	EGC_READPLANEREG, 0FFh
		outw	EGC_MODE_ROP_REG, EGC_COMPAREREAD or EGC_WS_ROP or 0F0h
		outw	EGC_MASKREG, 0FFFFh
		mov	dx, EGC_ADDRRESSREG
		xor	ax, ax
		out	dx, ax
		outw	EGC_BITLENGTHREG, 0Fh
		sti
		pop	dx
		pop	ax
		retn
sub_BD0		endp


; =============== S U B	R O U T	I N E =======================================


sub_C10		proc near
		push	ax
		push	dx
		cli
		outw	EGC_ACTIVEPLANEREG, 0FFF0h
		outw	EGC_READPLANEREG, 0FFh
		outw	EGC_MASKREG, 0FFFFh
		graph_egc	0
		GRCG_OFF_VIA_XOR al
		sti
		pop	dx
		pop	ax
		retn
sub_C10		endp

; ---------------------------------------------------------------------------
		db 4 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_C40		proc near
		push	si
		push	dx
		mov	si, dx
		mov	dx, 0FFFFh

loc_C47:
		inc	dx
		lodsb
		or	al, al
		jnz	short loc_C47
		mov	ax, dx
		pop	dx
		pop	si
		retn
sub_C40		endp


; =============== S U B	R O U T	I N E =======================================


sub_C52		proc near
		push	ax
		push	dx
		push	si
		push	di

loc_C56:
		mov	al, [si]
		call	sub_69D
		mov	dl, al
		mov	al, es:[di]
		call	sub_69D
		mov	dh, al
		inc	si
		inc	di
		cmp	dl, dh
		jnz	short loc_C6F
		or	dl, dl
		jnz	short loc_C56

loc_C6F:
		cmp	dl, dh
		pop	di
		pop	si
		pop	dx
		pop	ax
		retn
sub_C52		endp

; ---------------------------------------------------------------------------
		db 10 dup(0)
aGbgvgkpkpmvOFs	db 'メモリ縮小に失敗しました。',0Dh,0Ah,0
aVVVPatuvVVvvVB	db 'すでに常駐しています。',0Dh,0Ah,0
aKLlcIci	db '環境領域解放失敗',0Dh,0Ah,0
aGGxgngfbGCIci	db 'マスクデータ領域解放失敗',0Dh,0Ah,0
aGxgGfbGCIci	db 'ベタデータ領域解放失敗',0Dh,0Ah,0
aGrbGhcIci	db 'コード領域解放失敗',0Dh,0Ah,0
aI		db '解放しました。',0Dh,0Ah,0
aPatuvVVvvVV	db '常駐していません。',0Dh,0Ah,0
		db 200h	dup(0)
word_F38	dw 0
word_F3A	dw 0
word_F3C	dw 0
word_F3E	dw 0
word_F40	dw 0
byte_F42	db 42h
word_F43	dw 0
word_F45	dw 0
aGbgvgkvkslvsvV	db 'メモリが足りません。',0Dh,0Ah,0
aPatuvVVVBbInt0	db '常駐しました。(int %02Xh)',0Dh,0Ah,0
aHeader	label byte

ifdef THIEF

	db 'ZUNSP.COM    Version 1.00 Copyright(C) 1997 ZUN           ',0Dh,0Ah
	db 0Dh,0Ah,0
aUsage 	label byte
	db 'Usage: ZUNSP    -z (常駐)',0Dh,0Ah

else

	db 'SPRITE16.COM Version 0.04 Copyright(C) 1996 PromisenceSoft',0Dh,0Ah
	db 0Dh,0Ah,0
aUsage 	label byte
	db 'Usage: sprite16 -z (常駐)',0Dh,0Ah

endif

	db '                -r (解放)',0Dh,0Ah,0
aZ		db '/Z',0
aR		db '/R',0
aV		db '/V',0
aMasktest	db 'MASKTEST',0
aPressy		db 'PRESSY',0
aCopyul		db 'COPYUL',0
aClsu		db 'CLSU',0
aSprite		db 'SPRITE',0
off_101C	dw offset aZ, offset sub_243
		dw offset aR, offset sub_2AD
		dw offset aV, offset sub_1D7
		dw offset aMasktest, offset sub_1DE
		dw offset aPressy, offset sub_5D0
		dw offset aCopyul, offset sub_5A4
		dw offset aClsu, offset	sub_610
		dw offset aSprite, offset sub_201
		dw 0
off_103E	dw offset sub_520
		dw offset sub_540
		dw offset sub_364
		dw offset sub_340
		dw offset sub_346
		dw offset sub_34C
		dw offset sub_352
		dw offset sub_358
		dw offset sub_35E
word_1050	dw 0
word_1052	dw 0
word_1054	dw 0
word_1056	dw 0
word_1058	dw 0
word_105A	dw 0
word_105C	dw 0
word_105E	dw 0
word_1060	dw 0
word_1062	dw 0
word_1064	dw 0
word_1066	dw 0Fh
word_1068	dw 1
word_106A	dw 28FCh
word_106C	dw 0FFFFh
word_106E	dw 0FFF0h
word_1070	dw 0
byte_1072	db 80h dup(0)
word_10F2	dw 0
aSVVVsVkmivVivs	db '対になる " が見つかりません。',0Dh,0Ah,0
aI_0		db '引数が足りません。',0Dh,0Ah
		db 0Dh,0Ah,0
aRftlvVCVvtlvko	db '数値では無い値が指定されています。',0Dh,0Ah
		db 0Dh,0Ah,0
aGigvgvgzguvkcM	db 'オプションが無効です。',0Dh,0Ah
		db 0Dh,0Ah,0
		db 3 dup(0)
aOn		db 'ON',0
aOff		db 'OFF',0
		db 9 dup(0)
_TEXT		ends


		end start
