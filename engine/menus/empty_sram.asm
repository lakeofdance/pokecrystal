EmptyAllSRAMBanks:
	ld a, 0
.loop
	cp NUM_SRAM_BANKS
	ret nc
	cp 4 ; skip mobile
	call nz, .EmptyBank
	inc a
	jr .loop

.EmptyBank:
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
