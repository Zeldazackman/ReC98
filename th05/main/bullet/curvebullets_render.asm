public CURVEBULLETS_RENDER
curvebullets_render	proc near

@@head		= word ptr -6
@@trail_sprite		= word ptr -4
@@bullet_i		= word ptr -2

@@clip	macro @@label_next:req
local @@positive_y
	add	ax, (PLAYFIELD_X - (CURVEBULLET_W / 2))
	cmp	dx, (PLAYFIELD_Y - CURVEBULLET_H)
	jl	short @@label_next
	cmp	dx, PLAYFIELD_BOTTOM
	jge	short @@label_next
	or	ax, ax
	jl	short @@label_next
	cmp	ax, PLAYFIELD_RIGHT
	jge	short @@label_next

	; This is usually done in the scroll_subpixel_y_to_vram*() functions. But
	; since curve bullets are only used by bosses whose backgrounds don't
	; scroll, ZUN apparently didn't see the need to call that function here?
	; Y wrapping is in fact necessary here though, since curve bullets are one
	; of the few sprite types with a height greater than PLAYFIELD_Y *and*
	; sometimes leave the playfield through the top. Therefore, their top Y
	; coordinate can and will end up between 0 and -15, before being clipped
	; at -16 (PLAYFIELD_Y - CURVEBULLET_H). curvebullet_put() will then handle
	; the actual Y wrapping of the remaining sprite rows.
	or	dx, dx ; (PLAYFIELD_Y - (CURVEBULLET_H / 2))
	jge	short @@positive_y
	add	dx, RES_Y
@@positive_y:
endm

	push	bp
	mov	bp, sp
	sub	sp, 6
	push	si
	push	di
	mov	[bp+@@head], offset curvebullet_heads
	mov	di, offset _curvebullet_trails
	mov	ax, GRAM_400
	mov	es, ax
	assume es:nothing
	mov	[bp+@@bullet_i], 1
	jmp	@@bullets_more?
; ---------------------------------------------------------------------------

@@bullet_loop:
	cmp	[di+curvebullet_trail_t.flag], 0
	jz	@@bullet_next
	mov	ah, [di+curvebullet_trail_t.CBT_col]
	call	_grcg_setcolor_direct_seg1_raw
	mov	si, (CURVEBULLET_TRAIL_NODE_COUNT - 1)
	jmp	short @@nodes_more?
; ---------------------------------------------------------------------------

@@node_loop:
	mov	bx, si
	mov	al, [di+curvebullet_trail_t.node_sprite+bx]
	mov	ah, 0
	mov	[bp+@@trail_sprite], ax
	shl	bx, 2
	mov	ax, [di+curvebullet_trail_t.node_pos[bx]+y]
	sar	ax, 4
	mov	dx, ax
	mov	bx, si
	shl	bx, 2
	mov	ax, [di+curvebullet_trail_t.node_pos[bx]+x]
	sar	ax, 4
	@@clip	@@node_next

@@node_render:
	mov	bx, [bp+@@trail_sprite]
	call	@curvebullet_put

@@node_next:
	; Yes, we only render every second node! You only start to notice jagged
	; edges and gaps between the nodes once their speed exceeds roughly 11
	; pixels per second, which never happens during regular gameplay.
	; https://rec98.nmlgc.net/blog/2020-02-29 has a demo video of how this
	; optimization would look at higher speeds.
	sub	si, 2

@@nodes_more?:
	or	si, si
	jg	short @@node_loop
	mov	bx, [bp+@@head]
	mov	ax, [bx+curvebullet_head_t.pos.cur.y]
	sar	ax, 4
	mov	dx, ax
	mov	ax, [bx+curvebullet_head_t.pos.cur.x]
	sar	ax, 4
	@@clip	@@bullet_next

@@head_render:
	mov	bx, [bp+@@head]
	mov	bx, [bx+curvebullet_head_t.CBH_sprite]
	call	@curvebullet_put

@@bullet_next:
	inc	[bp+@@bullet_i]
	add	[bp+@@head], size curvebullet_head_t
	add	di, size curvebullet_trail_t

@@bullets_more?:
	cmp	[bp+@@bullet_i], 1 + CURVEBULLET_COUNT
	jl	@@bullet_loop
	pop	di
	pop	si
	leave
	retn
curvebullets_render	endp
