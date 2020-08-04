GiveDratini:
; if wScriptVar is 0 or 1, change the moveset of the last Dratini in the party.
;  0: give it a special moveset with Extremespeed.
;  1: give it the normal moveset of a level 15 Dratini.

	ld a, [wScriptVar]
	cp $2
	ret nc
	ld bc, wPartyCount
	ld a, [bc]
	ld hl, MON_SPECIES
	call .GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
.CheckForDratini:
; start at the end of the party and search backwards for a Dratini
	inc hl
	ld a, [hld]
	ld b, a
	ld a, [hl]
	sub DRATINI
	or b
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForDratini
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Movesets
	ld bc, .Moveset1 - .Moveset0
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de
	inc de
	ld b, 1

.GiveMoves:
	ld a, [hli]
	ld c, a
	ld a, [hld]
	or c 	; is the move 00?
	ret z 	; if so, we're done here

	push hl
	push de
	push bc
	; give the Pokémon the new move
	ld a, [hli]
	ld [de], a
	ld c, a
	inc de
	ld a, [hl]
	ld [de], a
	ld b, a

	; get the PP of the new move
	ld a, MOVE_LENGTH
	dec bc
	ld hl, Moves + MOVE_PP
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc

	; get the address of the move's PP and update the PP
	ld c, a
	ld hl, MON_PP - MON_MOVES
	add hl, de
	ld a, l
	sub b
	ld l, a
	ld a, h
	sbc 0
	ld h, a
	ld a, c
	ld [hl], a

	pop de
	pop hl
	inc de
	inc de
	inc hl
	inc hl
	inc b
	jr .GiveMoves

.Movesets:
.Moveset0:
; Dratini does not normally learn Extremespeed. This is a special gift.
	dw WRAP
	dw THUNDER_WAVE
	dw TWISTER
	dw EXTREMESPEED
	dw 0
.Moveset1:
; This is the normal moveset of a level 15 Dratini
	dw WRAP
	dw LEER
	dw THUNDER_WAVE
	dw TWISTER
	dw 0

.GetNthPartyMon:
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, wPartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret

.EmptyParty:
	scf
	ret
