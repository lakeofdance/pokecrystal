BattleCommand_Metronome:
; metronome

	farcall ClearLastMove
	farcall CheckUserIsCharging
	jr nz, .asm_3742b

	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a

.asm_3742b
	farcall LoadMoveAnim

.GetMove:
	call BattleRandomMove

; None of the moves in MetronomeExcepts.
	push bc
	ld de, 1
	ld hl, MetronomeExcepts
	call IsWordInArray
	pop bc
	jr c, .GetMove

; No moves the user already has.
	call CheckUserMoveLE
	jr z, .GetMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], c
	inc hl
	ld [hl], b
	farcall UpdateMoveData
	farcall ResetTurn
	ret

BattleRandomMove:
; returns little endian move in bc
; if NUM_ATTACKS is greater than 256 x 4, increase the rept count.
.GetMoveLoop
	call BattleRandom
	ld c, a
	ld b, 0
	ld hl, 0
rept 4
	add hl, bc
endr
	push hl
	call BattleRandom
	and 3
	ld c, a
	pop hl
	add hl, bc

; is hl a bad move?
	ld a, l
	and a
	jr z, .GetMoveLoop
	cp $ff
	jr z, .GetMoveLoop

; last thing to check: is hl too big?
	ld de, NUM_ATTACKS
	ld a, d
	cp h
	jr c, .GetMoveLoop
	jr nz, .ok
	ld a, e
	cp l
	jr c, .GetMoveLoop
.ok
	ld c, h
	ld b, l
	ret	

INCLUDE "data/moves/metronome_exception_moves.asm"
