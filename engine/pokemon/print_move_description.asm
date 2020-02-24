PrintMoveDesc:
	push hl
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	ld c, a
	ld a, [wCurSpecies + 1]
	ld b, a
	dec bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString
