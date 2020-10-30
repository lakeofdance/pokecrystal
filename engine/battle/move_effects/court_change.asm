BattleCommand_CourtChange:
; courtchange
	ld hl, wPlayerScreens
	ld de, wEnemyScreens
	call .swap
	ld hl, wPlayerScreens2
	ld de, wEnemyScreens2
	call .swap
	ld hl, SwappedHazardsText
	jp StdBattleTextbox

.swap:
	ld a, [hl]
	ld b, a
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	ret
