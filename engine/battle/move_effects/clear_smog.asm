BattleCommand_ResetFoeStats:
; resetfoestats

	ld a, [wAttackMissed]
	and a
	ret nz

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr nz, .gotfoe
	ld hl, wEnemyStatLevels
.gotfoe
	ld a, 7 ; neutral
	call .Fill

	ldh a, [hBattleTurn]
	push af
	and a
	jr nz, .gotpho
	call SetEnemyTurn
	call CalcEnemyStats
	jr .done
.gotpho
	call SetPlayerTurn
	call CalcPlayerStats

.done
	pop af
	ldh [hBattleTurn], a

	ld hl, EliminatedFoesStatsText
	jp StdBattleTextbox

.Fill:
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret