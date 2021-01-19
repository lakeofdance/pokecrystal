AddBattleTowerMonToParty:
; based on TryAddMonToParty

; hl is pointing to the data in BattleTowerMons.
; de is pointing to wBT_OTTrainerMon1, 2, or 3.
	; Copy species
	ld a, [hli]
	ld [wBTCurSpecies], a
	ld [de], a
	inc de
	ld a, [hli]
	ld [wBTCurSpecies + 1], a
	ld [de], a
	inc de
	call BTGetBaseData

	; Copy held item.
	ld a, [hli]
	ld [de], a
	inc de

	push de

	; Copy moves.
	ld bc, (NUM_MOVES * 2)
	call CopyBytes

	; Set ID, exp. to zero.
	xor a
	ld b, (MON_DVS - MON_ID)
.loop
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	; Copy stat exp. (gen II equivalent of EVs)
	ld bc, wBTStatExperience
rept NUM_STATS
	ld a, [hli]
	ld [bc], a
	inc bc
endr

	; Copy DVs
	ld a, [hli]
	ld [de], a
	ld [wBTDVs], a
	inc de
	ld a, [hli]
	ld [de], a
	ld [wBTDVs + 1], a
	inc de

	; Generate PP
	ld b, h
	ld c, l
	pop hl
	push bc
	call BTFillPP
	pop hl

	; Copy happiness.
	ld a, [hli]
	ld [de], a
	inc de

	xor a
	; PokerusStatus
	ld [de], a
	inc de
	; CaughtData/CaughtTime/CaughtLevel
	ld [de], a
	inc de
	; CaughtGender/CaughtLocation
	ld [de], a
	inc de

	; Copy level
	ld a, [hli]
	ld [wBTCurLevel], a ; used to calc stats
	ld [de], a
	inc de

	xor a
	; Status
	ld [de], a
	inc de
	; Unused
	ld [de], a
	inc de

	push hl  ; points to nickname

	; Generate stats from level and base data.
	ld hl, wBTStatExperience
	call BTCalcMonStats

	pop hl

	; Copy nickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret

BTFillPP:
; hl points to move list, already filled.
; de points to pp list, to be filled.
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .next
	push hl
	push de
	push bc
	ld c, a
	ld b, [hl]
	dec bc
	ld hl, Moves
	ld a, MOVE_LENGTH
	call AddNTimes
	ld bc, MOVE_PP
	add hl, bc
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop de
	pop hl

.next
	inc hl
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

BTGetBaseData:
	ld a, [wBTCurSpecies]
	ld b, a
	ld a, [wBTCurSpecies + 1]
	ld c, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurBaseData)
	ldh [rSVBK], a
	ld a, b
	ld [wCurSpecies], a
	ld a, c
	ld [wCurSpecies + 1], a
	call GetBaseData
	pop af
	ldh [rSVBK], a
	ret

BTCalcMonStats:
; Calculates: hp, maxhp, atk, def, speed, spatk, spdef.
; de points to where the final stats will be saved.
; hl points to wBTStatExperience

; First calc HP
	ld c, STAT_HP
	call .CalcSingleStat
; and Max HP
	call .SaveStat
; Now loop through the rest
	ld c, STAT_ATK - 1
.loop
	inc c
	call .CalcSingleStat
	ld a, c
	cp STAT_SDEF ; last stat
	jr nz, .loop
	ret

.CalcSingleStat:
	call BTCalcMonStatC

.SaveStat:
	ldh a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ldh a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ret

BTCalcMonStatC:
; temp, for testing
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc

	push hl
	ld hl, wBaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, 0
	add hl, bc

; Need to do this bank switching so that battle tower can use this function
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurBaseData)
	ldh [rSVBK], a

	ld a, [hl]
	ld e, a

	pop af
	ldh [rSVBK], a
	pop hl

; Take stat exp into account
	add hl, bc
	dec hl
	ld a, [hl]
	ld b, a

	ld hl, wBTDVs
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 | (DV_DEF & 1) << 2 | (DV_SPD & 1) << 1 | (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and 1
	add a
	add a
	add a
	ld b, a
	ld a, [hli]
	and 1
	add a
	add a
	add b
	ld b, a
	ld a, [hl]
	swap a
	and 1
	add a
	add b
	ld b, a
	ld a, [hl]
	and 1
	add b
	pop bc
	jr .GotDV

.Attack:
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense:
	ld a, [hl]
	and $f
	jr .GotDV

.Speed:
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special:
	inc hl
	ld a, [hl]
	and $f

.GotDV:
; if base HP is 1, then HP should always be 1
	push af
	ld a, c
	cp STAT_HP
	jr nz, .continue
	ld a, e
	cp 1
	jr nz, .continue
	ld a, 1
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 1], a
	pop af
	jp .stat_value_okay
.continue
	pop af
	ld d, 0
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplicand + 1], a
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [wBTCurLevel]
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 1]
	ldh [hDividend + 0], a
	ldh a, [hProduct + 2]
	ldh [hDividend + 1], a
	ldh a, [hProduct + 3]
	ldh [hDividend + 2], a
	ld a, 100
	ldh [hDivisor], a
	ld a, 3
	ld b, a
	call Divide
	ld a, c
	cp STAT_HP
	ld a, STAT_MIN_NORMAL
	jr nz, .not_hp
	ld a, [wBTCurLevel]
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hMultiplicand + 2], a
	jr nc, .no_overflow_3
	ldh a, [hQuotient + 2]
	inc a
	ldh [hMultiplicand + 1], a

.no_overflow_3
	ld a, STAT_MIN_HP

.not_hp
	ld b, a
	ldh a, [hQuotient + 3]
	add b
	ldh [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ldh a, [hQuotient + 2]
	inc a
	ldh [hMultiplicand + 1], a

.no_overflow_4
	ldh a, [hQuotient + 2]
	cp HIGH(MAX_STAT_VALUE + 1) + 1
	jr nc, .max_stat
	cp HIGH(MAX_STAT_VALUE + 1)
	jr c, .stat_value_okay
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE + 1)
	jr c, .stat_value_okay

.max_stat
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hMultiplicand + 1], a
	ld a, LOW(MAX_STAT_VALUE)
	ldh [hMultiplicand + 2], a

.stat_value_okay
	pop bc
	pop de
	pop hl
	ret
