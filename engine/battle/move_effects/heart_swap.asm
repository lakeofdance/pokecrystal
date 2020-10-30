BattleCommand_HeartSwap:
; heartswap

	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ld b, NUM_LEVEL_STATS
.loop2
	ld a, [de]
	push af
	ld a, [hl]
	ld [de], a
	pop af
	ld [hli], a 
	inc de
	dec b
	jr nz, .loop2
	call RecalcAllStats
	call AnimateCurrentMove
	ld hl, SwappedStatsText
	jp StdBattleTextbox
