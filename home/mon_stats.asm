IsAPokemon::
; Return carry if species pointed to by de is not a Pokemon.
; de points to the lower byte
; and de + 1 to the upper
	push hl
	ld hl, NUM_POKEMON	;big-endian
; Upper
	inc de
	ld a, [de]
	cp h
	dec de
	ld a, [de]
	jr z, .equal
	jr c, .strictly_less
	jr .NotAPokemon		;strictly greater

.equal
; Lower
	dec a
	cp l
	jr nc, .NotAPokemon

.strictly_less
	and a
	jr z, .NotAPokemon
	cp $ff
	jr z, .NotAPokemon
;	cp EGG
;	jr z, .Pokemon
; EGG returns pokemon anyway
	jr .Pokemon

.NotAPokemon:
	pop hl
	scf
	ret

.Pokemon:
	pop hl
	and a
	ret

DrawBattleHPBar::
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc

; Place 'HP:'
	ld a, $60
	ld [hli], a
	ld a, $61
	ld [hli], a

; Draw a template
	push hl
	ld a, $62 ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	ld a, $6b ; bar end
	add b
	ld [hl], a
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, $6a ; full bar
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, $62  ; empty bar
	add e      ; + e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret

PrepMonFrontpic::
	ld a, $1
	ld [wBoxAlignment], a

_PrepMonFrontpic::
	ld a, [wCurPartySpecies]
	push de
	ld de, wCurPartySpecies
	call IsAPokemon
	pop de
	jr c, .not_pokemon

	push hl
	ld de, vTiles2
	predef GetMonFrontpic
	pop hl
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a
	ret

.not_pokemon
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [wCurPartySpecies], a
	ret
