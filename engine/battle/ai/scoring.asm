AIScoring: ; used only for BANK(AIScoring)

AI_Basic:
; Don't do anything redundant:
;  -Using status-only moves if the player can't be statused
;  -Using moves that fail if they've already been used

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push bc
	ld a, [de]
	ld b, a
	call AIGetEnemyMove
	pop bc
	inc de

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a

; Dismiss moves with special effects if they are
; useless or not a good choice right now.
; For example, healing moves, weather moves, Dream Eater...
	push hl
	push de
	push bc
	farcall AI_Redundant
	pop bc
	pop de
	pop hl
	jr nz, .discourage

	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	ld b, a
	ld a, [wEnemyMoveStruct + MOVE_ANIM2]
	ld c, a
	farcall AI_Redundant_Moves
	pop bc
	pop de
	pop hl
	jr nz, .discourage

; Dismiss status-only moves if the player can't be statused.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, StatusOnlyEffects
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	ld a, [wBattleMonStatus]
	and a
	jr nz, .discourage

; Dismiss Safeguard if it's already active.
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr z, .checkmove

.discourage
	call AIDismissMove
	jr .checkmove

INCLUDE "data/battle/ai/status_only_effects.asm"


AI_Setup:
; Use stat-modifying moves on turn 1.

; 50% chance to greatly encourage stat-up moves during the first turn of enemy's Pokemon.
; 50% chance to greatly encourage stat-down moves during the first turn of player's Pokemon.
; Almost 90% chance to greatly discourage stat-modifying moves otherwise.

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push bc
	ld a, [de]
	ld b, a
	call AIGetEnemyMove
	pop bc
	inc de


	ld a, [wEnemyMoveStruct + MOVE_EFFECT]

	cp EFFECT_ATTACK_UP
	jr c, .checkmove
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .checkmove
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .checkmove

.statup
	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .discourage

	jr .encourage

.statdown
	ld a, [wPlayerTurnsTaken]
	and a
	jr nz, .discourage

.encourage
	call AI_50_50
	jr c, .checkmove

	dec [hl]
	dec [hl]
	jr .checkmove

.discourage
	call Random
	cp 12 percent
	jr c, .checkmove
	inc [hl]
	inc [hl]
	jr .checkmove


AI_Types:
; Dismiss any move that the player is immune to.
; Encourage super-effective moves.
; Discourage not very effective moves unless
; all damaging moves are of the same type.

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push bc
	ld a, [de]
	ld b, a
	call AIGetEnemyMove
	pop bc
	inc de


	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr z, .immune
	cp EFFECTIVE
	jr z, .checkmove
	jr c, .noteffective

; effective
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove
	dec [hl]
	jr .checkmove

.noteffective
; Discourage this move if there are any moves
; that do damage of a different type.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	ld d, a
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES + 1
	ld c, 0
.checkmove2
	dec b
	jr z, .asm_38693

	ld a, [hli]
	ld e, a
	ld a, [hld]
	or e
	jr z, .asm_38693

	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call AIGetEnemyMove
	pop bc
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	cp d
	jr z, .checkmove2
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .asm_38692
	jr .checkmove2

.asm_38692
	ld c, a
.asm_38693
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .checkmove
	inc [hl]
	jr .checkmove

.immune
	call AIDismissMove
	jr .checkmove


AI_Offensive:
; Greatly discourage non-damaging moves.

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push bc
	ld a, [de]
	ld b, a
	call AIGetEnemyMove
	pop bc
	inc de

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .checkmove

	inc [hl]
	inc [hl]
	jr .checkmove


AI_Smart:
; Context-specific scoring.

	ld hl, wBuffer1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push de
	push bc
	push hl
	ld a, [de]
	ld b, a
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, .table_386f2
	ld de, 3
	call IsInArray

	inc hl
	jr c, .found

	ld hl, wEnemyMoveStruct + MOVE_ANIM
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld hl, .smart_move
	ld e, 3
	call IsWordInArray

	inc hl
	jr nc, .nextmove

.found
	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	inc de
	jr .checkmove

.table_386f2
	dbw EFFECT_SLEEP,            AI_Smart_Sleep
	dbw EFFECT_LEECH_HIT,        AI_Smart_LeechHit
	dbw EFFECT_SELFDESTRUCT,     AI_Smart_Selfdestruct
	dbw EFFECT_DREAM_EATER,      AI_Smart_DreamEater
	dbw EFFECT_MIRROR_MOVE,      AI_Smart_MirrorMove
	dbw EFFECT_EVASION_UP,       AI_Smart_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AI_Smart_AlwaysHit
	dbw EFFECT_ACCURACY_DOWN,    AI_Smart_AccuracyDown
	dbw EFFECT_RESET_STATS,      AI_Smart_ResetStats
	dbw EFFECT_BIDE,             AI_Smart_Bide
	dbw EFFECT_FORCE_SWITCH,     AI_Smart_ForceSwitch
	dbw EFFECT_HEAL,             AI_Smart_Heal
	dbw EFFECT_TOXIC,            AI_Smart_Toxic
	dbw EFFECT_LIGHT_SCREEN,     AI_Smart_LightScreen
	dbw EFFECT_OHKO,             AI_Smart_Ohko
	dbw EFFECT_RAZOR_WIND,       AI_Smart_RazorWind
	dbw EFFECT_SUPER_FANG,       AI_Smart_SuperFang
	dbw EFFECT_TRAP_TARGET,      AI_Smart_TrapTarget
	dbw EFFECT_CONFUSE,          AI_Smart_Confuse
	dbw EFFECT_SP_DEF_UP_2,      AI_Smart_SpDefenseUp2
	dbw EFFECT_REFLECT,          AI_Smart_Reflect
	dbw EFFECT_PARALYZE,         AI_Smart_Paralyze
	dbw EFFECT_SPEED_DOWN_HIT,   AI_Smart_SpeedDownHit
	dbw EFFECT_SUBSTITUTE,       AI_Smart_Substitute
	dbw EFFECT_HYPER_BEAM,       AI_Smart_HyperBeam
	dbw EFFECT_RAGE,             AI_Smart_Rage
	dbw EFFECT_MIMIC,            AI_Smart_Mimic
	dbw EFFECT_LEECH_SEED,       AI_Smart_LeechSeed
	dbw EFFECT_DISABLE,          AI_Smart_Disable
	dbw EFFECT_COUNTER,          AI_Smart_Counter
	dbw EFFECT_ENCORE,           AI_Smart_Encore
	dbw EFFECT_PAIN_SPLIT,       AI_Smart_PainSplit
	dbw EFFECT_SNORE,            AI_Smart_Snore
	dbw EFFECT_CONVERSION2,      AI_Smart_Conversion2
	dbw EFFECT_LOCK_ON,          AI_Smart_LockOn
	dbw EFFECT_SLEEP_TALK,       AI_Smart_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AI_Smart_DestinyBond
	dbw EFFECT_REVERSAL,         AI_Smart_Reversal
	dbw EFFECT_SPITE,            AI_Smart_Spite
	dbw EFFECT_HEAL_BELL,        AI_Smart_HealBell
	dbw EFFECT_PRIORITY_HIT,     AI_Smart_PriorityHit
	dbw EFFECT_THIEF,            AI_Smart_Thief
	dbw EFFECT_MEAN_LOOK,        AI_Smart_MeanLook
	dbw EFFECT_NIGHTMARE,        AI_Smart_Nightmare
	dbw EFFECT_DEFROST_BURN_HIT, AI_Smart_Defrost
	dbw EFFECT_CURSE,            AI_Smart_Curse
	dbw EFFECT_PROTECT,          AI_Smart_Protect
	dbw EFFECT_FORESIGHT,        AI_Smart_Foresight
	dbw EFFECT_PERISH_SONG,      AI_Smart_PerishSong
	dbw EFFECT_SANDSTORM,        AI_Smart_Sandstorm
	dbw EFFECT_ENDURE,           AI_Smart_Endure
	dbw EFFECT_ROLLOUT,          AI_Smart_Rollout
	dbw EFFECT_SWAGGER,          AI_Smart_Swagger
	dbw EFFECT_FURY_CUTTER,      AI_Smart_FuryCutter
	dbw EFFECT_ATTRACT,          AI_Smart_Attract
	dbw EFFECT_SAFEGUARD,        AI_Smart_Safeguard
	dbw EFFECT_MAGNITUDE,        AI_Smart_Magnitude
	dbw EFFECT_BATON_PASS,       AI_Smart_BatonPass
	dbw EFFECT_PURSUIT,          AI_Smart_Pursuit
	dbw EFFECT_RAPID_SPIN,       AI_Smart_RapidSpin
	dbw EFFECT_MORNING_SUN,      AI_Smart_MorningSun
	dbw EFFECT_SYNTHESIS,        AI_Smart_Synthesis
	dbw EFFECT_MOONLIGHT,        AI_Smart_Moonlight
	dbw EFFECT_HIDDEN_POWER,     AI_Smart_HiddenPower
	dbw EFFECT_RAIN_DANCE,       AI_Smart_RainDance
	dbw EFFECT_SUNNY_DAY,        AI_Smart_SunnyDay
	dbw EFFECT_BELLY_DRUM,       AI_Smart_BellyDrum
	dbw EFFECT_PSYCH_UP,         AI_Smart_PsychUp
	dbw EFFECT_MIRROR_COAT,      AI_Smart_MirrorCoat
	dbw EFFECT_SKULL_BASH,       AI_Smart_SkullBash
	dbw EFFECT_TWISTER,          AI_Smart_Twister
	dbw EFFECT_EARTHQUAKE,       AI_Smart_Earthquake
	dbw EFFECT_FUTURE_SIGHT,     AI_Smart_FutureSight
	dbw EFFECT_GUST,             AI_Smart_Gust
	dbw EFFECT_STOMP,            AI_Smart_Stomp
	dbw EFFECT_SOLARBEAM,        AI_Smart_Solarbeam
	dbw EFFECT_THUNDER,          AI_Smart_Thunder
	dbw EFFECT_FLY,              AI_Smart_Fly
;
	dbw EFFECT_BURN_UP,            AI_Smart_BurnUp
	dbw EFFECT_STRENGTH_SAP,       AI_Smart_Strength_Sap
	dbw EFFECT_TURN_HIT,           AI_Smart_TurnHit
	dbw EFFECT_FORCE_SWITCH_HIT,   AI_Smart_ForceSwitchHit
	dbw EFFECT_KNOCK_OFF,          AI_Smart_KnockOff
	dbw EFFECT_FOUL_PLAY,          AI_Smart_FoulPlay
	dbw EFFECT_DOUBLE_IF_FIRST,    AI_Smart_DoubleIfFirst
	dbw EFFECT_SOAK,               AI_Smart_Soak
	dbw EFFECT_PRIORITY_MULTI_HIT, AI_Smart_PriorityMultiHit
	dbw EFFECT_EXTRA_PRIORITY_HIT, AI_Smart_ExtraPriorityHit
	dbw EFFECT_USERSTATSDOWN_HIT,  AI_Smart_UserStatsDown
	dbw EFFECT_FELL_STINGER,       AI_Smart_FellStinger
	dbw EFFECT_ACROBATICS,         AI_Smart_Acrobatics
	dbw EFFECT_FACADE,             AI_Smart_Facade
	dbw EFFECT_HEX,                AI_Smart_Hex
	dbw EFFECT_VENOSHOCK,          AI_Smart_Venoshock
	dbw EFFECT_PARTING_SHOT,       AI_Smart_PartingShot
	dbw EFFECT_BRICK_BREAK,        AI_Smart_BrickBreak
	dbw EFFECT_WAKE_UP_SLAP,       AI_Smart_WakeUpSlap
	dbw EFFECT_BOUNCE,             AI_Smart_Bounce
	dbw EFFECT_DEFOG,              AI_Smart_Defog
	dbw EFFECT_ROOST,              AI_Smart_Roost
	dbw EFFECT_COURT_CHANGE,       AI_Smart_CourtChange
	dbw EFFECT_ENDEAVOR,           AI_Smart_Endeavor
	dbw EFFECT_SPECTRAL_THIEF,     AI_Smart_SpectralThief
	dbw EFFECT_ERUPTION,           AI_Smart_Eruption
	dbw EFFECT_BURNING_ENVY,       AI_Smart_BurningEnvy
	dbw EFFECT_KINGS_SHIELD,       AI_Smart_KingsShield
	dbw EFFECT_HEART_SWAP,         AI_Smart_HeartSwap
	dbw EFFECT_PSYCHO_SHIFT,       AI_Smart_PsychoShift
	dbw EFFECT_SYNCHRONOISE,       AI_Smart_Synchronoise
	dbw EFFECT_TRICK,              AI_Smart_Trick
	dbw EFFECT_TRICK_ROOM,         AI_Smart_TrickRoom
	dbw EFFECT_CLEAR_SMOG,         AI_Smart_ClearSmog
	dbw EFFECT_VENOM_DRENCH,       AI_Smart_VenomDrench
	dbw EFFECT_FINAL_GAMBIT,       AI_Smart_FinalGambit
	dbw EFFECT_TAUNT,              AI_Smart_Taunt
	dbw EFFECT_MEMENTO,            AI_Smart_Memento
	dbw EFFECT_HAIL,               AI_Smart_Hail
	dbw EFFECT_AURORA_VEIL,        AI_Smart_AuroraVeil
	dbw EFFECT_SUCKER_PUNCH,       AI_Smart_SuckerPunch
	dbw EFFECT_BIG_LEECH_HIT,      AI_Smart_BigLeechHit
	dbw EFFECT_SPIKES,             AI_Smart_Spikes
	dbw EFFECT_STEALTH_ROCKS,      AI_Smart_StealthRocks
	dbw EFFECT_TOXIC_SPIKES,       AI_Smart_ToxicSpikes
	dbw EFFECT_STICKY_WEB,         AI_Smart_StickyWeb
	dbw EFFECT_SNATCH,             AI_Smart_Snatch
	dbw EFFECT_TOPSY_TURVY,        AI_Smart_TopsyTurvy
	dbw EFFECT_PURIFY,             AI_Smart_Purify
	dbw EFFECT_OCTOLOCK,           AI_Smart_Octolock
	db -1 ; end

.smart_move
	dw FAKE_OUT,                   AI_Smart_FakeOut
	dw STORM_THROW,                AI_Smart_StormThrow
	dw FROST_BREATH,               AI_Smart_FrostBreath
	dw WICKED_BLOW,                AI_Smart_WickedBlow
	db -1 ; end

AI_Smart_Sleep:
; 50% chance to greatly encourage sleep inducing moves if the enemy has either Dream Eater or Nightmare.

	ld b, EFFECT_DREAM_EATER
	call AIHasMoveEffect
	jr c, .asm_387f0

	ld b, EFFECT_NIGHTMARE
	call AIHasMoveEffect
	ret nc

.asm_387f0
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_LeechHit:
AI_Smart_BigLeechHit:
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl

; 60% chance to discourage this move if not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .asm_38815

; Do nothing if effectiveness is neutral.
	ret z

; Do nothing if enemy's HP is full.
	call AICheckEnemyMaxHP
	ret c

; 80% chance to encourage this move otherwise.
	call AI_80_20
	ret c

	dec [hl]
	ret

.asm_38815
	call Random
	cp 39 percent + 1
	ret c

	inc [hl]
	ret

AI_Smart_LockOn:
; If LockOn was used last turn, dismiss it and
; greatly encourage moves of low accuracy
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .alreadyLockedOn

	push hl
; discourage if enemy's HP is below 25%
	call AICheckEnemyQuarterHP
	jr nc, .discourage

; consider evasiveness and accuracy if enemy's HP is above 50%
	call AICheckEnemyHalfHP
	jr c, .asm_38834

; discourage if enemy's HP is below 50% and player is faster than enemy
	call AICompareSpeed
	jr nc, .discourage

.asm_38834
; If player evasiveness has been raised, 50% chance to greatly encourage
; if it has been lowered, do nothing
	ld a, [wPlayerEvaLevel]
	cp $a
	jr nc, .flipacoin
	cp $8
	jr nc, .doNothing

; If enemy accuracy has beeen lowered, 50% chance to greatly encourage
; if it has been raised, do nothing
; see AccuracyLevelMultipliers
	ld a, [wEnemyAccLevel]
	cp $5
	jr c, .flipacoin
	cp $7
	jr c, .doNothing

; If the enemy has a <= 70% move which is effective or super eff,
; LockOn is neither encouraged nor discouraged. Otherwise discourage.
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.loop
	dec b
	jr z, .discourage

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld c, a
	or c
	jr z, .discourage

	push bc
	ld b, a
	call AIGetEnemyMove
	pop bc

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 180
	jr nc, .loop

	ld a, $1
	ldh [hBattleTurn], a

	push hl
	push bc
	farcall BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop bc
	pop hl
	jr c, .loop

.doNothing
	pop hl
	ret

.discourage
	pop hl
	inc [hl]
	ret

.flipacoin
; 50% chance to greatly encourage
	pop hl
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.alreadyLockedOn
	push hl
	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1

.nextmove
; Greatly encourage any move of accuracy less than 70%,
; and dismiss LockOn
	inc hl
	dec b
	jr z, .done

	ld a, [de]
	ld c, a
	inc de
	ld a, [de]	
	or c
	jr z, .done

	push bc
	ld a, [de]
	ld b, a
	call AIGetEnemyMove
	pop bc
	inc de

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 180
	jr nc, .nextmove

	dec [hl]
	dec [hl]
	jr .nextmove

.done
	pop hl
	jp AIDismissMove

AI_Smart_Selfdestruct:
; Selfdestruct, Explosion

; Unless this is the enemy's last Pokemon...
	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .asm_388b7

; ...greatly discourage this move unless this is the player's last Pokemon too.
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .asm_388c6

.asm_388b7
; Greatly discourage this move if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	jr c, .asm_388c6

; Do nothing if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	ret nc

; If enemy's HP is between 25% and 50%,
; over 90% chance to greatly discourage this move.
	call Random
	cp 9 percent - 2
	ret c

.asm_388c6
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_DreamEater:
; 90% chance to greatly encourage this move.
; The AI_Basic layer will make sure that
; Dream Eater is only used against sleeping targets.
	call Random
	cp 10 percent
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_EvasionUp:
; Dismiss this move if enemy's evasion can't raise anymore.
	ld a, [wEnemyEvaLevel]
	cp $d
	jp nc, AIDismissMove

