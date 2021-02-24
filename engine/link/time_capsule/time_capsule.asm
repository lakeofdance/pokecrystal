CheckTimeCapsuleCompatibility:
; Checks to see if your party is compatible with the Gen 1 games.
; Returns the following in wScriptVar:
; 0: Party is okay
; 1: At least one Pokémon was introduced in Gen 2
; 2: At least one Pokémon has a move that was introduced in Gen 2
; 3: At least one Pokémon is holding mail

; If any party Pokémon was introduced in the Gen 2 games, don't let it in.
	ld hl, wPartySpecies
	ld b, PARTY_LENGTH
.loop
	ld a, [hl]
	cp -1
	jr z, .checkitem
    push bc
	ld bc, JOHTO_POKEMON
    call CompareMove
    pop bc
	jr nc, .mon_too_new
	dec b
	jr nz, .loop

; If any party Pokémon is holding mail, don't let it in.
.checkitem
	ld a, [wPartyCount]
	ld b, a
	ld hl, wPartyMon1Item
.itemloop
	push hl
	push bc
	ld d, [hl]
	farcall ItemIsMail
	pop bc
	pop hl
	jr c, .mon_has_mail
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec b
	jr nz, .itemloop

; If any party Pokémon has a move that was introduced in the Gen 2 games, don't let it in.
	ld hl, wPartyMon1Moves
	ld a, [wPartyCount]
	ld b, a
.move_loop
	ld c, NUM_MOVES
.move_next
    push bc
	ld bc, STRUGGLE + 1
    call CompareMove
    pop bc
	jr nc, .move_too_new
    inc hl
    inc hl
	dec c
	jr nz, .move_next
	ld de, PARTYMON_STRUCT_LENGTH - NUM_MOVES
	add hl, de
	dec b
	jr nz, .move_loop
	xor a
	jr .done

.mon_too_new
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld a, $1
	jr .done

.move_too_new
	push bc
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetMoveName
	call CopyName1
	pop bc
	call Function29c67
	ld a, $2
	jr .done

.mon_has_mail
	call Function29c67
	ld a, $3

.done
	ld [wScriptVar], a
	ret

Function29c67:
	ld a, [wPartyCount]
	sub b
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ret

EnterTimeCapsule:
	ld c, 10
	call DelayFrames
	ld a, $4
	call Link_EnsureSync
	ld c, 40
	call DelayFrames
	xor a
	ldh [hVBlank], a
	inc a
	ld [wLinkMode], a
	ret
