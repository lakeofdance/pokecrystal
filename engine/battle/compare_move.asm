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

IsMoveInArray:
; take move bc and searches for it in array hl, with skip e
; returns z if found
	call IsWordInArray
	jr nc, .notfound
	xor a
	ret
.notfound
	ld a, 1
	and a
	ret

CompareSpecies:
; Return z if the attacking mon matches the (big endian) species in bc
	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr
	ld a, [hli]
	ld l, [hl]
	ld h, a

	ldh a, [hBattleTurn]
	and a
	jr z, .CompareSpecies
	ld a, [wTempEnemyMonSpecies]
	ld h, a
	ld a, [wTempEnemyMonSpecies + 1]
	ld l, a

.CompareSpecies:
	ld a, l
	sub b
	ld b, a
	ld a, c
	sub h
	or b
	pop hl
	ret
