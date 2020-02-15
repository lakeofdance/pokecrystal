KnowsMove:
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld d, a
	ld a, [wPutativeTMHMMove + 1]
	ld e, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	sub d
	ld b, a
	ld a, [hli]
	cp e
	or b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .Text_knows
	call PrintText
	scf
	ret

.Text_knows:
	; knows @ .
	text_far UnknownText_0x1c5ea8
	text_end
