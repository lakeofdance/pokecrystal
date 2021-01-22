	dw 841 ; FLAPPLE

	db  70, 110,  80,  70,  95,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 45 ; catch rate
	db 170 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 21 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/flapple/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_ERRATIC ; growth rate
	dn EGG_PLANT, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, DRAGONBREATH, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, FLY
	; end