; If enemy's HP is full...
	call AICheckEnemyMaxHP
	jr nc, .asm_388f2

; ...greatly encourage this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_388ef

; ...70% chance to greatly encourage this move if player is not badly poisoned.
	call Random
	cp 70 percent
	jr nc, .asm_38911

.asm_388ef
	dec [hl]
	dec [hl]
	ret

.asm_388f2

; Greatly discourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	jr nc, .asm_3890f

; If enemy's HP is above 25% but not full, 4% chance to greatly encourage this move.
	call Random
	cp 4 percent
	jr c, .asm_388ef

; If enemy's HP is between 25% and 50%,...
	call AICheckEnemyHalfHP
	jr nc, .asm_3890a

; If enemy's HP is above 50% but not full, 20% chance to greatly encourage this move.
	call AI_80_20
	jr c, .asm_388ef
	jr .asm_38911

.asm_3890a
; ...50% chance to greatly discourage this move.
	call AI_50_50
	jr c, .asm_38911

.asm_3890f
	inc [hl]
	inc [hl]

; 30% chance to end up here if enemy's HP is full and player is not badly poisoned.
; 77% chance to end up here if enemy's HP is above 50% but not full.
; 96% chance to end up here if enemy's HP is between 25% and 50%.
; 100% chance to end up here if enemy's HP is below 25%.
; In other words, we only end up here if the move has not been encouraged or dismissed.
.asm_38911
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38938

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_38941

; Discourage this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .asm_38936

; Greatly encourage this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .asm_388ef

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .asm_388ef

.asm_38936
	inc [hl]
	ret

; Player is badly poisoned.
; 70% chance to greatly encourage this move.
; This would counter any previous discouragement.
.asm_38938
	call Random
	cp 31 percent + 1
	ret c
	dec [hl]
	dec [hl]
	ret

; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
.asm_38941
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_AlwaysHit:
; 80% chance to greatly encourage this move if either...

; ...enemy's accuracy level has been lowered three or more stages
	ld a, [wEnemyAccLevel]
	cp $5
	jr c, .asm_38954

; ...or player's evasion level has been raised three or more stages.
	ld a, [wPlayerEvaLevel]
	cp $a
	ret c

.asm_38954
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_MirrorMove:
; If the player did not use any move last turn...
	ld a, [wLastPlayerCounterMove]
	ld b, a
	ld a, [wLastPlayerCounterMove + 1]
	ld c, a
	or b
	jr nz, .asm_38968

; ...do nothing if enemy is slower than player
	call AICompareSpeed
	ret nc

; ...or dismiss this move if enemy is faster than player.
	jp AIDismissMove

; If the player did use a move last turn...
.asm_38968
	push hl
	ld hl, UsefulMoves
	ld e, 1
	call IsWordInArray
	pop hl

; ...do nothing if he didn't use a useful move.
	ret nc

; If he did, 50% chance to encourage this move...
	call AI_50_50
	ret c

	dec [hl]

; ...and 90% chance to encourage this move again if the enemy is faster.
	call AICompareSpeed
	ret nc

	call Random
	cp 10 percent
	ret c

	dec [hl]
	ret

AI_Smart_AccuracyDown:
; If player's HP is full...
	call AICheckPlayerMaxHP
	jr nc, .asm_389a0

; ...and enemy's HP is above 50%...
	call AICheckEnemyHalfHP
	jr nc, .asm_389a0

; ...greatly encourage this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_3899d

; ...70% chance to greatly encourage this move if player is not badly poisoned.
	call Random
	cp 70 percent
	jr nc, .asm_389bf

.asm_3899d
	dec [hl]
	dec [hl]
	ret

.asm_389a0

; Greatly discourage this move if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	jr nc, .asm_389bd

; If player's HP is above 25% but not full, 4% chance to greatly encourage this move.
	call Random
	cp 4 percent
	jr c, .asm_3899d

; If player's HP is between 25% and 50%,...
	call AICheckPlayerHalfHP
	jr nc, .asm_389b8

; If player's HP is above 50% but not full, 20% chance to greatly encourage this move.
	call AI_80_20
	jr c, .asm_3899d
	jr .asm_389bf

; ...50% chance to greatly discourage this move.
.asm_389b8
	call AI_50_50
	jr c, .asm_389bf

.asm_389bd
	inc [hl]
	inc [hl]

; We only end up here if the move has not been already encouraged.
.asm_389bf
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_389e6

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_389ef

; Discourage this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .asm_389e4

; Greatly encourage this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .asm_3899d

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .asm_3899d

.asm_389e4
	inc [hl]
	ret

; Player is badly poisoned.
; 70% chance to greatly encourage this move.
; This would counter any previous discouragement.
.asm_389e6
	call Random
	cp 31 percent + 1
	ret c
	dec [hl]
	dec [hl]
	ret

; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
.asm_389ef
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_ResetStats:
; 85% chance to encourage this move if any of enemy's stat levels is lower than -2.
	push hl
	ld hl, wEnemyAtkLevel
	ld c, $8
.asm_389fb
	dec c
	jr z, .asm_38a05
	ld a, [hli]
	cp $5
	jr c, .asm_38a12
	jr .asm_389fb

; 85% chance to encourage this move if any of player's stat levels is higher than +2.
.asm_38a05
	ld hl, wPlayerAtkLevel
	ld c, $8
.asm_38a0a
	dec c
	jr z, .asm_38a1b
	ld a, [hli]
	cp $a
	jr c, .asm_38a0a

.asm_38a12
	pop hl
	call Random
	cp 16 percent
	ret c
	dec [hl]
	ret

; Discourage this move if neither:
; Any of enemy's stat levels is	lower than -2.
; Any of player's stat levels is higher than +2.
.asm_38a1b
	pop hl
	inc [hl]
	ret

AI_Smart_Bide:
; 90% chance to discourage this move unless enemy's HP is full.

	call AICheckEnemyMaxHP
	ret c
	call Random
	cp 10 percent
	ret c
	inc [hl]
	ret

AI_Smart_ForceSwitch:
AI_Smart_ForceSwitchHit:
; Whirlwind, Roar.

; Discourage this move if the player has not shown
; a super-effective move against the enemy.
; Consider player's type(s) if its moves are unknown.

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10 ; neutral
	pop hl
	ret c
	inc [hl]
	ret

AI_Smart_Heal:
AI_Smart_MorningSun:
AI_Smart_Synthesis:
AI_Smart_Moonlight:
AI_Smart_Roost:
; 90% chance to greatly encourage this move if enemy's HP is below 25%.
; Discourage this move if enemy's HP is higher than 50%.
; Do nothing otherwise.

	call AICheckEnemyQuarterHP
	jr nc, .asm_38a45
	call AICheckEnemyHalfHP
	ret nc
	inc [hl]
	ret

.asm_38a45
	call Random
	cp 10 percent
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Toxic:
AI_Smart_LeechSeed:
; Discourage this move if player's HP is below 50%.

	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret

AI_Smart_AuroraVeil:
; dismiss if not hailing

	ld a, [wBattleWeather]
	bit WEATHER_HAIL, a
	jp z, AIDismissMove
;fallthrough

AI_Smart_LightScreen:
AI_Smart_Reflect:
; Over 90% chance to discourage this move unless enemy's HP is full.

	call AICheckEnemyMaxHP
	ret c
	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

AI_Smart_Ohko:
; Dismiss this move if player's level is higher than enemy's level.
; Else, discourage this move is player's HP is below 50%.

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]
	cp b
	jp c, AIDismissMove
	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret

AI_Smart_TrapTarget:
; Bind, Wrap, Fire Spin, Clamp

; 50% chance to discourage this move if the player is already trapped.
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .asm_38a8b

; 50% chance to greatly encourage this move if player is either
; badly poisoned, in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38a91

	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .asm_38a91

; Else, 50% chance to greatly encourage this move if it's the player's Pokemon first turn.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .asm_38a91

; 50% chance to discourage this move otherwise.
.asm_38a8b
	call AI_50_50
	ret c
	inc [hl]
	ret

.asm_38a91
	call AICheckEnemyQuarterHP
	ret nc
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_RazorWind:
; discourage if player perish count is less than 3
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .asm_38aaa

	ld a, [wEnemyPerishCount]
	cp 3
	jr c, .asm_38ad3

.asm_38aaa
; dismiss this move if the player has shown a protecting move
	push hl
	ld hl, wPlayerUsedMoves
	ld d, 4

.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .asm_38ac1

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	jr z, .asm_38ad5
	dec d
	jr nz, .loop

.asm_38ac1
; 20% chance to discourage if player is confused
	pop hl
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .asm_38acd

	call AICheckEnemyHalfHP
	ret c

.asm_38acd
	call Random
	cp 79 percent - 1
	ret c

.asm_38ad3
	inc [hl]
	ret

.asm_38ad5
	pop hl
	ld a, [hl]
	add 6
	ld [hl], a
	ret

AI_Smart_Confuse:
; 90% chance to discourage this move if player's HP is between 25% and 50%.
	call AICheckPlayerHalfHP
	ret c
	call Random
	cp 10 percent
	jr c, .asm_38ae7
	inc [hl]

.asm_38ae7
; Discourage again if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_SpDefenseUp2:
; Discourage this move if enemy's HP is lower than 50%.
	call AICheckEnemyHalfHP
	jr nc, .asm_38b10

; Discourage this move if enemy's special defense level is higher than +3.
	ld a, [wEnemySDefLevel]
	cp $b
	jr nc, .asm_38b10

; 80% chance to greatly encourage this move if
; enemy's Special Defense level is lower than +2, and the player is of a special type.
; not very sensible if you implement phsyical/special split
	cp $9
	ret nc

	ld a, [wBattleMonType1]
	cp SPECIAL_TYPES
	jr nc, .asm_38b09
	ld a, [wBattleMonType2]
	cp SPECIAL_TYPES
	ret c

.asm_38b09
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b10
	inc [hl]
	ret

AI_Smart_Fly:
AI_Smart_Bounce:
; Fly, Dig, Bounce

; Greatly encourage this move if the player is
; flying or underground, and slower than the enemy.

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_SuperFang:
; Discourage this move if player's HP is below 25%.

	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_Paralyze:
; 50% chance to discourage this move if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	jr nc, .asm_38b3a

; 80% chance to greatly encourage this move
; if enemy is slower than player and its HP is above 25%.
	call AICompareSpeed
	ret c
	call AICheckEnemyQuarterHP
	ret nc
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b3a
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_SpeedDownHit:
; Icy Wind

; Almost 90% chance to greatly encourage this move if the following conditions all meet:
; Enemy's HP is higher than 25%.
; It's the first turn of player's Pokemon.
; Player is faster than enemy.

	ld a, [wEnemyMoveStruct + MOVE_ANIM2]
	ld b, a
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	sub ICY_WIND
	or b
	ret nz
	call AICheckEnemyQuarterHP
	ret nc
	ld a, [wPlayerTurnsTaken]
	and a
	ret nz
	call AICompareSpeed
	ret c
	call Random
	cp 12 percent
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Substitute:
; Dismiss this move if enemy's HP is below 50%.

	call AICheckEnemyHalfHP
	ret c
	jp AIDismissMove

AI_Smart_HyperBeam:
	call AICheckEnemyHalfHP
	jr c, .asm_38b72

; 50% chance to encourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

.asm_38b72
; If enemy's HP is above 50%, discourage this move at random
	call Random
	cp 16 percent
	ret c
	inc [hl]
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Rage:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_RAGE, a
	jr z, .asm_38b9b

; If enemy's Rage is building, 50% chance to encourage this move.
	call AI_50_50
	jr c, .asm_38b8c

	dec [hl]

; Encourage this move based on Rage's counter.
.asm_38b8c
	ld a, [wEnemyRageCounter]
	cp $2
	ret c
	dec [hl]
	ld a, [wEnemyRageCounter]
	cp $3
	ret c
	dec [hl]
	ret

.asm_38b9b
; If enemy's Rage is not building, discourage this move if enemy's HP is below 50%.
	call AICheckEnemyHalfHP
	jr nc, .asm_38ba6

; 50% chance to encourage this move otherwise.
	call AI_80_20
	ret nc
	dec [hl]
	ret

.asm_38ba6
	inc [hl]
	ret

AI_Smart_Mimic:
	ld a, [wLastPlayerCounterMove]
	ld c, a
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	or c
	jr z, .asm_38be9

	call AICheckEnemyHalfHP
	jr nc, .asm_38bef

	push hl
	call AIGetEnemyMove

	ld a, $1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup

	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop hl
	jr c, .asm_38bef
	jr z, .asm_38bd4

	call AI_50_50
	jr c, .asm_38bd4

	dec [hl]

.asm_38bd4
	ld a, [wLastPlayerCounterMove]
	ld b, a
	ld a, [wLastPlayerCounterMove + 1]
	ld c, a
	push hl
	ld hl, UsefulMoves
	ld e, 1
	call IsWordInArray

	pop hl
	ret nc
	call AI_50_50
	ret c
	dec [hl]
	ret

.asm_38be9
	call AICompareSpeed
	jp c, AIDismissMove

.asm_38bef
	inc [hl]
	ret

AI_Smart_Counter:
	push hl
	ld hl, wPlayerUsedMoves
	ld e, 4
	ld d, 0

.asm_38bf9
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .asm_38c0e

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c0e

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	call AIDeterminePhysicalSpecial
	jr nc, .asm_38c0e

	inc d

.asm_38c0e
	dec e
	jr nz, .asm_38bf9

	pop hl
	ld a, d
	and a
	jr z, .asm_38c39

	cp $3
	jr nc, .asm_38c30

	ld a, [wLastPlayerCounterMove]
	ld c, a
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	or c
	jr z, .asm_38c38

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c38

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	call AIDeterminePhysicalSpecial
	jr nc, .asm_38c38

.asm_38c30
	call Random
	cp 39 percent + 1
	jr c, .asm_38c38

	dec [hl]

.asm_38c38
	ret

.asm_38c39
	inc [hl]
	ret

AI_Smart_Encore:
	call AICompareSpeed
	jr nc, .asm_38c81

	ld a, [wLastPlayerMove]
	ld c, a
	ld a, [wLastPlayerMove + 1]
	ld b, a
	or c
	jp z, AIDismissMove

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c68

	push hl
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	ld hl, wEnemyMonType1
	predef CheckTypeMatchup

	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .asm_38c68

	and a
	ret nz
	jr .asm_38c78

.asm_38c68
	push hl
	ld a, [wLastPlayerCounterMove]
	ld b, a
	ld a, [wLastPlayerCounterMove + 1]
	ld c, a
	ld hl, EncoreMoves
	ld e, 1
	call IsWordInArray
	pop hl
	jr nc, .asm_38c81

.asm_38c78
	call Random
	cp 28 percent - 1
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38c81
	inc [hl]
	inc [hl]
	inc [hl]
	ret

INCLUDE "data/battle/ai/encore_moves.asm"

AI_Smart_PainSplit:
; Discourage this move if [enemy's current HP * 2 > player's current HP].

	push hl
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, wBattleMonHP + 1
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret nc
	inc [hl]
	ret

AI_Smart_Snore:
AI_Smart_SleepTalk:
; Greatly encourage this move if enemy is fast asleep.
; Greatly discourage this move otherwise.

	ld a, [wEnemyMonStatus]
	and $7
	cp $1
	jr z, .asm_38cc7

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38cc7
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_Spite:
	ld a, [wLastPlayerCounterMove]
	ld c, a
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	or c
	jr nz, .asm_38ce7

	call AICompareSpeed
	jp c, AIDismissMove

	call AI_50_50
	ret c
	inc [hl]
	ret

.asm_38ce7
	push hl
	ld c, 4
	ld hl, wBattleMonMoves
	ld de, wBattleMonPP

.asm_38cf1
	push bc
	ld a, [wLastPlayerCounterMove]
	ld c, a
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hli]
	sub b
	or c
	pop bc
	jr z, .asm_38cfb

	inc de
	dec c
	jr nz, .asm_38cf1

	pop hl
	ret

.asm_38cfb
	pop hl
	ld a, [de]
	cp $6
	jr c, .asm_38d0d
	cp $f
	jr nc, .asm_38d0b

	call Random
	cp 39 percent + 1
	ret nc

.asm_38d0b
	inc [hl]
	ret

.asm_38d0d
	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_DestinyBond:
AI_Smart_Reversal:
AI_Smart_SkullBash:
; Discourage this move if enemy's HP is above 25%.

	call AICheckEnemyQuarterHP
	ret nc
	inc [hl]
	ret

AI_Smart_HealBell:
; Dismiss this move if none of the opponent's Pokemon is statused.
; Encourage this move if the enemy is statused.
; 50% chance to greatly encourage this move if the enemy is fast asleep or frozen.

	push hl
	ld a, [wOTPartyCount]
	ld b, a
	ld c, 0
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	push hl
	ld a, [hli]
	or [hl]
	jr z, .next

	; status
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop

	pop hl
	ld a, c
	and a
	jr z, .no_status

	ld a, [wEnemyMonStatus]
	and a
	jr z, .ok
	dec [hl]
.ok
	and 1 << FRZ | SLP
	ret z
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

.no_status
	ld a, [wEnemyMonStatus]
	and a
	ret nz
	jp AIDismissMove


AI_Smart_PriorityHit:
AI_Smart_PriorityMultiHit:
AI_Smart_ExtraPriorityHit:
	call AICompareSpeed
	ret c

; Dismiss this move if the player is flying or underground.
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, AIDismissMove

; Greatly encourage this move if it will KO the player.
	ld a, $1
	ldh [hBattleTurn], a
	push hl
	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	pop hl
	ld a, [wCurDamage + 1]
	ld c, a
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp c
	ld a, [wBattleMonHP]
	sbc b
	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Thief:
AI_Smart_KnockOff:
AI_Smart_Trick:
; Don't use unless it's the only move available.

	ld a, [hl]
	add $1e
	ld [hl], a
	ret

