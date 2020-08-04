BattleCommand_BurnUp:
; burn up

	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, [hli]
	cp FIRE
	jr z, .burn
	ld a, [hl]
	cp FIRE
	jr z, .burn
;fail here
	farcall AnimateFailedMove
	farcall TryPrintButItFailed
	farcall EndMoveEffect
	ret

.burn
	ld a, [hld]
	cp FIRE
	jr nz, .secondary_type
	ld a, [hli]
	cp FIRE
	jr nz, .secondary_type
	ld a, CURSE_T
	ld [hld], a

.secondary_type
	ld [hl], a
	ret

BattleCommand_BurnUpText:
; User burnt itself out!

	ld a, [wAttackMissed]
	and a
	ret nz

	ld hl, BurntOutText
	call StdBattleTextbox
	ret

