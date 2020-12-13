MoveRecoilDamage:
; defined in constants/move_effect_constants.asm
; used in engine/battle/battle_commands/recoil.asm
	; move, damage
	dwb BRAVE_BIRD,   RECOIL_30
	dwb DOUBLE_EDGE,  RECOIL_25
	dwb FLARE_BLITZ,  RECOIL_30
	dwb HEAD_CHARGE,  RECOIL_25
	dwb HEAD_SMASH,   RECOIL_50
	dwb STRUGGLE,     RECOIL_25
	dwb SUBMISSION,   RECOIL_25
	dwb TAKE_DOWN,    RECOIL_25
	dwb WILD_CHARGE,  RECOIL_25
	dwb WOOD_HAMMER,  RECOIL_30
	db -1
