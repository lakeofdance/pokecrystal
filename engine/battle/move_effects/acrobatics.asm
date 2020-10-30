BattleCommand_Acrobatics:
; acrobatics
; doubles damage if the user has no item
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonItem
	jr z, .gotit
	ld hl, wEnemyMonItem
.gotit
	ld a, [hl]
	and a
	jp z, DoubleDamage2
	ret


