BattleCommand_StoredPower:
; storedpower
; multiplies damage by c = 1 + the no. of pos stat boosts
; 0 < c < 44
	ld b, NUM_LEVEL_STATS
	ld c, 1
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .gotem
	ld hl, wEnemyStatLevels
.gotem
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
	ld a, c
	ldh [hMultiplier], a
	ld hl, wCurDamage
	xor a
	ldh [hMultiplicand], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	call Multiply
	ldh a, [hProduct + 1]
	and a
	jr nz, .max_damage
	ldh a, [hProduct + 3]
	ld [hld], a
	ldh a, [hProduct + 2]
	ld [hl], a
	ret

.max_damage
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret
