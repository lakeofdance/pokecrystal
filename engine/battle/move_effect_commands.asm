CompareMove2:
; compares the 2 bytes in bc to those pointed to by hl and hl + 1
; bc is big endian
; hl points to a little endian word
; returns z if equal
; preserves hl and bc
	push hl
	push bc
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hl]
	sub b
	or c
	pop bc
	pop hl
	ret

CallBattleCore2:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

GetMoveAttr2:
; Assuming hl = Moves + x, return attribute x of move bc (big endian).
	push bc
	ld a, MOVE_LENGTH
	call AddNTimes
	call GetMoveByte2
	pop bc
	ret

GetMoveByte2:
	ld a, BANK(Moves)
	jp GetFarByte


CheckUserMoveLE:
; Return z if the user has move bc (little endian).
	ld a, b
	ld b, c
	ld c, a

CheckUserMove:
; Return z if the user has move bc (big endian).
	push hl
	push de

	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonMoves
.ok

	ld d, NUM_MOVES
.loop
	call CompareMove2
	jr z, .end

	dec d
	inc hl
	inc hl
	jr nz, .loop

	ld a, 1
	and a
.end
	pop de
	pop hl
	ret

AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc 
	ld a, [wKickCounter]
	push af
	farcall BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	farcall PlayDamageAnim
	farcall BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

; Transform and substitute stayed in effect_commands.asm

INCLUDE "engine/battle/move_effects/attract.asm"

INCLUDE "engine/battle/move_effects/baton_pass.asm"

INCLUDE "engine/battle/move_effects/beat_up.asm"

INCLUDE "engine/battle/move_effects/belly_drum.asm"

INCLUDE "engine/battle/move_effects/bide.asm"

INCLUDE "engine/battle/move_effects/conversion.asm"

INCLUDE "engine/battle/move_effects/conversion2.asm"

INCLUDE "engine/battle/move_effects/counter.asm"

INCLUDE "engine/battle/move_effects/curse.asm"

INCLUDE "engine/battle/move_effects/destiny_bond.asm"

INCLUDE "engine/battle/move_effects/disable.asm"

INCLUDE "engine/battle/move_effects/encore.asm"

INCLUDE "engine/battle/move_effects/endure.asm"

INCLUDE "engine/battle/move_effects/false_swipe.asm"

INCLUDE "engine/battle/move_effects/focus_energy.asm"

INCLUDE "engine/battle/move_effects/foresight.asm"

INCLUDE "engine/battle/move_effects/frustration.asm"

INCLUDE "engine/battle/move_effects/fury_cutter.asm"

INCLUDE "engine/battle/move_effects/future_sight.asm"

INCLUDE "engine/battle/move_effects/heal_bell.asm"

INCLUDE "engine/battle/move_effects/hidden_power.asm"

INCLUDE "engine/battle/move_effects/leech_seed.asm"

INCLUDE "engine/battle/move_effects/lock_on.asm"

INCLUDE "engine/battle/move_effects/magnitude.asm"

INCLUDE "engine/battle/move_effects/metronome.asm"

INCLUDE "engine/battle/move_effects/mimic.asm"

INCLUDE "engine/battle/move_effects/mirror_coat.asm"

INCLUDE "engine/battle/move_effects/mirror_move.asm"

INCLUDE "engine/battle/move_effects/mist.asm"

INCLUDE "engine/battle/move_effects/nightmare.asm"

INCLUDE "engine/battle/move_effects/pain_split.asm"

INCLUDE "engine/battle/move_effects/pay_day.asm"

INCLUDE "engine/battle/move_effects/perish_song.asm"

INCLUDE "engine/battle/move_effects/present.asm"

INCLUDE "engine/battle/move_effects/protect.asm"

INCLUDE "engine/battle/move_effects/psych_up.asm"

INCLUDE "engine/battle/move_effects/pursuit.asm"

INCLUDE "engine/battle/move_effects/rage.asm"

INCLUDE "engine/battle/move_effects/rain_dance.asm"

INCLUDE "engine/battle/move_effects/rapid_spin.asm"

INCLUDE "engine/battle/move_effects/return.asm"

INCLUDE "engine/battle/move_effects/rollout.asm"

INCLUDE "engine/battle/move_effects/safeguard.asm"

INCLUDE "engine/battle/move_effects/sandstorm.asm"

INCLUDE "engine/battle/move_effects/selfdestruct.asm"

INCLUDE "engine/battle/move_effects/sketch.asm"

INCLUDE "engine/battle/move_effects/sleep_talk.asm"

INCLUDE "engine/battle/move_effects/snore.asm"

INCLUDE "engine/battle/move_effects/spite.asm"

INCLUDE "engine/battle/move_effects/spikes.asm"

INCLUDE "engine/battle/move_effects/splash.asm"

INCLUDE "engine/battle/move_effects/sunny_day.asm"

INCLUDE "engine/battle/move_effects/teleport.asm"

INCLUDE "engine/battle/move_effects/thief.asm"

INCLUDE "engine/battle/move_effects/thunder.asm"

INCLUDE "engine/battle/move_effects/triple_kick.asm"
