PunishmentEffect:
; returns move power in b
; base power is 60 + 20 * max(#opponents pos stat boosts, 7)
	ld b, NUM_LEVEL_STATS
	ld c, 0
	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .loop
	ld hl, wPlayerStatLevels
.loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	jr nc, .save
	xor a
.save
	add c
	ld c, a
	dec b
	jr nz, .loop

	ld b, 200 ;max
	ld a, c
	cp 8
	ret nc
	ld c, 20
	call SimpleMultiply	; returns a * c in a
	add 60
	ld b, a
	ret
