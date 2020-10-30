BattleCommand_ClearHazards:
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_leeched
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextbox
.not_leeched

	ld hl, wPlayerScreens2
	ld de, wPlayerWrapCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_wrap
	ld hl, wEnemyScreens2
	ld de, wEnemyWrapCount
	push de
.got_screens_wrap
	bit SCREENS_SPIKES_1, [hl]
	jr nz, .spikes
	bit SCREENS_SPIKES_2, [hl]
	jr z, .no_spikes
.spikes
	res SCREENS_SPIKES_1, [hl]
	res SCREENS_SPIKES_2, [hl]
	push hl
	ld hl, BlewSpikesText
	call StdBattleTextbox
	pop hl
.no_spikes
	bit SCREENS_STEALTH_ROCKS, [hl]
	jr z, .no_rocks
	res SCREENS_STEALTH_ROCKS, [hl]
	push hl
	ld hl, BlewRocksText
	call StdBattleTextbox
	pop hl
.no_rocks
	bit SCREENS_TOXIC_SPIKES_1, [hl]
	jr z, .no_toxic_spikes
	res SCREENS_TOXIC_SPIKES_1, [hl]
	res SCREENS_TOXIC_SPIKES_2, [hl]
	push hl
	ld hl, BlewTSpikesText
	call StdBattleTextbox
	pop hl
.no_toxic_spikes
	bit SCREENS_STICKY_WEB, [hl]
	jr z, .no_webs
	res SCREENS_STICKY_WEB, [hl]
	ld hl, BlewWebsText
	call StdBattleTextbox
.no_webs

	pop de
	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	jp StdBattleTextbox
