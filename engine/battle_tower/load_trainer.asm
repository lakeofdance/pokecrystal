Function_LoadOpponentTrainerAndPokemons:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainer)
	ldh [rSVBK], a

	; Fill wBT_OTTrainer with zeros
	xor a
	ld hl, wBT_OTTrainer
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [wBT_OTMon1Item], a
	ld [wBT_OTMon2Item], a
	ld [wBT_OTMon3Item], a

	; Set wBT_OTTrainer as start address to write the following data to
	ld de, wBT_OTTrainer

	ldh a, [hRandomAdd]
	ld b, a
.resample ; loop to find a random trainer
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
if DEF(_CRYSTAL11)
	maskbits BATTLETOWER_NUM_UNIQUE_TRAINERS
	cp BATTLETOWER_NUM_UNIQUE_TRAINERS
else
; Crystal 1.0 used the wrong constant here, so only the first 21
; trainers in BattleTowerTrainers can be sampled.
	maskbits BATTLETOWER_NUM_UNIQUE_MON
	cp BATTLETOWER_NUM_UNIQUE_MON
endc
	jr nc, .resample
	ld b, a

	ld a, BANK(sBTTrainers)
	call GetSRAMBank

	ld c, BATTLETOWER_STREAK_LENGTH
	ld hl, sBTTrainers
.next_trainer
	ld a, [hli]
	cp b
	jr z, .resample
	dec c
	jr nz, .next_trainer ; c <= 7  initialise all 7 trainers?

	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a

	call CloseSRAM

	push af
; Copy name (10 bytes) and class (1 byte) of trainer
	ld hl, BattleTowerTrainers
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

	call Function_LoadRandomBattleTowerMon
	pop af

	ld hl, BattleTowerTrainerData
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call AddNTimes
	ld bc, BATTLETOWER_TRAINERDATALENGTH
.copy_bt_trainer_data_loop
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_bt_trainer_data_loop

	pop af
	ldh [rSVBK], a

	ret

Function_LoadRandomBattleTowerMon:
	ld c, BATTLETOWER_PARTY_LENGTH
.loop
	push bc
	ld a, BANK(sBTMonPrevTrainer1)
	call GetSRAMBank

	push hl
.FindARandomBattleTowerMon:
	pop hl
	; From Which LevelGroup are the mon loaded
	; a = 1..10
	ld a, [wBTChoiceOfLvlGroup]
	dec a
	ld hl, BattleTowerMons
	ld bc, BATTLETOWER_NUM_UNIQUE_MON * NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	ldh a, [hRandomAdd]
	ld b, a
.resample
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a
	maskbits BATTLETOWER_NUM_UNIQUE_MON
	cp BATTLETOWER_NUM_UNIQUE_MON
	jr nc, .resample
	; in register 'a' is the chosen mon of the LevelGroup

	; Check if mon was already loaded before
	; Check current and the 2 previous teams
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	ld hl, wBT_OTMon1
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, wBT_OTMon2
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, wBT_OTMon3
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevTrainer1
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevTrainer2
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevTrainer3
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevPrevTrainer1
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevPrevTrainer2
	call CompareMove
	jr z, .FindARandomBattleTowerMon
	ld hl, sBTMonPrevPrevTrainer3
	call CompareMove
	jr z, .FindARandomBattleTowerMon

	; check for duplicate items in team
.checkitem
	pop hl
	ld a, [hld]
	ld c, a
	dec hl
	push hl
	ld a, [wBT_OTMon1Item]
	cp c
	jp z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon2Item]
	cp c
	jp z, .FindARandomBattleTowerMon
	ld a, [wBT_OTMon3Item]
	cp c
	jp z, .FindARandomBattleTowerMon

	pop hl
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wNamedObjectIndexBuffer]
	push af
	ld a, [wNamedObjectIndexBuffer + 1]
	push af
	push de
	ld hl, -NICKNAMED_MON_STRUCT_LENGTH
	add hl, de
	ld a, [hli]
	ld [wNamedObjectIndexBuffer], a
	ld a, [hld]
	ld [wNamedObjectIndexBuffer + 1], a
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	pop de
	pop af
	ld [wNamedObjectIndexBuffer + 1], a
	pop af
	ld [wNamedObjectIndexBuffer], a
	pop bc
	dec c
	jp nz, .loop

	ld hl, sBTMonPrevTrainer1
	ld de, sBTMonPrevPrevTrainer1
	ld bc, 6
	call CopyBytes

	ld hl, sBTMonPrevTrainer1
	ld a, [wBT_OTMon1]
	ld [hli], a
	ld a, [wBT_OTMon1 + 1]
	ld [hli], a
	ld a, [wBT_OTMon2]
	ld [hli], a
	ld a, [wBT_OTMon2 + 1]
	ld [hli], a
	ld a, [wBT_OTMon3]
	ld [hli], a
	ld a, [wBT_OTMon3 + 1]
	ld [hl], a
	call CloseSRAM
	ret

INCLUDE "data/battle_tower/classes.asm"

INCLUDE "data/battle_tower/parties.asm"
