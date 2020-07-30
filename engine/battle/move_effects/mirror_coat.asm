BattleCommand_MirrorCoat:
; mirrorcoat

	ld a, 1
	ld [wAttackMissed], a

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld c, a
	and a
	ret z
	inc hl
	ld a, [hl]
	ld b, a

	callfar GetMoveEffect
	ld a, b
	cp EFFECT_MIRROR_COAT
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
	and a
	inc hl
	ld a, [hl]
	dec bc
	ld de, wStringBuffer1
	farcall GetMoveData

	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	ret z

	ld a, [wStringBuffer1 + MOVE_TYPE]
	cp SPECIAL
	ret c

	; BUG: Move should fail with all non-damaging battle actions
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	ret z

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
