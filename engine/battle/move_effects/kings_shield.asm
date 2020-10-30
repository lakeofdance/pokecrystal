BattleCommand_KingsShield:
; kingsshield

; shares code with Protect.

	call ProtectChance
	ret c

	ld a, BATTLE_VARS_SUBSTATUS6
	call GetBattleVarAddr
	set SUBSTATUS_KINGS_SHIELD, [hl]

	farcall AnimateCurrentMove

	ld hl, ProtectedItselfText
	jp StdBattleTextbox
