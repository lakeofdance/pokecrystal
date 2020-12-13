BattleCommand_Thief:
; thief

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call PlayerItem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call EnemyItem
	ld a, [hl]
	and a
	ret z

	cp MEGA_STONE
	ret z

; Can't steal mail.

	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call EnemyItem
	xor a
	ld [hl], a
	ld [de], a

	call PlayerItem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy

; The enemy can't already have an item.

	call EnemyItem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call PlayerItem
	ld a, [hl]
	and a
	ret z

	cp MEGA_STONE
	ret z

; Can't steal mail!

	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call PlayerItem
	xor a
	ld [hl], a
	ld [de], a

	call EnemyItem
	ld a, [wNamedObjectIndexBuffer]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextbox

PlayerItem:
	ld a, 2
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

EnemyItem:
	ld a, 2
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret
