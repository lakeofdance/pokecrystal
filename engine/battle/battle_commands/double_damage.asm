BattleCommand_DoubleDamage:
;doubledamage
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DOUBLE_IF_FIRST
	jr z, .DoubleDamageIfFirst
	cp EFFECT_FACADE
	jr z, .FacadeEffect
	cp EFFECT_HEX
	jr z, .HexEffect
	cp EFFECT_VENOSHOCK
	jr z, .VenoshockEffect
	cp EFFECT_PURSUIT
	jr z, BattleCommand_Pursuit
	cp EFFECT_WAKE_UP_SLAP
	jr z, .WakeUpSlapEffect
	cp EFFECT_BUG_BITE
	jr z, .BugBiteEffect
	ret

.DoubleDamageIfFirst:
; whose turn? 0 if player, 1 if enemy
	ldh a, [hBattleTurn]
	and a
; who went first? 0 if player, 1 if enemy.
	ld hl, wEnemyGoesFirst
	cp [hl]
	ret nz
	jp DoubleDamage2

.FacadeEffect:
; doubles damage if the user is poisoned, burned, or paralysed
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << PSN | BRN | PAR
	ret z
	call DoubleDamage2
; facade ignores the attack drop from burn
	and 1 << BRN
	jp nz, DoubleDamage2
	ret

.HexEffect:
; doubles damage if the opponent is statused
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jp nz, DoubleDamage2
	ret

.VenoshockEffect:
; doubles damage if the opponent is poisoned
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << PSN
	jp nz, DoubleDamage2
	ret

.WakeUpSlapEffect:
; doubles damage if the opponent is sleeping
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and $7	; 00000111
	ret z
	jr DoubleDamage2

.BugBiteEffect:
; doubles damage if the opponent is holding a berry
	call CheckOpponentBerry
	ret nc
	jr DoubleDamage2

BattleCommand_Pursuit:
; pursuit
; Double damage if the opponent is switching
; or using a turning move.

	ld hl, wEnemyIsSwitching
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerIsSwitching
.ok
	ld a, [hl]
	and a
	ret z
;fallthrough

DoubleDamage2:
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc

	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret
