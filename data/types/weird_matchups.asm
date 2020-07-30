FreezeDryTypeMatchups:
	;  attacker,  defender,  *=
	db ICE,       WATER,     SUPER_EFFECTIVE
	db ICE,       GRASS,     SUPER_EFFECTIVE
	db ICE,       ICE,       NOT_VERY_EFFECTIVE
	db ICE,       GROUND,    SUPER_EFFECTIVE
	db ICE,       FLYING,    SUPER_EFFECTIVE
	db ICE,       DRAGON,    SUPER_EFFECTIVE
	db ICE,       STEEL,     NOT_VERY_EFFECTIVE
	db ICE,       FIRE,      NOT_VERY_EFFECTIVE

	db -1 ; end

FlyingPressTypeMatchups:
	;  attacker,  defender,  *=
	db FIGHTING,  NORMAL,    SUPER_EFFECTIVE
	db FIGHTING,  ELECTRIC,  NOT_VERY_EFFECTIVE
	db FIGHTING,  GRASS,     SUPER_EFFECTIVE
	db FIGHTING,  ICE,       SUPER_EFFECTIVE
	db FIGHTING,  FIGHTING,  SUPER_EFFECTIVE
	db FIGHTING,  POISON,    NOT_VERY_EFFECTIVE
	db FIGHTING,  FLYING,    NOT_VERY_EFFECTIVE
	db FIGHTING,  PSYCHIC,   NOT_VERY_EFFECTIVE
	db FIGHTING,  DARK,      SUPER_EFFECTIVE

	db -2 ; end (with Foresight)

	db FIGHTING,  GHOST,     NO_EFFECT

	db -1 ; end

WeirdMatchups:
	dw FREEZE_DRY, FreezeDryTypeMatchups
	dw FLYING_PRESS, FlyingPressTypeMatchups
	db -1
