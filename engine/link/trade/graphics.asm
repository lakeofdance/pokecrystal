LinkCommsBorderGFX:
INCBIN "gfx/trade/border_tiles.2bpp"

SetTradeRoomBGPals:
	farcall LoadTradeRoomBGPals
	call SetPalettes
	ret

LoadTradeScreenBorder:
	ld de, LinkCommsBorderGFX
	ld hl, vTiles2
	lb bc, BANK(LinkCommsBorderGFX), 70
	call Get2bpp
	ret

LinkComms_LoadPleaseWaitTextboxBorderGFX:
	ld de, LinkCommsBorderGFX + $30 tiles
	ld hl, vTiles2 tile $76
	lb bc, BANK(LinkCommsBorderGFX), 8
	call Get2bpp
	ret

Function16d6ae:
	call Function16d42e
	ld hl, Tilemap_CableTradeBorderTop
	decoord 0, 0
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ld hl, Tilemap_CableTradeBorderBottom
	decoord 0, 16
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ret

Function16d42e:
	ld hl, Tilemap_MobileTradeBorderFullscreen
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret

Tilemap_MobileTradeBorderFullscreen:
INCBIN "gfx/trade/border_mobile_fullscreen.tilemap"

Tilemap_CableTradeBorderTop:
INCBIN "gfx/trade/border_cable_top.tilemap"

Tilemap_CableTradeBorderBottom:
INCBIN "gfx/trade/border_cable_bottom.tilemap"

LinkTextboxAtHL:
	ld d, h
	ld e, l
	call LinkTextbox
	ret

LinkTextbox:
	ld h, d
	ld l, e
	push bc
	push hl
	call .PlaceBorder
	pop hl
	pop bc

	ld de, wAttrMap - wTileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

.PlaceBorder
	push hl
	ld a, $30
	ld [hli], a
	inc a
	call .PlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $33
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], $34
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, $35
	ld [hli], a
	ld a, $36
	call .PlaceRow
	ld [hl], $37
	ret

.PlaceRow
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret
