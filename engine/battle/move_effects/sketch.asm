BattleCommand_Sketch:
; sketch

	farcall ClearLastMove
; Don't sketch during a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	farcall AnimateFailedMove
	jp PrintNothingHappened

.not_linked
; If the opponent has a substitute up, fail.
	farcall CheckSubstituteOpp
	jp nz, .fail
; If the opponent is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .fail
; Get the user's moveset in its party struct.
; This move replacement shall be permanent.
; Pointer will be in de.
	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
; Get the battle move structs.
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld [wNamedObjectIndexBuffer], a
	ld c, a
	inc hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	ld b, a
	pop hl
; Fail if move is invalid or is Struggle.
	ld a, c
	and a
	jp z, .fail
	sub STRUGGLE
	or b
	jp z, .fail
; Fail if user already knows that move
; Fist save de, won't get popped for a long time
	push de
	ld d, NUM_MOVES
.does_user_already_know_move
	call CompareMove2
	jp z, .knows_move
	inc hl
	inc hl
	dec d
	jr nz, .does_user_already_know_move
	jr .doesnt_know_move
.knows_move
	pop de
	jp .fail
.doesnt_know_move
; Find Sketch in the user's moveset.
; Pointer in hl, and index in c.
	push bc
; put the move index into d
	ld d, NUM_MOVES
.find_sketch
	dec hl
	dec hl
	dec d
	ld bc, SKETCH
	call CompareMove2
	jr nz, .find_sketch
	pop bc
; The Sketched move is loaded to that slot.
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
; Copy the base PP from that move.
	push bc
	push hl
	dec bc
	ld hl, Moves + MOVE_PP
	call GetMoveAttr2
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
;Recall which move we are looking at, and subtract the offset, because pp is one byte
	ld e, a
	ld a, l
	sub d
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	dec hl
	ld a, e
	ld [hl], a
	pop bc

	ldh a, [hBattleTurn]
	and a
	jr z, .user_trainer
	ld a, [wBattleMode]
	dec a
	jr nz, .user_trainer
; wildmon
	ld a, [hl]
	push bc
	ld hl, wWildMonPP
	ld b, 0
;Get the right offset
	ld c, d
	add hl, bc
	ld [hl], a
	ld hl, wWildMonMoves
	add hl, bc
	add hl, bc
	pop bc
	ld [hl], c
	inc hl
	ld [hl], b
	pop de
	jr .done_copy

.user_trainer
	ld l, d
	ld h, 0
	ld a, e
; Finally popping de
	pop de
	push hl
	add hl, hl
	push af
	add hl, de
	ld a, c
	ld [hli], a
	ld a, b
	ld [hld], a
	pop af
	ld de, MON_PP - MON_MOVES
	add hl, de
	pop de
	push af
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	pop af
;
	ld [hl], a
.done_copy
	call GetMoveName
	farcall AnimateCurrentMove

	ld hl, SketchedText
	jp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farcall PrintDidntAffect
	ret
