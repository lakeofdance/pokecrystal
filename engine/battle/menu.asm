LoadBattleMenu:
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

ContestBattleMenu:
	ld hl, BugContestMenuHeader
	call LoadMenuHeader

Function24f19:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw BattleMenuData
	db 1 ; default option

BattleMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba BattleMenuStrings
	dbw BANK(BattleMenuData), 0

BattleMenuStrings:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

BugContestMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw BugContestMenuData
	db 1 ; default option

BugContestMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba BugContestMenuStrings
	dba PrintRemainingParkBalls

BugContestMenuStrings:
	db "FIGHT@"
	db "<PKMN>@"
	db "PARKBALL×  @"
	db "RUN@"

PrintRemainingParkBalls:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
