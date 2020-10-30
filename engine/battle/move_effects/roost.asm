BattleCommand_Roost:
; roost
	ld a, [wEffectFailed]
	and a
	ret nz

	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, [hl]
	cp FLYING
	call z, .losetype
	inc hl
	ld a, [hl]
	cp FLYING
	call z, .losetype
	ret

.losetype:
	ld a, ROOST_TYPE
	ld [hl], a
	ret
