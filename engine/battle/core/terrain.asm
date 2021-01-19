IsOpponentAffectedByTerrain:
; returns nz if the opponent is affected by terrain
	; check grounded
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_GROUNDED, a
	ret nz

	; flying or underground
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_UNDERGROUND | 1 << SUBSTATUS_FLYING
	jr nz, .not_affected

	; vanished
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_VANISHED, a
	jr nz, .not_affected

	; check flying type
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonType1
.ok
	ld a, [hli]
	cp FLYING
	ret z
	ld a, [hl]
	cp FLYING
	ret

.not_affected
	xor a
	ret

IsUserAffectedByTerrain:
; returns nz if the user is affected by terrain
	; check grounded
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVar
	bit SUBSTATUS_GROUNDED, a
	ret nz

	; flying or underground
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_UNDERGROUND | 1 << SUBSTATUS_FLYING
	jr nz, .not_affected

	; vanished
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_VANISHED, a
	jr nz, .not_affected

	; check flying type
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonType1
.ok
	ld a, [hli]
	cp FLYING
	ret z
	ld a, [hl]
	cp FLYING
	ret

.not_affected
	xor a
	ret
