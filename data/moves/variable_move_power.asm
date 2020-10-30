FlailReversalPower:
	; hp bar pixels, power
	db HP_BAR_LENGTH_PX / 48,   200
	db HP_BAR_LENGTH_PX / 12,   150
	db HP_BAR_LENGTH_PX / 5,    100
	db HP_BAR_LENGTH_PX / 3,     80
	db HP_BAR_LENGTH_PX * 2 / 3, 40
	db HP_BAR_LENGTH_PX,         20

TrumpCardPower:
	; pp, power
	db 4, 40
	db 3, 50
	db 2, 60
	db 1, 80
	db 0, 200

ElectroBallPower:
	; user speed / target speed, power
	db 4,       150
	db 3,       120
	db 2,        80
	db 1,        60
	db 0,        40
