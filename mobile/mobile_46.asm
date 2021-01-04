AddMobileMonToParty:
	ld hl, wPartyCount
	ld a, [hl]
	ld e, a
	inc [hl]

	ld a, [wMobileMonSpeciesPointerBuffer]
	ld l, a
	ld a, [wMobileMonSpeciesPointerBuffer + 1]
	ld h, a
	inc hl
	ld bc, wPartySpecies
	ld d, e
.loop1
	inc bc
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [wCurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
;Used only for oddegg, which has 0 upper byte
	xor a
	ld [bc], a
	inc bc
;
	ld a, $ff
	ld [bc], a

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wMobileMonSpeciesBuffer], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld a, [wMobileMonStructurePointerBuffer]
	ld l, a
	ld a, [wMobileMonStructurePointerBuffer + 1]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld a, [wMobileMonOTNamePointerBuffer]
	ld l, a
	ld a, [wMobileMonOTNamePointerBuffer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld a, [wMobileMonNicknamePointerBuffer]
	ld l, a
	ld a, [wMobileMonNicknamePointerBuffer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld e, l
	ld d, h
	ld a, [wMobileMonMailPointerBuffer]
	ld l, a
	ld a, [wMobileMonMailPointerBuffer + 1]
	ld h, a
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes

	call CloseSRAM
	ret
