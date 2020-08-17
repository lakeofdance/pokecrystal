DisplayUsedMoveText:
; battle command 03
	ld hl, UsedMoveText
	call BattleTextbox
	jp WaitBGMap

UsedMoveText:
; this is a stream of text and asm from 105db9 to 105ef6
	text_far _ActorNameText
	text_asm
	ldh a, [hBattleTurn]
	and a
	jr nz, .start

	push bc
	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	ld b, a
	ld a, [wPlayerMoveStruct + MOVE_ANIM2]
	ld c, a
	call UpdateUsedMoves
	pop bc

.start
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr

	push hl
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, [hli]
	ld [wMoveGrammar], a
	ld a, [hl]
	ld [wMoveGrammar + 1], a
	pop hl

	push hl
	farcall CheckUserIsCharging
	pop hl
	jr nz, .grammar

	; update last move
	ld a, [wMoveGrammar]
	ld [hli], a
	ld [de], a
	ld a, [wMoveGrammar + 1]
	inc de
	ld [hl], a
	ld [de], a

.grammar
	call GetMoveGrammar ; convert move id to grammar index

; everything except 'instead' made redundant in localization

	; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	ld hl, UsedMove2Text
	ret nz

	; check move grammar
	ld a, [wMoveGrammar]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret

UsedMove1Text:
	text_far _UsedMove1Text
	text_asm
	jr UsedMoveText_CheckObedience

UsedMove2Text:
	text_far _UsedMove2Text
	text_asm
UsedMoveText_CheckObedience:
; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	jr z, .GetMoveNameText
; print "instead,"
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text_far _UsedInsteadText
	text_asm
.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText:
	text_far _MoveNameText
	text_asm
; get start address
	ld hl, .endusedmovetexts

; get move id
	ld a, [wMoveGrammar]

; 2-byte pointer
	add a

; seek
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc

; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.endusedmovetexts
; entries correspond to MoveGrammar sets
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text

EndUsedMove1Text:
	text_far _EndUsedMove1Text
	text_end

EndUsedMove2Text:
	text_far _EndUsedMove2Text
	text_end

EndUsedMove3Text:
	text_far _EndUsedMove3Text
	text_end

EndUsedMove4Text:
	text_far _EndUsedMove4Text
	text_end

EndUsedMove5Text:
	text_far _EndUsedMove5Text
	text_end

GetMoveGrammar:
; store move grammar type in wMoveGrammar

	push bc
; wMoveGrammar contains move id
	ld a, [wMoveGrammar]
	ld c, a ; move id
	ld b, 0 ; grammar index

; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp -1
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at 0
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wMoveGrammar now contains move grammar
	ld a, b
	ld [wMoveGrammar], a

; we're done
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"

UpdateUsedMoves:
; append move bc to wPlayerUsedMoves unless it has already been used

	push de
; start of list
	ld hl, wPlayerUsedMoves
; move id is in bc
; next count
	ld e, NUM_MOVES

.loop
; get move from the list
	ld a, [hli]
	ld d, a
	ld a, [hl]
; not used yet?
	or d
	jr z, .add
; already used?
	push de
	ld a, [hl]
	sub c
	ld e, a
	ld a, d
	sub b
	or e
	pop de
	jr z, .quit
; next move
	dec e
	inc hl
	jr nz, .loop

; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, wPlayerUsedMoves + 2
rept 6
	ld a, [hld]
	dec hl
	ld [hli], a
	inc hl
	inc hl
endr
; new move
	dec hl
.add
	dec hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
.quit
; list updated
	pop de
	ret
