BattleCommand_StartHail:
; starthail
	ld hl, wBattleWeather
	ld a, [hl]
	cp WEATHER_HAIL
	jr z, .failed	

	ld a, WEATHER_HAIL
	ld [hli], a
	ld a, 5
; hl is at wWeatherCount
	ld [hl], a
	farcall AnimateCurrentMove
	ld hl, HailstormBrewingText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farcall PrintButItFailed
	ret
