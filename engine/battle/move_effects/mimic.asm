BattleCommand_Mimic:
; mimic

	farcall ClearLastMove
	farcall BattleCommand_MoveDelay
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wEnemyMonMoves
.player_turn
	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld c, a
	inc hl
	ld a, [hl]
	ld b, a
	pop hl
	ld a, c
	and a
	jr z, .fail
	sub STRUGGLE
	or b
	jr z, .fail
	ld d, NUM_MOVES
.check_already_knows_move
	call CompareMove2
	jr z, .fail
	inc hl
	inc hl
	dec d
	jr nz, .check_already_knows_move
	ld d, NUM_MOVES
	push bc
	ld bc, MIMIC
.find_mimic
	dec hl
	dec hl
	dec d
	call CompareMove2
	jr nz, .find_mimic
	pop bc
	ld a, c
	ld [hli], a
	ld [wNamedObjectIndexBuffer], a
	ld a, b
	ld [hl], a
	ld [wNamedObjectIndexBuffer + 1], a
	ld hl, wBattleMonPP
	ld b, 0
	ld c, d
	add hl, bc
	ld [hl], 5
	call GetMoveName
	farcall AnimateCurrentMove
	ld hl, LearnedMoveText
	jp StdBattleTextbox

.fail
	farcall FailMimic
	ret
