BattleCommand_KnockOffDamageBoost:
; increases damage by half if the opponent has a knockable item

	call CheckKnockOffEffect
	ret z
; fallthrough
IncreaseDamageByHalf:
; get current damage
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld c, [hl]
; mutiply by 3
	ld hl, 0
	ld a, 3
	call AddNTimes	
; divide by 2
	sla c
	rl b
; save
	ld hl, wCurDamage
	ld [hl], b
	inc hl
	ld [hl], c
	ret

BattleCommand_KnockOffEffect:
; removes opponent's item if it is knockable

	call CheckKnockOffEffect
	ret z

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

	call EnemyItem
	xor a
	ld [hl], a
	ld [de], a
	jr .knockedoff

.enemy

; If the enemy knocks off your item,
; it's gone for good if you don't get it back.

	call PlayerItem
	xor a
	ld [hl], a
	ld [de], a

.knockedoff
	call GetItemName
	ld hl, KnockedOffText
	jp StdBattleTextbox

CheckKnockOffEffect:
; returns nz if the opponent has a knockable item
; z otherwise

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The enemy needs to have an item to knock off.
	call EnemyItem
	ld a, [hl]
	and a
	jr z, .fail

; Can't knock off mail.
	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
	jr c, .fail
	jr .succeed

.enemy

; The player must have an item to knock off.
	call PlayerItem
	ld a, [hl]
	and a
	jr z, .fail

; Can't knock off mail!
	ld [wNamedObjectIndexBuffer], a
	ld d, a
	farcall ItemIsMail
	jr c, .fail

.succeed
	ld a, 1
	and a
	ret

.fail
	xor a
	ret


