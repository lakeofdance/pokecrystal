BattleTowerMons:
; 10 groups of 21 mons.

; species
; held item
; moves
; stat exp: 0 to 255 (but only the value/4 counts, so max 252)
;     hp
;     attack
;     defense
;     speed
;     special attack
;     special defense
; DVs: 0 to 15 (hp DV is derived from the others)
;     attack
;     defense
;     speed
;     special
; happiness: 0 to 255
; level
; nickname: 11 characters

; NB: The lowest stat exp appearing here is 172, and the highest (excluding the lv90 dragonite with 252) is 244.

; NB2: If a mon's defense, speed, and special DVs are all 10, and its attack DV is 2, 3, 6, 7, 10, 11, 14 or 15, it will be shiny.

BattleTowerMons1:

	dw JOLTEON
	db MIRACLEBERRY
	dw THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	db 220, 200, 200, 184, 200, 200 ; Stat exp
	dn 13, 13, 11, 13 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "SANDA-SU@@@"

	dw ESPEON
	db LEFTOVERS
	dw MUD_SLAP, PSYCHIC_M, PSYCH_UP, TOXIC
	db 200, 220, 184, 200, 200, 200 ; Stat exp
	dn 14, 13, 15, 11 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "E-HUi@@@@@@"

	dw UMBREON
	db GOLD_BERRY
	dw SHADOW_BALL, IRON_TAIL, PSYCH_UP, TOXIC
	db 200, 200, 212, 220, 200, 200 ; Stat exp
	dn 13, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "BURAtuKI-@@"

	dw WOBBUFFET
	db FOCUS_BAND
	dw COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 7, 15, 13, 7 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "SO-NANSU@@@"

	dw KANGASKHAN
	db MIRACLEBERRY
	dw REVERSAL, HYPER_BEAM, EARTHQUAKE, ATTRACT
	db 200, 172, 200, 172, 172, 172 ; Stat exp
	dn 14, 15, 12, 15 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "GARU-RA@@@@"

	dw CORSOLA
	db SCOPE_LENS
	dw SURF, PSYCHIC_M, RECOVER, ANCIENTPOWER
	db 200, 172, 180, 172, 172, 172 ; Stat exp
	dn 15, 14, 15, 13 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "SANI-GO@@@@"

	dw MILTANK
	db GOLD_BERRY
	dw BLIZZARD, EARTHQUAKE, HYPER_BEAM, TOXIC
	db 172, 172, 172, 172, 184, 184 ; Stat exp
	dn 11, 11, 13, 15 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "MIRUTANKU@@"

	dw AERODACTYL
	db LEFTOVERS
	dw HYPER_BEAM, SUPERSONIC, EARTHQUAKE, BITE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 13, 11, 15, 11 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "PUTERA@@@@@"

	dw LAPRAS
	db MIRACLEBERRY
	dw BLIZZARD, SURF, THUNDERBOLT, PSYCHIC_M
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "RAPURASU@@@"

	dw SNEASEL
	db GOLD_BERRY
	dw SLASH, FAINT_ATTACK, SURF, BLIZZARD
	db 172, 184, 172, 172, 172, 172 ; Stat exp
	dn 15, 11, 11, 15 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "NIyu-RA@@@@"

	dw PORYGON2
	db BRIGHTPOWDER
	dw PSYCHIC_M, BLIZZARD, HYPER_BEAM, TRI_ATTACK
	db 172, 172, 200, 172, 172, 172 ; Stat exp
	dn 15, 11, 13, 14 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "PORIGON2@@@"

	dw MISDREAVUS
	db FOCUS_BAND
	dw PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 14, 15, 13, 15 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "MUUMA@@@@@@"

	dw HOUNDOUR
	db GOLD_BERRY
	dw FAINT_ATTACK, SOLARBEAM, ROAR, SUNNY_DAY
	db 172, 172, 172, 180, 172, 172 ; Stat exp
	dn 15, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "DERUBIRU@@@"

	dw GIRAFARIG
	db KINGS_ROCK
	dw PSYBEAM, MUD_SLAP, SHADOW_BALL, AGILITY
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 14, 13, 15, 13 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "KIRINRIKI@@"

	dw BLISSEY
	db QUICK_CLAW
	dw HEADBUTT, SOLARBEAM, ROLLOUT, STRENGTH
	db 176, 200, 172, 172, 172, 172 ; Stat exp
	dn 13, 15, 12, 14 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "HAPINASU@@@"

	dw SNORLAX
	db MIRACLEBERRY
	dw HEADBUTT, PROTECT, SNORE, SURF
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 14, 15, 15, 7 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "KABIGON@@@@"

	dw EXEGGUTOR
	db KINGS_ROCK
	dw TOXIC, GIGA_DRAIN, THIEF, CONFUSION
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "NAtuSI-@@@@"

	dw HERACROSS
	db GOLD_BERRY
	dw REVERSAL, ENDURE, COUNTER, ROCK_SMASH
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 15, 7, 15, 7 ; DVs
	db 100 ; Happiness
	db 10 ; Level
	db "HERAKUROSU@"

	dw UNOWN
	db BERRY
	dw HIDDEN_POWER, NO_MOVE, NO_MOVE, NO_MOVE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 15, 15, 15, 15 ; DVs
	db 0 ; Happiness
	db 10 ; Level
	db "ANNO-N@@@@@"

	dw TAUROS
	db KINGS_ROCK
	dw HEADBUTT, SWAGGER, TAIL_WHIP, ICY_WIND
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 5, 5, 7 ; DVs
	db 0 ; Happiness
	db 10 ; Level
	db "KENTAROSU@@"

	dw MR__MIME
	db QUICK_CLAW
	dw TOXIC, PSYCH_UP, FIRE_PUNCH, HEADBUTT
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 3, 6, 7 ; DVs
	db 0 ; Happiness
	db 10 ; Level
	db "BARIYA-DO@@"


