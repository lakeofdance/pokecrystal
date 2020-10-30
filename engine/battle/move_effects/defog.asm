BattleCommand_Defog:
; defog
; fail if we cannot hit the opponent
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
; otherwise succeed
	farcall AnimateCurrentMove
; lower evasion: fails in mist
	farcall BattleCommand_EvasionDown
; clear opponent's mist
	call DefogMist
; clear opponent's screens
	call ClearOpponentScreens
; clear opponent's safeguard
	call DefogSafeguard
; clear all spikes, toxic spikes, and rocks
	ld b, 0
	ld hl, wPlayerScreens2
	call DefogHazards
	ld hl, wEnemyScreens2
	call DefogHazards
; b is non-zero if any hazards were removed
	ld a, b
	and a
	ret z
	ld hl, BlewHazardsText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	ld hl, ButItFailedText
	jp StdBattleTextbox

DefogMist:
; remove opponent's mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_MIST, [hl]
	ret z
	res SUBSTATUS_MIST, [hl]
	ld hl, TargetsMistDissapated
	jp StdBattleTextbox

DefogSafeguard:
; remove opponent's safeguard
	ld hl, wPlayerScreens
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_screens_pointer
	ld hl, wEnemyScreens
.got_screens_pointer
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	res SCREENS_SAFEGUARD, [hl]
	ld hl, BattleText_TargetSafeguardFaded
	jp StdBattleTextbox

DefogHazards:
; spikes
	bit SCREENS_SPIKES_1, [hl]
	jr nz, .spikes
	bit SCREENS_SPIKES_2, [hl]
	jr z, .no_spikes
.spikes
	res SCREENS_SPIKES_1, [hl]
	res SCREENS_SPIKES_2, [hl]
	inc b
.no_spikes
; rocks
	bit SCREENS_STEALTH_ROCKS, [hl]
	jr z, .no_rocks
	res SCREENS_STEALTH_ROCKS, [hl]
	inc b
.no_rocks
; toxic spikes
	bit SCREENS_TOXIC_SPIKES_1, [hl]
	jr z, .no_t_spikes
	res SCREENS_TOXIC_SPIKES_1, [hl]
	res SCREENS_TOXIC_SPIKES_2, [hl]
	inc b
.no_t_spikes
; webs
	bit SCREENS_STICKY_WEB, [hl]
	ret z
	res SCREENS_STICKY_WEB, [hl]
	inc b
	ret
