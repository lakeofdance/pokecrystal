RocksDamage:
; types weak to stealth rocks
	db FIRE,     SUPER_EFFECTIVE
	db ICE,      SUPER_EFFECTIVE
	db FLYING,   SUPER_EFFECTIVE
	db BUG,      SUPER_EFFECTIVE
; types resistant to stealth rocks
	db FIGHTING, NOT_VERY_EFFECTIVE
	db GROUND,   NOT_VERY_EFFECTIVE
	db STEEL,    NOT_VERY_EFFECTIVE
; normal effectiveness is implicit
	db -1