BattleTowerMons2:

	dw UMBREON
	db LEFTOVERS
	dw PROTECT, TOXIC, MUD_SLAP, ATTRACT
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 12, 15, 11, 12 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "BURAtuKI-@@"

	dw STARMIE
	db GOLD_BERRY
	dw RECOVER, PSYCHIC_M, SURF, PSYCH_UP
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 13, 11, 13, 11 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "SUTA-MI-@@@"

	dw GYARADOS
	db MIRACLEBERRY
	dw HYPER_BEAM, DRAGON_RAGE, THUNDERBOLT, FIRE_BLAST
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 10, 15, 13 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "GIyaRADOSU@"

	dw STEELIX
	db GOLD_BERRY
	dw ROAR, IRON_TAIL, SWAGGER, EARTHQUAKE
	db 220, 212, 220, 172, 220, 220 ; Stat exp
	dn 15, 15, 15, 15 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "HAGANE-RU@@"

	dw ALAKAZAM
	db BERRY_JUICE
	dw PSYCHIC_M, PSYCH_UP, TOXIC, THUNDERPUNCH
	db 220, 220, 172, 220, 200, 200 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "HU-DEiN@@@@"

	dw ARCANINE
	db BRIGHTPOWDER
	dw FLAMETHROWER, ROAR, HYPER_BEAM, IRON_TAIL
	db 184, 212, 220, 232, 220, 220 ; Stat exp
	dn 13, 11, 15, 11 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "UINDEi@@@@@"

	dw HERACROSS
	db FOCUS_BAND
	dw ENDURE, REVERSAL, MEGAHORN, EARTHQUAKE
	db 220, 172, 212, 172, 212, 212 ; Stat exp
	dn 13, 15, 13, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "HERAKUROSU@"

	dw EXEGGUTOR
	db LEFTOVERS
	dw HYPER_BEAM, PSYCHIC_M, TOXIC, DREAM_EATER
	db 212, 220, 220, 212, 212, 212 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "NAtuSI-@@@@"

	dw AERODACTYL
	db GOLD_BERRY
	dw REST, HYPER_BEAM, EARTHQUAKE, DRAGON_RAGE
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 15, 11, 11, 11 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "PUTERA@@@@@"

	dw BLISSEY
	db BRIGHTPOWDER
	dw PSYCHIC_M, SUBMISSION, SOFTBOILED, COUNTER
	db 220, 220, 172, 172, 220, 220 ; Stat exp
	dn 11, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "HAPINASU@@@"

	dw LAPRAS
	db GOLD_BERRY
	dw PSYCHIC_M, THUNDERBOLT, BLIZZARD, CONFUSE_RAY
	db 232, 172, 200, 232, 172, 172 ; Stat exp
	dn 15, 14, 13, 7 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "RAPURASU@@@"

	dw PIKACHU
	db LIGHT_BALL
	dw THUNDERBOLT, THUNDER_WAVE, STRENGTH, TOXIC
	db 212, 220, 212, 220, 220, 220 ; Stat exp
	dn 15, 12, 15, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "PIKATIyuU@@"

	dw SCIZOR
	db FOCUS_BAND
	dw STEEL_WING, SLASH, TOXIC, SANDSTORM
	db 200, 212, 200, 212, 220, 220 ; Stat exp
	dn 15, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "HAtuSAMU@@@"

	dw HITMONCHAN
	db GOLD_BERRY
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MEGA_PUNCH
	db 220, 212, 184, 220, 172, 172 ; Stat exp
	dn 15, 11, 15, 13 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "EBIWARA-@@@"

	dw TAUROS
	db BRIGHTPOWDER
	dw THUNDERBOLT, EARTHQUAKE, HYPER_BEAM, BLIZZARD
	db 220, 200, 220, 172, 172, 172 ; Stat exp
	dn 15, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "KENTAROSU@@"

	dw AZUMARILL
	db MYSTIC_WATER
	dw SURF, BLIZZARD, ATTRACT, RAIN_DANCE
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 14, 13, 15, 7 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "MARIRURI@@@"

	dw MILTANK
	db KINGS_ROCK
	dw EARTHQUAKE, THUNDER, ATTRACT, SURF
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 13, 15, 15, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "MIRUTANKU@@"

	dw WIGGLYTUFF
	db GOLD_BERRY
	dw HYPER_BEAM, BLIZZARD, FIRE_BLAST, ATTRACT
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 12, 7, 15, 14 ; DVs
	db 100 ; Happiness
	db 20 ; Level
	db "PUKURIN@@@@"

	dw WIGGLYTUFF
	db PINK_BOW
	dw PSYCHIC_M, SWAGGER, PSYCH_UP, HEADBUTT
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 12, 7, 7, 7 ; DVs
	db 0 ; Happiness
	db 20 ; Level
	db "PUKURIN@@@@"

	dw NIDOKING
	db BERRY
	dw BLIZZARD, EARTHQUAKE, SURF, THUNDERPUNCH
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 5, 6, 4, 6 ; DVs
	db 0 ; Happiness
	db 20 ; Level
	db "NIDOKINGU@@"

	dw QUAGSIRE
	db QUICK_CLAW
	dw AMNESIA, EARTHQUAKE, SURF, RAIN_DANCE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 5, 5, 4, 7 ; DVs
	db 0 ; Happiness
	db 20 ; Level
	db "NUO-@@@@@@@"

BattleTowerMons3:

	dw JOLTEON
	db MIRACLEBERRY
	dw THUNDERBOLT, THUNDER_WAVE, ROAR, MUD_SLAP
	db 220, 220, 220, 220, 232, 232 ; Stat exp
	dn 13, 11, 14, 13 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "SANDA-SU@@@"

	dw POLIWRATH
	db BRIGHTPOWDER
	dw DOUBLE_TEAM, SURF, FISSURE, SUBMISSION
	db 220, 232, 232, 232, 220, 220 ; Stat exp
	dn 13, 13, 15, 11 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "NIyoROBON@@"

	dw STARMIE
	db LEFTOVERS
	dw THUNDER_WAVE, PSYCHIC_M, RECOVER, SURF
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 15, 15, 15 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "SUTA-MI-@@@"

	dw JYNX
	db GOLD_BERRY
	dw BLIZZARD, LOVELY_KISS, DREAM_EATER, ATTRACT
	db 220, 220, 220, 172, 220, 220 ; Stat exp
	dn 15, 11, 14, 14 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "RU-ZIyuRA@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, SLUDGE_BOMB, SLASH, MUD_SLAP
	db 220, 220, 172, 220, 220, 220 ; Stat exp
	dn 14, 15, 15, 15 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "DAGUTORIO@@"

	dw BELLOSSOM
	db BRIGHTPOWDER
	dw GIGA_DRAIN, SUNNY_DAY, SOLARBEAM, DOUBLE_TEAM
	db 212, 212, 220, 232, 220, 220 ; Stat exp
	dn 13, 15, 13, 11 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "KIREIHANA@@"

	dw BLISSEY
	db LEFTOVERS
	dw TOXIC, REFLECT, SOFTBOILED, PROTECT
	db 220, 172, 212, 172, 212, 212 ; Stat exp
	dn 15, 11, 14, 13 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "HAPINASU@@@"

	dw HOUNDOOM
	db CHARCOAL
	dw FLAMETHROWER, CRUNCH, SHADOW_BALL, DREAM_EATER
	db 212, 220, 220, 212, 212, 212 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "HERUGA-@@@@"

	dw MACHAMP
	db MIRACLEBERRY
	dw CROSS_CHOP, ICE_PUNCH, EARTHQUAKE, FIRE_BLAST
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 15, 13, 11, 14 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "KAIRIKI-@@@"

	dw CROBAT
	db GOLD_BERRY
	dw ATTRACT, CONFUSE_RAY, TOXIC, WING_ATTACK
	db 220, 220, 172, 172, 220, 220 ; Stat exp
	dn 14, 15, 13, 12 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "KUROBAtuTO@"

	dw PORYGON2
	db BRIGHTPOWDER
	dw PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	db 232, 172, 200, 232, 172, 172 ; Stat exp
	dn 13, 15, 13, 11 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "PORIGON2@@@"

	dw MAROWAK
	db THICK_CLUB
	dw EARTHQUAKE, RETURN, HYPER_BEAM, BONEMERANG
	db 212, 220, 212, 220, 172, 172 ; Stat exp
	dn 13, 13, 14, 11 ; DVs
	db 255 ; Happiness
	db 30 ; Level
	db "GARAGARA@@@"

	dw ELECTRODE
	db BRIGHTPOWDER
	dw LIGHT_SCREEN, THUNDERBOLT, PROTECT, THUNDER
	db 200, 212, 200, 212, 220, 220 ; Stat exp
	dn 11, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "MARUMAIN@@@"

	dw LAPRAS
	db LEFTOVERS
	dw RAIN_DANCE, WATER_GUN, ICY_WIND, STRENGTH
	db 220, 212, 184, 220, 172, 172 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "RAPURASU@@@"

	dw LANTURN
	db GOLD_BERRY
	dw RAIN_DANCE, THUNDER, SURF, FLAIL
	db 220, 200, 220, 172, 172, 172 ; Stat exp
	dn 13, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "RANTA-N@@@@"

	dw ESPEON
	db MIRACLEBERRY
	dw CONFUSION, SWIFT, TOXIC, PSYCH_UP
	db 212, 220, 220, 220, 220, 220 ; Stat exp
	dn 14, 15, 15, 7 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "E-HUi@@@@@@"

	dw TENTACRUEL
	db KINGS_ROCK
	dw WRAP, TOXIC, SLUDGE_BOMB, BUBBLEBEAM
	db 220, 212, 220, 216, 212, 212 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "DOKUKURAGE@"

	dw GENGAR
	db GOLD_BERRY
	dw THIEF, LICK, NIGHT_SHADE, GIGA_DRAIN
	db 220, 200, 220, 220, 220, 220 ; Stat exp
	dn 15, 7, 15, 7 ; DVs
	db 100 ; Happiness
	db 30 ; Level
	db "GENGA-@@@@@"

	dw URSARING
	db GOLD_BERRY
	dw HEADBUTT, PROTECT, ROAR, LEER
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 7, 4, 5 ; DVs
	db 0 ; Happiness
	db 30 ; Level
	db "RINGUMA@@@@"

	dw FEAROW
	db BRIGHTPOWDER
	dw MIRROR_MOVE, PURSUIT, PECK, SWIFT
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 7, 7, 7 ; DVs
	db 0 ; Happiness
	db 30 ; Level
	db "ONIDORIRU@@"

	dw PRIMEAPE
	db MIRACLEBERRY
	dw LOW_KICK, KARATE_CHOP, REVERSAL, FOCUS_ENERGY
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 7, 6, 7 ; DVs
	db 0 ; Happiness
	db 30 ; Level
	db "OKORIZARU@@"


BattleTowerMons4:

	dw TAUROS
	db GOLD_BERRY
	dw RETURN, HYPER_BEAM, EARTHQUAKE, IRON_TAIL
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 15, 14 ; DVs
	db 255 ; Happiness
	db 40 ; Level
	db "KENTAROSU@@"

	dw KINGDRA
	db LEFTOVERS
	dw SURF, DRAGONBREATH, HYPER_BEAM, BLIZZARD
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "KINGUDORA@@"

	dw SNORLAX
	db QUICK_CLAW
	dw ATTRACT, BODY_SLAM, PSYCH_UP, EARTHQUAKE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 14, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "KABIGON@@@@"

	dw LAPRAS
	db LEFTOVERS
	dw THUNDERBOLT, ICE_BEAM, CONFUSE_RAY, SURF
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "RAPURASU@@@"

	dw STEELIX
	db GOLD_BERRY
	dw SANDSTORM, IRON_TAIL, EARTHQUAKE, TOXIC
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 14, 15, 13, 11 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "HAGANE-RU@@"

	dw ALAKAZAM
	db KINGS_ROCK
	dw PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
	db 220, 212, 220, 232, 220, 220 ; Stat exp
	dn 13, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "HU-DEiN@@@@"

	dw STARMIE
	db LEFTOVERS
	dw BLIZZARD, THUNDERBOLT, SURF, PSYCHIC_M
	db 220, 220, 212, 220, 212, 212 ; Stat exp
	dn 15, 13, 11, 14 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "SUTA-MI-@@@"

	dw WOBBUFFET
	db GOLD_BERRY
	dw COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	db 212, 220, 220, 220, 220, 220 ; Stat exp
	dn 11, 15, 14, 7 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "SO-NANSU@@@"

	dw GOLEM
	db FOCUS_BAND
	dw EXPLOSION, EARTHQUAKE, MEGA_PUNCH, ROCK_SLIDE
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 13, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "GORO-NIya@@"

	dw SCIZOR
	db SCOPE_LENS
	dw SLASH, STEEL_WING, PURSUIT, HYPER_BEAM
	db 220, 220, 220, 200, 220, 220 ; Stat exp
	dn 11, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "HAtuSAMU@@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, HYPER_BEAM, SLUDGE_BOMB, MUD_SLAP
	db 212, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 11, 11 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "DAGUTORIO@@"

	dw SLOWBRO
	db MIRACLEBERRY
	dw SURF, PSYCHIC_M, EARTHQUAKE, BLIZZARD
	db 212, 220, 212, 220, 220, 220 ; Stat exp
	dn 11, 15, 12, 15 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "YADORAN@@@@"

	dw PORYGON2
	db NO_ITEM
	dw CONVERSION2, CONVERSION, PSYBEAM, THIEF
	db 220, 212, 220, 220, 220, 220 ; Stat exp
	dn 11, 12, 14, 15 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "PORIGON2@@@"

	dw ARCANINE
	db CHARCOAL
	dw FLAME_WHEEL, LEER, BODY_SLAM, ROAR
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 11, 11 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "UINDEi@@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw RAPID_SPIN, PROTECT, TOXIC, SANDSTORM
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 10, 7, 15 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "HUoRETOSU@@"

	dw OMASTAR
	db GOLD_BERRY
	dw CURSE, WATER_GUN, ANCIENTPOWER, ROCK_SMASH
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 14, 15, 15, 7 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "OMUSUTA-@@@"

	dw CHARIZARD
	db KINGS_ROCK
	dw FIRE_SPIN, DRAGON_RAGE, FLY, SLASH
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "RIZA-DON@@@"

	dw EXEGGUTOR
	db BRIGHTPOWDER
	dw EGG_BOMB, STOMP, PSYCH_UP, CONFUSION
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 7, 14, 7 ; DVs
	db 100 ; Happiness
	db 40 ; Level
	db "NAtuSI-@@@@"

	dw HYPNO
	db BRIGHTPOWDER
	dw CONFUSION, THUNDERPUNCH, HEADBUTT, DISABLE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 7, 7, 10 ; DVs
	db 0 ; Happiness
	db 40 ; Level
	db "SURI-PA-@@@"

	dw MUK
	db QUICK_CLAW
	dw SCREECH, TOXIC, SLUDGE, HARDEN
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 5, 6, 11 ; DVs
	db 0 ; Happiness
	db 40 ; Level
	db "BETOBETON@@"

	dw ELECTABUZZ
	db KINGS_ROCK
	dw LIGHT_SCREEN, THUNDERPUNCH, SWIFT, SNORE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 5, 7, 7 ; DVs
	db 0 ; Happiness
	db 40 ; Level
	db "EREBU-@@@@@"

