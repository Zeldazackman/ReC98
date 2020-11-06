/* ReC98
 * -----
 * Macros to help decompiling the seemingly impossible
 */

// Flag comparisons
// ----------------
// When used inside a conditional expression like
//	if(FLAGS_*) { goto some_label; | return; }
// these assemble into the single given instruction. Apply the ! operator to
// get the N versions.
#define FLAGS_ZERO (_FLAGS & 0x40) /* JZ */
#define FLAGS_SIGN (_FLAGS & 0x80) /* JS */
// ----------------

// Alternate version that doesn't spill the port number to DX
#define outportb2(port, val) __asm { \
	mov al, val; \
	out port, al; \
}

// Alternate version that sets the value first
#define outport2(port, val) __asm { \
	mov ax, val; \
	mov dx, port; \
	out dx, ax; \
}

// Versions that actually inline with pseudoregisters
#define pokew(sgm, off, val) { *(uint16_t far *)(MK_FP(sgm, off)) = val; }
