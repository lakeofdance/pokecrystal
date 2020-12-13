; recoil constants
; see BattleCommand_Recoil
	const_def
	const RECOIL_100
	const RECOIL_75
	const RECOIL_50
	const RECOIL_30
	const RECOIL_25

; MoveEffectsPointers indexes (see data/moves/effects_pointers.asm)
	const_def
	const EFFECT_NORMAL_HIT
	const EFFECT_SLEEP
	const EFFECT_POISON_HIT
	const EFFECT_LEECH_HIT
	const EFFECT_BURN_HIT
	const EFFECT_FREEZE_HIT
	const EFFECT_PARALYZE_HIT
	const EFFECT_SELFDESTRUCT
	const EFFECT_DREAM_EATER
	const EFFECT_MIRROR_MOVE
	const EFFECT_ATTACK_UP
	const EFFECT_DEFENSE_UP
	const EFFECT_SPEED_UP
	const EFFECT_SP_ATK_UP
	const EFFECT_SP_DEF_UP
	const EFFECT_ACCURACY_UP
	const EFFECT_EVASION_UP
	const EFFECT_ALWAYS_HIT
	const EFFECT_ATTACK_DOWN
	const EFFECT_DEFENSE_DOWN
	const EFFECT_SPEED_DOWN
	const EFFECT_SP_ATK_DOWN
	const EFFECT_SP_DEF_DOWN
	const EFFECT_ACCURACY_DOWN
	const EFFECT_EVASION_DOWN
	const EFFECT_RESET_STATS
	const EFFECT_BIDE
	const EFFECT_RAMPAGE
	const EFFECT_FORCE_SWITCH
	const EFFECT_MULTI_HIT
	const EFFECT_CONVERSION
	const EFFECT_FLINCH_HIT
	const EFFECT_HEAL
	const EFFECT_TOXIC
	const EFFECT_PAY_DAY
	const EFFECT_LIGHT_SCREEN
	const EFFECT_TRI_ATTACK
	const EFFECT_OHKO
	const EFFECT_RAZOR_WIND
	const EFFECT_SUPER_FANG
	const EFFECT_STATIC_DAMAGE
	const EFFECT_TRAP_TARGET
	const EFFECT_DOUBLE_HIT
	const EFFECT_JUMP_KICK
	const EFFECT_MIST
	const EFFECT_FOCUS_ENERGY
	const EFFECT_RECOIL_HIT
	const EFFECT_CONFUSE
	const EFFECT_ATTACK_UP_2
	const EFFECT_DEFENSE_UP_2
	const EFFECT_SPEED_UP_2
	const EFFECT_SP_ATK_UP_2
	const EFFECT_SP_DEF_UP_2
	const EFFECT_ACCURACY_UP_2
	const EFFECT_EVASION_UP_2
	const EFFECT_TRANSFORM
	const EFFECT_ATTACK_DOWN_2
	const EFFECT_DEFENSE_DOWN_2
	const EFFECT_SPEED_DOWN_2
	const EFFECT_SP_ATK_DOWN_2
	const EFFECT_SP_DEF_DOWN_2
	const EFFECT_ACCURACY_DOWN_2
	const EFFECT_EVASION_DOWN_2
	const EFFECT_REFLECT
	const EFFECT_POISON
	const EFFECT_PARALYZE
	const EFFECT_ATTACK_DOWN_HIT
	const EFFECT_DEFENSE_DOWN_HIT
	const EFFECT_SPEED_DOWN_HIT
	const EFFECT_SP_ATK_DOWN_HIT
	const EFFECT_SP_DEF_DOWN_HIT
	const EFFECT_ACCURACY_DOWN_HIT
	const EFFECT_EVASION_DOWN_HIT
	const EFFECT_SKY_ATTACK
	const EFFECT_CONFUSE_HIT
	const EFFECT_POISON_MULTI_HIT
	const EFFECT_SUBSTITUTE
	const EFFECT_HYPER_BEAM
	const EFFECT_RAGE
	const EFFECT_MIMIC
	const EFFECT_METRONOME
	const EFFECT_LEECH_SEED
	const EFFECT_SPLASH
	const EFFECT_DISABLE
	const EFFECT_LEVEL_DAMAGE
	const EFFECT_PSYWAVE
	const EFFECT_COUNTER
	const EFFECT_ENCORE
	const EFFECT_PAIN_SPLIT
	const EFFECT_SNORE
	const EFFECT_CONVERSION2
	const EFFECT_LOCK_ON
	const EFFECT_SKETCH
	const EFFECT_SLEEP_TALK
	const EFFECT_DESTINY_BOND
	const EFFECT_REVERSAL
	const EFFECT_SPITE
	const EFFECT_FALSE_SWIPE
	const EFFECT_HEAL_BELL
	const EFFECT_PRIORITY_HIT
	const EFFECT_TRIPLE_KICK
	const EFFECT_THIEF
	const EFFECT_MEAN_LOOK
	const EFFECT_NIGHTMARE
	const EFFECT_DEFROST_BURN_HIT
	const EFFECT_CURSE
	const EFFECT_PROTECT
	const EFFECT_SPIKES
	const EFFECT_FORESIGHT
	const EFFECT_PERISH_SONG
	const EFFECT_SANDSTORM
	const EFFECT_ENDURE
	const EFFECT_ROLLOUT
	const EFFECT_SWAGGER
	const EFFECT_FURY_CUTTER
	const EFFECT_ATTRACT
	const EFFECT_RETURN
	const EFFECT_PRESENT
	const EFFECT_FRUSTRATION
	const EFFECT_SAFEGUARD
	const EFFECT_SACRED_FIRE
	const EFFECT_MAGNITUDE
	const EFFECT_BATON_PASS
	const EFFECT_PURSUIT
	const EFFECT_RAPID_SPIN
	const EFFECT_MORNING_SUN
	const EFFECT_SYNTHESIS
	const EFFECT_MOONLIGHT
	const EFFECT_HIDDEN_POWER
	const EFFECT_RAIN_DANCE
	const EFFECT_SUNNY_DAY
	const EFFECT_DEFENSE_UP_HIT
	const EFFECT_ATTACK_UP_HIT
	const EFFECT_SP_ATTACK_UP_HIT
	const EFFECT_ALL_UP_HIT
	const EFFECT_BELLY_DRUM
	const EFFECT_PSYCH_UP
	const EFFECT_MIRROR_COAT
	const EFFECT_SKULL_BASH
	const EFFECT_TWISTER
	const EFFECT_EARTHQUAKE
	const EFFECT_FUTURE_SIGHT
	const EFFECT_GUST
	const EFFECT_STOMP
	const EFFECT_SOLARBEAM
	const EFFECT_THUNDER
	const EFFECT_TELEPORT
	const EFFECT_BEAT_UP
	const EFFECT_FLY
	const EFFECT_DEFENSE_CURL
