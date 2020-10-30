TrumpCardEffect:
; returns move power in [hl]
; at this point, 1PP has already been consumed
	ld hl, wBattleMonPP
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay
	ld hl, wEnemyMonPP
	ld a, [wCurEnemyMoveNum]
.okay
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld b, a
	ld hl, TrumpCardPower - 1
.trumpcardloop
	inc hl
	ld a, [hli]
	cp b
	ret c
	jr nz, .trumpcardloop
	ret
