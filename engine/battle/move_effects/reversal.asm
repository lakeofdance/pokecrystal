ReversalEffect:
; returns move power in [hl]
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .reversal_got_hp
	ld hl, wEnemyMonHP
.reversal_got_hp
	xor a
	ldh [hDividend], a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply
; we shall divide by the lower byte of max hp.
; if the upper byte is zero, we can go straight there.
; otherwise we need to do some pre-emptive division.
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a
	jr z, .skip_to_divide

; Weird.. this is hDividend, which was prev set to 0
	ldh a, [hProduct + 4]
; max hp is 999. divide by 4 to get an 8-bit integer.
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
; Now divide the value we have for hp*48 by 4
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a

.skip_to_divide
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
; we have ended up with a number between 0 and 64
; representing how many pixels (out of 64) of the hp bar are filled
	ld b, a
	ld hl, FlailReversalPower

.reversal_loop
	ld a, [hli]
	cp b
	ret nc
	inc hl
	jr .reversal_loop