;
	const EFFECT_BURN_UP
	const EFFECT_STRENGTH_SAP
	const EFFECT_TURN_HIT
	const EFFECT_FORCE_SWITCH_HIT
	const EFFECT_REVENGE
	const EFFECT_KNOCK_OFF
	const EFFECT_FOUL_PLAY
	const EFFECT_DOUBLE_IF_FIRST
	const EFFECT_SOAK
	const EFFECT_PRIORITY_MULTI_HIT
	const EFFECT_EXTRA_PRIORITY_HIT
	const EFFECT_STEALTH_ROCKS
	const EFFECT_TOXIC_SPIKES
	const EFFECT_USERSTATSDOWN_HIT
	const EFFECT_HYPERSPACE_FURY
	const EFFECT_FELL_STINGER
	const EFFECT_GEOMANCY
	const EFFECT_ACROBATICS
	const EFFECT_FACADE
	const EFFECT_HEX
	const EFFECT_VENOSHOCK
	const EFFECT_PARTING_SHOT
	const EFFECT_PARA_FLINCH_HIT
	const EFFECT_BRICK_BREAK
	const EFFECT_WAKE_UP_SLAP
	const EFFECT_BOUNCE
	const EFFECT_DEFOG
	const EFFECT_ROOST
	const EFFECT_COURT_CHANGE
	const EFFECT_ENDEAVOR
	const EFFECT_REFLECT_TYPE
	const EFFECT_TRUMP_CARD
	const EFFECT_STICKY_WEB
	const EFFECT_GROUND_OPP_HIT
	const EFFECT_ARENA_TRAP_HIT
	const EFFECT_METEOR_BEAM
	const EFFECT_PHANTOM_FORCE
	const EFFECT_SPECTRAL_THIEF
	const EFFECT_ERUPTION
	const EFFECT_BURN_FLINCH_HIT
	const EFFECT_BURNING_ENVY
	const EFFECT_FLARE_BLITZ
	const EFFECT_INCINERATE
	const EFFECT_MIND_BLOWN
	const EFFECT_BURN
	const EFFECT_SPEED_UP_HIT
	const EFFECT_GYRO_BALL
	const EFFECT_KINGS_SHIELD
	const EFFECT_HEART_SWAP
	const EFFECT_PSYCHO_SHIFT
	const EFFECT_PSYSHOCK
	const EFFECT_STORED_POWER
	const EFFECT_SYNCHRONOISE
	const EFFECT_TRICK
	const EFFECT_TRICK_ROOM
	const EFFECT_SP_DEF_DOWN_2_HIT
	const EFFECT_CLEAR_SMOG
	const EFFECT_MULTI_BOOST
	const EFFECT_TOXIC_THREAD
	const EFFECT_VENOM_DRENCH
	const EFFECT_FINAL_GAMBIT
	const EFFECT_IGNORE_FOE_BOOSTS
	const EFFECT_FREEZE_FLINCH_HIT
	const EFFECT_TAUNT
	const EFFECT_TAILWIND
	const EFFECT_CRUSH_GRIP
	const EFFECT_MEMENTO
	const EFFECT_WEATHER_BALL
	const EFFECT_ELECTRO_BALL
	const EFFECT_SUCKER_PUNCH
	const EFFECT_HAIL
	const EFFECT_AURORA_VEIL
	const EFFECT_BIG_LEECH_HIT
	const EFFECT_PUNISHMENT
	const EFFECT_SNATCH
	const EFFECT_TOPSY_TURVY
	const EFFECT_PURIFY
	const EFFECT_OCTOLOCK
	const EFFECT_VOLT_TACKLE
	const EFFECT_BUG_BITE
; 227
