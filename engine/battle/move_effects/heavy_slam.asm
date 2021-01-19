HeavySlamEffect:
; returns move power in b
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_species
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
.got_species
	; user weight
	call GetMonWeight
	; target weight
	push bc
	ld h, d
	ld l, e
	call GetMonWeight
	pop de
.loop
; we want 8-bit weight values
; the ratio of target weight to user weight is (almost) preserved
	ld a, d
	or b
	jr z, .get_ratio
	srl b
	rr c
	srl d
	rr e
	jr .loop

.get_ratio
; if c = 0, max power
	ld a, c
	and a
	jr z, .max_power
; if e = 0, min power
	ld a, e
	and a
	jr z, .min_power
; divide a by c, that is, user weight by target weight
	call SimpleDivide
.skip_divide
	ld hl, HeavySlamPower - 1
.loop2
	inc hl
	ld a, [hli]
	and a
	jr z, .gotit
	ld c, a
	ld a, b
	cp c
	jr c, .loop2
.gotit
	ld b, [hl]
	jr .check_minimize

.max_power
	ld b, 120
	jr .check_minimize

.min_power
	ld b, 40

.check_minimize
; double power if opponent is minimized
; so up to a max of 240
	ld hl, wEnemyMinimized
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerMinimized
.ok
	ld a, [hl]
	and a
	ret z
	ld a, b
	add a
	ld b, a
	ret

GetMonWeight:
; returns big-endian weight in bc
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	farcall GetDexEntryPointer
	ld h, d
	ld l, e

	; skip species name
.loop
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop

	; skip height
	inc hl
	inc hl

	; load weight into bc
	call GetFarByte
	ld c, a
	inc hl
	call GetFarByte
	ld b, a
	ret
