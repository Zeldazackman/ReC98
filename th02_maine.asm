;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |        Copyright (c) 2009 by Hex-Rays, <support@hex-rays.com>           |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	E6F971B37336C0F9FCE53F895780031E

; File Name   :	th02/MAINE.EXE
; Format      :	MS-DOS executable (EXE)
; Base Address:	0h Range: 0h-FCF0h Loaded length: DE32h
; Entry	Point :	0:0
; OS type	  :  MS	DOS
; Application type:  Executable	16bit

		.386
		.model use16 large _TEXT

include ReC98.inc
include th01/hardware/grppsafx.inc
include th02/th02.inc

	extern _execl:proc

maine_01 group END_TEXT, maine_01_TEXT

; ===========================================================================

; Segment type:	Pure code
_TEXT		segment	word public 'CODE' use16
		assume cs:_TEXT
		assume es:nothing, ds:_DATA, fs:nothing, gs:nothing

include libs/master.lib/bfnt_entry_pat.asm
include libs/master.lib/bfnt_extend_header_skip.asm
include libs/master.lib/bfnt_header_read.asm
include libs/master.lib/bfnt_header_analysis.asm
include libs/master.lib/bcloser.asm
include libs/master.lib/bfill.asm
include libs/master.lib/bfnt_palette_set.asm
include libs/master.lib/bgetc.asm
include libs/master.lib/palette_black_in.asm
include libs/master.lib/palette_black_out.asm
include libs/master.lib/bopenr.asm
include libs/master.lib/bread.asm
include libs/master.lib/bseek.asm
include libs/master.lib/bseek_.asm
include libs/master.lib/cutline.asm
include libs/master.lib/dos_axdx.asm
include libs/master.lib/dos_filesize.asm
include libs/master.lib/dos_setvect.asm
include libs/master.lib/egc.asm
include libs/master.lib/egc_shift_down.asm
include libs/master.lib/egc_shift_left.asm
include libs/master.lib/file_append.asm
include libs/master.lib/file_close.asm
include libs/master.lib/file_exist.asm
include libs/master.lib/file_read.asm
include libs/master.lib/file_ropen.asm
include libs/master.lib/file_seek.asm
include libs/master.lib/file_size.asm
include libs/master.lib/file_write.asm
include libs/master.lib/dos_close.asm
include libs/master.lib/dos_ropen.asm
include libs/master.lib/grcg_boxfill.asm
include libs/master.lib/grcg_line.asm
include libs/master.lib/grcg_setcolor.asm
include libs/master.lib/gaiji_backup.asm
include libs/master.lib/gaiji_entry_bfnt.asm
include libs/master.lib/gaiji_putca.asm
include libs/master.lib/gaiji_putsa.asm
include libs/master.lib/gaiji_read.asm
include libs/master.lib/gaiji_write.asm
include libs/master.lib/graph_400line.asm
include libs/master.lib/graph_clear.asm
include libs/master.lib/graph_copy_page.asm
include libs/master.lib/graph_extmode.asm
include libs/master.lib/graph_gaiji_putc.asm
include libs/master.lib/graph_gaiji_puts.asm
include libs/master.lib/graph_pi_free.asm
include libs/master.lib/graph_pi_load_pack.asm
include libs/master.lib/graph_pack_put_8.asm
include libs/master.lib/key_sense.asm
include libs/master.lib/over_put_8.asm
include libs/master.lib/palette_show.asm
include libs/master.lib/pfclose.asm
include libs/master.lib/pfgetc.asm
include libs/master.lib/pfread.asm
include libs/master.lib/pfrewind.asm
include libs/master.lib/pfseek.asm
include libs/master.lib/palette_entry_rgb.asm
include libs/master.lib/rottbl.asm
include libs/master.lib/smem_release.asm
include libs/master.lib/smem_wget.asm
include libs/master.lib/text_clear.asm
include libs/master.lib/vsync.asm
include libs/master.lib/vsync_wait.asm
include libs/master.lib/palette_white_in.asm
include libs/master.lib/palette_white_out.asm
include libs/master.lib/hmem_lallocate.asm
include libs/master.lib/mem_assign_dos.asm
include libs/master.lib/mem_assign.asm
include libs/master.lib/memheap.asm
include libs/master.lib/mem_unassign.asm
include libs/master.lib/super_entry_pat.asm
include libs/master.lib/super_entry_at.asm
include libs/master.lib/super_entry_bfnt.asm
include libs/master.lib/pfint21.asm
		db 0
include th02/formats/pfopen.asm
include libs/master.lib/pf_str_ieq.asm
_TEXT		ends

; ===========================================================================

END_TEXT segment byte public 'CODE' use16
	@VERDICT_VALUE_SCORE_PUT$QIIL procdesc pascal near \
		left_and_top:dword, score:dword
	@LINE_TYPE$QIIINUCI procdesc pascal near \
		left_and_top:dword, len:word, str_seg:word, str_off:word, frames_per_kanji:word
	extern @verdict_row_1_to_0_animate$qiii:proc
	@GAIJI_BOLDFONT_STR_FROM_POSITIVE$QIN12GAIJI_TH02_T procdesc pascal near
	@STAFFROLL_PIC_PUT$QIII procdesc pascal near \
		left_and_top:dword, quarter:word
	@end_bad_animate$qv procdesc near
	@end_good_animate$qv procdesc near
	@ENDFT_PUT$QIII procdesc pascal near
END_TEXT ends

; Segment type:	Pure code
maine_01_TEXT	segment	byte public 'CODE' use16
		assume cs:maine_01
		;org 3
		assume es:nothing, ss:nothing, ds:_DATA, fs:nothing, gs:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_A8A4	proc near
		push	bp
		mov	bp, sp
		call	grcg_setcolor pascal, (GC_RMW shl 16) + 0
		push	1A000C0h
		push	27F010Fh
		call	grcg_boxfill
		call	grcg_off
		pop	bp
		retn
sub_A8A4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

rotrect	proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_0]
		call	@staffroll_rotrect_animate$qucuc
		call	@staffroll_pic_put$qiii pascal, large (32 shl 16) or 100, [bp+arg_2]
		call	@frame_delay$qi pascal, 4
		mov	PaletteTone, 100
		call	far ptr	palette_show
		pop	bp
		retn	6
rotrect	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_A8FA	proc near

@@g_str		= byte ptr -4

		enter	4, 0
		push	si
		push	di
		call	_snd_delay_until_measure stdcall, 6
		pop	cx
		xor	si, si
		jmp	short loc_A920
; ---------------------------------------------------------------------------

loc_A90C:
		push	(432 shl 16) or 184	; (left) or top
		push	si	; patnum_base
		call	@endft_put$qiii
		call	@frame_delay$qi pascal, 4
		add	si, 5

loc_A920:
		cmp	si, 55
		jl	short loc_A90C
		call	_graph_putsa_fx c, 528, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 192, offset aVer1_00, ds	; "ver 1.00"
		call	_snd_delay_until_measure stdcall, 8
		pop	cx
		mov	si, 184
		jmp	short loc_A992
; ---------------------------------------------------------------------------

loc_A947:
		call	grcg_setcolor pascal, (GC_RMW shl 16) + 0
		push	528
		lea	ax, [si+4]
		push	ax
		push	591
		lea	ax, [si+19]
		push	ax
		call	grcg_boxfill
		call	grcg_off
		push	432	; left
		push	si	; top
		push	50	; patnum_base
		call	@endft_put$qiii
		push	ds
		push	offset aVer1_00	; "ver 1.00"
		push	(V_WHITE or FX_WEIGHT_BOLD)
		lea	ax, [si+8]
		push	ax
		push	528
		call	_graph_putsa_fx
		add	sp, 0Ah
		call	@frame_delay$qi pascal, 1
		add	si, 4

loc_A992:
		cmp	si, 368
		jl	short loc_A947
		call	_snd_delay_until_measure stdcall, 9
		pop	cx
		mov	_line_col_and_fx, (V_WHITE or FX_WEIGHT_BOLD)
		call	@line_type$qiiinuci pascal, (432 shl 16) or 192, 20, ds, offset aXxcvsB@b@vrvsv, 12
		call	_snd_delay_until_measure stdcall, 13
		pop	cx
		graph_accesspage 1
		call	_pi_load c, 0, offset aEd06_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		graph_accesspage 0
		push	4
		push	0
		push	29h ; ')'
		call	rotrect
		call	sub_A8A4
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 192, offset aGvgngogigab@b@, ds	; "プログラム　　　ＺＵＮ"
		call	_snd_delay_until_measure stdcall, 17
		pop	cx
		push	ds
		push	offset aEd06b_rgb ; "ed06b.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	0FCh
		push	2
		push	29h ; ')'
		call	rotrect
		call	_snd_delay_until_measure stdcall, 21
		pop	cx
		call	@staffroll_pic_put$qiii pascal, large (32 shl 16) or 100, 3
		push	ds
		push	offset aEd06c_rgb ; "ed06c.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	4
		push	3
		push	29h ; ')'
		call	rotrect
		graph_accesspage 1
		call	_pi_load c, 0, offset aEd07_pi, ds
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		graph_accesspage 0
		call	_snd_delay_until_measure stdcall, 25
		pop	cx
		call	sub_A8A4
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 192, offset aGogigtgbgbgnb@, ds	; "グラフィック　ＺＵＮ"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 224, offset aB@b@b@b@b@b@b@, ds	; "　　　　　　　高附日向"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 240, offset aB@b@b@b@bigibG, ds	; "　　　　（オールクリア画）"
		push	ds
		push	offset aEd07a_rgb ; "ed07a.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	0FCh
		push	0
		push	29h ; ')'
		call	rotrect
		call	_snd_delay_until_measure stdcall, 29
		pop	cx
		push	ds
		push	offset aEd07b_rgb ; "ed07b.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	8
		push	1
		push	0E9h
		call	rotrect
		call	_snd_delay_until_measure stdcall, 33
		pop	cx
		call	@staffroll_pic_put$qiii pascal, (32 shl 16) or 100, 2
		push	0F8h
		push	2
		push	0E9h
		call	rotrect
		call	_snd_delay_until_measure stdcall, 37
		pop	cx
		call	sub_A8A4
		call	_graph_putsa_fx c, 432, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 192, offset aVlvtvrvhvbb@b@, ds	; "ＭＵＳＩＣ　　ＺＵＮ"
		push	ds
		push	offset aEd07b_rgb ; "ed07b.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	8
		push	3
		push	0E9h
		call	rotrect
		graph_accesspage 1
		call	_pi_load c, 0, offset aEd08_pi, ds
		call	_pi_put_8 c, 0, large 0
		graph_accesspage 0
		call	_snd_delay_until_measure stdcall, 41
		pop	cx
		call	_pi_palette_apply stdcall, 0
		pop	cx
		freePISlotLarge	0
		push	0F8h
		push	0
		push	0E9h
		call	rotrect
		call	_snd_delay_until_measure stdcall, 45
		pop	cx
		push	ds
		push	offset aEd08a_rgb ; "ed08a.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	0Ch
		push	1
		push	29h ; ')'
		call	rotrect
		call	_snd_delay_until_measure stdcall, 49
		pop	cx
		call	sub_A8A4
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 192, offset aVsvdvrvsb@vovk, ds	; "ＴＥＳＴ　ＰＬＡＹＥＲ"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 224, offset aB@b@b@b@vivivs, ds	; "　　　　かおる"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 248, offset aB@b@b@b@vbbVv, ds	;	"　　　　Ｃ−Ｗ"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 272, offset aB@b@Orucb@mbiS, ds	; "　　 山田　恵一郎"
		call	_graph_putsa_fx c, 416, ((V_WHITE or FX_WEIGHT_BOLD) shl 16) or 296, offset aVVSSxrivVVVV, ds	; " その他大勢のみなさん"
		push	ds
		push	offset aEd08b_rgb ; "ed08b.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	0F4h
		push	2
		push	29h ; ')'
		call	rotrect
		call	_snd_delay_until_measure stdcall, 53
		pop	cx
		push	ds
		push	offset aEd08c_rgb ; "ed08c.rgb"
		call	palette_entry_rgb
		call	far ptr	palette_show
		push	0Ch
		push	3
		push	29h ; ')'
		call	rotrect
		call	_snd_delay_until_measure stdcall, 57
		pop	cx
		push	4
		call	palette_black_out
		graph_accesspage 1
		call	_pi_load c, 0, offset aEd09_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		call	graph_copy_page pascal, 0
		push	4
		call	palette_black_in
		call	@frame_delay$qi pascal, 100
		graph_accesspage 1
		push	ds
		push	offset aVsvivbvovlb@vs
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(96 shl 16) or 24
		call	_graph_putsa_fx
		add	sp, 0Ah
		call	@verdict_row_1_to_0_animate$qiii c, 24, large 96 or (21 shl 16)
		call	@frame_delay$qi pascal, 200
		graph_accesspage 1
		push	ds
		push	offset aB@nPiuU_ ; "　最終得点"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(128 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		call	@verdict_value_score_put$qiil pascal, (192 shl 16) or 128, large [_score]
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 128 or (16 shl 16)
		call	@frame_delay$qi pascal, 100
		graph_accesspage 1
		push	ds
		push	offset aGrgugegbgjgeb ;	"コンティニュー"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(160 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		push	(256 shl 16) or 160
		les	bx, _resident
		mov	ax, es:[bx+mikoconfig_t.continues_used]
		add	ax, gb_0_
		push	ax
		push	V_WHITE
		call	graph_gaiji_putc
		call	@verdict_row_1_to_0_animate$qiii c, 64, large (16 shl 16) or 160
		call	@frame_delay$qi pascal, 100
		graph_accesspage 1
		push	ds
		push	offset aB@Gigugn ; "　 ランク"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(192 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		push	(208 shl 16) or 192
		push	GAIJI_W
		push	ds
		mov	al, _rank
		cbw
		shl	ax, 3
		add	ax, offset _gbcRANKS
		push	ax
		push	V_WHITE
		call	graph_gaiji_puts
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 192 or (16 shl 16)
		call	@frame_delay$qi pascal, 100
		graph_accesspage 1
		push	ds
		push	offset aGvgmgcgdbPik ; "プレイヤー初期"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(224 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		push	(256 shl 16) or 224
		les	bx, _resident
		mov	al, es:[bx+mikoconfig_t.start_lives]
		mov	ah, 0
		add	ax, gb_1_
		push	ax
		push	V_WHITE
		call	graph_gaiji_putc
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 224 or (16 shl 16)
		call	@frame_delay$qi pascal, 100
		graph_accesspage 1
		push	ds
		push	offset aCMvpik	; " 霊撃初期数"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(256 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		push	(256 shl 16) or 256
		les	bx, _resident
		mov	al, es:[bx+mikoconfig_t.start_bombs]
		mov	ah, 0
		add	ax, gb_0_
		push	ax
		push	V_WHITE
		call	graph_gaiji_putc
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 256 or (16 shl 16)
		call	@frame_delay$qi pascal, 150
		graph_accesspage 1
		les	bx, _resident
		mov	di, es:[bx+mikoconfig_t.skill]
		cmp	di, 64h	; 'd'
		jle	short loc_AEAC
		mov	di, 64h	; 'd'
		jmp	short loc_AEB2
; ---------------------------------------------------------------------------

loc_AEAC:
		or	di, di
		jge	short loc_AEB2
		xor	di, di

loc_AEB2:
		push	ds
		push	offset aVavVVSrso ; "あなたの腕前"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(288 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		push	di	; value
		push	ss	; str (segment)
		lea	ax, [bp+@@g_str]
		push	ax	; str (offset)
		call	@gaiji_boldfont_str_from_positive$qin12gaiji_th02_t
		push	(192 shl 16) or 288
		push	GAIJI_W
		push	ss
		lea	ax, [bp+@@g_str]
		push	ax
		push	V_WHITE
		call	graph_gaiji_puts
		cmp	di, 64h	; 'd'
		jnz	short loc_AEEF
		xor	si, si
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AEEF:
		cmp	di, 5Ah	; 'Z'
		jl	short loc_AEF9
		mov	si, 1
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AEF9:
		cmp	di, 50h	; 'P'
		jl	short loc_AF03
		mov	si, 2
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF03:
		cmp	di, 46h	; 'F'
		jl	short loc_AF17
		cmp	di, 4Dh	; 'M'
		jnz	short loc_AF12
		mov	si, 3
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF12:
		mov	si, 4
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF17:
		cmp	di, 3Ch	; '<'
		jl	short loc_AF21
		mov	si, 5
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF21:
		cmp	di, 32h	; '2'
		jl	short loc_AF2B
		mov	si, 6
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF2B:
		cmp	di, 28h	; '('
		jl	short loc_AF35
		mov	si, 7
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF35:
		cmp	di, 1Eh
		jl	short loc_AF3F
		mov	si, 8
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF3F:
		cmp	di, 14h
		jl	short loc_AF49
		mov	si, 9
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF49:
		cmp	di, 0Ah
		jl	short loc_AF53
		mov	si, 0Ah
		jmp	short loc_AF56
; ---------------------------------------------------------------------------

loc_AF53:
		mov	si, 0Bh

loc_AF56:
		mov	ax, si
		imul	ax, END_LINE_SIZE
		add	ax, offset _end_text
		push	ds
		push	ax
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(288 shl 16) or 240
		call	_graph_putsa_fx
		add	sp, 0Ah
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 288 or (6 shl 16)
		call	@frame_delay$qi pascal, 120
		call	@verdict_row_1_to_0_animate$qiii c, 192, large 288 or (24 shl 16)
		call	@frame_delay$qi pascal, 200
		graph_accesspage 1
		push	ds
		push	offset aVpvxvxvvb@vyvt ; "１９９７　ＺＵＮ  (Amusement Makers)"
		mov	al, _line_col_and_fx
		cbw
		push	ax
		push	(352 shl 16) or 64
		call	_graph_putsa_fx
		add	sp, 0Ah
		call	@verdict_row_1_to_0_animate$qiii c, 64, large 352 or (18 shl 16)
		call	@key_delay$qv
		push	5
		call	palette_black_out
		nopcall	sub_AFE7
		call	graph_clear
		pop	di
		pop	si
		leave
		retn
sub_A8FA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_AFE7	proc far
		push	bp
		mov	bp, sp
		call	scoredat_is_extra_unlocked
		or	ax, ax
		jz	loc_B07D
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.continues_used], 0
		jnz	short loc_B07D
		call	_pi_load c, 0, offset aAll_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		push	2
		call	palette_black_in
		call	@frame_delay$qi pascal, 150
		call	_pi_load c, 0, offset aBut_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		call	@key_delay$qv
		push	5
		call	palette_black_out

loc_B07D:
		pop	bp
		retf
sub_AFE7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_B07F	proc far
		push	bp
		mov	bp, sp
		call	scoredat_is_extra_unlocked
		or	ax, ax
		jz	loc_B115
		mov	PaletteTone, 0
		call	far ptr	palette_show
		call	_pi_load c, 0, offset aAll_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		push	2
		call	palette_black_in
		call	@frame_delay$qi pascal, 150
		call	_pi_load c, 0, offset aExtra_pi, ds
		call	_pi_palette_apply stdcall, 0
		pop	cx
		call	_pi_put_8 c, 0, large 0
		freePISlotLarge	0
		call	@key_delay$qv
		push	5
		call	palette_black_out

loc_B115:
		pop	bp
		retf
sub_B07F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl main(int _argc, const char **_argv, const	char **_envp)
public _main
_main		proc far

_argc		= word ptr  6
_argv		= dword	ptr  8
_envp		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		call	@cfg_load$qv
		or	ax, ax
		jz	loc_B1FE
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.stage], 7Fh
		jnz	loc_B1FE
		call	@game_init_main$qv
		call	gaiji_backup
		push	ds
		push	offset aMikoft_bft ; "MIKOFT.bft"
		call	gaiji_entry_bfnt
		call	_snd_pmd_resident
		call	_snd_mmd_resident
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.bgm_mode], 0
		jnz	short loc_B161
		mov	_snd_midi_active, 0
		jmp	short loc_B189
; ---------------------------------------------------------------------------

loc_B161:
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.bgm_mode], 1
		jnz	short loc_B173
		mov	_snd_midi_active, 0
		jmp	short loc_B184
; ---------------------------------------------------------------------------

loc_B173:
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.bgm_mode], 2
		jnz	short loc_B189
		mov	al, _snd_midi_possible
		mov	_snd_midi_active, al

loc_B184:
		call	_snd_determine_mode

loc_B189:
		graph_accesspage 0
		mov	dx, 164	; Port 00A4h: Page display register
		out	dx, al
		call	super_entry_bfnt pascal, ds, offset aEndft_bft ; "endft.bft"
		call	@frame_delay$qi pascal, 100
		les	bx, _resident
		cmp	es:[bx+mikoconfig_t.rank], 4
		jz	short loc_B1C2
		cmp	es:[bx+mikoconfig_t.continues_used], 0
		jz	short loc_B1BA
		call	@end_bad_animate$qv
		jmp	short loc_B1BD
; ---------------------------------------------------------------------------

loc_B1BA:
		call	@end_good_animate$qv

loc_B1BD:
		call	sub_A8FA
		jmp	short loc_B1C6
; ---------------------------------------------------------------------------

loc_B1C2:
		call	sub_B07F

loc_B1C6:
		mov	PaletteTone, 50
		call	far ptr	palette_show
		call	score_enter
		mov	PaletteTone, 0
		call	far ptr	palette_show
		call	gaiji_restore
		call	@game_exit$qv
		pushd	0
		push	ds
		push	offset path	; "op"
		push	ds
		push	offset path	; "op"
		call	_execl
		add	sp, 0Ch

loc_B1FE:
		pop	bp
		retf
_main		endp

maine_01_TEXT	ends

; ===========================================================================

SHARED	segment	word public 'CODE' use16
	extern _graph_putsa_fx:proc
	extern @key_delay$qv:proc
	extern _pi_load:proc
	extern @FRAME_DELAY$QI:proc
	extern @game_exit$qv:proc
	extern _snd_mmd_resident:proc
	extern _snd_determine_mode:proc
	extern _snd_pmd_resident:proc
	extern @game_init_main$qv:proc
	extern _pi_palette_apply:proc
	extern _pi_put_8:proc
	extern _snd_kaja_interrupt:proc
	extern _snd_delay_until_measure:proc
SHARED	ends

; ===========================================================================

maine_03_TEXT	segment	word public 'CODE' use16
	extern @cfg_load$qv:proc
maine_03_TEXT	ends

; ===========================================================================

maine_04_TEXT	segment	byte public 'CODE' use16
	extern SCOREDAT_IS_EXTRA_UNLOCKED:proc
	extern SCORE_ENTER:proc
maine_04_TEXT	ends

	extern @STAFFROLL_ROTRECT_ANIMATE$QUCUC:proc

	.data

	extern _gbcRANKS:byte
aVer1_00 = ($ - 9)
aXxcvsB@b@vrvsv	db '封魔録　　ＳＴＡＦＦ',0
aEd06_pi	db 'ed06.pi',0
aGvgngogigab@b@	db 'プログラム　　　ＺＵＮ',0
aEd06b_rgb	db 'ed06b.rgb',0
aEd06c_rgb	db 'ed06c.rgb',0
aEd07_pi	db 'ed07.pi',0
aGogigtgbgbgnb@	db 'グラフィック　ＺＵＮ',0
aB@b@b@b@b@b@b@	db '　　　　　　　高附日向',0
aB@b@b@b@bigibG	db '　　　　（オールクリア画）',0
aEd07a_rgb	db 'ed07a.rgb',0
aEd07b_rgb	db 'ed07b.rgb',0
aVlvtvrvhvbb@b@	db 'ＭＵＳＩＣ　　ＺＵＮ',0
aEd08_pi	db 'ed08.pi',0
aEd08a_rgb	db 'ed08a.rgb',0
aVsvdvrvsb@vovk	db 'ＴＥＳＴ　ＰＬＡＹＥＲ',0
aB@b@b@b@vivivs	db '　　　　かおる',0
aB@b@b@b@vbbVv	db '　　　　Ｃ−Ｗ',0
aB@b@Orucb@mbiS	db '　　 山田　恵一郎',0
aVVSSxrivVVVV	db ' その他大勢のみなさん',0
aEd08b_rgb	db 'ed08b.rgb',0
aEd08c_rgb	db 'ed08c.rgb',0
aEd09_pi	db 'ED09.pi',0
aVsvivbvovlb@vs	db 'Ｔｈａｎｋ　ｙｏｕ　ｆｏｒ　ｐｌａｙｉｎｇ',0
aB@nPiuU_	db '　最終得点',0
aGrgugegbgjgeb	db 'コンティニュー',0
aB@Gigugn	db '　 ランク',0
aGvgmgcgdbPik	db 'プレイヤー初期',0
aCMvpik		db ' 霊撃初期数',0
aVavVVSrso	db 'あなたの腕前',0
aVpvxvxvvb@vyvt	db '１９９７　ＺＵＮ  (Amusement Makers)',0
aAll_pi		db 'all.pi',0
aBut_pi		db 'but.pi',0
aExtra_pi	db 'extra.pi',0
aMikoft_bft	db 'MIKOFT.bft',0
aEndft_bft	db 'endft.bft',0
; char path[]
path		db 'op',0
include libs/master.lib/bfnt_id[data].asm
include libs/master.lib/clip[data].asm
include libs/master.lib/edges[data].asm
include libs/master.lib/fil[data].asm
include libs/master.lib/dos_ropen[data].asm
include libs/master.lib/gaiji_backup[data].asm
include libs/master.lib/gaiji_entry_bfnt[data].asm
include libs/master.lib/grp[data].asm
include libs/master.lib/pal[data].asm
include libs/master.lib/pf[data].asm
include libs/master.lib/sin8[data].asm
include libs/master.lib/tx[data].asm
include libs/master.lib/version[data].asm
include libs/master.lib/vs[data].asm
include libs/master.lib/mem[data].asm
include libs/master.lib/super_entry_bfnt[data].asm
include libs/master.lib/superpa[data].asm
public _key_delay_groups
_key_delay_groups	db 5, 3, 0
		db 0
include th02/formats/pfopen[data].asm
extern _rank:byte

	.data?

END_LINE_LENGTH = 44
END_LINE_SIZE = (END_LINE_LENGTH + 2)

	extern _end_text:byte:(100 * END_LINE_SIZE)
	extern _line_col_and_fx:byte
include libs/master.lib/clip[bss].asm
include libs/master.lib/fil[bss].asm
include libs/master.lib/pal[bss].asm
include libs/master.lib/vs[bss].asm
include libs/master.lib/vsync[bss].asm
include libs/master.lib/mem[bss].asm
include libs/master.lib/superpa[bss].asm
include th01/hardware/vram_planes[bss].asm
include th02/formats/pi_slots[bss].asm
include libs/master.lib/pfint21[bss].asm
include th02/hardware/input_sense[bss].asm
include th02/snd/snd[bss].asm
include th02/snd/load[bss].asm
extern _resident:dword
extern _score:dword

		end
