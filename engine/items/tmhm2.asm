CanLearnTMHMMove:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld a, [wCurPartySpecies + 1]
	ld [wCurSpecies + 1], a
	call GetBaseData
	ld hl, wBaseTMHM
	push hl

	ld a, [wPutativeTMHMMove]
	ld d, a
	ld a, [wPutativeTMHMMove + 1]
	ld e, a
	ld c, 0
	ld hl, TMHMMoves
.loop
	ld a, [hli]
	and a
	jr z, .end
	sub d
	ld b, a
	ld a, [hli]
	cp e
	or b
	jr z, .asm_11659
	inc c
	jr .loop

.asm_11659
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef SmallFarFlagAction
	pop de
	ret

.end
	pop hl
	ld c, 0
	ret

GetTMHMMove:
	ld a, [wTempTMHM]
	dec a
	ld hl, TMHMMoves
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTempTMHM], a
	ld a, [hl]
	ld [wTempTMHM + 1], a
	ret

INCLUDE "data/moves/tmhm_moves.asm"
