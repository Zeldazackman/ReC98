;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |        Copyright (c) 2009 by Hex-Rays, <support@hex-rays.com>           |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	2CAAD6F798E32B912A08DA327A97DDB4

; File Name   : th01/FUUIN.EXE
; Format      :	MS-DOS executable (EXE)
; Base Address:	0h Range: 0h-147E0h Loaded length: 13ED8h
; Entry	Point :	0:0
; OS type	  :  MS	DOS
; Application type:  Executable	16bit

		.386
		.model use16 large _TEXT

BINARY = 'E'

include ReC98.inc
include th01/th01.inc

	extern SCOPY@:proc
	extern __setargv__:proc ; main() needs both to be set
	extern __setenvp__:proc
	extern _execl:proc

fuuin_01 group fuuin_01_TEXT, fuuin_01__TEXT

; ===========================================================================

; Segment type:	Pure code
_TEXT		segment	word public 'CODE' use16
		assume cs:_TEXT
		assume es:nothing, ds:_DATA, fs:nothing, gs:nothing

include libs/master.lib/graph_400line.asm
include libs/master.lib/graph_clear.asm
include libs/master.lib/graph_show.asm
include libs/master.lib/graph_start.asm
include libs/master.lib/graph_scrollup.asm
include libs/master.lib/palette_show.asm
include libs/master.lib/palette_init.asm
include libs/master.lib/respal_exist.asm
include libs/master.lib/respal_free.asm
include libs/master.lib/resdata.asm
include libs/master.lib/file_read.asm
include libs/master.lib/file_close.asm
include libs/master.lib/file_ropen.asm
include libs/master.lib/file_seek.asm
include libs/master.lib/key_sense.asm
include libs/master.lib/dos_ropen.asm
include libs/master.lib/egc.asm
include libs/master.lib/gdc_outpw.asm
		db    0
include libs/master.lib/random.asm
_TEXT		ends

; ===========================================================================

; Segment type:	Pure code
fuuin_01_TEXT	segment	byte public 'CODE' use16
fuuin_01_TEXT	ends

fuuin_01__TEXT	segment	byte public 'CODE' use16
		assume cs:fuuin_01

	extern _end_init:proc

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl main(int argc, const char	**argv,	const char **envp)
public _main
_main		proc far

_argc		= word ptr  6
_argv		= dword	ptr  8
_envp		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		call	_mdrv2_resident
		or	ax, ax
		jnz	short loc_A105
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_A105:
		les	bx, [bp+_argv]
		les	bx, es:[bx+4]
		mov	al, es:[bx]
		cbw
		cmp	ax, 74h	; 't'
		jz	short loc_A121
		call	_end_init
		or	ax, ax
		jnz	short loc_A11F
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_A11F:
		jmp	short loc_A13E
; ---------------------------------------------------------------------------

loc_A121:
		les	bx, [bp+_argv]
		les	bx, es:[bx+4]
		mov	al, es:[bx+1]
		cbw
		cmp	ax, 31h	; '1'
		jnz	short loc_A139
		mov	_end_flag, 1
		jmp	short loc_A13E
; ---------------------------------------------------------------------------

loc_A139:
		mov	_end_flag, 2

loc_A13E:
		call	_mdrv2_check_board
		call	@game_init$qv
		call	@end_and_verdict_and_regist_anima$qv
		call	@game_switch_binary$qv
		push	0
		push	0
		push	ds
		push	offset arg0	; "op"
		push	ds
		push	offset path	; "op"
		call	_execl
		add	sp, 0Ch
		pop	bp
		retf
_main		endp

fuuin_01__TEXT	ends

; ===========================================================================

fuuin_02_TEXT	segment	byte public 'CODE' use16
fuuin_02_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
fuuin_03_TEXT	segment	byte public 'CODE' use16
	extern @end_and_verdict_and_regist_anima$qv:proc
fuuin_03_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
fuuin_04_TEXT	segment	byte public 'CODE' use16
fuuin_04_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
vsync_TEXT	segment	byte public 'CODE' use16
vsync_TEXT	ends

; ===========================================================================

ztext_TEXT	segment	byte public 'CODE' use16
ztext_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
initexit_TEXT	segment	byte public 'CODE' use16
	extern @game_init$qv:proc
	extern @game_switch_binary$qv:proc
initexit_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
graph_TEXT	segment	byte public 'CODE' use16
graph_TEXT	ends

; ===========================================================================

grppffx_TEXT	segment	byte public 'CODE' use16
grppffx_TEXT	ends

; ===========================================================================

PTN_GRP_GRZ	segment	byte public 'CODE' use16
PTN_GRP_GRZ	ends

; ===========================================================================

SHARED	segment	byte public 'CODE' use16
SHARED	ends

; ===========================================================================

; Segment type:	Pure code
GRAPH_EX_TEXT	segment	byte public 'CODE' use16
GRAPH_EX_TEXT	ends

; ===========================================================================

; Segment type:	Pure code
mdrv2_TEXT	segment	byte public 'CODE' use16
	extern _mdrv2_resident:proc
	extern _mdrv2_check_board:proc
mdrv2_TEXT	ends

	.data

public _score, _score_highest
public _RES_ID_0, _RES_ID_1, _ERROR_END_FLAG, _ERROR_NO_RESDATA
_score	dd 100000
_score_highest	dd 100000
_RES_ID_0	db 'ReiidenConfig',0
_ERROR_END_FLAG  	db 'ERROR : end_flag is not ture !!',0
_ERROR_NO_RESDATA	db 'ERROR : cfg_id is not alloc!!',0
_RES_ID_1	db 'ReiidenConfig',0
; char path[]
path		db 'op',0
; char arg0[3]
arg0		db 'op',0
		db    0
include th01/hardware/input_main_end[data].asm
		dd 0

	; th01/hardware/palette[data].asm
	extern _z_Palettes:rgb_t:COLOR_COUNT

	; libs/master.lib/grp[data].asm
	extern graph_VramSeg:word
	extern graph_VramWords:word
	extern graph_VramLines:word
	extern graph_VramZoom:word

	; libs/master.lib/pal[data].asm
	extern PaletteTone:word
	extern PalettesInit:rgb_t:COLOR_COUNT
	extern PaletteNote:word
	extern ResPalSeg:word

	; libs/master.lib/respal_exist[data].asm
IDLEN EQU 10
	extern ResPalID:byte:IDLEN

	; libs/master.lib/fil[data].asm
	extern file_BufferSize:word
	extern file_Handle:word

	; libs/master.lib/dos_ropen[data].asm
	extern file_sharingmode:word

	; libs/master.lib/clip[data].asm
	extern ClipXL:word
	extern ClipXW:word
	extern ClipXR:word
	extern ClipYT:word
	extern ClipYH:word
	extern ClipYB:word
	extern ClipYT_seg:word
	extern ClipYB_adr:word

	; libs/master.lib/rand[data].asm
	extern random_seed:dword

	.data?

public _continues_total, _continues_per_scene
_continues_total	dd ?
_continues_per_scene	dd SCENE_COUNT dup(?)
		db 308 dup(?)
public _start_lives_extra, _end_flag, _rank
_start_lives_extra	db ?
_end_flag	db ? ; ZUN symbol [Strings]
_rank	db ?
		db ?
include th01/hiscore/hiscore[bss].asm
		db    ?	;
public _input_prev
_input_prev	db 10 dup(?)
		evendata
include th01/hardware/vsync[bss].asm
		db 256 dup(?)
include th01/core/initexit[bss].asm
include th01/hardware/graph[bss].asm

	; libs/master.lib/pal[bss].asm
	extern Palettes:rgb_t:COLOR_COUNT

	; libs/master.lib/fil[bss].asm
	extern file_Buffer:dword
	extern file_BufferPos:dword
	extern file_BufPtr:word
	extern file_InReadBuf:word
	extern file_Eof:word
	extern file_ErrorStat:word

		end
