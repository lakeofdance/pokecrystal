MegaButton:
; Places textbox with word "MEGA" on the FIGHT screen if
; the player has the option of mega evolving.
; Called by MoveSelectionScreen in core.asm.
	ld hl, wMegaAction
	res PLAYER_CAN_MEGA, [hl]
	call CanPlayerMegaEvolve
	ret nz
	call DrawMegaTextbox
; set "can mega" bit
	ld hl, wMegaAction
	set PLAYER_CAN_MEGA, [hl]
	bit PLAYER_WILL_MEGA, [hl]
	ret z
	jr DrawMegaSelectedArrows

OnOffMegaButton:
; Switches on or off whether the player will mega evolve
; when they take their turn.
; Called by MoveSelectionScreen in core.asm, whenever the
; player presses START while on the FIGHT menu.
	ld hl, wMegaAction
	bit PLAYER_CAN_MEGA, [hl]
	ret z
	bit PLAYER_WILL_MEGA, [hl]
	jr nz, .reset
	set PLAYER_WILL_MEGA, [hl]
	jr DrawMegaSelectedArrows
.reset
	res PLAYER_WILL_MEGA, [hl]
; fallthrough

DrawMegaTextbox:
; textbox
	hlcoord 1, 4
	ld b, 1 ;height
	ld c, 4 ;width
	call Textbox
; MEGA
	hlcoord 2, 5
	ld de, MegaString
	call PlaceString
	jp WaitBGMap

DrawMegaSelectedArrows:
; showing it has been activated
	hlcoord 1, 5
	ld [hl], "▶"
	hlcoord 6, 5
	ld [hl], "◀"
	jp WaitBGMap

MegaString:
	db "MEGA@"

CanEnemyMegaEvolve:
; return z if enemy has potential to mega
; called by AI
	ld hl, wMegaAction
	bit ENEMY_HAS_MEGA, [hl]
	ret nz
	ld hl, wEnemyMon
	ld de, wEnemyMonItem
	jr FindUserMega

CanPlayerMegaEvolve:
; return z if player has potential to mega
	ld hl, wMegaAction
	bit PLAYER_HAS_MEGA, [hl]
	ret nz
	ld hl, wBattleMon
	ld de, wBattleMonItem
;fallthrough

FindUserMega:
; point to mon's EvosAttacks
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	dec bc
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
;check whether mon has a mega evolution
.loop
	ld a, [hli]
	and a
	jr z, .fail
	cp EVOLVE_MEGA
	jr .foundmegaevo
	inc hl
	inc hl
	inc hl
	cp EVOLVE_STAT
	jr nz, .loop
	inc hl
	jr .loop

.foundmegaevo
; now check if mon is holding the required item
	ld a, [de]
	cp [hl]
	ret z
; no need to deal with EVOLVE_STAT, because we have EVOLVE_MEGA
	inc hl
	inc hl
	inc hl
	jr .loop
.fail
	ld a, 1
	and a
	ret

AI_GetMegaBaseData:
; called by AIMega_Smart
	ld hl, wEnemyMon
	ld de, wEnemyMonItem
	call FindUserMega
	inc hl
	ld a, [hli]
	ld [wCurSpecies], a
	ld a, [hl]
	ld [wCurSpecies + 1], a
	jp GetBaseData

MegaEvolveBattleParticipants:
	ld a, [wEnemyGoesFirst]
	and a
	jr nz, .EnemyFirst
	call PlayerMegaEvolve
	jp EnemyMegaEvolve

.EnemyFirst
	call EnemyMegaEvolve
;fallthrough

PlayerMegaEvolve:
	ld hl, wMegaAction
	bit PLAYER_CAN_MEGA, [hl]
	ret z
	bit PLAYER_WILL_MEGA, [hl]
	ret z
	bit PLAYER_HAS_MEGA, [hl]
	ret nz
; the player can mega, and wants to
	res PLAYER_CAN_MEGA, [hl]
	res PLAYER_WILL_MEGA, [hl]
	set PLAYER_HAS_MEGA, [hl]

	ld c, 20
	call DelayFrames
	farcall DropPlayerSub

; first we copy our mon to tempmon
; then we'll fill tempmons stats with the new mega's stats
; and then copy it back to the party
	xor a
	ld [wMonType], a
	predef CopyMonToTempMon

	ld hl, wBattleMon
	ld de, wBattleMonItem
	call FindUserMega ; returns species in [hl + 1]
	inc hl

	ld a, [hli]
	ld [wCurSpecies], a
	ld [wTempBattleMonSpecies], a ; used by LoadSGBLayoutCGB
	ld [wTempMonSpecies], a
	ld a, [hl]
	ld [wCurSpecies + 1], a
	ld [wTempMonSpecies + 1], a
	ld [wTempBattleMonSpecies + 1], a

	call SetMegaSeenAndCaught
