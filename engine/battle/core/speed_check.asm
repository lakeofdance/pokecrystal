; function called by battle/core.asm

CompareBattlerSpeed:
; ret z if speed tie
; ret nc if player moves first
; ret c if enemy moves first
	ld hl, wBattleArenaEffects
	bit ARENA_TRICK_ROOM, [hl]
	jr nz, .inverse_speed_check
	ld de, wBattleMonSpeed
	ld hl, wEnemyMonSpeed
	ld c, 2
	jp CompareBytes

.inverse_speed_check
	ld de, wEnemyMonSpeed
	ld hl, wBattleMonSpeed
	ld c, 2
	jp CompareBytes