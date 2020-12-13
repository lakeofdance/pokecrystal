BattleCommand_BugBite:
; bugbite
	call CheckOpponentBerry
	ret nc

; Save berry, which we will use later to get its effect from ItemAttributes.
	ld [wCurItem], a
	push bc

; Delete opponent's held berry.
	call EnemyItem
	ldh a, [hBattleTurn]
	and a
	jr z, .got_it
	call PlayerItem

.got_it
	xor a
	ld [hl], a
	ld [de], a

; Recovery anim, as in ItemRecoveryAnim of battle/core
	callfar EmptyBattleTextbox
	ld a, RECOVER
	ld [wFXAnimID], a
	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	predef PlayBattleAnim

; Load effect and parameter of berry a into b and c respectively.
	ld a, [wCurItem]
	ld b, a
	callfar GetItemHeldEffect

	pop de
; Apply the berry's effect to the user.
	ld a, d
	ld hl, BugBiteBerryEffects
	rst JumpTable

; "User ate Target's Berry!"
	ld a, [wCurItem]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, PlayerAteEnemyBerryText
	ldh a, [hBattleTurn]
	and a
	jr z, .got_text
	ld hl, EnemyAtePlayerBerryText
.got_text
	jp StdBattleTextbox

BugBiteBerryEffects:
; Corresponds to BerryItems in data/items/berry_items
	dw BugBite_HealStatus       ; PSNCUREBERRY
	dw BugBite_HealStatus       ; PRZCUREBERRY
	dw BugBite_HealStatus       ; BURNT_BERRY
	dw BugBite_HealStatus       ; ICE_BERRY
	dw BugBite_HealConfusion    ; BITTER_BERRY
	dw BugBite_HealStatus       ; MINT_BERRY
	dw BugBite_HealStatus       ; MIRACLE_BERRY
	dw BugBite_RestorePP        ; MYSTERYBERRY
	dw BugBite_RestoreHP        ; BERRY
	dw BugBite_RestoreHP        ; GOLD_BERRY

BugBite_HealStatus:
	ld a, b
	ld de, 2
	ld hl, BugBite_HeldStatusHealingEffects
	call IsInArray
	ret nc ; safety net
	inc hl
	ld b, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	or b
	xor b
	ld [hl], a

	call UpdateUserInParty
	call RefreshBattleHuds

	ld hl, CalcPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_it
	ld hl, CalcEnemyStats
.got_it
	ld a, BANK(CalcPlayerStats)
	rst FarCall
	ret

BugBite_HeldStatusHealingEffects:
	db HELD_HEAL_POISON,   1 << PSN
	db HELD_HEAL_FREEZE,   1 << FRZ
	db HELD_HEAL_BURN,     1 << BRN
	db HELD_HEAL_SLEEP,    SLP
	db HELD_HEAL_PARALYZE, 1 << PAR
	db HELD_HEAL_STATUS,   ALL_STATUS
	db -1 ; end

BugBite_HealConfusion:
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret z
	res SUBSTATUS_CONFUSED, [hl]
	ret

BugBite_RestorePP:
	ld hl, wBattleMonPP
	ld de, wBattleMonMoves
	ld bc, wPartyMon1Moves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_it
	ld hl, wEnemyMonPP
	ld de, wEnemyMonMoves
	ld bc, wOTPartyMon1Moves
.got_it
	push bc
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0

	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, [hl]
	ld c, a

; Cant hardcode bug bite's max pp, because it could be called
; by mirror move, sleep talk, or metronome.
	ld hl, Moves + MOVE_PP
	call GetMoveAttr2
	ld b, a
	call .compute_max_hp
	ld a, [de]
	and PP_MASK
	cp b
	pop hl	; points to partymon moves
	ret nc  ; dont restore pp if it is already maxed out

	add 5
	cp b
	jr c, .got_new_pp
; Adding 5 would exceed max, so we just get max
	ld a, b

.got_new_pp
; take pp-ups into account
	push af
	ld a, [de]
	and PP_UP_MASK
	ld b, a
	pop af
	or b

	ld [de], a
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
; We don't want to increase mimic's pp if we used it to learn bug bite.
	push hl
	push bc
	add hl, bc
	add hl, bc
	ld bc, MIMIC
	call CompareMove
	pop bc
	pop hl
	ret z

	add hl, bc
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	ld a, [de]
	ld [hl], a
	ret	

.compute_max_hp:
; Computes max pp, taking pp-ups into account.
; b contains base max pp of current move
; de points to pp of current move
	push bc
	; Divide the base PP by 5.
	ld a, b
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; Get the number of PP ups, which is the top 2 bits of the pp value.
	ld a, [de]
	ld b, a
	swap a
	and $f
	srl a
	srl a
	pop bc
	ld c, a
	; If this value is 0, there are no pp ups
	and a
	ret z

.loop
	; Only increase by 7 for moves with base 40 pp
	ldh a, [hQuotient + 3]
	cp $8
	jr c, .okay
	ld a, $7

.okay
	add b
	ld b, a
	dec c
	jr nz, .loop
	ret

BugBite_RestoreHP:
	xor a
	ldh [hDividend], a
	ld a, c
	ldh [hDividend + 1], a
	jp Battle_RestoreHP
