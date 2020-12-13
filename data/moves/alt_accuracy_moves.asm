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
	dw SKY_UPPERCUT
	dw HURRICANE
	dw THSND_ARROWS
	dw SMACK_DOWN
	db -1

VanishedHitMoves:
; These moves always hit a vanished opponent.
	db -1

RainHitMoves:
; These moves always hit in the rain.
	dw THUNDER
	dw HURRICANE
	db -1

HailHitMoves:
; These moves always hit in the hail.
	dw BLIZZARD
	db -1

AlwaysHitMoves:
; Moves with these effects don't make an accuracy check
	db EFFECT_ALWAYS_HIT
	db EFFECT_HYPERSPACE_FURY
	db EFFECT_DEFOG
	db EFFECT_PHANTOM_FORCE
	db EFFECT_CLEAR_SMOG
	db EFFECT_TOPSY_TURVY
	db -1

HitThroughProtectMoves:
; These moves ignore protect, detect, king's shield
	dw H_SPACE_FURY
	dw PHANTOMFORCE
	dw SHADOW_FORCE
	dw H_SPACE_HOLE
	dw FEINT
	db -1

FirstTurnOnlyMoves:
; These moves only hit only the first turn
	dw FAKE_OUT
	dw FIRST_IMP
	db -1
