BattleCommand_Present:
; present

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippush
	push bc
	push de
.colosseum_skippush

	farcall BattleCommand_Stab

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippop
	pop de
	pop bc
.colosseum_skippop

	ld a, [wTypeMatchup]
	and a
	jr nz, .ok1
	farcall AnimateFailedMove
	ret
.ok1
	ld a, [wAttackMissed]
	and a
	jr z, .ok2
	farcall AnimateFailedMove
	ret

.ok2
	push bc
	call BattleRandom
	ld b, a
	ld hl, PresentPower
	ld c, 0
.next
	ld a, [hli]
	cp -1
	jr z, .heal_effect
	cp b
	jr nc, .got_power
	inc c
	inc hl
	jr .next

.got_power
	ld a, c
	ld [wPresentPower], a
	call AnimateCurrentMoveEitherSide
	ld d, [hl]
	pop bc
	ret

.heal_effect
	pop bc
	ld a, 3
	ld [wPresentPower], a
	farcall AnimateCurrentMove
	call SwitchTurn
	ld hl, AICheckPlayerMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp_fn_pointer
	ld hl, AICheckEnemyMaxHP
.got_hp_fn_pointer
	ld a, BANK(AICheckPlayerMaxHP) ; aka BANK(AICheckEnemyMaxHP)
	rst FarCall
	jr c, .already_fully_healed

	ld hl, GetQuarterMaxHP
	farcall CallBattleCore
	call SwitchTurn
	ld hl, RestoreHP
	farcall CallBattleCore
	call SwitchTurn
	ld hl, RegainedHealthText
	call StdBattleTextbox
	call SwitchTurn
	farcall UpdateOpponentInParty
	jr .do_animation

.already_fully_healed
	call SwitchTurn
	farcall _CheckBattleScene
	jr nc, .do_animation
	farcall AnimateFailedMove
	ld hl, RefusedGiftText
	call StdBattleTextbox
.do_animation
	farcall EndMoveEffect
	ret

INCLUDE "data/moves/present_power.asm"
