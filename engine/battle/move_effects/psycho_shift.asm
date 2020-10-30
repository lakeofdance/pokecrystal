BattleCommand_PsychoShift:
; psychoshift
; fails if opp has safeguard
	call SafeCheckSafeguard
	jr nz, .fail
; fails if opp is already statused
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jr nz, .fail
	ld b, h
	ld c, l
; fails if user has no status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	and a
	jr z, .fail
; each status has its own particular fail conditions
	push hl
	push bc
	call CheckStatusCompatibility
	pop bc
	pop hl
	jr z, .fail

; now we're good
	push de
	ld a, [hl]
; if we are sleeping the opp, sleep turns are reset
	cp $8
	jr nc, .not_sleep
; random number of sleep turns
	ld d, $7
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld d, $3
.random_loop
	call BattleRandom
	and d
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
.not_sleep
	ld [bc], a
	xor a
	ld [hl], a
	call AnimateCurrentMove
	call UpdateBattleMonInParty
	call UpdateEnemyMonInParty
	pop de
; battle anim is in de
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
; recalc burn or para effects on stats
	call RecalcAllStats
	ld hl, TransferredStatusText
	jp StdBattleTextbox

.fail
	call AnimateFailedMove
	jp PrintButItFailed

CheckStatusCompatibility:
; return z if opponent is immune to the user's current status
	bit PSN, [hl]
	jr nz, .poison
	bit BRN, [hl]
	jr nz, .burn
; passing freeze is in theory not possible
; but it doesn't hurt to be thorough
	bit FRZ, [hl]
	jr nz, .freeze
	bit PAR, [hl]
	jr nz, .para
; sleep
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	ret z
	ld de, ANIM_SLP
	jr .end
	
.poison
	ld b, POISON
	call CheckTypeMatch
	ret z
	ld b, STEEL
	call CheckTypeMatch
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_POISON
	ret z
	ld de, ANIM_PSN
	jr .end
	
.burn
	ld b, FIRE
	call CheckTypeMatch
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_BURN
	ret z
	ld de, ANIM_BRN
	jr .end

.freeze
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	ld b, ICE
	call CheckTypeMatch
	ret z
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_FREEZE
	ret z
	ld de, ANIM_FRZ
	jr .end

.para
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_PARALYZE
	ret z
	ld de, ANIM_PAR
; fallthrough

.end
	ld a, 1
	and a
	ret

CheckTypeMatch:
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wBattleMonType1
.got_type
	ld a, b
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret