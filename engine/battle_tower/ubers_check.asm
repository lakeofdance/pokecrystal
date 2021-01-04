BattleTower_UbersCheck:
	ldh a, [rSVBK]
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .level_70_or_more
	ld a, $1
	ldh [rSVBK], a
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartySpecies
	ld a, [wPartyCount]
.loop
	push af
	call .UberCheck
	jr nc, .next
; uber
	ld a, [hl]
	cp 70
	jr c, .uber_under_70
.next
	add hl, bc
	inc de
	inc de
	pop af
	dec a
	jr nz, .loop
.level_70_or_more
	pop af
	ldh [rSVBK], a
	and a
	ret

.uber_under_70
	pop af
	ld a, [de]
	ld [wNamedObjectIndexBuffer], a
	inc de
	ld a, [de]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wcd49
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wcf66], a
	pop af
	ldh [rSVBK], a
	scf
	ret

.UberCheck:
; return c if uber
	push bc
	push hl
	push de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	ld e, 1
	ld hl, BattleTowerUbers
	call IsWordInArray
	pop de
	pop hl
	pop bc
	ret

INCLUDE "data/battle_tower/ubers.asm"
