GyroBallEffect:
; returns move power in b
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
	jr z, .multiply
	srl b
	rr c
	srl d
	rr e
	jr .loop

.multiply
	ld a, e
	ldh [hDivisor], a
; multiply bc by 25
	ld a, 25
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
; if the result is 16-bit, it's definitely larger than 150
	ldh a, [hQuotient + 2]
	and a
	jr nz, .cap
; otherwise it's 8-bit
	ldh a, [hQuotient + 3]
; add 1
	inc a
	ld b, a
; cap power at 150
	cp 150
	ret c
.cap
	ld b, 150
	ret
