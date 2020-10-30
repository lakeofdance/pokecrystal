BattleCommand_Soak:
; soak
	ld a, [wAttackMissed]
	and a
	jr nz, .evaded
	farcall CheckSubstituteOpp
	jr nz, .evaded

	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok

	ld a, [de]
	cp WATER
	jr nz, .notPureWater
	inc de
	ld a, [de]
	dec de
	cp WATER
	jr nz, .notPureWater
	farcall AnimateFailedMove
	farcall PrintDoesntAffect
	ret

.notPureWater
	ld a, WATER
	ld [de], a
	inc de
	ld [de], a
	farcall AnimateCurrentMove
; Target was soaked!
	ld hl, WasSoakedText
	jp StdBattleTextbox

.evaded
	farcall AnimateFailedMove
	ld hl, EvadedText
	jp StdBattleTextbox
