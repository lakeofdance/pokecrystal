ElectroBallEffect:
; returns move power in [hl]
	ld hl, wEnemyMonSpeed
	ld de, wBattleMonSpeed
	ldh a, [hBattleTurn]
	and a
	jr z, .got_speed
	ld hl, wBattleMonSpeed
	ld de, wEnemyMonSpeed
.got_speed
;target speed
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
;user speed
	ld h, d
	ld l, e
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
.loop
; we want 8-bit speed values
; the ratio of target speed to user speed is (almost) preserved
	ld a, d
	or b
	jr z, .get_ratio
	srl b
	rr c
	srl d
	rr e
	jr .loop

.get_ratio
	ld a, e
; if a < c, we want the min power
	ld b, 0
	cp c
	jr c, .skip_divide
; divide a by c, that is, user speed by target speed
	call SimpleDivide
.skip_divide
	ld hl, ElectroBallPower - 1
.loop2
	inc hl
	ld a, [hli]
	ld c, a
	ld a, b
	cp c
	jr c, .loop2
	ret
