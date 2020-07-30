BattleCommand_CheckFutureSight:
; checkfuturesight

	ld hl, wPlayerFutureSightCount
	ld de, wPlayerFutureSightDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyFutureSightCount
	ld de, wEnemyFutureSightDamage
.ok

	ld a, [hl]
	and a
	ret z
	cp 1
	ret nz

	ld [hl], 0
	ld a, [de]
	inc de
	ld [wCurDamage], a
	ld a, [de]
	ld [wCurDamage + 1], a
	ld b, futuresight_command
	farcall SkipToBattleCommand
	ret

BattleCommand_FutureSight:
; futuresight

	farcall CheckUserIsCharging
	jr nz, .AlreadyChargingFutureSight
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld b, a
	inc hl
	ld a, [hl]
	ld c, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	inc hl
	ld [hl], c
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
	inc hl
	ld [hl], c
.AlreadyChargingFutureSight:
	ld hl, wPlayerFutureSightCount
	ldh a, [hBattleTurn]
	and a
	jr z, .GotFutureSightCount
	ld hl, wEnemyFutureSightCount
.GotFutureSightCount:
	ld a, [hl]
	and a
	jr nz, .failed
	ld a, 4
	ld [hl], a
	farcall BattleCommand_LowerSub
	farcall BattleCommand_MoveDelay
	ld hl, ForesawAttackText
	call StdBattleTextbox
	farcall BattleCommand_RaiseSub
	ld de, wPlayerFutureSightDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .StoreDamage
	ld de, wEnemyFutureSightDamage
.StoreDamage:
	ld hl, wCurDamage
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	inc hl
	inc de
	ld a, [hl]
	ld [de], a
	ld [hl], 0
	farcall EndMoveEffect
	ret

.failed
	pop bc
	call ResetDamage
	farcall AnimateFailedMove
	farcall PrintButItFailed
	farcall EndMoveEffect
	ret
