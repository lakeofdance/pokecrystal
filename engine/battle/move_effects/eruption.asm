EruptionEffect:
; returns move power in b
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
;hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
;max hp
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
.loop
; we want 8-bit hp values
; the ratio of HP to MAX HP is (almost) preserved
	ld a, d
	and a
	jr z, .multiply
	srl b
	rr c
	srl d
	rr e
	jr .loop

.multiply
	ld a, e
	ldh [hDivisor], a
; multiply bc by base power
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld hl, 0
	call AddNTimes
.divide
; divide hl by e
	ld a, h
	ldh [hDividend], a
	ld a, l
	ldh [hDividend+ 1], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	and a
	ret nz
	inc b
	ret
