; functions called by battle/core.asm
; relating to move selection

CheckEnemyTaunt:
; ret nz if taunt is preventing enemy from using a move
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TAUNTED, a
	ret z
	ld hl, wEnemyMonMoves
	ld bc, wEnemyMonPP
	ld a, [wEnemyDisableCount]
	swap a
	and $f
	ld d, a
	jr CheckAllTauntMoves

CheckPlayerTaunt:
; ret nz if taunt is preventing player from using a move
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TAUNTED, a
	ret z
	ld hl, wBattleMonMoves
	ld bc, wBattleMonPP
	ld a, [wPlayerDisableCount]
	swap a
	and $f
	ld d, a
;fallthrough

CheckAllTauntMoves:
; return z if user has a move which is not a status move,
; is not disabled, and has at least 1 pp
; nz otherwise
	ld e, NUM_MOVES
	push bc
.loop
; end if we have no more moves
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .no_usable_move
; skip if this move is disabled
	dec d
	jr z, .next
; skip if this move is a status move
	call IsMoveStatus
	jr nz, .next
; skip if this move has no pp
	pop bc
	ld a, [bc]
	and PP_MASK
	jr nz, .done
	push bc
.next
	pop bc
	inc bc
	push bc
	dec e
	jr nz, .loop
.no_usable_move
	pop bc
	ld a, 1
	and a
	ret
.done
; found a usable move
	xor a
	ret

EnemyCheckMoveForTaunt:
; a big-endian move index is in bc
; ret nz if this move is prevented by taunt
; preserves hl and bc
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TAUNTED, a
	ret z
	jr IsMoveStatus

PlayerCheckMoveForTaunt:
; a big-endian move index is in bc
; ret nz if this move is prevented by taunt
; preserves hl and bc
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TAUNTED, a
	ret z
;fallthrough

IsMoveStatus:
; ret nz if move is a status move
; bc contains big-endian move index
	push hl
	push bc
	dec bc
	ld hl, Moves + MOVE_TYPE
	ld a, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp STATUS
	pop bc
	pop hl
	jr nc, .status
	xor a
	ret

.status
	ld a, 1
	and a
	ret