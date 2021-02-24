ValidateOTTrademon:
	ld a, [wd003]
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wd003]
	ld c, a
	ld b, 0
	ld hl, wOTPartySpecies
	add hl, bc
    add hl, bc
	ld a, [hli]
    ld c, a
    ld a, [hl]
    ld b, a
	pop hl
    ld a, c
	cp EGG
	jr z, .matching_or_egg
	call CompareMove
	jr nz, .abnormal

.matching_or_egg
	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL + 1
	jr nc, .abnormal
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr nz, .normal
	ld hl, wOTPartySpecies
	ld a, [wd003]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc

	; Magnemite and Magneton's types changed
	; from Electric to Electric/Steel.
	ld bc, MAGNEMITE
    call CompareMove
	jr z, .normal
	ld bc, MAGNETON
    call CompareMove
	jr z, .normal

    ld a, [hli]
	ld [wCurSpecies], a
    ld a, [hl]
	ld [wCurSpecies + 1], a
	call GetBaseData
	ld hl, wLinkOTPartyMonTypes
	add hl, bc
	add hl, bc
	ld a, [wBaseType1]
	cp [hl]
	jr nz, .abnormal
	inc hl
	ld a, [wBaseType2]
	cp [hl]
	jr nz, .abnormal

.normal
	and a
	ret

.abnormal
	scf
	ret

Functionfb5dd:
	ld a, [wd002]
	ld d, a
	ld a, [wPartyCount]
	ld b, a
	ld c, $0
.loop
	ld a, c
	cp d
	jr z, .next
	push bc
	ld a, c
	ld hl, wPartyMon1HP
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .done

.next
	inc c
	dec b
	jr nz, .loop
	ld a, [wd003]
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	jr nz, .done
	scf
	ret

.done
	and a
	ret
