DoHazardsEffects:
	call StealthRocksDamage
	call SpikesDamage
	call StickyWeb
;fallthrough

ToxicSpikesEffect:
	ld hl, wPlayerScreens2
	ld de, wBattleMonType
	ld bc, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens2
	ld de, wEnemyMonType
	ld bc, wEnemyMonItem
.ok

; no effect if no toxic spikes
	bit SCREENS_TOXIC_SPIKES_1, [hl]
	ret z

; doesn't affect flying types
	ld a, [de]
	inc de
	cp FLYING
	ret z
	ld a, [de]
	cp FLYING
	ret z

; poison types absorb toxic spikes
	ld a, [de]
	dec de
	cp POISON
	jr z, .absorb
	ld a, [de]
	cp POISON
	jr z, .absorb

; doesn't affect steel types
	ld a, [de]
	inc de
	cp STEEL
	ret z
	ld a, [de]
	cp STEEL
	ret z

; no effect if already statused
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz

; no effect if a held item prevents poison
	ld a, [bc]
	cp HELD_PREVENT_POISON
	ret z

; nothing else stops us
	ldh a, [hBattleTurn]
	and a
	ld de, wPlayerToxicCount
	ld bc, UpdatePlayerHUD
	jr z, .cool
	ld de, wEnemyToxicCount
	ld bc, UpdateEnemyHUD
.cool
	push bc
	bit SCREENS_TOXIC_SPIKES_2, [hl]
	jr z, .poison
; toxic poison
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	ld hl, BattleText_UserBadlyPoisonedByToxicSpikes ; "badly poisoned by TOXIC SPIKES!"
	jr .badlypoisoned
.poison
	ld hl, BattleText_UserPoisonedByToxicSpikes ; "poisoned by TOXIC SPIKES!"
.badlypoisoned
	call StdBattleTextbox
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	set PSN, [hl]
	call UpdateOpponentInParty
	pop hl
	call CallBattleCore
	jp WaitBGMap

.absorb
	res SCREENS_TOXIC_SPIKES_1, [hl]
	res SCREENS_TOXIC_SPIKES_2, [hl]
	ld hl, BattleText_UserAbsorbedToxicSpikes ; "absorbed TOXIC SPIKES!"
	jp StdBattleTextbox

SpikesDamage:
	ld hl, wPlayerScreens2
	ld de, wBattleMonType
	ld bc, UpdatePlayerHUD
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens2
	ld de, wEnemyMonType
	ld bc, UpdateEnemyHUD
.ok

	; Flying-types aren't affected by Spikes.
	ld a, [de]
	cp FLYING
	ret z
	inc de
	ld a, [de]
	cp FLYING
	ret z


; only SCREENS_SPIKES_1 set: 1 layer
; only SCREENS_SPIKES_2 set: 2 layers
; both set: 3 layers
	ld d, 2
	bit SCREENS_SPIKES_1, [hl]
	jr z, .twoOrNone
	bit SCREENS_SPIKES_2, [hl]
	jr z, .gotIt
	inc d
	inc d
	jr .gotIt

.twoOrNone
	bit SCREENS_SPIKES_2, [hl]
	ret z
	inc d
.gotIt
	push bc

	push de
	ld hl, BattleText_UserHurtBySpikes ; "hurt by SPIKES!"
	call StdBattleTextbox
	pop de

	ld hl, GetSixteenthMaxHP
	call CallBattleCore
	ld hl, 0
	ld a, d
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, SubtractHPFromTarget
	call CallBattleCore

	pop hl
	call CallBattleCore
	jp WaitBGMap

StealthRocksDamage:
	ld hl, wPlayerScreens2
	ld de, wBattleMonType
	ld bc, UpdatePlayerHUD
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens2
	ld de, wEnemyMonType
	ld bc, UpdateEnemyHUD
.ok

	bit SCREENS_STEALTH_ROCKS, [hl]
	ret z

	push bc

	; Stealth rocks care about matchup
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
; keep track of effectiveness
	ld d, 3
	ld hl, RocksDamage
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr z, .changematchup
	cp c
	jr z, .changematchup
	inc hl
	jr .loop

.changematchup
	ld a, [hli]
	cp EFFECTIVE
	jr z, .loop
	dec d
	cp SUPER_EFFECTIVE
	jr z, .loop
	inc d
	inc d
	cp NOT_VERY_EFFECTIVE
	jr z, .loop
; NO_EFFECT
	pop bc
	ret

.done
	push de
	ld hl, BattleText_UserHurtByRocks ; "hurt by ROCKS!"
	call StdBattleTextbox
	pop de

	ld hl, GetHalfMaxHP
	call CallBattleCore
.DamageLoop
	dec d
	jr z, .gotDamage
; halve result
	srl b
	rr c
; floor = 1
	ld a, c
	or b
	jr nz, .DamageLoop
	inc c

.gotDamage
	ld hl, SubtractHPFromTarget
	call CallBattleCore
	pop hl
	call CallBattleCore
	jp WaitBGMap

INCLUDE "data/types/rocks_damage.asm"

StickyWeb:
	ld hl, wPlayerScreens2
	ld de, wBattleMonType
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens2
	ld de, wEnemyMonType
.ok
	bit SCREENS_STICKY_WEB, [hl]
	ret z

; doesn't affect flying types
	ld a, [de]
	inc de
	cp FLYING
	ret z
	ld a, [de]
	cp FLYING
	ret z

	farcall LowerSpeedStat
	call SwitchTurn
	farcall BattleCommand_StatDownMessage
	call SwitchTurn
	farcall RecalcAllStats
	ret
