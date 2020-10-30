BattleCommand_TrickRoom:
; trickroom
	ld hl, wBattleArenaEffects
	bit ARENA_TRICK_ROOM, [hl]
	jr nz, .end_trick_room

	set ARENA_TRICK_ROOM, [hl]
	ld a, 5
	ld [wTrickRoomCount], a
	farcall AnimateCurrentMove
	ld hl, WeirdDimensionsText
	jp StdBattleTextbox

.end_trick_room
	res ARENA_TRICK_ROOM, [hl]
	xor a
	ld [wTrickRoomCount], a
	farcall AnimateCurrentMove
	ld hl, BattleText_TrickRoomEnded
	jp StdBattleTextbox