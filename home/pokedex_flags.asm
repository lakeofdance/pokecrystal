SetSeenAndCaughtMon::
	push af
; Monspecies now comes in de, big endian
;	ld c, a
	ld hl, wPokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction2
	pop af
	; fallthrough

SetSeenMon::
; Monspecies now comes in de, big endian
;	ld c, a
	ld hl, wPokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction2

CheckCaughtMon::
; Monspecies now comes in de, big endian
;	ld c, a
	ld hl, wPokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction2

CheckSeenMon::
; Monspecies now comes in de, big endian
;	ld c, a
	ld hl, wPokedexSeen
	ld b, CHECK_FLAG
	; fallthrough

PokedexFlagAction2::
	predef FlagAction
	ld a, c
	and a
	ret

PokedexFlagAction::
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	and a
	ret
