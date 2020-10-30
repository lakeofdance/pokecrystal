; functions called by battle/core.asm

ApplyStatusEffectOnPlayerStats:
	ld a, 1
	jr ApplyStatusEffectOnStats

ApplyStatusEffectOnEnemyStats:
	xor a

ApplyStatusEffectOnStats:
	ldh [hBattleTurn], a
	call ApplyPrzEffectOnSpeed
	call ApplyBrnEffectOnAttack
	jp ApplyTailwindEffectOnSpeed

ApplyPrzEffectOnSpeed:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonStatus]
	and 1 << PAR
	ret z
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min speed

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonStatus]
	and 1 << PAR
	ret z
	ld hl, wEnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min speed

.enemy_ok
	ld [hl], b
	ret

ApplyBrnEffectOnAttack:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonStatus]
	and 1 << BRN
	ret z
	ld hl, wBattleMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min attack

.player_ok
	ld [hl], b
	ret

.enemy
	ld a, [wEnemyMonStatus]
	and 1 << BRN
	ret z
	ld hl, wEnemyMonAttack + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min attack

.enemy_ok
	ld [hl], b
	ret

ApplyTailwindEffectOnSpeed:
; double
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wPlayerScreens]
	bit SCREENS_TAILWIND, a
	ret z
	ld hl, wBattleMonSpeed + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
; max speed
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

.enemy
	ld a, [wEnemyScreens]
	bit SCREENS_TAILWIND, a
	ret z
	ld hl, wEnemyMonSpeed + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
; max speed
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret