BattleCommand_SleepTalk:
; sleeptalk

	farcall ClearLastMove
	ld a, [wAttackMissed]
	and a
	jp nz, .fail
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonMoves + 2
	ld a, [wDisabledMove]
	ld b, a
	ld a, [wDisabledMove + 1]
	ld de, wDisabledMove
	or b
	jr z, .got_moves
	ld hl, wEnemyMonMoves + 2
	ld de, wEnemyDisabledMove
.got_moves
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	call .safely_check_has_usable_move
	jr c, .fail
;Point to first move
	dec hl
	dec hl
.sample_move
	push hl
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	pop hl
; Reject move == 0
	or c
	jr z, .sample_move
	ld a, BATTLE_VARS_MOVE_ANIM
	push hl
	call GetBattleVarAddr
	call CompareMove2
	pop hl
	jr z, .sample_move
; Reject disabled move
	ld h, d
	ld l, e
	call CompareMove2
	jr z, .sample_move
; Reject move that takes two turns
	call .check_two_turn_move
	jr z, .sample_move
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	farcall CheckUserIsCharging
	jr nz, .charging
	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
.charging
	farcall LoadMoveAnim
	farcall UpdateMoveData
	farcall ResetTurn
	ret

.fail
	farcall AnimateFailedMove
	farcall TryPrintButItFailed
	ret

.safely_check_has_usable_move
	push hl
	push de
	push bc
	call .check_has_usable_move
	pop bc
	pop de
	pop hl
	ret

.check_has_usable_move
; Returns no carry if user has at least one move which:
; is not disabled,
; is not sleep talk,
; doesn't have any of the effects listed in .check_two_turn_move.
	ldh a, [hBattleTurn]
	and a
	ld a, [wDisabledMove]
	ld c, a
	ld a, [wDisabledMove + 1]
	ld b, a
	jr z, .got_move_2

	ld a, [wDisabledMove]
	ld c, a
	ld a, [wDisabledMove + 1]
	ld b, a
.got_move_2
;	ld a, BATTLE_VARS_MOVE
;	call GetBattleVar
;	ld c, a
;Point to first move
	dec hl
	dec hl
	ld d, NUM_MOVES
.loop2
; Check for 0
	ld a, [hli]
	ld e, a
	ld a, [hld]
	or e
	jr z, .carry

; Check whether move is disabled
	call CompareMove2
	jr z, .nope
	push bc
; Check whether move is sleep talk
	ld bc, SLEEP_TALK
	call CompareMove2
	pop bc
	jr z, .nope

	call .check_two_turn_move
	jr nz, .no_carry

.nope
	inc hl
	inc hl
	dec d
	jr nz, .loop2

.carry
	scf
	ret

.no_carry
	and a
	ret

.check_two_turn_move
	push hl
	push de
	push bc

	ld b, a
	callfar GetMoveEffect
	ld a, b

	pop bc
	pop de
	pop hl

	cp EFFECT_SKULL_BASH
	ret z
	cp EFFECT_RAZOR_WIND
	ret z
	cp EFFECT_SKY_ATTACK
	ret z
	cp EFFECT_SOLARBEAM
	ret z
	cp EFFECT_FLY
	ret z
	cp EFFECT_BIDE
	ret
