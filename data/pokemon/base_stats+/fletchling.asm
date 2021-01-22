	dw 661 ; FLETCHLING

	db  45,  50,  43,  62,  40,  38
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 56 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 16 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/fletchling/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, STEEL_WING, FLY
	; end
