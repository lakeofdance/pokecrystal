BattleCommand_Recoil:
; recoil

	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld d, a
; get recoil damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a

	push hl
	push bc
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld e, 2
	ld hl, MoveRecoilDamage
	call IsWordInArray
	pop bc
	jr nc, .deal_min_damage

	inc hl
	ld a, [hl]
	cp RECOIL_100
	jr z, .total_recoil
	cp RECOIL_75
	jr z, .three_quarters_recoil
	cp RECOIL_50
	jr z, .half_recoil
	cp RECOIL_25
	jr z, .quarter_recoil
	cp RECOIL_30
	jr z, .approx_third_recoil

.deal_min_damage
	ld bc, 1
	jr .got_damage

.approx_third_recoil
; recoil 5/16 of damage dealt
	ld hl, 0
	ld a, 5
	call AddNTimes
	srl h
	rr l
	srl h
	rr l
	ld b, h
	ld c, l
	jr .quarter_recoil

.three_quarters_recoil
; recoil 3/4 of damage dealt
	ld hl, 0
	ld a, 3
	call AddNTimes
	ld b, h
	ld c, l
.quarter_recoil
; recoil 1/4 of damage dealt
	srl b
	rr c
.half_recoil
; recoil 1/2 of damage dealt
	srl b
	rr c
.total_recoil
; recoil all damage dealt
	ld a, b
	or c
	jr nz, .got_damage
	inc c
.got_damage
	pop hl
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hld]
	ld [wBuffer1], a
	dec hl
	call ApplyRecoil
	ld hl, RecoilText
	jp StdBattleTextbox

INCLUDE "data/moves/recoil_damage.asm"

ApplyRecoil:
; deals damage bc to user
; hl points to wBattleMonHP + 1 or wEnemyMonHP + 1, depending on the turn
	ld a, [hl]
	ld [wBuffer3], a
	sub c
	ld [hld], a
	ld [wBuffer5], a
	ld a, [hl]
	ld [wBuffer4], a
	sbc b
	ld [hl], a
	ld [wBuffer6], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a
.dont_ko
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	jp RefreshBattleHuds

BattleCommand_RecoilHalfMaxHP:
; recoilhalfmaxhp
; used by EFFECT_MIND_BLOWN
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
; get max HP
	ld a, [hli]
	ld [wBuffer2], a
	ld b, a
	ld a, [hld]
	ld [wBuffer1], a
	ld c, a
; halve it, rounded up
	inc c
	srl b
	rr c
; deal as damage
	dec hl
	call ApplyRecoil
	ld hl, TookHugeDamageText
	jp StdBattleTextbox

BattleCommand_RecoilAllHP:
; recoilallhp
; used by final gambit, memento
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
; get max hp
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hld]
	ld [wBuffer1], a
	dec hl
	jp ApplyRecoil