BattleTowerMons5:

	dw KINGDRA
	db GOLD_BERRY
	dw SURF, HYPER_BEAM, BLIZZARD, DRAGONBREATH
	db 232, 232, 244, 220, 232, 232 ; Stat exp
	dn 13, 13, 15, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "KINGUDORA@@"

	dw HOUNDOOM
	db MIRACLEBERRY
	dw REST, CRUNCH, DREAM_EATER, FLAMETHROWER
	db 232, 220, 244, 244, 244, 244 ; Stat exp
	dn 13, 13, 15, 12 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "HERUGA-@@@@"

	dw SHUCKLE
	db LEFTOVERS
	dw SANDSTORM, REST, TOXIC, WRAP
	db 244, 244, 244, 244, 232, 232 ; Stat exp
	dn 15, 13, 12, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "TUBOTUBO@@@"

	dw SNORLAX
	db LEFTOVERS
	dw HYPER_BEAM, EARTHQUAKE, SURF, PSYCH_UP
	db 244, 232, 232, 244, 232, 232 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "KABIGON@@@@"

	dw LAPRAS
	db GOLD_BERRY
	dw THUNDERBOLT, SURF, CONFUSE_RAY, BLIZZARD
	db 232, 244, 244, 232, 244, 244 ; Stat exp
	dn 13, 13, 13, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "RAPURASU@@@"

	dw JOLTEON
	db KINGS_ROCK
	dw THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER
	db 232, 244, 236, 232, 232, 232 ; Stat exp
	dn 14, 13, 15, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "SANDA-SU@@@"

	dw SCIZOR
	db LEFTOVERS
	dw HYPER_BEAM, SLASH, AGILITY, METAL_CLAW
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 13, 15, 14, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "HAtuSAMU@@@"

	dw SLOWKING
	db MINT_BERRY
	dw REST, SURF, PSYCHIC_M, AMNESIA
	db 220, 200, 212, 220, 220, 220 ; Stat exp
	dn 13, 15, 13, 14 ; DVs
	db 15 ; Happiness
	db 50 ; Level
	db "YADOKINGU@@"

	dw MACHAMP
	db GOLD_BERRY
	dw CROSS_CHOP, EARTHQUAKE, FIRE_BLAST, THUNDERPUNCH
	db 200, 212, 220, 200, 208, 208 ; Stat exp
	dn 15, 15, 14, 12 ; DVs
	db 13 ; Happiness
	db 50 ; Level
	db "KAIRIKI-@@@"

	dw STARMIE
	db SCOPE_LENS
	dw THUNDER_WAVE, RECOVER, THUNDERBOLT, SURF
	db 212, 208, 200, 212, 200, 200 ; Stat exp
	dn 15, 15, 15, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "SUTA-MI-@@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, SLASH, HYPER_BEAM, SLUDGE_BOMB
	db 212, 200, 220, 212, 220, 220 ; Stat exp
	dn 15, 7, 15, 14 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "DAGUTORIO@@"

	dw ELECTRODE
	db MIRACLEBERRY
	dw THUNDERBOLT, EXPLOSION, MIRROR_COAT, REST
	db 220, 212, 232, 200, 220, 220 ; Stat exp
	dn 7, 13, 15, 14 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "MARUMAIN@@@"

	dw AERODACTYL
	db KINGS_ROCK
	dw HYPER_BEAM, EARTHQUAKE, FIRE_BLAST, IRON_TAIL
	db 212, 220, 220, 212, 212, 212 ; Stat exp
	dn 15, 13, 13, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "PUTERA@@@@@"

	dw CROBAT
	db LEFTOVERS
	dw CONFUSE_RAY, ATTRACT, HYPER_BEAM, TOXIC
	db 212, 200, 220, 200, 220, 220 ; Stat exp
	dn 14, 15, 15, 15 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "KUROBAtuTO@"

	dw ZAPDOS
	db MIRACLEBERRY
	dw DRILL_PECK, THUNDERBOLT, THUNDER_WAVE, HYPER_BEAM
	db 212, 220, 212, 200, 220, 220 ; Stat exp
	dn 15, 13, 13, 14 ; DVs
	db 0 ; Happiness
	db "SANDA-@@@@@"

	dw SKARMORY
	db GOLD_BERRY
	dw SANDSTORM, FLY, STEEL_WING, TOXIC
	db 212, 220, 220, 220, 200, 200 ; Stat exp
	dn 13, 7, 14, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "EA-MUDO@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw SANDSTORM, TOXIC, EXPLOSION, SWAGGER
	db 220, 220, 232, 212, 200, 200 ; Stat exp
	dn 12, 15, 13, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "HUoRETOSU@@"

	dw STEELIX
	db MIRACLEBERRY
	dw SANDSTORM, IRON_TAIL, REST, EARTHQUAKE
	db 212, 220, 220, 200, 212, 212 ; Stat exp
	dn 13, 13, 13, 13 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "HAGANE-RU@@"

	dw GIRAFARIG
	db SCOPE_LENS
	dw DREAM_EATER, CRUNCH, PSYCHIC_M, EARTHQUAKE
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 4, 5, 5, 6 ; DVs
	db 100 ; Happiness
	db 50 ; Level
	db "KIRINRIKI@@"

	dw GYARADOS
	db MIRACLEBERRY
	dw HYPER_BEAM, SURF, RAIN_DANCE, ZAP_CANNON
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 7, 5, 6, 5 ; DVs
	db 100 ; Happiness
	db 50 ; Level
	db "GIyaRADOSU@"

	dw ARTICUNO
	db GOLD_BERRY
	dw BLIZZARD, HYPER_BEAM, ROAR, ICY_WIND
	db 200, 200, 200, 200, 200, 200 ; Stat exp
	dn 4, 5, 5, 6 ; DVs
	db 0 ; Happiness
	db 50 ; Level
	db "HURI-ZA-@@@"

