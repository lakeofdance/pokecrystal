BattleCommand_ReflectType:
; reflecttype
; fail if opponent flying or underground
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr nz, .evaded

	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
	ld de, wEnemyMonType1
.ok
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a	
	farcall AnimateCurrentMove
; Target was soaked!
	ld hl, ReflectTypeText
	jp StdBattleTextbox

.evaded
	farcall AnimateFailedMove
	ld hl, EvadedText
	jp StdBattleTextbox
