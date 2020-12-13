BattleCommand_Purify:
; purify

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr z, .fail
	xor a
	ld [hl], a

	call AnimateCurrentMove
	ld hl, CuredOppStatusText
	call StdBattleTextbox

	call RestoreHalfHP

	ldh a, [hBattleTurn]
	and a
	jp z, .enemy
	jp CalcPlayerStats
.enemy
	jp CalcEnemyStats

.fail
	call AnimateFailedMove
	jp PrintButItFailed

RestoreHalfHP:
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	push hl
	push de
	ld c, 2
	call CompareBytes
	pop de
	pop hl
	ret z

	ld hl, GetHalfMaxHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextbox
