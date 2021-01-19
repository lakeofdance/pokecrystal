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

GrassKnotPower:
	; target weight * 10 in lbs, power
	dwb 4407,   120 ; 200kg or more
	dwb 2202,   100 ; 100 - 199.9kg
	dwb 1110,    80 ; 50  -  99.9kg
	dwb 549,     60 ; 25  -  49.9kg
	dwb 218,     40 ; 10  -  24.9kg
	dwb 0,       20 ; 0   -   9.9kg

HeavySlamPower:
	; user weight / target weight, power
	db 5,       120
	db 4,       100
	db 3,        80
	db 2,        60
	db 0,        40
