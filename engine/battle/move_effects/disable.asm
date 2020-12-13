BattleCommand_Disable:
; disable

	ld a, [wAttackMissed]
	and a
	jp nz, .failed

	ld de, wEnemyDisableCount
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld de, wPlayerDisableCount
	ld hl, wBattleMonMoves
.got_moves

	ld a, [de]
	and a
	jr nz, .failed

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
	jr z, .failed
	sub STRUGGLE
	or b
	jr z, .failed

	push de
	ld e, $ff
	dec hl
	dec hl
.loop
	inc hl
	inc hl
	inc e
	call CompareMove
	jr nz, .loop
	ld c, e
	pop de

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonPP
	jr z, .got_pp
	ld hl, wBattleMonPP
.got_pp
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .failed
.loop2
	call BattleRandom
	and 7
	jr z, .loop2
	inc a
	inc c
	swap c
	add c
	ld [de], a
	farcall AnimateCurrentMove
	ld hl, wDisabledMove
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_disabled_move_pointer
	inc hl
	inc hl
.got_disabled_move_pointer
	inc hl
	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld [wNamedObjectIndexBuffer], a
	inc hl
	ld a, [hl]
	pop hl
	ld [hld], a
	ld [wNamedObjectIndexBuffer + 1], a
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	call GetMoveName
	ld hl, WasDisabledText
	jp StdBattleTextbox

.failed
	farcall FailMove
	ret
