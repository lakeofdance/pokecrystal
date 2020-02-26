CompareMove:
; compares the 2 bytes in bc to those pointed to by hl and hl + 1
; bc is big endian
; hl points to a little endian word
; returns z if equal
; preserves hl and bc
	push hl
	push bc
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hl]
	sub b
	or c
	pop bc
	pop hl
	ret
