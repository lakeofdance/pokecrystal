BattleCommand_SetTerrain:
; setterrain
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld bc, ELEC_TERAIN
	call CompareMove
	ld b, 1 << ARENA_ELECTRIC_TERRAIN
	ld de, ElectricTerrainText
	jr z, .set_terrain

	ld bc, GRASS_TERAIN
	call CompareMove
	ld b, 1 << ARENA_GRASSY_TERRAIN
	ld de, GrassyTerrainText
	jr z, .set_terrain

	ld bc, MISTY_TERAIN
	call CompareMove
	ld b, 1 << ARENA_MISTY_TERRAIN
	ld de, MistyTerrainText
	jr z, .set_terrain

	ld bc, PSYCH_TERAIN
	call CompareMove
	ld b, 1 << ARENA_PSYCHIC_TERRAIN
	ld de, PsychicTerrainText
	jr z, .set_terrain

	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret

.set_terrain
	ld a, [wBattleArenaEffects]
	and %1110000
	or b
	ld [wBattleArenaEffects], a
	ld a, 5
	ld [wTerrainCount], a
	farcall AnimateCurrentMove
	ld h, d
	ld l, e
	jp StdBattleTextbox
