AIConsiderMegaEvolution:
; Wildmons can't mega evolve.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

; Can't mega evolve if there is no move choice
	farcall CheckEnemyLockedIn
	ret nz

; AI behaviour is determined by scoring pointers
	ld hl, TrainerClassAttributes + TRNATTR_AI_MOVE_WEIGHTS

; Battle Tower AI is always taken from the first class (Falkner)
	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .battle_tower_skip

	ld a, [wTrainerClass]
	dec a
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes

.battle_tower_skip
; check whether we have each scoring pointer, and if so call its function
	lb bc, CHECK_FLAG, 0
	push bc
	push hl

.CheckLayer:
	pop hl
	pop bc

	ld a, c
	cp 16 ; up to 16 scoring layers
	jr z, .done

	push bc
	ld d, BANK(TrainerClassAttributes)
	predef SmallFarFlagAction
	ld d, c
	pop bc

	inc c
	push bc
	push hl

	ld a, d
	and a
	jr z, .CheckLayer

	ld hl, AIScoringPointers_Mega
	dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_

	jr .CheckLayer

.done
	ret

AIScoringPointers_Mega:
; entries correspond to AI_* constants
	dw AIMega_Basic
	dw AIMega_Ignore     ;setup
	dw AIMega_Ignore     ;types
	dw AIMega_Offensive
	dw AIMega_Smart
	dw AIMega_Ignore     ;opportunist
	dw AIMega_Aggressive
	dw AIMega_Ignore     ;cautious
	dw AIMega_Ignore     ;status
	dw AIMega_Ignore     ;risky
	dw AIMega_Ignore     ;ai_10
	dw AIMega_Ignore     ;ai_11
	dw AIMega_Ignore     ;ai_12
	dw AIMega_Ignore     ;ai_13
	dw AIMega_Ignore     ;ai_14
	dw AIMega_Ignore     ;ai_15

AIMega_Ignore:
; no effect on mega evolution
	ret

AIMega_Basic:
; check whether mega evolution is possible
; without basic ai, the enemy cannot mega evolve
	farcall CanEnemyMegaEvolve
	ld hl, wMegaAction
	jr nz, .dont
	set ENEMY_CAN_MEGA, [hl]
	ret
.dont
	res ENEMY_CAN_MEGA, [hl]
	res ENEMY_WILL_MEGA, [hl]
	ret

AIMega_Offensive:
; if possible, mega evolve
	ld hl, wMegaAction
	bit ENEMY_CAN_MEGA, [hl]
	ret z
	set ENEMY_WILL_MEGA, [hl]
	ret

AIMega_Aggressive:
; chance to mega evolve if the mega form gains an offensive boost
; 80% chance if speed and either ak or sp.atk are increased
; 50% chance if only atk or sp.atk increase, but speed is unchanged
; 20% chance if either ak or sp.atk increase and speed decreases
	ld hl, wMegaAction
	bit ENEMY_CAN_MEGA, [hl]
	ret z
; if its already been decided, we neednt bother check
	bit ENEMY_WILL_MEGA, [hl]
	ret nz
; load mega base data into wCurBaseData
	farcall AI_GetMegaBaseData
; compare attack
	ld hl, wBaseAttack
	ld a, [wEnemyMonBaseStats]
	cp [hl]
	jr c, .speed
; compare special attack
	ld hl, wBaseSpecialAttack
	ld a, [wEnemyMonBaseStats + 3]
	cp [hl]
	ret nc

.speed
; compare speed
	ld hl, wBaseSpeed
	ld a, [wEnemyMonBaseStats + 2]
	cp [hl]
	ld hl, wMegaAction
	jr c, .high_chance ; speed increase
	jr nc, .low_chance ; speed decrease
; 50% chance to mega
	call AI_50_50
	ret c
	set ENEMY_WILL_MEGA, [hl]
	ret

.low_chance
; 20% chance to mega
	call AI_80_20
	ret nc
	set ENEMY_WILL_MEGA, [hl]
	ret

.high_chance
; 80% chance to mega
	call AI_80_20
	ret c
	set ENEMY_WILL_MEGA, [hl]
	ret

AIMega_Smart:
; Mega evolve unless the mega gains a type disadvantage against
; the players used moves. If no moves have been used, check mon
; types instead.
	ld hl, wMegaAction
	bit ENEMY_CAN_MEGA, [hl]
	ret z
; if its already been decided, we neednt bother check
	bit ENEMY_WILL_MEGA, [hl]
	ret nz
; In most situations, it is worthwhile mega evolving.
; The exception is if the mega gains a type disadvantage.
	farcall AI_GetMegaBaseData
	call AIMega_CheckMatchup
	ld a, d
	cp 4
	ret c
; if no type disadvantage compared to current, then mega
	ld hl, wMegaAction
	set ENEMY_WILL_MEGA, [hl]
	ret

AIMega_CheckMatchup:
; outputs d between 0 and 8
; lower d means mega has a worse matchup than non
; 4 is neutral
	ld d, 4
; If the player has used moves, we use those to compare matchup.
; Otherwise we compare pokemon types directly.
	ld hl, wPlayerUsedMoves
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .UsePlayerType ; unknown moves

	ld e, NUM_MOVES
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	ret z ; no more moves
	push hl
	dec bc
	ld hl, Moves + MOVE_POWER
	ld a, MOVE_LENGTH
	call AddNTimes
	call AI_GetMoveByte
	and a
	jr z, .next

; inc hl to point at type
	inc hl
	call AI_GetMoveByte
	call AI_DoTypeMatchup
.next
	pop hl
	dec e
	ret z ; checked all 4 player moves
	jr .loop

.UsePlayerType:
	ld a, [wBattleMonType]
	call AI_DoTypeMatchup
	ld a, [wBattleMonType2]
; fallthrough

AI_DoTypeMatchup:
; Compares effectiveness of type a against
; enemy mon before and after mega.
	and TYPE_MASK
	push af
	ld hl, wEnemyMonType
	call AI_CheckTypeMatchup
	ld b, a
	pop af
	ld hl, wBaseType
	call AI_CheckTypeMatchup
	cp b
	ret z	; equal
	jr c, .inc_d
	dec d	; mega worse
	ret
.inc_d
	inc d	; mega better
	ret

AI_CheckTypeMatchup:
; Checks how effective type a is against
; the types in [hl] and [hl+1].
; Larger output means more effective.
	push de
	push bc
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld e, 2
	ld hl, AI_TypeMatchups
.TypesLoop
	ld a, [hli]
	cp -1
	jr z, .end	; no more types to check
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope
	inc hl
.Nope2
	inc hl
	jr .TypesLoop

.Yup
	ld a, [hli]
	cp NO_EFFECT
	jr z, .no_effect
	dec e
	cp NOT_VERY_EFFECTIVE
	jr z, .TypesLoop
; super effective
	inc e
	inc e
	jr .TypesLoop
.no_effect
	ld e, 0
.end
	ld a, e
	pop bc
	pop de
	ret

AI_GetMoveByte:
	ld a, BANK(Moves)
	jp GetFarByte
