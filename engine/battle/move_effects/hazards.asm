BattleCommand_Hazard:
; spikes, stealth rocks, toxic spikes

	ld hl, wEnemyScreens2
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerScreens2
.asm_3768e

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_STICKY_WEB
	jr z, .webs
	cp EFFECT_STEALTH_ROCKS
	jr z, .rocks
	cp EFFECT_TOXIC_SPIKES
	jr z, .t_spikes
; fallthrough
; Fails if 3 layers of spikes are already down!
; only SCREENS_SPIKES_1 set: 1 layer
; only SCREENS_SPIKES_2 set: 2 layers
; both set: 3 layers

	bit SCREENS_SPIKES_1, [hl]
	jr z, .setSpikesOne
	bit SCREENS_SPIKES_2, [hl]
	jr nz, .failed
	set SCREENS_SPIKES_2, [hl]
	res SCREENS_SPIKES_1, [hl]
	jr .animMove

; Nothing else stops it from working.
.setSpikesOne
	set SCREENS_SPIKES_1, [hl]
.animMove
	farcall AnimateCurrentMove

	ld hl, SpikesText
	jr .success

.rocks
; Fails if rocks are already down!

	bit SCREENS_STEALTH_ROCKS, [hl]
	jr nz, .failed

; Nothing else stops it from working.

	set SCREENS_STEALTH_ROCKS, [hl]

	farcall AnimateCurrentMove

	ld hl, StealthRocksText
	jr .success

.t_spikes
; Fails if both layers are already down!

	bit SCREENS_TOXIC_SPIKES_2, [hl]
	jr nz, .failed
; Nothing else stops it from working.
	bit SCREENS_TOXIC_SPIKES_1, [hl]
	jr z, .firstlayer
	set SCREENS_TOXIC_SPIKES_2, [hl]
.firstlayer
	set SCREENS_TOXIC_SPIKES_1, [hl]
	farcall AnimateCurrentMove
	ld hl, SpikesText
	jr .success

.webs
; Fails if webs are already down!
	bit SCREENS_STICKY_WEB, [hl]
	jr nz, .failed
; Nothing else stops it from working.
	set SCREENS_STICKY_WEB, [hl]
	farcall AnimateCurrentMove
	ld hl, StickyWebsText
; fallthrough
.success
	jp StdBattleTextbox

.failed
	farcall FailMove
	ret