BattleTowerMons6:

	dw KINGDRA
	db LEFTOVERS
	dw DRAGONBREATH, SURF, HYPER_BEAM, BLIZZARD
	db 232, 232, 220, 244, 244, 244 ; Stat exp
	dn 13, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "KINGUDORA@@"

	dw TYRANITAR
	db GOLD_BERRY
	dw CRUNCH, EARTHQUAKE, ROCK_SLIDE, HYPER_BEAM
	db 232, 244, 232, 244, 232, 232 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "BANGIRASU@@"

	dw HOUNDOOM
	db MIRACLEBERRY
	dw FLAMETHROWER, CRUNCH, DREAM_EATER, REST
	db 244, 232, 232, 244, 232, 232 ; Stat exp
	dn 15, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "HERUGA-@@@@"

	dw PORYGON2
	db LEFTOVERS
	dw BLIZZARD, RECOVER, TOXIC, PSYCHIC_M
	db 232, 220, 220, 220, 232, 232 ; Stat exp
	dn 13, 13, 13, 14 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "PORIGON2@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw FIRE_PUNCH, CROSS_CHOP, THUNDERPUNCH, EARTHQUAKE
	db 220, 220, 212, 220, 220, 220 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "KAIRIKI-@@@"

	dw ZAPDOS
	db MINT_BERRY
	dw REST, DRILL_PECK, THUNDERBOLT, THUNDER_WAVE
	db 220, 212, 220, 232, 220, 220 ; Stat exp
	dn 13, 13, 15, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "SANDA-@@@@@"

	dw WOBBUFFET
	db GOLD_BERRY
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD
	db 220, 220, 212, 220, 212, 212 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "SO-NANSU@@@"

	dw AERODACTYL
	db LEFTOVERS
	dw HYPER_BEAM, SUPERSONIC, EARTHQUAKE, BITE
	db 212, 220, 220, 212, 212, 212 ; Stat exp
	dn 15, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "PUTERA@@@@@"

	dw DRAGONITE
	db MIRACLEBERRY
	dw HYPER_BEAM, ICY_WIND, THUNDERBOLT, SURF
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 13, 13, 15, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "KAIRIyu-@@@"

	dw UMBREON
	db GOLD_BERRY
	dw MUD_SLAP, MOONLIGHT, PSYCHIC_M, FAINT_ATTACK
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "BURAtuKI-@@"

	dw ARCANINE
	db CHARCOAL
	dw FLAMETHROWER, CRUNCH, EXTREMESPEED, IRON_TAIL
	db 232, 220, 200, 232, 220, 220 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "UINDEi@@@@@"

	dw SKARMORY
	db MIRACLEBERRY
	dw STEEL_WING, FLY, TOXIC, PROTECT
	db 220, 220, 212, 220, 220, 220 ; Stat exp
	dn 15, 11, 14, 11 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "EA-MUDO@@@@"

	dw BLISSEY
	db LEFTOVERS
	dw SOFTBOILED, TOXIC, PROTECT, PSYCHIC_M
	db 220, 212, 220, 212, 220, 220 ; Stat exp
	dn 15, 11, 12, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "HAPINASU@@@"

	dw SNORLAX
	db PINK_BOW
	dw ROCK_SLIDE, SURF, BODY_SLAM, EARTHQUAKE
	db 220, 212, 220, 220, 220, 220 ; Stat exp
	dn 15, 10, 15, 12 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "KABIGON@@@@"

	dw HERACROSS
	db FOCUS_BAND
	dw REVERSAL, MEGAHORN, EARTHQUAKE, COUNTER
	db 220, 200, 220, 220, 220, 220 ; Stat exp
	dn 13, 15, 14, 13 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "HERAKUROSU@"

	dw JYNX
	db MIRACLEBERRY
	dw BLIZZARD, PSYCHIC_M, SHADOW_BALL, ICY_WIND
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 15, 14, 11 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "RU-ZIyuRA@@"

	dw BLASTOISE
	db GOLD_BERRY
	dw SURF, EARTHQUAKE, RAPID_SPIN, BLIZZARD
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "KAMEtuKUSU@"

	dw RHYDON
	db QUICK_CLAW
	dw EARTHQUAKE, SURF, IRON_TAIL, ROCK_SLIDE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 11, 15, 10 ; DVs
	db 100 ; Happiness
	db 60 ; Level
	db "SAIDON@@@@@"

	dw SANDSLASH
	db SCOPE_LENS
	dw EARTHQUAKE, SLASH, HYPER_BEAM, SNORE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 11, 7, 6, 7 ; DVs
	db 0 ; Happiness
	db 60 ; Level
	db "SANDOPAN@@@"

	dw PARASECT
	db GOLD_BERRY
	dw SPORE, GIGA_DRAIN, HYPER_BEAM, SLUDGE_BOMB
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 6, 5, 15 ; DVs
	db 0 ; Happiness
	db 60 ; Level
	db "PARASEKUTO@"

	dw GOLEM
	db BRIGHTPOWDER
	dw EXPLOSION, EARTHQUAKE, FIRE_PUNCH, FRUSTRATION
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 6, 5, 7 ; DVs
	db 0 ; Happiness
	db 60 ; Level
	db "GORO-NIya@@"

BattleTowerMons7:

	dw JOLTEON
	db MIRACLEBERRY
	dw THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR
	db 244, 236, 232, 220, 244, 244 ; Stat exp
	dn 15, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "SANDA-SU@@@"

	dw VAPOREON
	db LEFTOVERS
	dw BLIZZARD, SHADOW_BALL, SURF, MUD_SLAP
	db 220, 220, 244, 244, 220, 220 ; Stat exp
	dn 11, 15, 14, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "SIyaWA-ZU@@"

	dw UMBREON
	db GOLD_BERRY
	dw FAINT_ATTACK, MOONLIGHT, PSYCH_UP, TOXIC
	db 232, 244, 232, 220, 240, 240 ; Stat exp
	dn 13, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "BURAtuKI-@@"

	dw BLISSEY
	db GOLD_BERRY
	dw COUNTER, SOFTBOILED, SHADOW_BALL, THUNDERBOLT
	db 232, 232, 232, 240, 220, 220 ; Stat exp
	dn 13, 15, 14, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "HAPINASU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw ROCK_SLIDE, EARTHQUAKE, BLIZZARD, SHADOW_BALL
	db 232, 232, 244, 232, 220, 220 ; Stat exp
	dn 13, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "KABIGON@@@@"

	dw HOUNDOOM
	db KINGS_ROCK
	dw CRUNCH, FLAMETHROWER, FAINT_ATTACK, ROAR
	db 240, 220, 232, 244, 232, 232 ; Stat exp
	dn 13, 13, 12, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "HERUGA-@@@@"

	dw TYRANITAR
	db LEFTOVERS
	dw EARTHQUAKE, CRUNCH, ROCK_SLIDE, HYPER_BEAM
	db 220, 212, 212, 220, 212, 212 ; Stat exp
	dn 13, 11, 13, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "BANGIRASU@@"

	dw ZAPDOS
	db GOLD_BERRY
	dw THUNDERBOLT, DRILL_PECK, THUNDER_WAVE, HYPER_BEAM
	db 212, 220, 220, 212, 212, 212 ; Stat exp
	dn 13, 11, 13, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "SANDA-@@@@@"

	dw EXEGGUTOR
	db MIRACLEBERRY
	dw REST, EXPLOSION, PSYCHIC_M, GIGA_DRAIN
	db 212, 220, 200, 220, 212, 212 ; Stat exp
	dn 13, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "NAtuSI-@@@@"

	dw UMBREON
	db GOLD_BERRY
	dw MOONLIGHT, FAINT_ATTACK, PSYCHIC_M, SHADOW_BALL
	db 220, 220, 212, 212, 220, 220 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "BURAtuKI-@@"

	dw GYARADOS
	db BRIGHTPOWDER
	dw SURF, THUNDERBOLT, HYPER_BEAM, ROAR
	db 232, 212, 220, 232, 220, 220 ; Stat exp
	dn 13, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "GIyaRADOSU@"

	dw QUAGSIRE
	db MIRACLEBERRY
	dw EARTHQUAKE, SURF, SLUDGE_BOMB, IRON_TAIL
	db 220, 220, 212, 220, 220, 220 ; Stat exp
	dn 13, 14, 13, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "NUO-@@@@@@@"

	dw URSARING
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, HYPER_BEAM, THUNDERPUNCH
	db 220, 212, 220, 212, 220, 220 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "RINGUMA@@@@"

	dw MR__MIME
	db KINGS_ROCK
	dw REFLECT, FIRE_PUNCH, PSYCHIC_M, ENCORE
	db 220, 212, 212, 220, 220, 220 ; Stat exp
	dn 11, 13, 15, 11 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "BARIYA-DO@@"

	dw PRIMEAPE
	db QUICK_CLAW
	dw CROSS_CHOP, ICE_PUNCH, THUNDERPUNCH, ROCK_SLIDE
	db 220, 200, 220, 220, 220, 220 ; Stat exp
	dn 11, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "OKORIZARU@@"

	dw GIRAFARIG
	db GOLD_BERRY
	dw AGILITY, BATON_PASS, CRUNCH, EARTHQUAKE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 13 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "KIRINRIKI@@"

	dw HITMONLEE
	db FOCUS_BAND
	dw REVERSAL, ENDURE, BODY_SLAM, MEGA_KICK
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "SAWAMURA-@@"

	dw HERACROSS
	db BRIGHTPOWDER
	dw REVERSAL, ENDURE, MEGAHORN, EARTHQUAKE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 7, 15, 7 ; DVs
	db 100 ; Happiness
	db 70 ; Level
	db "HERAKUROSU@"

	dw VENUSAUR
	db BRIGHTPOWDER
	dw SUNNY_DAY, SOLARBEAM, SYNTHESIS, HYPER_BEAM
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 6, 4, 4 ; DVs
	db 0 ; Happiness
	db 70 ; Level
	db "HUSIGIBANA@"

	dw CHARIZARD
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, HYPER_BEAM, FLAMETHROWER
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 5, 6, 4, 4 ; DVs
	db 0 ; Happiness
	db 70 ; Level
	db "RIZA-DON@@@"

	dw BLASTOISE
	db QUICK_CLAW
	dw HYDRO_PUMP, ICE_PUNCH, HYPER_BEAM, IRON_TAIL
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 6, 6, 4 ; DVs
	db 0 ; Happiness
	db 70 ; Level
	db "KAMEtuKUSU@"

BattleTowerMons8:

	dw JOLTEON
	db MIRACLEBERRY
	dw THUNDER_WAVE, THUNDERBOLT, IRON_TAIL, ROAR
	db 244, 232, 244, 232, 232, 232 ; Stat exp
	dn 15, 13, 14, 11 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "SANDA-SU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw REST, BELLY_DRUM, SNORE, EARTHQUAKE
	db 244, 232, 220, 232, 244, 244 ; Stat exp
	dn 13, 11, 14, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "KABIGON@@@@"

	dw HOUNDOOM
	db MINT_BERRY
	dw REST, CRUNCH, FLAMETHROWER, SUNNY_DAY
	db 232, 220, 232, 232, 232, 232 ; Stat exp
	dn 15, 13, 13, 11 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "HERUGA-@@@@"

	dw TAUROS
	db GOLD_BERRY
	dw EARTHQUAKE, BODY_SLAM, IRON_TAIL, HYPER_BEAM
	db 220, 220, 220, 172, 220, 220 ; Stat exp
	dn 15, 13, 13, 14 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "KENTAROSU@@"

	dw LAPRAS
	db MINT_BERRY
	dw REST, SURF, CONFUSE_RAY, PSYCHIC_M
	db 220, 220, 220, 232, 220, 220 ; Stat exp
	dn 13, 15, 13, 11 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "RAPURASU@@@"

	dw TYRANITAR
	db MIRACLEBERRY
	dw REST, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	db 220, 232, 220, 232, 220, 220 ; Stat exp
	dn 13, 15, 13, 11 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "BANGIRASU@@"

	dw GENGAR
	db NO_ITEM
	dw THUNDERBOLT, SHADOW_BALL, CONFUSE_RAY, THIEF
	db 220, 220, 212, 232, 220, 220 ; Stat exp
	dn 13, 14, 13, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "GENGA-@@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw EXPLOSION, TOXIC, SOLARBEAM, SWAGGER
	db 212, 220, 220, 212, 220, 220 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "HUoRETOSU@@"

	dw KINGDRA
	db MINT_BERRY
	dw REST, SURF, BLIZZARD, DRAGONBREATH
	db 212, 220, 200, 232, 220, 220 ; Stat exp
	dn 15, 11, 14, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "KINGUDORA@@"

	dw DRAGONITE
	db GOLD_BERRY
	dw THUNDER_WAVE, SURF, THUNDERBOLT, OUTRAGE
	db 220, 220, 220, 220, 212, 212 ; Stat exp
	dn 13, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "KAIRIyu-@@@"

	dw PORYGON2
	db LEFTOVERS
	dw PSYCHIC_M, RECOVER, HYPER_BEAM, TRI_ATTACK
	db 232, 220, 200, 232, 220, 220 ; Stat exp
	dn 13, 15, 14, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "PORIGON2@@@"

	dw JYNX
	db QUICK_CLAW
	dw LOVELY_KISS, BLIZZARD, DREAM_EATER, PSYCHIC_M
	db 232, 220, 212, 220, 220, 220 ; Stat exp
	dn 13, 15, 13, 15 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "RU-ZIyuRA@@"

	dw MANTINE
	db GOLD_BERRY
	dw SURF, CONFUSE_RAY, BLIZZARD, WING_ATTACK
	db 200, 212, 200, 212, 220, 220 ; Stat exp
	dn 13, 15, 13, 12 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "MANTAIN@@@@"

	dw SKARMORY
	db QUICK_CLAW
	dw STEEL_WING, FLY, MUD_SLAP, TOXIC
	db 220, 212, 184, 220, 220, 220 ; Stat exp
	dn 13, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "EA-MUDO@@@@"

	dw MOLTRES
	db CHARCOAL
	dw FLAMETHROWER, SKY_ATTACK, STEEL_WING, HYPER_BEAM
	db 220, 200, 220, 200, 220, 220 ; Stat exp
	dn 13, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "HUaIYA-@@@@"

	dw AERODACTYL
	db MIRACLEBERRY
	dw HYPER_BEAM, REST, EARTHQUAKE, ROAR
	db 220, 200, 220, 200, 220, 220 ; Stat exp
	dn 15, 15, 14, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "PUTERA@@@@@"

	dw ELECTRODE
	db KINGS_ROCK
	dw THUNDERBOLT, EXPLOSION, MIRROR_COAT, TOXIC
	db 220, 220, 200, 200, 220, 220 ; Stat exp
	dn 15, 15, 14, 15 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "MARUMAIN@@@"

	dw DUGTRIO
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, THIEF, MUD_SLAP
	db 220, 220, 200, 220, 200, 200 ; Stat exp
	dn 15, 13, 13, 13 ; DVs
	db 100 ; Happiness
	db 80 ; Level
	db "DAGUTORIO@@"

	dw VICTREEBEL
	db QUICK_CLAW
	dw GIGA_DRAIN, SLUDGE_BOMB, HYPER_BEAM, TOXIC
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 5, 6, 5 ; DVs
	db 0 ; Happiness
	db 80 ; Level
	db "UTUBOtuTO@@"

	dw PINSIR
	db GOLD_BERRY
	dw HYPER_BEAM, SUBMISSION, STRENGTH, TOXIC
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 4, 6, 4 ; DVs
	db 0 ; Happiness
	db 80 ; Level
	db "KAIROSU@@@@"

	dw GRANBULL
	db BRIGHTPOWDER
	dw ROAR, SHADOW_BALL, HYPER_BEAM, THUNDERPUNCH
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 6, 5, 7 ; DVs
	db 0 ; Happiness
	db 80 ; Level
	db "GURANBURU@@"

