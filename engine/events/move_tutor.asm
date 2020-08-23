MoveTutor:
	call FadeToMenu
	call ClearBGPalettes
	call ClearScreen
	call DelayFrame
	ld b, SCGB_PACKPALS
	call GetSGBLayout
	xor a
	ld [wItemAttributeParamBuffer], a
	call .GetMoveTutorMove
	ld a, c
	ld [wNamedObjectIndexBuffer], a
	ld [wPutativeTMHMMove], a
	ld a, b
	ld [wNamedObjectIndexBuffer + 1], a
	ld [wPutativeTMHMMove + 1], a
	call GetMoveName
	call CopyName1
	farcall ChooseMonToLearnTMHM
	jr c, .cancel
	jr .enter_loop

.loop
; This fixes a strange bug, in which after being asked to overwrite a move
; and responding no, the move name is replaced by the mon name
; Somehow wTMHMMoveNameBackup is being overwritten by mon name, I don't know
; where. Regardless, this fixes it.
	ld hl, wStringBuffer2
	ld de, wTMHMMoveNameBackup
	ld bc, 12
	call CopyBytes
;
	farcall ChooseMonToLearnTMHM_NoRefresh
	jr c, .cancel
.enter_loop
	call CheckCanLearnMoveTutorMove
	jr nc, .loop
	xor a ; FALSE
	ld [wScriptVar], a
	jr .quit

.cancel
	ld a, -1
	ld [wScriptVar], a
.quit
	call CloseSubmenu
	ret

.GetMoveTutorMove:
	ld a, [wScriptVar]
	cp MOVETUTOR_FLAMETHROWER
	jr z, .flamethrower
	cp MOVETUTOR_THUNDERBOLT
	jr z, .thunderbolt
	; MOVETUTOR_ICE_BEAM
	ld bc, ICE_BEAM
	ret

.flamethrower
	ld bc, FLAMETHROWER
	ret

.thunderbolt
	ld bc, THUNDERBOLT
	ret

CheckCanLearnMoveTutorMove:
	ld hl, .MenuHeader
	call LoadMenuHeader

	predef CanLearnTMHMMove

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .can_learn
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, BANK(Text_TMHMNotCompatible)
	ld hl, Text_TMHMNotCompatible
	call FarPrintText
	jr .didnt_learn

.can_learn
	callfar KnowsMove
	jr c, .didnt_learn

	predef LearnMove
	ld a, b
	and a
	jr z, .didnt_learn

	ld c, HAPPINESS_LEARNMOVE
	callfar ChangeHappiness
	jr .learned

.didnt_learn
	call ExitMenu
	and a
	ret

.learned
	call ExitMenu
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
