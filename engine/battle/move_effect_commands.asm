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
