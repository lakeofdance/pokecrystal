BattleCommand_Tailwind:
; tailwind

	ld hl, wPlayerScreens
	ld de, wPlayerTailwindCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemyTailwindCount
.ok
	bit SCREENS_TAILWIND, [hl]
	jp nz, .already_set
	set SCREENS_TAILWIND, [hl]
.already_set
	ld a, 4
	ld [de], a
	farcall AnimateCurrentMove
	ld hl, SetTailwindText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	jp z, .enemy
	farcall CalcPlayerStats
	ret
.enemy
	farcall CalcEnemyStats
	ret
