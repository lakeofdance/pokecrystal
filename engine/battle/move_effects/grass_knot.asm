GrassKnotEffect:
; returns move power in [hl]
	ld hl, wBattleMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_species
	ld hl, wEnemyMonSpecies
.got_species
	; uses code from heavy_slam.asm
	call GetMonWeight

	; get move power
	ld hl, GrassKnotPower
.loop
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .got_power
	call CompareMove
	jr c, .got_power
	inc hl
	inc hl
	inc hl
	jr .loop

.got_power
	inc hl
	inc hl
	ret
