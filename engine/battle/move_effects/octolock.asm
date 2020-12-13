BattleCommand_Octolock:
; octolock
	ld a, [wAttackMissed]
	and a
	jr nz, .fail

	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	bit SUBSTATUS_OCTOLOCK, [hl]
	jr nz, .fail
	set SUBSTATUS_OCTOLOCK, [hl]
	jr BattleCommand_ArenaTrap

.fail
	call AnimateFailedMove
	jp PrintButItFailed
