GetBaseData::
	push bc
	push de
	push hl
	ldh a, [hROMBank]
	push af
	ld a, BANK(BaseData)
	rst Bankswitch
	ld hl, BaseData

; We might need to be in the second bank
	ld de, BASE_BANK_SWITCH
	ld a, [wCurSpecies + 1]
	cp d
	jr c, .noswitch
	ld a, [wCurSpecies]
	cp e
	jr c, .noswitch
	ld a, BANK(BaseData2)
	rst Bankswitch
	ld hl, BaseData2
	ld a, [wCurSpecies]
	dec de
	sub e
	ld c, a
	ld a, [wCurSpecies + 1]
	sbc d
	ld b, a
;we don't need to check for egg here, it's assumed less than BASE_BANK_SWITCH
	jr .haveswitched
.noswitch	

; Egg doesn't have BaseData
	ld a, [wCurSpecies]
	cp EGG
	jr z, .egg

; Get BaseData
	ld c, a
	ld a, [wCurSpecies + 1]
	ld b, a
.haveswitched
	dec bc
	ld a, BASE_DATA_SIZE
;
	call AddNTimes
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes
	jr .end

.egg
; Sprite dimensions
	ld b, $55 ; 5x5
	ld hl, wBasePicSize
	ld [hl], b

.end
; Replace Pokedex # with species
	ld a, [wCurSpecies]
	ld [wBaseDexNo], a
	ld a, [wCurSpecies + 1]
	ld [wBaseDexNo + 1], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNick::
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames

GetNick::
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, wStringBuffer1

	push de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de

	callfar CorrectNickErrors

	pop bc
	pop hl
	ret
