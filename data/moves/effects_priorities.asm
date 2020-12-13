MoveEffectPriorities:
	db EFFECT_PROTECT,            9
	db EFFECT_ENDURE,             9
	db EFFECT_KINGS_SHIELD,       9
	db EFFECT_SNATCH,             9
	db EFFECT_EXTRA_PRIORITY_HIT, 7
	db EFFECT_PRIORITY_HIT,       6
	db EFFECT_PRIORITY_MULTI_HIT, 6
	db EFFECT_SUCKER_PUNCH,       6
; default move priority is 5
	db EFFECT_REVENGE,            3
	db EFFECT_COUNTER,            2
	db EFFECT_MIRROR_COAT,        2
	db EFFECT_FORCE_SWITCH,       1
	db EFFECT_FORCE_SWITCH_HIT,   1
	db EFFECT_TRICK_ROOM,         0
	db -1

MovePriorities:
; some individual moves have their own priority
	dwb FAKE_OUT,                 8
	dwb BABYDOLLEYES,             6
; default move priority is 5
	dwb VITAL_THROW,              4
	db -1
