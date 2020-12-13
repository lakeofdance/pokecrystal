BattleCommand_TopsyTurvy:
; topsyturvy

	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .pointers_correct
	ld hl, wPlayerStatLevels
.pointers_correct
	push hl
	ld b, NUM_LEVEL_STATS
; If any of the opponent's stats is modified from its base level,
; the move succeeds.  Otherwise, it fails.
.loop
	ld a, [hli]
	cp BASE_STAT_LEVEL
	jr nz, .break
	dec b
	jr nz, .loop
	pop hl
	call AnimateFailedMove
	jp PrintButItFailed

.break
	pop hl
	ld b, NUM_LEVEL_STATS
.loop2
	ld a, BASE_STAT_LEVEL * 2
	ld b, [hl]
	sub b
	ld [hli], a
	dec b
	jr nz, .loop2
	ldh a, [hBattleTurn]
	and a
	jr z, .calc_enemy_stats
	call CalcPlayerStats
	jr .merge

.calc_enemy_stats
	call CalcEnemyStats
.merge
	call AnimateCurrentMove
	ld hl, InvertedStatsText
	jp StdBattleTextbox
