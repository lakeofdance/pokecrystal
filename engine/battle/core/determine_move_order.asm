DetermineMoveOrder:
	ld a, [wLinkMode]
	and a
	jr z, .use_move
	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jr z, .use_move
	cp BATTLEACTION_SKIPTURN
	jr z, .use_move
	sub BATTLEACTION_SWITCH1
	jr c, .use_move
	ld a, [wBattlePlayerAction]
	cp BATTLEPLAYERACTION_SWITCH
	jr nz, .switch
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .player_2

	call BattleRandom
	cp 50 percent + 1
	jp c, .player_first
	jp .enemy_first

.player_2
	call BattleRandom
	cp 50 percent + 1
	jp c, .enemy_first
	jp .player_first

.switch
	callfar AI_Switch
	call SetEnemyTurn
	call DoHazardsEffects
	jp .enemy_first

.use_move
	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jp nz, .player_first
	call CompareMovePriority
	jr z, .equal_priority
	jp c, .player_first ; player goes first
	jp .enemy_first

.equal_priority
	call SetPlayerTurn
	callfar GetUserItem
	push bc
	callfar GetOpponentItem
	pop de
	ld a, d
	cp HELD_QUICK_CLAW
	jr nz, .player_no_quick_claw
	ld a, b
	cp HELD_QUICK_CLAW
	jr z, .both_have_quick_claw
	call BattleRandom
	cp e
	jr nc, .speed_check
	jp .player_first

.player_no_quick_claw
	ld a, b
	cp HELD_QUICK_CLAW
	jr nz, .speed_check
	call BattleRandom
	cp c
	jr nc, .speed_check
	jp .enemy_first

.both_have_quick_claw
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .player_2b
	call BattleRandom
	cp c
	jp c, .enemy_first
	call BattleRandom
	cp e
	jp c, .player_first
	jr .speed_check

.player_2b
	call BattleRandom
	cp e
	jp c, .player_first
	call BattleRandom
	cp c
	jp c, .enemy_first
	jr .speed_check

.speed_check
	call CompareBattlerSpeed
	jr z, .speed_tie
	jp nc, .player_first
	jp .enemy_first

.speed_tie
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .player_2c
	call BattleRandom
	cp 50 percent + 1
	jp c, .player_first
	jp .enemy_first

.player_2c
	call BattleRandom
	cp 50 percent + 1
	jp c, .enemy_first
.player_first
	scf
	ret

.enemy_first
	and a
	ret

CompareMovePriority:
; Compare the priority of the player and enemy's moves.
; Return carry if the player goes first, or z if they match.

	ld a, [wCurPlayerMove]
	ld b, a
	ld a, [wCurPlayerMove + 1]
	ld c, a
	call GetMovePriority
	ld b, a
	push bc
	ld a, [wCurEnemyMove]
	ld b, a
	ld a, [wCurEnemyMove + 1]
	ld c, a
	call GetMovePriority
	pop bc
	cp b
	ret

GetMovePriority:
; Return the priority (0-9) of move bc.

	ld hl, MovePriorities
	ld d, 0
	ld e, 2
	call IsWordInArray
	inc hl
	jr c, .done

	ld a, b
	ld b, c
	ld c, a
	dec bc
	ld hl, Moves + MOVE_EFFECT
	ld a, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a
	ld hl, MoveEffectPriorities
.loop
	ld a, [hli]
	cp b
	jr z, .done
	inc hl
	cp -1
	jr nz, .loop

	ld a, BASE_PRIORITY
	ret

.done
	ld a, [hl]
	ret

INCLUDE "data/moves/effects_priorities.asm"

IsMoveIncreasedPriority:
; returns nc if move has increased priority
	call GetMovePriority
	cp BASE_PRIORITY + 1
	ret
