; Code specific to linking with pokeruth.

RuthToRuthLinkComms:
	call ClearLinkData
	call Link_PrepPartyData_Ruth
	call FixDataForLinkTransfer
	call Function29dba
	ld a, [wScriptVar]
	and a
	jp z, LinkTimeout
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .Player1

	ld c, 3
	call DelayFrames
	xor a
	ldh [hSerialSend], a
	ld a, (0 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a

	call DelayFrame
	xor a
	ldh [hSerialSend], a
	ld a, (0 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a

.Player1:
	ld de, MUSIC_NONE
	call PlayMusic
	ld c, 3
	call DelayFrames
	xor a
	ldh [rIF], a
	ld a, 1 << SERIAL
	ldh [rIE], a
	ld hl, wd1f3
	ld de, wEnemyMonSpecies
	ld bc, $15 ; species through status of battle_struct, plus one
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a
	ld hl, wLinkData
	ld de, wOTPlayerName
; wOTPlayerName through wOTPartyMonNicknames, plus one
    ld bc, NAME_LENGTH + (PARTY_LENGTH * 2) + 6 + (PARTYMON_STRUCT_LENGTH * 6) + (NAME_LENGTH * PARTY_LENGTH) + (MON_NAME_LENGTH * PARTY_LENGTH) + 1
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a
	ld hl, wLink_c608
	ld de, wTrademons
	ld bc, wTrademons - wLink_c608
	call Serial_ExchangeBytes
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jr nz, .not_trading
; exchange mail
	ld hl, wc9f4
	ld de, wcb84
	ld bc, $186
	call ExchangeBytes

.not_trading
	xor a
	ldh [rIF], a
	ld a, (1 << JOYPAD) | (1 << SERIAL) | (1 << TIMER) | (1 << VBLANK)
	ldh [rIE], a
	ld de, MUSIC_NONE
	call PlayMusic
	call Link_CopyRandomNumbers
	ld hl, wOTPlayerName
	call Link_FindFirstNonControlCharacter_SkipZero
	ld de, wLinkData
; wLinkPlayerName through wLinkPlayerDataEnd, plus one
	ld bc, NAME_LENGTH + (PARTY_LENGTH * 2) + 2 + (PARTYMON_STRUCT_LENGTH * 6) + (NAME_LENGTH * PARTY_LENGTH) + (MON_NAME_LENGTH * PARTY_LENGTH) + 1
	call Link_CopyOTData
	ld de, wPlayerTrademonSpecies
	ld hl, wLinkPlayerPartyMon1Species
	ld c, 2
.loop1
	ld a, [de]
	inc de
	and a
	jr z, .loop1
	cp SERIAL_PREAMBLE_BYTE
	jr z, .loop1
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop1
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .next1
	push hl
	push bc
	ld b, 0
	dec a
	ld c, a
	add hl, bc
	ld a, SERIAL_NO_DATA_BYTE
	ld [hl], a
	pop bc
	pop hl
	jr .loop1

.next1
	ld hl, wc90f
	dec c
	jr nz, .loop1
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jp nz, .skip_mail
	ld hl, wcb84
.loop2
	ld a, [hli]
	cp MAIL_MSG_LENGTH
	jr nz, .loop2
.loop3
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .loop3
	cp MAIL_MSG_LENGTH
	jr z, .loop3
	dec hl
	ld de, wcb84
	ld bc, $190 ; 400
	call CopyBytes
	ld hl, wcb84
	ld bc, $c6 ; 198
.loop4
	ld a, [hl]
	cp MAIL_MSG_LENGTH + 1
	jr nz, .okay1
	ld [hl], SERIAL_NO_DATA_BYTE
.okay1
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop4
	ld de, wcc9e
.loop5
	ld a, [de]
	inc de
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .start_copying_mail
	ld hl, wcc4a
	dec a
	ld b, $0
	ld c, a
	add hl, bc
	ld [hl], SERIAL_NO_DATA_BYTE
	jr .loop5

.start_copying_mail
	ld hl, wcb84
	ld de, wc9f4
	ld b, PARTY_LENGTH
.copy_mail_loop
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	call CopyBytes
	ld a, LOW(MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1))
	add e
	ld e, a
	ld a, HIGH(MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1))
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .copy_mail_loop
	ld de, wc9f4
	ld b, PARTY_LENGTH
.copy_author_loop
	push bc
	ld a, LOW(MAIL_MSG_LENGTH + 1)
	add e
	ld e, a
	ld a, HIGH(MAIL_MSG_LENGTH + 1)
	adc d
	ld d, a
	ld bc, MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)
	call CopyBytes
	pop bc
	dec b
	jr nz, .copy_author_loop
	ld b, PARTY_LENGTH
	ld de, wc9f4
.fix_mail_loop
	push bc
	push de
	farcall IsMailEuropean
	ld a, c
	or a
	jr z, .next
	sub $3
	jr nc, .skip
	farcall DeutenEnglischenPost
	jr .next

.skip
	cp $2
	jr nc, .next
	farcall HandleSpanishItalianMail

.next
	pop de
	ld hl, MAIL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop bc
	dec b
	jr nz, .fix_mail_loop
	ld de, wcb0e
	xor a
	ld [de], a

