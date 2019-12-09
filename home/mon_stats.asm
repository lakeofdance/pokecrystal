IsAPokemon::
; Return carry if species a is not a Pokemon.
;
	push hl
	ld hl, NUM_POKEMON	;big-endian??
; First, if the upper byte of x is greater than that of NUM_POKEMON then we are def wrong.
	inc de
	ld a, [de]
	and a
	jr z, .nothingtosee
	dec a
	cp h
	jr nc, .NotAPokemon
.nothingtosee
; But still it might be that the upper bytes are equal but NUM_POKEMON < x. Let's check.
	dec de
	ld a, [de]
	and a
	dec a
	cp l
	jr nc, .NotAPokemon
; That's great, but there are still a couple of boxes to tick.
;
	and a
	jr z, .NotAPokemon
	cp $ff
	jr z, .NotAPokemon
	cp EGG
	jr z, .Pokemon
; We are here if the lower byte is not EGG, $ff, or 0. 
; Since we already compared to NUM_POKEMON, we can conclude that all is good.

;	cp NUM_POKEMON + 1
;	jr c, .Pokemon
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
