BattleCommand_Counter:
; counter

	ld a, 1
	ld [wAttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z

	farcall BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z

	farcall CheckOpponentWentFirst
	ret z

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld c, a
	inc hl
	ld a, [hl]
	ld b, a
	dec bc
	ld de, wStringBuffer1
	farcall GetMoveData

	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	ret z

	ld a, [wStringBuffer1 + MOVE_TYPE]
	cp SPECIAL
	ret nc

	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	jr z, .failed

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [wAttackMissed], a
	ret

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret
