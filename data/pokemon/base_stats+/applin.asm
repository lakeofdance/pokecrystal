	dw 840 ; APPLIN

	db  40,  40,  80,  20,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 255 ; catch rate
	db 52 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 21 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/applin/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_ERRATIC ; growth rate
	dn EGG_PLANT, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROLLOUT, DEFENSE_CURL, ATTRACT
	; end
