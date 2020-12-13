BattleCommand_BrickBreak:
;brickbreak
	call ClearOpponentScreens
	jp nz, DoubleDamage2
	ret

ClearOpponentScreens:
; returns nz if opponent had screens up
	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ld de, .your
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount
	ld de, .enemy
.got_screens_pointer
	bit SCREENS_LIGHT_SCREEN, [hl]
	jr z, .no_light_screen
	res SCREENS_LIGHT_SCREEN, [hl]
	xor a
	ld [bc], a
	push hl
	ld hl, wStringBuffer1
	call CopyName2
	ld hl, BattleText_MonsLightScreenFell
	call StdBattleTextbox
	pop hl

.no_light_screen
	inc bc
	bit SCREENS_REFLECT, [hl]
	jr z, .no_reflect
	res SCREENS_REFLECT, [hl]
	xor a
	ld [bc], a
	push hl	
	ld hl, wStringBuffer1
	call CopyName2
	ld hl, BattleText_MonsReflectFaded
	call StdBattleTextbox
	pop hl

.no_reflect
	inc bc
	bit SCREENS_AURORA_VEIL, [hl]
	ret z
	res SCREENS_AURORA_VEIL, [hl]
	xor a
	ld [bc], a	
	ld hl, wStringBuffer1
	call CopyName2
	ld hl, BattleText_MonsAuroraVeilFell
	call StdBattleTextbox
	ld a, 1
	and a
	ret

.your:
	db "Your@"
.enemy:
	db "Enemy@"
