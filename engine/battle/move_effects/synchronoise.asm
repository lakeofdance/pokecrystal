BattleCommand_Synchronoise:
; synchronoise

	ld hl, wBattleMonType1
	ld de, wEnemyMonType1
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	ld a, [hli]
	cp b
	ret z
	cp c
	ret z
	ld a, [hl]
	cp b
	ret z
	cp c
	ret z
;fail here
	farcall AnimateFailedMove
	farcall TryPrintButItFailed
	farcall EndMoveEffect
	ret
