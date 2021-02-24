InitTradeSpeciesList:
	call LoadTradeScreenBorder
	call Function16d6ae
	farcall InitMG_Mobile_LinkTradePalMap
	farcall PlaceTradePartnerNamesAndParty
	hlcoord 10, 17
	ld de, .CANCEL
	call PlaceString
	ret

.CANCEL:
	db "CANCEL@"
    
INCLUDE "engine/link/trade/graphics.asm"

Function16d6ce:
	call LoadStandardMenuHeader
	call PrintWaiting
	farcall WaitLinkTransfer
	call Call_ExitMenu
	call WaitBGMap2
	ret

PrintWaiting:
	hlcoord 4, 10
	ld b, 1
	ld c, 10
	predef LinkTextboxAtHL
	hlcoord 5, 11
	ld de, .Waiting
	call PlaceString
	call WaitBGMap
	call WaitBGMap2
	ld c, 50
	jp DelayFrames

.Waiting:
	db "WAITING..!@"

INCLUDE "engine/link/trade/trade_menu.asm"
    
LinkTrade:
	xor a
	ld [wcf57], a
	ld [wOtherPlayerLinkAction], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	farcall Link_WaitBGMap
	ld a, [wd002]
	ld hl, wPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wd004
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, [wd003]
	ld hl, wOTPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hl]
	ld [wNamedObjectIndexBuffer + 1], a
	call GetPokemonName
	ld hl, UnknownText_0x28eb8
	bccoord 1, 14
	call PlaceHLTextAtBC
	call LoadStandardMenuHeader
	hlcoord 10, 7
	ld b, 3
	ld c, 7
	call LinkTextboxAtHL
	ld de, String28eab
	hlcoord 12, 8
	call PlaceString
	ld a, 8
	ld [w2DMenuCursorInitY], a
	ld a, 11
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 2
	ld [w2DMenuNumRows], a
	xor a
	ld [w2DMenuFlags1], a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ld a, 1
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	farcall Link_WaitBGMap
	call ScrollingMenuJoypad
	push af
	call Call_ExitMenu
	call WaitBGMap2
	pop af
	bit 1, a
	jr nz, .asm_28c33
	ld a, [wMenuCursorY]
	dec a
	jr z, .asm_28c54

.asm_28c33
	ld a, $1
	ld [wPlayerLinkAction], a
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TooBadTheTradeWasCanceled
	call PlaceString
	farcall Function16d6ce
	jp Function28ea3

.asm_28c54
	ld a, $2
	ld [wPlayerLinkAction], a
	farcall Function16d6ce
	ld a, [wOtherPlayerLinkMode]
	dec a
	jr nz, .asm_28c7b
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String_TooBadTheTradeWasCanceled
	call PlaceString
	jp Function28ea3

.asm_28c7b
	ld hl, sPartyMail
	ld a, [wd002]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld d, h
	ld e, l
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	ld a, [wd002]
	ld c, a
.asm_28c96
	inc c
	ld a, c
	cp PARTY_LENGTH
	jr z, .asm_28ca6
	push bc
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop bc
	jr .asm_28c96

.asm_28ca6
	ld hl, sPartyMail
	ld a, [wPartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld hl, wc9f4
	ld a, [wd003]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	ld hl, wPlayerName
	ld de, wPlayerTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wd002]
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wPlayerTrademonSpecies], a
	ld a, [hl]
	ld [wPlayerTrademonSpecies + 1], a
	ld a, [wd002]
	ld hl, wPartyMonOT
	call SkipNames
	ld de, wPlayerTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wPartyMon1ID
	ld a, [wd002]
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonID], a
	ld a, [hl]
	ld [wPlayerTrademonID + 1], a
	ld hl, wPartyMon1DVs
	ld a, [wd002]
	call GetPartyLocation
	ld a, [hli]
	ld [wPlayerTrademonDVs], a
	ld a, [hl]
	ld [wPlayerTrademonDVs + 1], a
	ld a, [wd002]
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a
	ld hl, wOTPlayerName
	ld de, wOTTrademonSenderName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wd003]
	ld hl, wOTPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wOTTrademonSpecies], a
	ld a, [hl]
	ld [wOTTrademonSpecies + 1], a
	ld a, [wd003]
	ld hl, wOTPartyMonOT
	call SkipNames
	ld de, wOTTrademonOTName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wOTPartyMon1ID
	ld a, [wd003]
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonID], a
	ld a, [hl]
	ld [wOTTrademonID + 1], a
	ld hl, wOTPartyMon1DVs
	ld a, [wd003]
	call GetPartyLocation
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld a, [wd003]
	ld hl, wOTPartyMon1Species
	call GetPartyLocation
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	ld a, [wd002]
	ld [wCurPartyMon], a
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hl]
; Why? Maybe todo.
	ld [wd002], a
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	callfar RemoveMonFromPartyOrBox
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, [wd003]
	push af
	ld hl, wOTPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hl]
; Why? Maybe todo.
	ld [wd003], a
	ld c, 100
	call DelayFrames
	call ClearTileMap
	call LoadFontsBattleExtra
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .player_2
	predef TradeAnimation
	jr .done_animation

.player_2
	predef TradeAnimationPlayer2

.done_animation
	pop af
	ld c, a
	ld [wCurPartyMon], a
	ld hl, wOTPartySpecies
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld a, [hl]
	ld [wCurPartySpecies + 1], a
	ld hl, wOTPartyMon1Species
	ld a, c
	call GetPartyLocation
	ld de, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	predef AddTempmonToParty
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	callfar EvolvePokemon
	call ClearScreen
	call LoadTradeScreenBorder
	call SetTradeRoomBGPals
	farcall Link_WaitBGMap
	ld d, $1
	ld hl, wPlayerTrademonSpecies
	ld bc, MEW
	call CompareMove
	jr z, .loop
	ld hl, wCurPartySpecies
	ld bc, MEW
	call CompareMove
	jr z, .loop
	ld d, $2
	ld hl, wPlayerTrademonSpecies
	ld bc, CELEBI
	call CompareMove
	jr z, .loop
	ld hl, wCurPartySpecies
	ld bc, CELEBI
	call CompareMove
	jr z, .loop
	ld d, $0

.loop
	ld a, b
	ld [wPlayerLinkAction], a
	push bc
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	pop bc
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .save
	ld a, b
	and a
	jr z, .save
	ld a, [wOtherPlayerLinkAction]
	cp b
	jr nz, .loop

.save
	farcall SaveAfterLinkTrade
	farcall BackupMobileEventIndex
	ld c, 40
	call DelayFrames
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call LinkTextboxAtHL
	hlcoord 1, 14
	ld de, String28ebd
	call PlaceString
	farcall Link_WaitBGMap
	ld c, 50
	call DelayFrames
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, Gen2ToGen1LinkComms
; prev this default was Gen2ToGen2LinkComms
	jp RuthToRuthLinkComms
    
INCLUDE "engine/link/trade/party_menu.asm"

Function28ea3:
	ld c, 100
	call DelayFrames
	jp InitTradeMenuDisplay

String28eab:
	db   "TRADE"
	next "CANCEL@"

UnknownText_0x28eb8:
	; Trade @ for @ ?
	text_far UnknownText_0x1c4212
	text_end

String28ebd:
	db   "Trade completed!@"

String_TooBadTheTradeWasCanceled:
	db   "Too bad! The trade"
	next "was canceled!@"

INCLUDE "engine/movie/trade_animation.asm"

INCLUDE "engine/link/trade/validate_ot_trademon.asm"

PlaceTradePartnerNamesAndParty:
	hlcoord 4, 0
	ld de, wPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 4, 8
	ld de, wOTPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, wPartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, wOTPartySpecies
.PlaceSpeciesNames:
	ld c, $0
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wNamedObjectIndexBuffer], a
    inc de
    ld a, [de]
	ld [wNamedObjectIndexBuffer + 1], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ldh [hProduct], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .loop

INCLUDE "data/pokemon/gen1_base_special.asm"
