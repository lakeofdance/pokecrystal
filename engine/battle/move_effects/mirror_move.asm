BattleCommand_MirrorMove:
; mirrormove

	farcall ClearLastMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr

	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld c, a
	inc hl
	ld a, [hl]
	ld b, a
	pop hl
	ld a, c
	and a
	jr z, .failed

	call CheckUserMove
	jr nz, .use

.failed
	farcall AnimateFailedMove

	ld hl, MirrorMoveFailedText
	call StdBattleTextbox
	farcall EndMoveEffect
	ret

.use
	ld a, c
	ld [hli], a
	ld [wNamedObjectIndexBuffer], a
	ld a, b
	ld [hl], a
	ld [wNamedObjectIndexBuffer + 1], a

	push bc
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l
	pop bc

	dec bc
	farcall GetMoveData
	call GetMoveName
	call CopyName1
	farcall CheckUserIsCharging
	jr nz, .done

	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a

.done
	farcall BattleCommand_MoveDelay
	farcall ResetTurn
	ret
