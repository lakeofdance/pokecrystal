BattleCommand_StealOpponentsBoosts:
; stealopponentsboosts

	ld d, NUM_LEVEL_STATS
	ld e, 1
	ld hl, wEnemyStatLevels -1 
	ld bc, wPlayerStatLevels - 1
	ldh a, [hBattleTurn]
	and a
	jr z, .next_stat
	ld hl, wPlayerStatLevels - 1
	ld bc, wEnemyStatLevels - 1
.next_stat
	inc hl
	inc bc
	dec d
	jr z, .done
.steal_loop
	ld a, [hl]
	cp BASE_STAT_LEVEL + 1
	jr c, .next_stat
	call .steal_boost
	inc e
	jr .steal_loop

.done
	dec e
	ret z
	call RecalcAllStats
	ld c, 40
	call DelayFrames
	ld hl, StoleStatBoostsText
	jp StdBattleTextbox

.steal_boost:
	dec [hl]
	ld a, [bc]
	cp MAX_STAT_LEVEL
	ret nc
	inc a
	ld [bc], a
	ret