.skip_mail
	ld hl, wLinkPlayerName
	ld de, wOTPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld de, wOTPartyCount
	ld bc, 1 + (PARTY_LENGTH * 2) + 1
	call CopyBytes
	ld de, wOTPlayerID
	ld bc, 2
	call CopyBytes
	ld de, wOTPartyMons
	ld bc, wOTPartyDataEnd - wOTPartyMons
	call CopyBytes
	ld a, LOW(wOTPartyMonOT)
	ld [wUnusedD102], a
	ld a, HIGH(wOTPartyMonOT)
	ld [wUnusedD102 + 1], a
	ld de, MUSIC_NONE
	call PlayMusic
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ld c, 66
	call z, DelayFrames
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr nz, .ready_to_trade
; link battle
	ld a, CAL
	ld [wOtherTrainerClass], a
	call ClearScreen
	farcall Link_WaitBGMap
	ld hl, wOptions
	ld a, [hl]
	push af
	and 1 << STEREO
	or TEXT_DELAY_MED
	ld [hl], a
	ld hl, wOTPlayerName
	ld de, wOTClassName
	ld bc, NAME_LENGTH
	call CopyBytes
	call ReturnToMapFromSubmenu

	; LET'S DO THIS
	ld a, [wDisableTextAcceleration]
	push af
	ld a, 1
	ld [wDisableTextAcceleration], a
	ldh a, [rIE]
	push af
	ldh a, [rIF]
	push af
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	set LCD_STAT, a
	ldh [rIE], a
	pop af
	ldh [rIF], a

	predef StartBattle

	ldh a, [rIF]
	ld h, a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ld a, h
	ldh [rIF], a
	pop af
	ld [wDisableTextAcceleration], a
	pop af
	ld [wOptions], a
	farcall LoadPokemonData
	jp Function28b22

.ready_to_trade
	ld de, MUSIC_ROUTE_30
	call PlayMusic
	jp InitTradeMenuDisplay
    
Link_PrepPartyData_Ruth:
	ld de, wLinkData
	ld a, SERIAL_PREAMBLE_BYTE
	ld b, PARTY_LENGTH
.loop1
	ld [de], a
	inc de
	dec b
	jr nz, .loop1
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wPartyCount
	ld bc, 1 + (PARTY_LENGTH * 2) + 1
	call CopyBytes
	ld hl, wPlayerID
	ld bc, 2
	call CopyBytes
	ld hl, wPartyMon1Species
	ld bc, PARTY_LENGTH * PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, wPartyMonOT
	ld bc, PARTY_LENGTH * NAME_LENGTH
	call CopyBytes
	ld hl, wPartyMonNicknames
	ld bc, PARTY_LENGTH * MON_NAME_LENGTH
	call CopyBytes

; Okay, we did all that.  Now, are we in the trade center?
; If not, we need not care about carried mail.
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	ret nz

; Fill 5 bytes at wc9f4 with $20
	ld de, wc9f4
	ld a, $20
	call Function28682

; Copy all the mail messages to wc9f9
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.loop2
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	call CopyBytes
	ld bc, sPartyMon1MailEnd - sPartyMon1MailAuthor
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2
; Copy the mail data to wcabf
	ld hl, sPartyMail
	ld b, PARTY_LENGTH
.loop3
	push bc
	ld bc, MAIL_MSG_LENGTH + 1
	add hl, bc
	ld bc, sPartyMon1MailEnd - sPartyMon1MailAuthor
	call CopyBytes
	pop bc
	dec b
	jr nz, .loop3

	ld b, PARTY_LENGTH
	ld de, sPartyMail
	ld hl, wc9f9
.loop4
	push bc
	push hl
	push de
	push hl
	farcall IsMailEuropean
	pop de
	ld a, c
	or a
	jr z, .next
	sub $3
	jr nc, .italian_spanish
	farcall HandleFrenchGermanMail
	jr .next

.italian_spanish
	cp $2
	jr nc, .next
	farcall HandleSpanishItalianMail

.next
	pop de
	ld hl, MAIL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, sPartyMon1MailAuthor - sPartyMon1Mail
	add hl, bc
	pop bc
	dec b
	jr nz, .loop4
	call CloseSRAM
	ld hl, wc9f9
	ld bc, PARTY_LENGTH * (sPartyMon1MailAuthor - sPartyMon1Mail)
.loop5
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .skip2
	ld [hl], sPartyMon1MailAuthor - sPartyMon1Mail

.skip2
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop5
	ld hl, wcabf
	ld de, wcb13
	ld b, PARTY_LENGTH * (sPartyMon1MailEnd - sPartyMon1MailAuthor)
	ld c, $0
.loop6
	inc c
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .skip3
	ld [hl], SERIAL_PATCH_LIST_PART_TERMINATOR
	ld a, c
	ld [de], a
	inc de

.skip3
	inc hl
	dec b
	jr nz, .loop6
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a
	ret

Function28682:
	ld c, 5
.loop
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Function29dba:
	ld a, $5
	ld [wPlayerLinkAction], a
	ld hl, wLinkTimeoutFrames
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	call WaitBGMap
	ld a, $2
	ldh [hVBlank], a
	call DelayFrame
	call DelayFrame
	call Link_CheckCommunicationError
	ld a, [wScriptVar]
	and a
	jr z, .vblank
	ld bc, -1
.wait
	dec bc
	ld a, b
	or c
	jr nz, .wait
	ld a, [wOtherPlayerLinkMode]
	cp $5
	jr nz, .script_var
	ld a, $6
	ld [wPlayerLinkAction], a
	ld hl, wLinkTimeoutFrames
	ld a, $1
	ld [hli], a
	ld [hl], $32
	call Link_CheckCommunicationError
	ld a, [wOtherPlayerLinkMode]
	cp $6
	jr z, .vblank

.script_var
	xor a
	ld [wScriptVar], a
	ret

.vblank
	xor a
	ldh [hVBlank], a
	ret