AI_Smart_Conversion2:
	ld a, [wLastPlayerMove]
	ld c, a
	ld a, [wLastPlayerMove + 1]
	ld b, a
	or b
	jr nz, .asm_38dc9

	push hl
	dec bc
	ld hl, Moves + MOVE_TYPE
	ld a, MOVE_LENGTH
	call AddNTimes

	ld a, BANK(Moves)
	call GetFarByte
	ld [wPlayerMoveStruct + MOVE_TYPE], a

	xor a
	ldh [hBattleTurn], a

	callfar BattleCheckTypeMatchup

	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop hl
	jr c, .asm_38dc9
	ret z

	call AI_50_50
	ret c

	dec [hl]
	ret

.asm_38dc9
	call Random
	cp 10 percent
	ret c
	inc [hl]
	ret

AI_Smart_Disable:
	call AICompareSpeed
	jr nc, .asm_38df3

	push hl
	ld a, [wLastPlayerCounterMove]
	ld b, a
	ld a, [wLastPlayerCounterMove + 1]
	ld c, a
	ld hl, UsefulMoves
	ld e, 1
	call IsWordInArray

	pop hl
	jr nc, .asm_38dee

	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	ret

.asm_38dee
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret nz

.asm_38df3
	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

AI_Smart_MeanLook:
AI_Smart_Octolock:
	call AICheckEnemyHalfHP
	jr nc, .asm_38e24

	push hl
	call AICheckLastPlayerMon
	pop hl
	jp z, AIDismissMove

; 80% chance to greatly encourage this move if the enemy is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38e26

; 80% chance to greatly encourage this move if the player is either
; in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .asm_38e26

; Otherwise, discourage this move unless the player only has not very effective moves against the enemy.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp $b ; not very effective
	pop hl
	ret nc

.asm_38e24
	inc [hl]
	ret

.asm_38e26
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AICheckLastPlayerMon:
; returns z if the player is on their last mon
	ld a, [wPartyCount]
	ld b, a
	ld c, 0
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	ld a, [wCurBattleMon]
	cp c
	jr z, .asm_38e44

	ld a, [hli]
	or [hl]
	ret nz
	dec hl

.asm_38e44
	add hl, de
	inc c
	dec b
	jr nz, .loop

	ret

AI_Smart_Nightmare:
; 50% chance to encourage this move.
; The AI_Basic layer will make sure that
; Dream Eater is only used against sleeping targets.

	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_Defrost:
; Use this move if the enemy is frozen.

	ld a, [wEnemyMonStatus]
	bit FRZ, a
	ret z
rept 5
	dec [hl]
endr
	ret

AI_Smart_Curse:
	ld a, [wEnemyMonType1]
	cp GHOST
	jr z, .ghostcurse
	ld a, [wEnemyMonType2]
	cp GHOST
	jr z, .ghostcurse

	call AICheckEnemyHalfHP
	jr nc, .asm_38e93

	ld a, [wEnemyAtkLevel]
	cp $b
	jr nc, .asm_38e93
	cp $9
	ret nc

	ld a, [wBattleMonType1]
	cp GHOST
	jr z, .asm_38e92
; not very smart after phys/spec split
	cp SPECIAL_TYPES
	ret nc
	ld a, [wBattleMonType2]
	cp SPECIAL_TYPES
	ret nc
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38e90
	inc [hl]
	inc [hl]
.asm_38e92
	inc [hl]
.asm_38e93
	inc [hl]
	ret

.ghostcurse
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, AIDismissMove

	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr nc, .asm_38eb0

	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .asm_38e90

	jr .asm_38eb7

.asm_38eb0
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .asm_38ecb

.asm_38eb7
	call AICheckEnemyQuarterHP
	jp nc, .asm_38e90

	call AICheckEnemyHalfHP
	jr nc, .asm_38e92

	call AICheckEnemyMaxHP
	ret nc

	ld a, [wPlayerTurnsTaken]
	and a
	ret nz

.asm_38ecb
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_Protect:
AI_Smart_KingsShield:
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .asm_38f13

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .asm_38f14

	ld a, [wPlayerFuryCutterCount]
	cp 3
	jr nc, .asm_38f0d

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CHARGED, a
	jr nz, .asm_38f0d

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38f0d
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_38f0d
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jr nz, .asm_38f0d

	bit SUBSTATUS_ROLLOUT, a
	jr z, .asm_38f14

	ld a, [wPlayerRolloutCount]
	cp 3
	jr c, .asm_38f14

.asm_38f0d
	call AI_80_20
	ret c
	dec [hl]
	ret

.asm_38f13
	inc [hl]

.asm_38f14
	call Random
	cp 8 percent
	ret c
	inc [hl]
	inc [hl]
	ret

AI_Smart_Foresight:
	ld a, [wEnemyAccLevel]
	cp $5
	jr c, .asm_38f41
	ld a, [wPlayerEvaLevel]
	cp $a
	jr nc, .asm_38f41

	ld a, [wBattleMonType1]
	cp GHOST
	jr z, .asm_38f41
	ld a, [wBattleMonType2]
	cp GHOST
	jr z, .asm_38f41

	call Random
	cp 8 percent
	ret c
	inc [hl]
	ret

.asm_38f41
	call Random
	cp 39 percent + 1
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_PerishSong:
	push hl
	callfar FindAliveEnemyMons
	pop hl
	jr c, .no

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .yes

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10 ; 1.0
	pop hl
	ret c

	call AI_50_50
	ret c

	inc [hl]
	ret

.yes
	call AI_50_50
	ret c

	dec [hl]
	ret

.no
	ld a, [hl]
	add 5
	ld [hl], a
	ret

AI_Smart_Sandstorm:
; Greatly discourage this move if the player is immune to Sandstorm damage.
	ld a, [wBattleMonType1]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .asm_38fa5

	ld a, [wBattleMonType2]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .asm_38fa5

; Discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, .asm_38fa6

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

.asm_38fa5
	inc [hl]

.asm_38fa6
	inc [hl]
	ret

.SandstormImmuneTypes:
	db ROCK
	db GROUND
	db STEEL
	db -1 ; end

AI_Smart_Endure:
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .asm_38fd8

	call AICheckEnemyMaxHP
	jr c, .asm_38fd8

	call AICheckEnemyQuarterHP
	jr c, .asm_38fd9

	ld b, EFFECT_REVERSAL
	call AIHasMoveEffect
	jr nc, .asm_38fcb

	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38fcb
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	ret z

	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.asm_38fd8
	inc [hl]

.asm_38fd9
	inc [hl]
	ret

AI_Smart_FuryCutter:
; Encourage this move based on Fury Cutter's count.

	ld a, [wEnemyFuryCutterCount]
	and a
	jr z, .end
	dec [hl]

	cp 2
	jr c, .end
	dec [hl]
	dec [hl]

	cp 3
	jr c, .end
	dec [hl]
	dec [hl]
	dec [hl]

.end

	; fallthrough

AI_Smart_Rollout:
; Rollout, Fury Cutter

; 80% chance to discourage this move if the enemy is in love, confused, or paralyzed.
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .asm_39020

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .asm_39020

	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr nz, .asm_39020

; 80% chance to discourage this move if the enemy's HP is below 25%,
; or if accuracy or evasion modifiers favour the player.
	call AICheckEnemyQuarterHP
	jr nc, .asm_39020

	ld a, [wEnemyAccLevel]
	cp 7
	jr c, .asm_39020
	ld a, [wPlayerEvaLevel]
	cp 8
	jr nc, .asm_39020

; Otherwise, 80% chance to greatly encourage this move.
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39020
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Swagger:
AI_Smart_Attract:
; 80% chance to encourage this move during the first turn of player's Pokemon.
; 80% chance to discourage this move otherwise.

	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .first_turn

	call AI_80_20
	ret c
	inc [hl]
	ret

.first_turn
	call Random
	cp 79 percent - 1
	ret nc
	dec [hl]
	ret

AI_Smart_Safeguard:
; 80% chance to discourage this move if player's HP is below 50%.

	call AICheckPlayerHalfHP
	ret c
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Magnitude:
AI_Smart_Earthquake:
; Greatly encourage this move if the player is underground and the enemy is faster.
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	ld a, [wLastPlayerCounterMove]
	sub DIG
	or b
	ret nz

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_UNDERGROUND, a
	jr z, .could_dig

	call AICompareSpeed
	ret nc
	dec [hl]
	dec [hl]
	ret

.could_dig
	; Try to predict if the player will use Dig this turn.

	; 50% chance to encourage this move if the enemy is slower than the player.
	call AICompareSpeed
	ret c

	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_BatonPass:
; Discourage this move if the player hasn't shown super-effective moves against the enemy.
; Consider player's type(s) if its moves are unknown.

	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10 ; neutral
	pop hl
	ret c
	inc [hl]
	ret

AI_Smart_Pursuit:
; 50% chance to greatly encourage this move if player's HP is below 25%.
; 80% chance to discourage this move otherwise.

	call AICheckPlayerQuarterHP
	jr nc, .asm_3907d
	call AI_80_20
	ret c
	inc [hl]
	ret

.asm_3907d
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_RapidSpin:
; 80% chance to greatly encourage this move if the enemy is
; trapped (Bind effect), seeded, or scattered with spikes.

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .asm_39097

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_39097

	ld a, [wEnemyScreens]
	bit SCREENS_STEALTH_ROCKS, a
	jr nz, .asm_39097
	bit SCREENS_TOXIC_SPIKES_1, a
	jr nz, .asm_39097
	bit SCREENS_STICKY_WEB, a
	jr nz, .asm_39097
	bit SCREENS_SPIKES_1, a
	jr nz, .asm_39097
	bit SCREENS_SPIKES_2, a
	ret z

