BattleCommand_VariableDamage:
; variabledamage
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_REVERSAL
	jp z, .reversal

	cp EFFECT_TRUMP_CARD
	jp z, .trump_card

	cp EFFECT_ERUPTION
	jr z, .eruption

	cp EFFECT_GYRO_BALL
	jr z, .gyro_ball

	cp EFFECT_STORED_POWER
	jr z, .stored_power

	cp EFFECT_CRUSH_GRIP
	jr z, .crush_grip

	cp EFFECT_ELECTRO_BALL
	jr z, .electro_ball

	cp EFFECT_PUNISHMENT
	jr z, .punishment

; we shouldn't ever be here
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	jr .calc_damage

.reversal
	call ReversalEffect
	jr .extract_power

.trump_card
	call TrumpCardEffect
	jr .extract_power

.eruption
	call EruptionEffect
	jr .calc_damage

.gyro_ball
	call GyroBallEffect
	jr .calc_damage

.stored_power
; variation is done after the damage calc, because stored power
; can have a base power greater than 255
	ld b, 20
	jr .calc_damage

.crush_grip
	call SwitchTurn
	call EruptionEffect
	call SwitchTurn
	jr .calc_damage

.punishment
	call PunishmentEffect
	jr .calc_damage

.electro_ball
	call ElectroBallEffect
;fallthrough

.extract_power
	ld b, [hl]
.calc_damage
	ldh a, [hBattleTurn]
	and a
	ld a, b
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	callfar PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	callfar EnemyAttackDamage

.notEnemysTurn
	callfar BattleCommand_DamageCalc
	pop hl
	ld [hl], 1
	ret

INCLUDE "data/moves/variable_power.asm"

INCLUDE "engine/battle/move_effects/reversal.asm"

INCLUDE "engine/battle/move_effects/trump_card.asm"

INCLUDE "engine/battle/move_effects/eruption.asm"

INCLUDE "engine/battle/move_effects/gyro_ball.asm"

INCLUDE "engine/battle/move_effects/stored_power.asm"

INCLUDE "engine/battle/move_effects/electro_ball.asm"

INCLUDE "engine/battle/move_effects/punishment.asm"
