UndergroundHitMoves:
; These moves always hit an underground opponent.
; They also can't hit a flying opponent, even when Lock On is active.
	dw EARTHQUAKE
	dw FISSURE
	dw MAGNITUDE
	db -1

FlyingHitMoves:
; These moves always hit a flying opponent.
	dw GUST
	dw WHIRLWIND
	dw THUNDER
	dw TWISTER
	db -1

RainHitMoves:
; These moves always hit in the rain.
	dw THUNDER
	db -1