.asm_39097
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_HiddenPower:
	push hl
	ld a, 1
	ldh [hBattleTurn], a

; Calculate Hidden Power's type and base power based on enemy's DVs.
	callfar HiddenPowerDamage
	callfar BattleCheckTypeMatchup
	pop hl

; Discourage Hidden Power if not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .bad

; Discourage Hidden Power if its base power	is lower than 50.
	ld a, d
	cp 50
	jr c, .bad

; Encourage Hidden Power if super-effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	jr nc, .good

; Encourage Hidden Power if its base power is 70.
	ld a, d
	cp 70
	ret c

.good
	dec [hl]
	ret

.bad
	inc [hl]
	ret

AI_Smart_RainDance:
; Greatly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Water-type.
	ld a, [wBattleMonType1]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	push hl
	ld hl, RainDanceMoves
	jr AI_Smart_WeatherMove

INCLUDE "data/battle/ai/rain_dance_moves.asm"

AI_Smart_SunnyDay:
; Greatly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Fire-type.
	ld a, [wBattleMonType1]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	push hl
	ld hl, SunnyDayMoves

	; fallthrough

AI_Smart_WeatherMove:
; Rain Dance, Sunny Day

; Greatly discourage this move if the enemy doesn't have
; one of the useful Rain Dance or Sunny Day moves.
	call AIHasMoveInArray
	pop hl
	jr nc, AIBadWeatherType

; Greatly discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, AIBadWeatherType

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

AIBadWeatherType:
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AIGoodWeatherType:
; Rain Dance, Sunny Day

; Greatly encourage this move if it would disfavour the player type-wise and player's HP is above 50%...
	call AICheckPlayerHalfHP
	ret nc

; ...as long as one of the following conditions meet:
; It's the first turn of the player's Pokemon.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .good

; Or it's the first turn of the enemy's Pokemon.
	ld a, [wEnemyTurnsTaken]
	and a
	ret nz

.good
	dec [hl]
	dec [hl]
	ret

INCLUDE "data/battle/ai/sunny_day_moves.asm"

AI_Smart_BellyDrum:
; Dismiss this move if enemy's attack is higher than +2 or if enemy's HP is below 50%.
; Else, discourage this move if enemy's HP is not full.

	ld a, [wEnemyAtkLevel]
	cp $a
	jr nc, .asm_3914d

	call AICheckEnemyMaxHP
	ret c

	inc [hl]

	call AICheckEnemyHalfHP
	ret c

.asm_3914d
	ld a, [hl]
	add $5
	ld [hl], a
	ret

AI_Smart_PsychUp:
AI_Smart_HeartSwap:
	push hl
	ld hl, wEnemyAtkLevel
	ld b, $8
	ld c, 100

; Calculate the sum of all enemy's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in c. c will range between 58 and 142.
.asm_3915a
	ld a, [hli]
	sub $7
	add c
	ld c, a
	dec b
	jr nz, .asm_3915a

; Calculate the sum of all player's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in d. d will range between 58 and 142.
	ld hl, wPlayerAtkLevel
	ld b, $8
	ld d, 100

.asm_39169
	ld a, [hli]
	sub $7
	add d
	ld d, a
	dec b
	jr nz, .asm_39169

; Greatly discourage this move if enemy's stat levels are higher than player's (if c>=d).
	ld a, c
	sub d
	pop hl
	jr nc, .asm_39188

; Else, 80% chance to encourage this move unless player's accuracy level is lower than -1...
	ld a, [wPlayerAccLevel]
	cp $6
	ret c

; ...or enemy's evasion level is higher than +0.
	ld a, [wEnemyEvaLevel]
	cp $8
	ret nc

	call AI_80_20
	ret c

	dec [hl]
	ret

.asm_39188
	inc [hl]
	inc [hl]
	ret

AI_Smart_MirrorCoat:
	push hl
	ld hl, wPlayerUsedMoves
	ld e, 4
	ld d, 0

.asm_39193
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .asm_391a8

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_391a8

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	call AIDeterminePhysicalSpecial
	jr c, .asm_391a8

	inc d

.asm_391a8
	dec e
	jr nz, .asm_39193

	pop hl
	ld a, d
	and a
	jr z, .asm_391d3

	cp $3
	jr nc, .asm_391ca

	ld a, [wLastPlayerCounterMove]
	ld c, a
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	or c
	jr z, .asm_391d2

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_391d2

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	call AIDeterminePhysicalSpecial
	jr c, .asm_391d2

.asm_391ca
	call Random
	cp 100
	jr c, .asm_391d2
	dec [hl]

.asm_391d2
	ret

.asm_391d3
	inc [hl]
	ret

AI_Smart_Twister:
AI_Smart_Gust:
; Greatly encourage this move if the player is flying and the enemy is faster.
	ld a, [wLastPlayerCounterMove + 1]
	ld b, a
	ld a, [wLastPlayerCounterMove]
	sub FLY
	or b
	ret nz

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_FLYING, a
	jr z, .couldFly

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	ret

; Try to predict if the player will use Fly this turn.
.couldFly

; 50% chance to encourage this move if the enemy is slower than the player.
	call AICompareSpeed
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_FutureSight:
; Greatly encourage this move if the player is
; flying or underground, and slower than the enemy.

	call AICompareSpeed
	ret nc

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	dec [hl]
	dec [hl]
	ret

AI_Smart_Stomp:
; 80% chance to encourage this move if the player has used Minimize.

	ld a, [wPlayerMinimized]
	and a
	ret z

	call AI_80_20
	ret c

	dec [hl]
	ret

AI_Smart_Solarbeam:
; 80% chance to encourage this move when it's sunny.
; 90% chance to discourage this move when it's raining.

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .asm_3921e

	cp WEATHER_RAIN
	ret nz

	call Random
	cp 10 percent
	ret c

	inc [hl]
	inc [hl]
	ret

.asm_3921e
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_Thunder:
; 90% chance to discourage this move when it's sunny.

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz

	call Random
	cp 10 percent
	ret c

	inc [hl]
	ret

AI_Smart_BurnUp:
; Dismiss this move if the enemy doesn't have the fire type.
	ld a, [wEnemyMonType1]
	cp FIRE
	jr z, .gotFire
	ld a, [wEnemyMonType2]
	cp FIRE
	jr z, .gotFire
	jp AIDismissMove

.gotFire
; Use this move if the enemy is frozen.
	ld a, [wEnemyMonStatus]
	bit FRZ, a
	ret z
rept 5
	dec [hl]
endr
	ret

AI_Smart_Strength_Sap:
; Dismiss if player has -6 attack or mist.
; Otherwise 50% chance to encourage this move if player has boosted attack.
; Otherwise treat like normal healing move.

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_MIST, a
	jp nz, AIDismissMove
	ld a, [wPlayerAtkLevel]
	dec a
	jp z, AIDismissMove
	cp BASE_STAT_LEVEL
	jp c, AI_Smart_Heal
	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_FoulPlay:
; Encourage this move if player has boosted attack,
; with 80% chance to greatly ecourage.

	ld a, [wPlayerAtkLevel]
	dec a
	cp BASE_STAT_LEVEL
	ret c
	dec [hl]
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Soak:
; Dismiss this move if the player is pure water type.
	ld a, [wBattleMonType1]
	cp WATER
	ret nz
	ld a, [wBattleMonType2]
	cp WATER
	ret nz
	jp AIDismissMove

AI_Smart_UserStatsDown:
; Powerful moves that drop the users stats.
; Encourage if the enemy has < 25% hp
	call AICheckEnemyQuarterHP
	jr nc, .encourage
; else, encourage if the player has only one pokemon left
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .encourage
; else, 80% chance to encourage if the player has shown super effective moves
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10 ; neutral
	pop hl
	jr nc, .skip
	call AI_80_20
	jr nc, .encourage
.skip
; else, don't discourage if enemy has a switching move
	call AIHasMoveEffect
	ret c
; else, 50% chance not to discourage if enemy has < 50% hp
	call AICheckEnemyHalfHP
	jr c, .skip2
	call AI_50_50
	ret nc
.skip2
; else, 10% chance not to discourage if the enemy has at least two pokemon left
	push hl
	farcall FindAliveEnemyMons
	pop hl
	jr c, .skip3
	call Random
	cp 10 percent + 1
	ret c
.skip3
; else, discourage
	inc [hl]
	ret

.encourage
	dec [hl]
	ret

AI_Smart_TurnHit:
AI_Smart_PartingShot:
; 80% chance to encourage this move if any of enemy's stat levels is lower than -2.
	push hl
	ld hl, wEnemyAtkLevel
	ld c, $8
.loop
	dec c
	jr z, .check_boosts
	ld a, [hli]
	cp $5
	jr c, .encourage
	jr .loop

.encourage
	pop hl
	call AI_80_20
	ret c
	dec [hl]
	ret

.check_boosts
; otherwise, 80% chance to discourage this move if any of enemy's stat levels is higher than +0.
	ld hl, wEnemyAtkLevel
	ld c, $8
.loop2
	dec c
	jr z, .check_hazards
	ld a, [hli]
	cp $8
	jr nc, .discourage
	jr .loop2

