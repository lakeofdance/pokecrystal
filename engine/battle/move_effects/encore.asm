BattleCommand_Encore:
; encore

	ld hl, wEnemyMonMoves
	ld de, wEnemyEncoreCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMoves
	ld de, wPlayerEncoreCount
.ok
	push hl
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVarAddr
	ld c, a
	inc hl
	ld a, [hl]
	ld b, a
	pop hl

	ld a, c
	and a
	jp z, .failed
	sub STRUGGLE
	or b
	jp z, .failed
	ld a, c
	sub ENCORE
	or b
	jp z, .failed
	ld a, c
	sub MIRROR_MOVE
	or b
	jp z, .failed

	push de
	dec hl
	dec hl
	ld d, $ff
.not_got_move
	inc d
	inc hl
	inc hl
	call CompareMove2
	jr nz, .not_got_move

	ld b, 0
	ld c, d
	pop de
	ld hl, wEnemyMonPP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok2
	ld hl, wBattleMonPP
.ok2
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jp z, .failed
	ld a, [wAttackMissed]
	and a
	jp nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jp nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	farcall CheckOpponentWentFirst
	jr nz, .finish_move
	ldh a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move

	push hl
	push de
	ld a, [wLastPlayerMove]
	ld c, a
	ld a, [wLastPlayerMove + 1]
	ld b, a
	ld d, 0
	ld hl, wBattleMonMoves - 2
.find_player_move
	inc hl
	inc hl
	call CompareMove2
	jr z, .got_player_move
	inc d
	ld a, d
	cp NUM_MOVES
	jr c, .find_player_move
	pop de
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_player_move
	ld a, d
	ld [wCurMoveNum], a
	ld a, c
	ld [wCurPlayerMove], a
	ld a, b
	ld [wCurPlayerMove + 1], a
	pop de
	pop hl
	dec bc
	ld de, wPlayerMoveStruct
	farcall GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	push de
	ld a, [wLastEnemyMove]
	ld c, a
	ld a, [wLastEnemyMove + 1]
	ld b, a
	ld d, 0
	ld hl, wEnemyMonMoves - 2
.find_enemy_move
	inc hl
	inc hl
	call CompareMove2
	jr z, .got_enemy_move
	inc d
	ld a, d
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop de
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_enemy_move
	ld a, d
	ld [wCurEnemyMoveNum], a
	ld a, c
	ld [wCurEnemyMove], a
	ld a, b
	ld [wCurEnemyMove + 1], a
	pop de
	pop hl
	dec bc
	ld de, wEnemyMoveStruct
	farcall GetMoveData

.finish_move
	farcall AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextbox

.failed
	farcall PrintDidntAffect2
	ret
