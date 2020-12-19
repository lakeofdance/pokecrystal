	dw 562 ; YAMASK

	db  38,  30,  85,  30,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 190 ; catch rate
	db 61 ; base exp
	db NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/yamask/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DREAM_EATER, REST, ATTRACT, THIEF, NIGHTMARE, FLASH
	; end