; load user name into wStringBuffer2
	ld de, wBattleMonNick
	call CopyName1
; print mega evolving text
	ld c, 10
	call DelayFrames
	ld hl, Text_WhatPlayerMegaEvolving
	call PrintText

	ld c, 50
	call DelayFrames

; first we update partymon
	ld hl, wBattleMonSpecies
	call IsMonNicknamed
	jr nz, .skip_name
	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wPartyMonNicknames
	call AddNTimes
	push hl
; copy new name over
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	ld a, [wCurSpecies + 1]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
.skip_name
	call GetBaseData

; calc new stats
; this assumes that base HP will not change
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcMonStats

; copy new stats to party struct
	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

; wPartySpecies needs to be updated too
	ld a, [wCurPartyMon]
	ld hl, wPartySpecies
	ld bc, 2
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wTempMonSpecies
	call CopyBytes

; then we update battlemon
;species
	ld hl, wTempMonSpecies
	ld de, wBattleMon
	ld bc, 2
	call CopyBytes
;type
	ld hl, wBaseType
	ld de, wBattleMonType
	ld bc, 2
	call CopyBytes
;nickname
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld de, wBattleMonNick
	call CopyBytes
; recalc stats - takes boosts/drops and status into account
	farcall CalcPlayerStats
; animate, and print success message
	jp PlayerAnimateMegaEvolution

EnemyMegaEvolve:
	ld hl, wMegaAction
	bit ENEMY_CAN_MEGA, [hl]
	ret z
	bit ENEMY_WILL_MEGA, [hl]
	ret z
	bit ENEMY_HAS_MEGA, [hl]
	ret nz
; the AI can mega, and wants to
	res ENEMY_CAN_MEGA, [hl]
	res ENEMY_WILL_MEGA, [hl]
	set ENEMY_HAS_MEGA, [hl]

	farcall DropEnemySub

; same as for player, but using
; party struct in wOTPartyMons
; party species in wOTPartySpecies
; battle struct in wEnemyMon

; first we copy our mon to tempmon
; then we'll fill tempmons stats with the new mega's stats
; and then copy it back to the enemy party
	ld a, OTPARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon

	ld hl, wEnemyMon
	ld de, wEnemyMonItem
	call FindUserMega ; returns species in [hl + 1]
	inc hl

	ld a, [hli]
	ld [wCurSpecies], a
	ld [wTempEnemyMonSpecies], a ; used by LoadSGBLayoutCGB
	ld [wTempMonSpecies], a
	ld a, [hl]
	ld [wCurSpecies + 1], a
	ld [wTempMonSpecies + 1], a
	ld [wTempEnemyMonSpecies + 1], a

	call SetMegaSeenAndCaught
; load user name into wStringBuffer2
	ld de, wEnemyMonNick
	call CopyName1
; print mega evolving text
	ld c, 10
	call DelayFrames
	ld hl, Text_WhatEnemyMegaEvolving
	call PrintText

	ld c, 50
	call DelayFrames

; update species name
	ld hl, wEnemyMonSpecies
	call IsMonNicknamed
	jr nz, .skip_name
	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wOTPartyMonNicknames
	call AddNTimes
	push hl
; copy new name over
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	ld a, [wCurSpecies + 1]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
.skip_name
; first we update OTPartyMon
	call GetBaseData

; calc new stats
; this assumes that base HP will not change
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcMonStats

; copy new stats to OT party struct
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

; wOTPartySpecies needs to be updated too
	ld a, [wCurPartyMon]
	ld hl, wOTPartySpecies
	ld bc, 2
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wTempMonSpecies
	call CopyBytes

; then we update wEnemyMon
;species
	ld hl, wTempMonSpecies
	ld de, wEnemyMon
	ld bc, 2
	call CopyBytes
;type
	ld hl, wBaseType
	ld de, wEnemyMonType
	ld bc, 2
	call CopyBytes
;nickname
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld de, wEnemyMonNick
	call CopyBytes
; recalc stats - takes boosts/drops and status into account
	farcall CalcEnemyStats
; animate, and print success message
	jp EnemyAnimateMegaEvolution

Text_WhatPlayerMegaEvolving:
	; "@ is reacting to player's mega bracelet!"
	text_far BattleText_PlayerMegaEvolving
	text_end

