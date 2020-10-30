BattleCommand_Memento:
; memento
	ld a, [wAttackMissed]
	and a
	jr nz, .fail

; fails in mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ld a, 2
	jr nz, .fail

	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wPlayerStatLevels
.go

; can attack be lowered?
	ld a, [hli]
	dec a
	jr nz, .lower

; can special attack be lowered?
	inc hl
	inc hl
	ld a, [hl]
	dec a
	jr nz, .lower	

; can't lower either stat.
	ld a, 1
	ld [wAttackMissed], a
	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontDropAnymoreText
	jp StdBattleTextbox

.lower
; lower opponent's Attack and Special Attack 2 stages.
	ld a, $1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	call BattleCommand_AttackDown2
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SpecialAttackDown2
	jp BattleCommand_StatDownMessage

.fail
	call AnimateFailedMove
	jp PrintButItFailed
