; AIDamageCalc uses BattleCommand_ConstantDamage
; to calculate damage for these instead of
; BattleCommand_DamageCalc and BattleCommand_Stab.

ConstantDamageEffects:
	db EFFECT_SUPER_FANG
	db EFFECT_STATIC_DAMAGE
	db EFFECT_LEVEL_DAMAGE
	db EFFECT_PSYWAVE
	db -1 ; end

; AIDamageCalc uses BattleCommand_VariableDamage
; to calculate damage for these instead of
; BattleCommand_DamageCalc

VariableDamageEffects:
	db EFFECT_REVERSAL
	db EFFECT_TRUMP_CARD
	db EFFECT_ERUPTION
	db EFFECT_GYRO_BALL
	db EFFECT_STORED_POWER
	db EFFECT_CRUSH_GRIP
	db EFFECT_ELECTRO_BALL
	db -1 ; end