Text_WhatEnemyMegaEvolving:
	; "@ is reacting to enemy's mega bracelet!"
	text_far BattleText_EnemyMegaEvolving
	text_end

PlayerAnimateMegaEvolution:
	ldh a, [hBattleTurn]
	push af
	; Clear the hud
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	call SetPlayerTurn
	call AnimateMegaEvolution
	pop af
	ldh [hBattleTurn], a
	ret

EnemyAnimateMegaEvolution:
	ldh a, [hBattleTurn]
	push af
	; Clear the hud
	hlcoord 0, 0
	lb bc, 5, 11
	call ClearBox
	call SetEnemyTurn
	call AnimateMegaEvolution
	pop af
	ldh [hBattleTurn], a
	ret

AnimateMegaEvolution:
; Set palettes to grayscale
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetPalettes

; See BattleAnim_MegaEvolve
; and BattleAnimCmd_MegaEvolve
	ld de, ANIM_MEGA_EVOLVE
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a

	callfar PlayBattleAnim
; Restore colour
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetPalettes

	call RefreshBattleHuds
	ld c, 40
	call DelayFrames
; "User's power rose immensely!"
	ld hl, MegaEvolvedText
	call StdBattleTextbox
	farcall BattleCommand_RaiseSubNoAnim
	ld c, 40
	call DelayFrames
	ret

RevertCurMegaPartyMon:
; called by FaintYourPokemon in battle/core.asm
; if our mega just fainted, it should revert
	ld a, [wCurPartyMon]
	ld d, a
	ld b, 0
	ld c, a
	ld hl, wPartySpecies
	add hl, bc
	add hl, bc
	ld bc, MEGA_POKEMON_START
	call CompareMove
	ret c
	ld bc, MEGA_POKEMON_END
	call CompareMove
	ret nc
	jp DevolveMega

RevertMegaEvolvedPartyMons:
; loop through party mons to find any megas
; and devolve them all
	ld d, 0
	ld hl, wPartySpecies
.loop
	ld a, d
	cp PARTY_LENGTH - 1
	ret nc
	ld bc, MEGA_POKEMON_START
	call CompareMove
	jr c, .notamega
	ld bc, MEGA_POKEMON_END
	call CompareMove
	jr nc, .notamega
.foundmega
	call DevolveMega
.notamega
	inc d
	inc hl
	inc hl
	jr .loop

DevolveMega:
; preserves hl and de
	push hl
	push de
	ld a, d
	ld [wCurPartyMon], a
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld a, [hl]
	ld [wCurPartySpecies + 1], a

	xor a
	ld [wMonType], a
	predef CopyMonToTempMon

; Find the first mon to evolve into wCurPartySpecies.
; Return the new species in wCurPartySpecies
; This assumes our mega has exactly one unique preevo - reasonable!
; If for any reason a preevo doesn't exist, the mon will be replaced by itself.
	farcall GetPreEvolution
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wTempMonSpecies], a
	ld a, [wCurPartySpecies + 1]
	ld [wCurSpecies + 1], a
	ld [wTempMonSpecies + 1], a

; and now the same job as we pulled when mega evolving
; load mon name into wStringBuffer2
	call GetCurNick
	call CopyName1
; and compare with the species name, which this function loads into wStringBuffer1
	ld hl, wBattleMonSpecies
	call IsMonNicknamed
	jr nz, .skip_name
	ld a, [wCurPartyMon]
	ld bc, MON_NAME_LENGTH
	ld hl, wPartyMonNicknames
	call AddNTimes
	push hl
; copy new name over
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	ld a, [wCurSpecies + 1]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
.skip_name
	call GetBaseData

; calc new stats
; this assumes that base HP will not change
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wTempMonExp + 2
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcMonStats

; copy new stats to party struct
	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

; wPartySpecies needs to be updated too
	ld a, [wCurPartyMon]
	ld hl, wPartySpecies
	ld bc, 2
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wTempMonSpecies
	call CopyBytes
	pop de
	pop hl
	ret

IsMonNicknamed:
; Returns nz if mon is nicknamed.
; Assumes current name is in wStringBuffer2.
	ld a, [wCurSpecies + 1]
	push af
	ld a, [wCurSpecies]
	push af
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	pop af
	ld [wCurSpecies], a
	pop af
	ld [wCurSpecies + 1], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	ret z
	jr .loop

SetMegaSeenAndCaught:
	ld a, [wCurSpecies]
	ld e, a
	ld a, [wCurSpecies + 1]
	ld d, a
	dec de
	jp SetSeenAndCaughtMon
