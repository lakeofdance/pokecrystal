MultiBoostMoves:
	dw QUIVER_DANCE, QuiverDanceEffect
	dw DRAGON_DANCE, DragonDanceEffect
	dw GEOMANCY,     GeomancyEffect
	dw BULK_UP,      BulkUpEffect
	dw SHELL_SMASH,  ShellSmashEffect
	dw WORK_UP,      WorkUpEffect
	dw SHIFT_GEAR,   ShiftGearEffect
	dw CALM_MIND,    CalmMindEffect
	dw COSMIC_POWER, CosmicPowerEffect
	dw COIL,         CoilEffect
	dw DEFEND_ORDER, DefendOrderEffect
	dw HONE_CLAWS,   HoneClawsEffect
	db -1

BattleCommand_MultipleStatsUp:
; multiplestatsup

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld hl, MultiBoostMoves
	ld e, 3
	call IsWordInArray
	ret nc
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels
.go
	jp hl


CantRaise:
; Can't raise any stat.
	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox

QuiverDanceEffect:
; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise

.raise
; Raise Speed, Special Attack, and Special Defense.

	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp BattleCommand_StatUpMessage

DragonDanceEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack and Speed.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpeedUp
	jp BattleCommand_StatUpMessage

GeomancyEffect:
; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise

.raise
; Sharply raise Speed, Special Attack, and Special Defense.

	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_SpeedUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp2
	jp BattleCommand_StatUpMessage

BulkUpEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack and Defense.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

ShellSmashEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

.raise
; Sharply raise Attack, Speed, and Special Attack
; Sharply drop Defense and Special Defense

	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpeedUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
	call BattleCommand_StatUpMessage
	call LowerDefenseStat2
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call BattleCommand_SwitchTurn
	call LowerSpecialDefenseStat2
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	jp BattleCommand_SwitchTurn

WorkUpEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Special Attack
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack and Special Attack.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	jp BattleCommand_StatUpMessage

ShiftGearEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Speed
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack and sharply raise Speed.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpeedUp2
	jp BattleCommand_StatUpMessage

CalmMindEffect:
; Special Attack
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise

.raise
; Raise Special Attack and Special Defense.

	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp BattleCommand_StatUpMessage

CosmicPowerEffect:
DefendOrderEffect:
; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Special Defense
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Defense and Special Defense.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp BattleCommand_StatUpMessage

CoilEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Accuracy
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack, Defense, and Accuracy.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_AccuracyUp
	jp BattleCommand_StatUpMessage

HoneClawsEffect:
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Accuracy
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jp nc, CantRaise
.raise
; Raise Attack and Accuracy.
	ld a, 1
	ld [wKickCounter], a
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_AccuracyUp
	jp BattleCommand_StatUpMessage
