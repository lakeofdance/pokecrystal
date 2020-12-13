BattleCommand_ConstantDamage:
; constantdamage

	ld hl, wBattleMonLevel
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wEnemyMonLevel

.got_turn
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jp z, .got_power

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_ENDEAVOR
	jr z, .endeavor

	cp EFFECT_FINAL_GAMBIT
	jr z, .final_gambit

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .got_power

.psywave
	ld a, b
	srl a
	add b
	ld b, a
.psywave_loop
	call BattleRandom
	and a
	jr z, .psywave_loop
	cp b
	jr nc, .psywave_loop
	ld b, a
	ld a, 0
	jr .got_power

.super_fang
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .got_power
	or b
	ld a, 0
	jr nz, .got_power
	ld b, 1
	jr .got_power

.final_gambit
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_final_gambit_hp
	ld hl, wEnemyMonHP
.got_final_gambit_hp
	ld a, [hli]
	ld b, [hl]
	jr .got_power

.endeavor
	ld de, wEnemyMonHP
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_endeavor_hp
	ld de, wBattleMonHP
	ld hl, wEnemyMonHP
.got_endeavor_hp
	ld a, [de]
	sub [hl]
	ld b, a
	jr c, .endeavor_fail
	jr nz, .endeavor_succeed
	inc de
	inc hl
	ld a, [de]
	sub [hl]
	jr z, .endeavor_fail
	jr nc, .endeavor_got_power
; fallthrough

.endeavor_fail
	ld a, 1
	ld [wAttackMissed], a
	ret

.endeavor_succeed
	inc de
	inc hl
	ld a, [de]
	sub [hl]
.endeavor_got_power
	push af
	ld a, b
	pop bc
; fallthrough

.got_power
	ld hl, wCurDamage
	ld [hli], a
	ld [hl], b
	ret
