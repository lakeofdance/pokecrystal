CompareBytes::
; Compare c bytes at de and hl.
; Return z if they all match.
; c if bytes at de < bytes at hl
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

CompareBytesLong::
; Compare bc bytes at de and hl.
; Return carry if they all match.
.loop
	ld a, [de]
	cp [hl]
	jr nz, .diff

	inc de
	inc hl
	dec bc

	ld a, b
	or c
	jr nz, .loop

	scf
	ret

.diff:
	and a
	ret

CompareMove::
; compares the 2 bytes in bc to those pointed to by hl and hl + 1
; bc is big endian
; hl points to a little endian word
; returns z if equal, c if hl < bc
; preserves hl and bc
	inc hl
	ld a, [hld]
	cp b
	ret nz
	ld a, [hl]
	cp c
	ret
