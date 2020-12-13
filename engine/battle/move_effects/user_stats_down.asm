UserStatsDownMoves:
; moves which drop the users stats after hitting
	dw SCALE_CLANG,     ClangingScalesEffect
	dw H_SPACE_FURY,    HyperspaceFuryEffect
	dw DRACO_METEOR,    DracoMeteorEffect
	dw OVERHEAT,        OverheatEffect
	dw LEAF_STORM,      LeafStormEffect
	dw PSYCHO_BOOST,    PsychoBoostEffect
	dw FLEUR_CANNON,    FleurCannonEffect
	dw CLOSE_COMBAT,    CloseCombatEffect
	dw DRAGONASCENT,    DragonAscentEffect
	dw HAMMER_ARM,      HammerArmEffect
	dw SUPERPOWER,      SuperpowerEffect
	dw ICE_HAMMER,      IceHammerEffect
	dw V_CREATE,        VCreateEffect
	db -1

BattleCommand_UserStatsDown:
; userstatsdown

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld hl, UserStatsDownMoves
	ld e, 3
	call IsWordInArray
	ret nc
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	jp CalcPlayerStats
.enemy
	jp CalcEnemyStats

DracoMeteorEffect:
OverheatEffect:
LeafStormEffect:
PsychoBoostEffect:
FleurCannonEffect:
	call LowerSpecialAttackStat2
	jr StatDownMessage

VCreateEffect:
	call LowerSpeedStat
	call StatDownMessage
;fallthrough

CloseCombatEffect:
DragonAscentEffect:
OctolockEffect: ; called in battle/core
	call LowerDefenseStat
	call StatDownMessage
	call LowerSpecialDefenseStat
	jr StatDownMessage

HammerArmEffect:
IceHammerEffect:
	call LowerSpeedStat
	jr StatDownMessage

SuperpowerEffect:
	call LowerAttackStat
	call StatDownMessage
; fallthrough

ClangingScalesEffect:
HyperspaceFuryEffect:
	call LowerDefenseStat
; fallthrough

StatDownMessage:
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	jp BattleCommand_SwitchTurn
