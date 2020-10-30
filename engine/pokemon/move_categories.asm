GetMoveCategoryName:
; Copy the category name of move b to wStringBuffer1.

	ld a, MOVE_LENGTH
	dec bc
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld b, a

; Mask out the type
	and STATUS
; Shift the category bits into the range 0-2
	rlc a
	rlc a
	and a
	call z, .DetermineFromType
	dec a

	ld hl, TypeCategoryNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, MOVE_NAME_LENGTH
	jp CopyBytes

.DetermineFromType:
	ld a, b
	ld b, 1
	and TYPE_MASK
	cp SPECIAL_TYPES
	jr c, .done
	inc b
.done
	ld a, b
	ret

INCLUDE "data/types/category_names.asm"