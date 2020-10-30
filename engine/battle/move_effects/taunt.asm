BattleCommand_Taunt:
; taunt

	ld a, [wAttackMissed]
	and a
	jp nz, .failed

	ld de, wEnemyTauntCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wPlayerTauntCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TAUNTED, [hl]
	jp nz, .failed
	set SUBSTATUS_TAUNTED, [hl]
	ld a, $5
	ld [de], a
	farcall AnimateCurrentMove
	ld hl, WasTauntedText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farcall PrintDidntAffect2
	ret