BattleTowerMons9:

	dw UMBREON
	db KINGS_ROCK
	dw FAINT_ATTACK, MUD_SLAP, MOONLIGHT, CONFUSE_RAY
	db 244, 244, 232, 244, 232, 232 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "BURAtuKI-@@"

	dw DRAGONITE
	db QUICK_CLAW
	dw FIRE_BLAST, HYPER_BEAM, OUTRAGE, BLIZZARD
	db 252, 220, 236, 244, 244, 244 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "KAIRIyu-@@@"

	dw STARMIE
	db LEFTOVERS
	dw RECOVER, THUNDERBOLT, SURF, PSYCHIC_M
	db 244, 244, 244, 232, 244, 244 ; Stat exp
	dn 13, 15, 13, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "SUTA-MI-@@@"

	dw CLOYSTER
	db LEFTOVERS
	dw EXPLOSION, BLIZZARD, SURF, ICY_WIND
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 13, 11, 13, 15 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "PARUSIeN@@@"

	dw CROBAT
	db GOLD_BERRY
	dw WING_ATTACK, HAZE, HYPER_BEAM, GIGA_DRAIN
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 12, 15 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "KUROBAtuTO@"

	dw PORYGON2
	db QUICK_CLAW
	dw TOXIC, PSYCHIC_M, RECOVER, PROTECT
	db 220, 212, 220, 232, 220, 220 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "PORIGON2@@@"

	dw KINGDRA
	db LEFTOVERS
	dw DRAGONBREATH, SURF, HYPER_BEAM, BLIZZARD
	db 220, 220, 232, 220, 212, 212 ; Stat exp
	dn 13, 15, 13, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "KINGUDORA@@"

	dw TYRANITAR
	db QUICK_CLAW
	dw HYPER_BEAM, CRUNCH, EARTHQUAKE, ROCK_SLIDE
	db 220, 232, 220, 212, 220, 220 ; Stat exp
	dn 13, 15, 13, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "BANGIRASU@@"

	dw LAPRAS
	db MINT_BERRY
	dw REST, SURF, THUNDERBOLT, PSYCHIC_M
	db 212, 220, 220, 220, 232, 232 ; Stat exp
	dn 11, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "RAPURASU@@@"

	dw ESPEON
	db GOLD_BERRY
	dw PSYCHIC_M, SHADOW_BALL, SUNNY_DAY, MORNING_SUN
	db 232, 220, 220, 232, 220, 220 ; Stat exp
	dn 13, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "E-HUi@@@@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw CROSS_CHOP, VITAL_THROW, FIRE_BLAST, EARTHQUAKE
	db 232, 232, 220, 232, 220, 220 ; Stat exp
	dn 13, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "KAIRIKI-@@@"

	dw SNORLAX
	db MIRACLEBERRY
	dw FIRE_BLAST, SURF, EARTHQUAKE, HYPER_BEAM
	db 212, 220, 232, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 13 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "KABIGON@@@@"

	dw ARCANINE
	db MINT_BERRY
	dw SUNNY_DAY, FLAMETHROWER, EXTREMESPEED, REST
	db 220, 212, 220, 212, 232, 232 ; Stat exp
	dn 13, 15, 13, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "UINDEi@@@@@"

	dw BLISSEY
	db LEFTOVERS
	dw SOLARBEAM, SUNNY_DAY, SOFTBOILED, FIRE_BLAST
	db 220, 212, 220, 220, 220, 220 ; Stat exp
	dn 11, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "HAPINASU@@@"

	dw HOUNDOOM
	db BRIGHTPOWDER
	dw FLAMETHROWER, CRUNCH, SUNNY_DAY, SOLARBEAM
	db 220, 200, 220, 220, 220, 220 ; Stat exp
	dn 13, 11, 15, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "HERUGA-@@@@"

	dw SKARMORY
	db QUICK_CLAW
	dw SANDSTORM, STEEL_WING, TOXIC, RETURN
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 14, 15, 15, 7 ; DVs
	db 255 ; Happiness
	db 90 ; Level
	db "EA-MUDO@@@@"

	dw SHUCKLE
	db LEFTOVERS
	dw TOXIC, WRAP, PROTECT, ENCORE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "TUBOTUBO@@@"

	dw FLAREON
	db MINT_BERRY
	dw HYPER_BEAM, FLAMETHROWER, SHADOW_BALL, ROAR
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 7, 15, 7 ; DVs
	db 100 ; Happiness
	db 90 ; Level
	db "BU-SUTA-@@@"

	dw MILTANK
	db LEFTOVERS
	dw MILK_DRINK, EARTHQUAKE, ATTRACT, BODY_SLAM
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 4, 7, 5, 7 ; DVs
	db 0 ; Happiness
	db 90 ; Level
	db "MIRUTANKU@@"

	dw TAUROS
	db PINK_BOW
	dw THUNDERBOLT, HYPER_BEAM, ATTRACT, EARTHQUAKE
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 5, 7, 6 ; DVs
	db 0 ; Happiness
	db 90 ; Level
	db "KENTAROSU@@"

	dw MUK
	db QUICK_CLAW
	dw TOXIC, SLUDGE_BOMB, ATTRACT, GIGA_DRAIN
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 5, 4, 4, 4 ; DVs
	db 0 ; Happiness
	db 90 ; Level
	db "BETOBETON@@"

BattleTowerMons10:

	dw HOUNDOOM
	db MINT_BERRY
	dw CRUNCH, FLAMETHROWER, ROAR, REST
	db 244, 244, 244, 244, 244, 244 ; Stat exp
	dn 15, 13, 14, 13 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "HERUGA-@@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw CROSS_CHOP, EARTHQUAKE, HYPER_BEAM, VITAL_THROW
	db 244, 244, 244, 244, 244, 244 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "KAIRIKI-@@@"

	dw KINGDRA
	db LEFTOVERS
	dw SURF, DRAGONBREATH, REST, TOXIC
	db 244, 244, 244, 244, 244, 244 ; Stat exp
	dn 13, 15, 15, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "KINGUDORA@@"

	dw JOLTEON
	db BRIGHTPOWDER
	dw THUNDERBOLT, ROAR, THUNDER_WAVE, IRON_TAIL
	db 220, 220, 220, 172, 220, 220 ; Stat exp
	dn 15, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "SANDA-SU@@@"

	dw TAUROS
	db KINGS_ROCK
	dw HYPER_BEAM, EARTHQUAKE, IRON_TAIL, THUNDERBOLT
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "KENTAROSU@@"

	dw ARCANINE
	db LEFTOVERS
	dw FLAMETHROWER, EXTREMESPEED, IRON_TAIL, HYPER_BEAM
	db 232, 220, 220, 232, 220, 220 ; Stat exp
	dn 13, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "UINDEi@@@@@"

	dw CHARIZARD
	db SCOPE_LENS
	dw FLAMETHROWER, EARTHQUAKE, SLASH, FLY
	db 220, 220, 232, 232, 232, 232 ; Stat exp
	dn 15, 14, 13, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "RIZA-DON@@@"

	dw ELECTRODE
	db BRIGHTPOWDER
	dw THUNDER_WAVE, THUNDERBOLT, EXPLOSION, MIRROR_COAT
	db 212, 220, 220, 212, 212 , 212 ; Stat exp
	dn 15, 11, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "MARUMAIN@@@"

	dw RHYDON
	db MIRACLEBERRY
	dw SURF, EARTHQUAKE, HYPER_BEAM, ROCK_SLIDE
	db 232, 220, 232, 220, 212 , 212 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "SAIDON@@@@@"

	dw STEELIX
	db LEFTOVERS
	dw EARTHQUAKE, HYPER_BEAM, SWAGGER, CRUNCH
	db 220, 220, 232, 244, 220, 220 ; Stat exp
	dn 15, 13, 13, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "HAGANE-RU@@"

	dw FEAROW
	db KINGS_ROCK
	dw DRILL_PECK, STEEL_WING, HYPER_BEAM, MUD_SLAP
	db 232, 220, 220, 232, 220, 220 ; Stat exp
	dn 15, 13, 12, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "ONIDORIRU@@"

	dw MISDREAVUS
	db FOCUS_BAND
	dw PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL
	db 212, 220, 232, 220, 232, 232 ; Stat exp
	dn 11, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "MUUMA@@@@@@"

	dw SNEASEL
	db SCOPE_LENS
	dw SLASH, BLIZZARD, DREAM_EATER, FAINT_ATTACK
	db 220, 220, 216, 212, 220, 220 ; Stat exp
	dn 15, 13, 14, 15 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "NIyu-RA@@@@"

	dw SCIZOR
	db QUICK_CLAW
	dw STEEL_WING, HYPER_BEAM, SLASH, TOXIC
	db 220, 220, 220, 220, 212, 212 ; Stat exp
	dn 15, 11, 15, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "HAtuSAMU@@@"

	dw BLISSEY
	db LEFTOVERS
	dw THUNDERBOLT, BLIZZARD, FIRE_BLAST, SOFTBOILED
	db 220, 200, 220, 172, 172, 172 ; Stat exp
	dn 13, 13, 15, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "HAPINASU@@@"

	dw PILOSWINE
	db MINT_BERRY
	dw REST, BLIZZARD, HYPER_BEAM, EARTHQUAKE
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 7 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "INOMU-@@@@@"

	dw EXEGGUTOR
	db QUICK_CLAW
	dw PSYCHIC_M, TOXIC, EXPLOSION, GIGA_DRAIN
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 14, 15, 14 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "NAtuSI-@@@@"

	dw OMASTAR
	db LEFTOVERS
	dw SURF, ANCIENTPOWER, BLIZZARD, TOXIC
	db 220, 220, 220, 220, 220, 220 ; Stat exp
	dn 15, 11, 14, 7 ; DVs
	db 100 ; Happiness
	db 100 ; Level
	db "OMUSUTA-@@@"

	dw GOLEM
	db BRIGHTPOWDER
	dw EXPLOSION, EARTHQUAKE, ROCK_SLIDE, FIRE_BLAST
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 4, 4, 6 ; DVs
	db 0 ; Happiness
	db 100 ; Level
	db "GORO-NIya@@"

	dw HITMONCHAN
	db FOCUS_BAND
	dw COUNTER, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 6, 7, 7, 6 ; DVs
	db 0 ; Happiness
	db 100 ; Level
	db "EBIWARA-@@@"

	dw LANTURN
	db QUICK_CLAW
	dw SURF, RAIN_DANCE, ZAP_CANNON, CONFUSE_RAY
	db 172, 172, 172, 172, 172, 172 ; Stat exp
	dn 7, 6, 5, 7 ; DVs
	db 0 ; Happiness
	db 100 ; Level
	db "RANTA-N@@@@"
