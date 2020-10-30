BattleCommand_BurningEnvy:
; burningenvy

	farcall CheckSubstituteOpp
	jr nz, .failed
	xor a
	ld [wEffectFailed], a

	ld d, NUM_LEVEL_STATS
	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .stat_loop
	ld hl, wPlayerStatLevels
.stat_loop
	dec d
	jr z, .failed
	ld a, [hli]
	cp BASE_STAT_LEVEL + 1
	ret nc
	jr .stat_loop

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret