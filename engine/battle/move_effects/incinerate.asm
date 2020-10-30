BattleCommand_Incinerate:
; incinerate
	call CheckOpponentBerry
	ret nc
	ld [wNamedObjectIndexBuffer], a

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

	call EnemyItem
	xor a
	ld [hl], a
	ld [de], a
	jr .incinerated

.enemy
	call PlayerItem
	xor a
	ld [hl], a
	ld [de], a

.incinerated
	call GetItemName
	ld hl, IncineratedText
	jp StdBattleTextbox

CheckOpponentBerry:
	farcall GetOpponentItem	
	ld a, [hl]
	ld de, 1
	ld hl, BerryItems
	call IsInArray
	ret
