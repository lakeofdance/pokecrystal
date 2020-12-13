BattleCommand_Snatch:
; snatch

	farcall CheckOpponentWentFirst
	jr nz, .fail

	ld hl, wCurEnemyMove
	ldh a, [hBattleTurn]
	and a
	jr z, .check_opponent_move
	ld hl, wCurPlayerMove
.check_opponent_move
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	or c
	jr z, .fail
	farcall IsMoveStatus
	jr z, .fail
	ld a, BATTLE_VARS_SUBSTATUS6_OPP
	call GetBattleVarAddr
	set SUBSTATUS_SNATCH, [hl]
	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	res SUBSTATUS_SNATCH, [hl]
	farcall AnimateCurrentMove
	ld hl, SnatchEffectText
	jp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret
