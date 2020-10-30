BattleCommand_WeatherBall:
; weatherball
	ld a, [wBattleWeather]
	cp WEATHER_NONE
	ret z

; double move power
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld a, [hl]
	add a
	ld [hl], a

; change move type depending on the weather
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld a, [wBattleWeather]
	ld b, WATER
	cp WEATHER_RAIN
	jr z, .got_type

	ld b, FIRE
	cp WEATHER_SUN
	jr z, .got_type

	ld b, ROCK
	cp WEATHER_SANDSTORM
	jr z, .got_type

	ld b, ICE
	cp WEATHER_HAIL
	jr z, .got_type

; shouldnt ever be here
	ret

.got_type
; change the type of the move
; but preserve physical/special/status and contact flags
	ld a, [hl]
	and %11100000
	or b
	ld [hl], a
	ret
