BattleCommand_Revenge:
; avalanche, revenge
; Double damage if the user took damage this turn

; Only necessary if user goes second
	farcall CheckOpponentWentFirst
	ret z

; Did the opponent mon damage the user this turn?
	ld hl, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyDamageTaken
.ok
	ld a, [hli]
	or [hl]
	ret z

	jp DoubleDamage2
