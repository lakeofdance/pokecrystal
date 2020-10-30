BattleCommand_VenomDrench:
; venomdrench

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	bit PSN, a
	jr z, .fail

; lower opponent's Attack, Special Attack, and Speed.
	ld a, $1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	call BattleCommand_AttackDown
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SpecialAttackDown
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SpeedDown
	jp BattleCommand_StatDownMessage

.fail
	call AnimateFailedMove
	jp PrintNothingHappened