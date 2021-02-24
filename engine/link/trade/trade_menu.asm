InitTradeMenuDisplay:
	call ClearScreen
	call LoadTradeScreenBorder
	farcall InitTradeSpeciesList
	xor a
	ld hl, wOtherPlayerLinkMode
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, 1
	ld [wMenuCursorY], a
	inc a
	ld [wPlayerLinkAction], a
	jp LinkTrade_PlayerPartyMenu

LinkTradeMenu:
	call .MenuAction
	call .GetJoypad
	ret

.GetJoypad:
	push bc
	push af
	ldh a, [hJoyLast]
	and D_PAD
	ld b, a
	ldh a, [hJoyPressed]
	and BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret

.MenuAction:
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ldh a, [hBGMapMode]
	push af
	call .loop
	pop af
	ldh [hBGMapMode], a
	ret

.loop
	call .UpdateCursor
	call .UpdateBGMapAndOAM
	call .loop2
	jr nc, .done
	farcall _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .done
	call .GetJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop

.done
	ret

.UpdateBGMapAndOAM:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret

.loop2
	call RTC
	call .TryAnims
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loop2
	and a
	ret

.UpdateCursor:
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $1f
	jr nz, .not_currently_selected
	ld a, [wCursorOffCharacter]
	ld [hl], a
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], a
	pop bc
	pop hl

.not_currently_selected
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	dec b
	jr z, .skip
.loop3
	add c
	dec b
	jr nz, .loop3

.skip
	ld c, SCREEN_WIDTH
	call AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .skip2
.loop4
	add c
	dec b
	jr nz, .loop4

.skip2
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $1f
	jr z, .cursor_already_there
	ld [wCursorOffCharacter], a
	ld [hl], $1f
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], $1f
	pop bc
	pop hl
.cursor_already_there
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret

.TryAnims:
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_anims
	farcall PlaySpriteAnimationsAndDelayFrame
.skip_anims
	call JoyTextDelay
	call .GetJoypad
	and a
	ret z
	scf
	ret
