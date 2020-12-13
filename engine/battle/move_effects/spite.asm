BattleCommand_Spite:
; spite

	ld a, [wAttackMissed]
	and a
	jp nz, .failed
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
; Check whether a move was used which can be spited
	push hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVarAddr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	or c
	pop hl
	jr z, .failed
	ld a, c
	sub STRUGGLE
	or b
	jr z, .failed
	ld e, -1
	dec hl
	dec hl
.loop
	inc hl
	inc hl
	inc e
	call CompareMove
	jr nz, .loop
	ld a, c
	ld [wNamedObjectIndexBuffer], a
	ld a, b
	ld [wNamedObjectIndexBuffer + 1], a
	ld d, 0
	push bc
	ld b, 0
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	pop bc
	ld a, [hl]
	and PP_MASK
	jr z, .failed
	push bc
	call GetMoveName
	; lose 2-5 PP
	call BattleRandom
	and %11
	inc a
	inc a
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, de
	ld b, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ldh a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, de
.not_wildmon
	ld [hl], b
.transformed
	push de
	farcall AnimateCurrentMove
	pop de
	ld a, d
	ld [wDeciramBuffer], a
	ld hl, SpiteEffectText
	jp StdBattleTextbox

.failed
	farcall PrintDidntAffect2
	ret
