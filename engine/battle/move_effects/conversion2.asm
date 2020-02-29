BattleCommand_Conversion2:
; conversion2

	ld a, [wAttackMissed]
	and a
	jp nz, .failed
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	dec bc
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr2
	ld d, a
	pop hl
	cp CURSE_T
	jr z, .failed
	push hl
	farcall AnimateCurrentMove
	farcall BattleCommand_SwitchTurn
	pop hl

.loop
	call BattleRandom
	maskbits NUM_TYPES
	cp UNUSED_TYPES
	jr c, .okay
	cp UNUSED_TYPES_END
	jr c, .loop
	cp TYPES_END
	jr nc, .loop
.okay
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	push af
	push hl
	ld a, d
	ld [hl], a
	farcall BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop
	push hl
	farcall BattleCommand_SwitchTurn
	pop hl

	ld a, [hl]		;
	ld [wNamedObjectIndexBuffer], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jp StdBattleTextbox

.failed
	farcall FailMove
	ret