.check_hazards
	ld a, [wEnemyScreens]
; encourage if toxic spikes are up and enemy mon is poison type
	bit SCREENS_TOXIC_SPIKES_1, a
	jr z, .no_tspikes
	ld a, [wEnemyMonType1]
	cp POISON
	jr z, .encourage
	ld a, [wEnemyMonType2]
	cp POISON	
	jr z, .encourage
.no_tspikes
; otherwise 80% chance to discourage this move if hazards are up
	ld a, [wEnemyScreens]
	bit SCREENS_STEALTH_ROCKS, a
	jr nz, .discourage
	bit SCREENS_SPIKES_1, a
	jr nz, .discourage
	bit SCREENS_SPIKES_2, a
	jr nz, .discourage
	pop hl
	ret

.discourage
	pop hl
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_DoubleIfFirst:
; encourage if enemy faster than player
	call AICompareSpeed
	ret nc
	dec [hl]
	ret

AI_Smart_FellStinger:
; greatly encourage if player hp below 12.5%
	call AICheckPlayerEighthHP
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Acrobatics:
; encourage if enemy is not holding an item
	ld a, [wEnemyMonItem]
	and a
	ret nz
	dec [hl]
	ret

AI_Smart_Facade:
; encourage if enemy is burnt, paralysed, or poisoned
	ld a, [wEnemyMonStatus]
	and 1 << PSN | BRN | PAR
	ret z
	dec [hl]
	ret

AI_Smart_Hex:
; encourage if player is statused
	ld a, [wBattleMonStatus]
	and a
	ret z
	dec [hl]
	ret

AI_Smart_Venoshock:
; encourage if player is poisoned
	ld a, [wBattleMonStatus]
	and 1 << PSN
	ret z
	dec [hl]
	ret

AI_Smart_BrickBreak:
; encourage if player has screens
	ld a, [wPlayerScreens]
	and 1 << SCREENS_REFLECT | SCREENS_LIGHT_SCREEN | SCREENS_AURORA_VEIL
	ret z
	dec [hl]
	ret

AI_Smart_WakeUpSlap:
; encourage if player is asleep
	ld a, [wBattleMonStatus]
	and $7
	ret z
	dec [hl]
	ret

AI_Smart_Defog:
; Encourage if player has boosted evasion.
; Otherwise 80% chance to encourage this move
; if the player set up hazards.

	ld a, [wPlayerEvaLevel]
	dec a
	cp BASE_STAT_LEVEL
	jr nc, .encourage

	ld a, [wEnemyScreens]
	bit SCREENS_STEALTH_ROCKS, a
	jr nz, .encourage_chance
	bit SCREENS_TOXIC_SPIKES_1, a
	jr nz, .encourage_chance
	bit SCREENS_STICKY_WEB, a
	jr nz, .encourage_chance
	bit SCREENS_SPIKES_1, a
	jr nz, .encourage_chance
	bit SCREENS_SPIKES_2, a
	ret z

.encourage_chance
	call AI_80_20
	ret c

.encourage
	dec [hl]
	ret

AI_Smart_CourtChange:
; dismiss if no hazards on enemy's side
	ld a, [wEnemyScreens2]
	and a
	jp z, AIDismissMove
; discourage if hazards on player's side
	ld a, [wPlayerScreens2]
	and a
	jr nz, .discourage
; otherwise greatly encourage
	dec [hl]
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Endeavor:
; Do nothing if the player has < 25% hp
	call AICheckPlayerQuarterHP
	ret nc
; Encourage if the enemy has < 25% hp
	call AICheckEnemyQuarterHP
	ret c
	dec [hl]
	ret

AI_Smart_BurningEnvy:
; 80% chance to encourage this move if player is not burned or fire type
; and any of player's stat levels are above +0.
	ld a, [wBattleMonType1]
	cp FIRE
	ret z
	ld a, [wBattleMonType2]
	cp FIRE
	ret z
	ld a, [wBattleMonStatus]
	and 1 << BRN
	ret nz
; fallthrough

AI_Smart_SpectralThief:
AI_Smart_ClearSmog:
; 80% chance to encourage this move if any of player's stat levels are above +0.
	push hl
	ld hl, wPlayerAtkLevel
	ld c, NUM_LEVEL_STATS
.loop
	dec c
	jr z, .loop
	ld a, [hli]
	dec a
	cp BASE_STAT_LEVEL
	jr nc, .encourage
	jr .loop

.encourage
	pop hl
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Eruption:
; 80% chance to discourage this move is enemy is slower than player
	call AICompareSpeed
	ret c
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_TrickRoom:
; encourage if it benefits the enemy, otherwise discourage
	dec [hl]
	ld a, [wBattleArenaEffects]
	bit ARENA_TRICK_ROOM, a
	jr nz, .up

; discourage if enemy faster than player
	call AICompareSpeed
	ret nc
	inc [hl]
	inc [hl]
	ret

.up
; discourage if enemy slower than player
	call AICompareSpeed
	ret c
	inc [hl]
	inc [hl]
	ret

AI_Smart_PsychoShift:
; dismiss if enemy is not statused
	ld a, [wEnemyMonStatus]
	and a
	jp nz, AIDismissMove
; dismiss if player is statused
	ld a, [wBattleMonStatus]
	and a
	ret z
	jp AIDismissMove

AI_Smart_Synchronoise:
; dismiss move if player and enemy do not share type
	ld a, [wBattleMonType1]
	ld b, a
	ld a, [wBattleMonType2]
	ld c, a
	ld a, [wEnemyMonType1]
	cp b
	ret z
	cp c
	ret z
	ld a, [wEnemyMonType2]
	cp b
	ret z
	cp c
	ret z
	jp AIDismissMove

AI_Smart_VenomDrench:
; dismiss if player is not poisoned
; encourage otherwise
	dec [hl]
	ld a, [wBattleMonStatus]
	and 1 << PSN
	ret nz
	jp AIDismissMove

AI_Smart_FinalGambit:
; 50% chance to discourage if player hp below 25%
	call AICheckPlayerQuarterHP
	ret c
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Taunt:
; Greatly discourage if player has not shown a status move.
; Greatly encourage if player has shown a status move worth taunting.
; Otherwise do nothing.
	push hl
	ld hl, wPlayerUsedMoves
	ld e, 4
	ld d, 1

.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .next

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .next

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	ld hl, TauntMoves
	ld de, 1
	call IsInArray
	pop de
	pop hl
	jr c, .encourage

	inc d
.next
	dec e
	jr nz, .loop

; out of moves
	pop hl
	dec d
	ret nz
	inc [hl]
	inc [hl]
	ret

.encourage
; player has a status move which is worth taunting
	pop hl
	dec [hl]
	dec [hl]
	ret

INCLUDE "data/battle/ai/taunt_moves.asm"

AI_Smart_Memento:
; 80% chance to discourage if enemy hp above 50%
	call AICheckEnemyHalfHP
	ret nc
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Hail:
; Greatly discourage this move if the player is immune to Hail damage.
	ld a, [wBattleMonType1]
	cp ICE
	jr z, .greatly_discourage
	ld a, [wBattleMonType2]
	cp ICE
	jr z, .greatly_discourage

; Discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, .discourage

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c
	dec [hl]
	ret
.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

AI_Smart_SuckerPunch:
; 50% chance to discourage if enemy used this move last turn
	push hl
	ld hl, wLastEnemyCounterMove
	ld bc, SUCKER_PUNCH
	call CompareMove
	pop hl
	ret nz
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Spikes:
AI_Smart_StealthRocks:
AI_Smart_ToxicSpikes:
AI_Smart_StickyWeb:
; dismiss if the player is down to last mon
; otherwise 50% chance to encourage if the enemy has a phasing move
; otherwise 50% chance to encourage if its the enemys first turn
	push hl
	call AICheckLastPlayerMon
	pop hl
	jp z, AIDismissMove

	ld b, EFFECT_FORCE_SWITCH
	call AIHasMoveEffect
	jr c, .encourage

	ld b, EFFECT_FORCE_SWITCH_HIT
	call AIHasMoveEffect
	jr c, .encourage

	ld a, [wEnemyTurnsTaken]
	and a
	ret nz
	call AI_50_50
	ret nc
	dec [hl]
	ret

.encourage
	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_Snatch:
; Discourage if player has not shown a status move.
; Otherwise do nothing.
	push hl
	ld hl, wPlayerUsedMoves
	ld e, NUM_MOVES

.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .next

	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .end

.next
	dec e
	jr nz, .loop
; out of moves
	pop hl
	inc [hl]
	ret

.end
	pop hl
	ret

AI_Smart_TopsyTurvy:
	push hl
	ld hl, wPlayerAtkLevel
	ld b, NUM_LEVEL_STATS
	ld c, 100

; Calculate the sum of all player's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in c. c will range between 58 and 142.
.loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	add c
	ld c, a
	dec b
	jr nz, .loop

; Greatly discourage if player's stat levels are less or equal zero (on average).
	ld a, c
	dec a
	sub 100
	pop hl
	jr nc, .encourage
	inc [hl]
	inc [hl]
	ret

.encourage
; Else, 80% chance to encourage this move unless player's accuracy level is lower than -1.
	ld a, [wPlayerAccLevel]
	cp BASE_STAT_LEVEL - 1
	ret c
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Purify:
; Dismiss if player has no status
; Discourage if player is badly poisoned
; Otherwise treat like normal healing move.
	ld a, [wBattleMonStatus]
	and a
	jp z, AIDismissMove

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jp z, AI_Smart_Heal

	inc [hl]
	ret

AI_Smart_FakeOut:
; 80% chance to encourage if its the enemys first turn
	ld a, [wEnemyTurnsTaken]
	and a
	ret nz
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_StormThrow:
AI_Smart_WickedBlow:
; 80% chance to encourage this move if player has greater
; or equal def boost than enemy atk, because thats when
; EnemyAttackDamage uses unboosted stats for crits.
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	cp b
	ret c
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_FrostBreath:
; 80% chance to encourage this move if player has greater
; or equal sp.def boost than enemy sp.atk, because thats when
; EnemyAttackDamage uses unboosted stats for crits.
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
	cp b
	ret c
	call AI_80_20
	ret c
	dec [hl]
	ret

AIDeterminePhysicalSpecial:
; returns nc if move is special or status
; z if move is special
; c if move is physical
	and STATUS
	jr z, .from_type
	cp SPECIAL
	ret

.from_type
	cp SPECIAL_TYPES
	ret

AICompareSpeed:
; Return carry if enemy is faster than player.

	push bc
	ld a, [wEnemyMonSpeed + 1]
	ld b, a
	ld a, [wBattleMonSpeed + 1]
	cp b
	ld a, [wEnemyMonSpeed]
	ld b, a
	ld a, [wBattleMonSpeed]
	sbc b
	pop bc
	ret

AICheckPlayerMaxHP:
	push hl
	push de
	push bc
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	jr AICheckMaxHP

AICheckEnemyMaxHP:
	push hl
	push de
	push bc
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	; fallthrough

AICheckMaxHP:
; Return carry if hp at de matches max hp at hl.

	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_39269

	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .asm_39269

	pop bc
	pop de
	pop hl
	scf
	ret

.asm_39269
	pop bc
	pop de
	pop hl
	and a
	ret

AICheckPlayerHalfHP:
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AICheckEnemyHalfHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckEnemyQuarterHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckPlayerQuarterHP:
; returns nc if players hp below 25%
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AICheckPlayerEighthHP:
; returns nc if players hp below 12.5%
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AIHasMoveEffect:
; Return carry if the enemy has move with effect b.

	push hl
	ld hl, wEnemyMonMoves
	ld d, NUM_MOVES

.checkmove
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .no

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .yes

	dec d
	jr nz, .checkmove

.no
	pop hl
	and a
	ret

.yes
	pop hl
	scf
	ret

AIHasMoveInArray:
; Return carry if the enemy has a move in array hl.
; Called only by AI_Smart_WeatherMove

	push hl
	push de
	push bc

.next
	ld a, [hli]
	cp $ff
	jr z, .done

	ld b, a
	ld a, [hli]
	ld c, a
	ld d, NUM_MOVES + 1
	ld de, wEnemyMonMoves

.check
	dec d
	jr z, .next

	ld a, [de]
	inc de
	inc de
	cp b
	jr nz, .check
	dec de
	ld a, [de]
	inc de
	cp c
	jr nz, .check

	scf

.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/battle/ai/useful_moves.asm"

AI_Opportunist:
; Discourage stall moves when the enemy's HP is low.

; Do nothing if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	ret c

; Discourage stall moves if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	jr nc, .asm_39322

; 50% chance to discourage stall moves if enemy's HP is between 25% and 50%.
	call AI_50_50
	ret c

.asm_39322
	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	jr z, .asm_39347

	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	or b
	jr z, .asm_39347

	push hl
	push de
	push bc
	ld hl, StallMoves
	ld e, 1
	call IsWordInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	inc [hl]
	jr .checkmove

.asm_39347
	ret

INCLUDE "data/battle/ai/stall_moves.asm"


AI_Aggressive:
; Use whatever does the most damage.

; Discourage all damaging moves but the one that does the most damage.
; If no damaging move deals damage to the player (immune),
; no move will be discouraged

; Figure out which attack does the most damage and put it in c.
	ld hl, wEnemyMonMoves
	ld bc, 0
	ld de, 0
.checkmove
	inc b
	push bc
	ld a, b
	cp NUM_MOVES + 1
	jr z, .gotstrongestmove

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .gotstrongestmove

	push hl
	push de
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nodamage
	call AIDamageCalc
	pop de
	pop hl
	pop bc

; Update current move if damage is highest so far
	ld a, [wCurDamage + 1]
	cp e
	ld a, [wCurDamage]
	sbc d
	jr c, .checkmove

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld c, b
	jr .checkmove

.nodamage
	pop de
	pop hl
	pop bc
	jr .checkmove

.gotstrongestmove
; Nothing we can do if no attacks did damage.
	pop bc
	ld a, c
	and a
	jr z, .done

; Discourage moves that do less damage unless they're reckless too.
	ld hl, wBuffer1 - 1
	ld d, 0
	ld e, c
.checkmove2
	inc d
	ld a, d
	cp NUM_MOVES + 1
	jr z, .done

; Ignore this move if it is the highest damaging one.
	push hl
	push de
	ld e, d
	ld d, 0
	dec de
	ld hl, wEnemyMonMoves
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	pop de
	pop hl
	inc hl
	ld a, d
	cp e
	jr z, .checkmove2

	call AIGetEnemyMove

; Ignore this move if its power is 0 or 1.
; Moves such as Seismic Toss, Hidden Power,
; Counter and Fissure have a base power of 1.
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	cp 2
	jr c, .checkmove2

; Ignore this move if it is reckless.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, RecklessMoves
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .checkmove2

; If we made it this far, discourage this move.
	inc [hl]
	jr .checkmove2

.done
	ret

INCLUDE "data/battle/ai/reckless_moves.asm"

AIDamageCalc:
	ld a, 1
	ldh [hBattleTurn], a
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, ConstantDamageEffects
	call IsInArray
	jr c, .constant_d

	ld de, 1
	ld hl, VariableDamageEffects
	call IsInArray
	jr c, .variable_d

	callfar EnemyAttackDamage
	callfar BattleCommand_DamageCalc
	callfar BattleCommand_Stab
	ret

.constant_d
	callfar BattleCommand_ConstantDamage
	ret

.variable_d
	callfar BattleCommand_VariableDamage
	callfar BattleCommand_Stab
	ret

INCLUDE "data/battle/ai/constant_damage_effects.asm"

AI_Cautious:
; 90% chance to discourage moves with residual effects after the first turn.

	ld a, [wEnemyTurnsTaken]
	and a
	ret z

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.loop
	inc hl
	dec c
	ret z

	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	inc de
	or b
	ret z

	push hl
	push de
	push bc
	ld a, [de]
	ld c, a
	ld hl, ResidualMoves
	ld e, 1
	call IsWordInArray

	pop bc
	pop de
	pop hl
	jr nc, .loop

	call Random
	cp 90 percent + 1
	ret nc

	inc [hl]
	jr .loop

INCLUDE "data/battle/ai/residual_moves.asm"


AI_Status:
; Dismiss status moves that don't affect the player.

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	push bc
	ld a, [de]
	ld b, a
	inc de
	call AIGetEnemyMove
	pop bc

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_TOXIC
	jr z, .poisonimmunity
	cp EFFECT_POISON
	jr z, .poisonimmunity
	cp EFFECT_SLEEP
	jr z, .typeimmunity
	cp EFFECT_PARALYZE
	jr z, .typeimmunity

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove

	jr .typeimmunity

.poisonimmunity
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .immune
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .immune

.typeimmunity
	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr nz, .checkmove

.immune
	call AIDismissMove
	jr .checkmove


AI_Risky:
; Use any move that will KO the target.
; Risky moves will often be an exception (see below).

	ld hl, wBuffer1 - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	inc hl
	dec b
	ret z

	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	or c
	ret z

	ld a, [de]
	inc de
	push de
	push bc
	push hl
	ld b, a
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nextmove

; Don't use risky moves at max hp.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, RiskyEffects
	call IsInArray
	jr nc, .checkko

	call AICheckEnemyMaxHP
	jr c, .nextmove

; Else, 80% chance to exclude them.
	call Random
	cp 79 percent - 1
	jr c, .nextmove

.checkko
	call AIDamageCalc

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld a, [wBattleMonHP + 1]
	cp e
	ld a, [wBattleMonHP]
	sbc d
	jr nc, .nextmove

	pop hl
rept 5
	dec [hl]
endr
	push hl

.nextmove
	pop hl
	pop bc
	pop de
	jr .checkmove

INCLUDE "data/battle/ai/risky_effects.asm"


AI_None:
	ret

AIDismissMove:
	ld a, [hl]
	add 10
	ld [hl], a
	ret

AIGetEnemyMove:
; Load attributes of move a into ram

	push hl
	push de
	push bc
	dec bc
	ld hl, Moves
	ld a, MOVE_LENGTH
	call AddNTimes

	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	ld bc, MOVE_LENGTH
	call FarCopyBytes

	pop bc
	pop de
	pop hl
	ret

AI_80_20:
	call Random
	cp 20 percent - 1
	ret

AI_50_50:
	call Random
	cp 50 percent + 1
	ret
