BattleCommand_Trick:
; trick

; fail if used by an enemy wild pokemon
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld a, [wBattleMode]
	dec a
	jr z, .fail

.player
; fail if neither mon has an item, or one is holding mail

	call PlayerItem
	ld a, [hl]
	ld b, a
	ld [wNamedObjectIndexBuffer], a
	call EnemyItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	or b
	jr z, .fail

	ld a, [wNamedObjectIndexBuffer + 1]
	ld d, a
	farcall ItemIsMail
	jr c, .fail
	ld a, [wNamedObjectIndexBuffer]
	ld d, a
	farcall ItemIsMail
	jr c, .fail

; succeed
	call EnemyItem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a

	call PlayerItem
	ld a, [wNamedObjectIndexBuffer + 1]
	ld [hl], a
	ld [de], a

	farcall AnimateCurrentMove
	ld hl, SwappedItemsText
	jp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret
