; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - MonMenuIcons (see data/pokemon/menu_icons.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - EZChat_SortedPokemon (see data/pokemon/ezchat_order.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - OldPokedexOrder (see data/pokemon/dex_order_old.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
; - Footprints (see gfx/footprints.asm)
	const_def 1
	const BULBASAUR  ; 01
	const IVYSAUR    ; 02
	const VENUSAUR   ; 03
	const CHARMANDER ; 04
	const CHARMELEON ; 05
	const CHARIZARD  ; 06
	const SQUIRTLE   ; 07
	const WARTORTLE  ; 08
	const BLASTOISE  ; 09
	const CATERPIE   ; 0a
	const METAPOD    ; 0b
	const BUTTERFREE ; 0c
	const WEEDLE     ; 0d
	const KAKUNA     ; 0e
	const BEEDRILL   ; 0f
	const PIDGEY     ; 10
	const PIDGEOTTO  ; 11
	const PIDGEOT    ; 12
	const RATTATA    ; 13
	const RATICATE   ; 14
	const SPEAROW    ; 15
	const FEAROW     ; 16
	const EKANS      ; 17
	const ARBOK      ; 18
	const PIKACHU    ; 19
	const RAICHU     ; 1a
	const SANDSHREW  ; 1b
	const SANDSLASH  ; 1c
	const NIDORAN_F  ; 1d
	const NIDORINA   ; 1e
	const NIDOQUEEN  ; 1f
	const NIDORAN_M  ; 20
	const NIDORINO   ; 21
	const NIDOKING   ; 22
	const CLEFAIRY   ; 23
	const CLEFABLE   ; 24
	const VULPIX     ; 25
	const NINETALES  ; 26
	const JIGGLYPUFF ; 27
	const WIGGLYTUFF ; 28
	const ZUBAT      ; 29
	const GOLBAT     ; 2a
	const ODDISH     ; 2b
	const GLOOM      ; 2c
	const VILEPLUME  ; 2d
	const PARAS      ; 2e
	const PARASECT   ; 2f
	const VENONAT    ; 30
	const VENOMOTH   ; 31
	const DIGLETT    ; 32
	const DUGTRIO    ; 33
	const MEOWTH     ; 34
	const PERSIAN    ; 35
	const PSYDUCK    ; 36
	const GOLDUCK    ; 37
	const MANKEY     ; 38
	const PRIMEAPE   ; 39
	const GROWLITHE  ; 3a
	const ARCANINE   ; 3b
	const POLIWAG    ; 3c
	const POLIWHIRL  ; 3d
	const POLIWRATH  ; 3e
	const ABRA       ; 3f
	const KADABRA    ; 40
	const ALAKAZAM   ; 41
	const MACHOP     ; 42
	const MACHOKE    ; 43
	const MACHAMP    ; 44
	const BELLSPROUT ; 45
	const WEEPINBELL ; 46
	const VICTREEBEL ; 47
	const TENTACOOL  ; 48
	const TENTACRUEL ; 49
	const GEODUDE    ; 4a
	const GRAVELER   ; 4b
	const GOLEM      ; 4c
	const PONYTA     ; 4d
	const RAPIDASH   ; 4e
	const SLOWPOKE   ; 4f
	const SLOWBRO    ; 50
	const MAGNEMITE  ; 51
	const MAGNETON   ; 52
	const FARFETCH_D ; 53
	const DODUO      ; 54
	const DODRIO     ; 55
	const SEEL       ; 56
	const DEWGONG    ; 57
	const GRIMER     ; 58
	const MUK        ; 59
	const SHELLDER   ; 5a
	const CLOYSTER   ; 5b
	const GASTLY     ; 5c
	const HAUNTER    ; 5d
	const GENGAR     ; 5e
	const ONIX       ; 5f
	const DROWZEE    ; 60
	const HYPNO      ; 61
	const KRABBY     ; 62
	const KINGLER    ; 63
	const VOLTORB    ; 64
	const ELECTRODE  ; 65
	const EXEGGCUTE  ; 66
	const EXEGGUTOR  ; 67
	const CUBONE     ; 68
	const MAROWAK    ; 69
	const HITMONLEE  ; 6a
	const HITMONCHAN ; 6b
	const LICKITUNG  ; 6c
	const KOFFING    ; 6d
	const WEEZING    ; 6e
	const RHYHORN    ; 6f
	const RHYDON     ; 70
	const CHANSEY    ; 71
	const TANGELA    ; 72
	const KANGASKHAN ; 73
	const HORSEA     ; 74
	const SEADRA     ; 75
	const GOLDEEN    ; 76
	const SEAKING    ; 77
	const STARYU     ; 78
	const STARMIE    ; 79
	const MR__MIME   ; 7a
	const SCYTHER    ; 7b
	const JYNX       ; 7c
	const ELECTABUZZ ; 7d
	const MAGMAR     ; 7e
	const PINSIR     ; 7f
	const TAUROS     ; 80
	const MAGIKARP   ; 81
	const GYARADOS   ; 82
	const LAPRAS     ; 83
	const DITTO      ; 84
	const EEVEE      ; 85
	const VAPOREON   ; 86
	const JOLTEON    ; 87
	const FLAREON    ; 88
	const PORYGON    ; 89
	const OMANYTE    ; 8a
	const OMASTAR    ; 8b
	const KABUTO     ; 8c
	const KABUTOPS   ; 8d
	const AERODACTYL ; 8e
	const SNORLAX    ; 8f
	const ARTICUNO   ; 90
	const ZAPDOS     ; 91
	const MOLTRES    ; 92
	const DRATINI    ; 93
	const DRAGONAIR  ; 94
	const DRAGONITE  ; 95
	const MEWTWO     ; 96
	const MEW        ; 97
JOHTO_POKEMON EQU const_value
	const CHIKORITA  ; 98
	const BAYLEEF    ; 99
	const MEGANIUM   ; 9a
	const CYNDAQUIL  ; 9b
	const QUILAVA    ; 9c
	const TYPHLOSION ; 9d
	const TOTODILE   ; 9e
	const CROCONAW   ; 9f
	const FERALIGATR ; a0
	const SENTRET    ; a1
	const FURRET     ; a2
	const HOOTHOOT   ; a3
	const NOCTOWL    ; a4
	const LEDYBA     ; a5
	const LEDIAN     ; a6
	const SPINARAK   ; a7
	const ARIADOS    ; a8
	const CROBAT     ; a9
	const CHINCHOU   ; aa
	const LANTURN    ; ab
	const PICHU      ; ac
	const CLEFFA     ; ad
	const IGGLYBUFF  ; ae
	const TOGEPI     ; af
	const TOGETIC    ; b0
	const NATU       ; b1
	const XATU       ; b2
	const MAREEP     ; b3
	const FLAAFFY    ; b4
	const AMPHAROS   ; b5
	const BELLOSSOM  ; b6
	const MARILL     ; b7
	const AZUMARILL  ; b8
	const SUDOWOODO  ; b9
	const POLITOED   ; ba
	const HOPPIP     ; bb
	const SKIPLOOM   ; bc
	const JUMPLUFF   ; bd
	const AIPOM      ; be
	const SUNKERN    ; bf
	const SUNFLORA   ; c0
	const YANMA      ; c1
	const WOOPER     ; c2
	const QUAGSIRE   ; c3
	const ESPEON     ; c4
	const UMBREON    ; c5
	const MURKROW    ; c6
	const SLOWKING   ; c7
	const MISDREAVUS ; c8
	const UNOWN      ; c9
	const WOBBUFFET  ; ca
	const GIRAFARIG  ; cb
	const PINECO     ; cc
	const FORRETRESS ; cd
	const DUNSPARCE  ; ce
	const GLIGAR     ; cf
	const STEELIX    ; d0
	const SNUBBULL   ; d1
	const GRANBULL   ; d2
	const QWILFISH   ; d3
	const SCIZOR     ; d4
	const SHUCKLE    ; d5
	const HERACROSS  ; d6
	const SNEASEL    ; d7
	const TEDDIURSA  ; d8
	const URSARING   ; d9
	const SLUGMA     ; da
	const MAGCARGO   ; db
	const SWINUB     ; dc
	const PILOSWINE  ; dd
	const CORSOLA    ; de
	const REMORAID   ; df
	const OCTILLERY  ; e0
	const DELIBIRD   ; e1
	const MANTINE    ; e2
	const SKARMORY   ; e3
	const HOUNDOUR   ; e4
	const HOUNDOOM   ; e5
	const KINGDRA    ; e6
	const PHANPY     ; e7
	const DONPHAN    ; e8
	const PORYGON2   ; e9
	const STANTLER   ; ea
	const SMEARGLE   ; eb
	const TYROGUE    ; ec
	const HITMONTOP  ; ed
	const SMOOCHUM   ; ee
	const ELEKID     ; ef
	const MAGBY      ; f0
	const MILTANK    ; f1
	const BLISSEY    ; f2
	const RAIKOU     ; f3
	const ENTEI      ; f4
	const SUICUNE    ; f5
	const LARVITAR   ; f6
	const PUPITAR    ; f7
	const TYRANITAR  ; f8
	const LUGIA      ; f9
	const HO_OH      ; fa
	const CELEBI     ; fb
;NUM_POKEMON EQU const_value + -1
	const MON_FC     ; fc
	const MON_FD     ; fd
	const EGG        ; fe
	const CANCEL     ; ff, don't use
	const MON_100    ; 100, don't use
	const YAMASK     ; 101
	const COFAGRIGUS ; 102
	const MON_103
	const MON_104
	const MON_105
NUM_DEX_MONS EQU const_value + -8 	;used in the pokedex
	const MON_106
	const MON_107
	const MON_108
	const MON_109
	const MON_10A
	const MON_10B
	const MON_10C
	const MON_10D
	const MON_10E
	const MON_10F
	const MON_110
	const MON_111
	const MON_112
	const MON_113
	const MON_114
	const MON_115
	const MON_116
	const MON_117
	const MON_118
	const MON_119
	const MON_11A
	const MON_11B
	const MON_11C
	const MON_11D
	const MON_11E
	const MON_11F
	const MON_120
	const MON_121
	const MON_122
	const MON_123
	const MON_124
	const MON_125
	const MON_126
	const MON_127
	const MON_128
	const MON_129
	const MON_12A
	const MON_12B
	const MON_12C	; 300
	const MON_12D
	const MON_12E
	const MON_12F
	const MON_130
	const MON_131
	const MON_132
	const MON_133
	const MON_134
	const MON_135
	const MON_136
	const MON_137
	const MON_138
	const MON_139
	const MON_13A
	const MON_13B
	const MON_13C
	const MON_13D
	const MON_13E
	const MON_13F
	const MON_140
	const MON_141
	const MON_142
	const MON_143
	const MON_144
	const MON_145
	const MON_146
	const MON_147
	const MON_148
	const MON_149
	const MON_14A
	const MON_14B
	const MON_14C
	const MON_14D
	const MON_14E
	const MON_14F
	const MON_150
	const MON_151
	const MON_152
	const MON_153
	const MON_154
	const MON_155
	const MON_156
	const MON_157
	const MON_158
	const MON_159
	const MON_15A
	const MON_15B
	const MON_15C
	const MON_15D
	const MON_15E	; 350
	const MON_15F
	const MON_160
	const MON_161
	const MON_162
	const MON_163
	const MON_164
	const MON_165
	const MON_166
	const MON_167
	const MON_168
	const MON_169
	const MON_16A
	const MON_16B
	const MON_16C
	const MON_16D
	const MON_16E
	const MON_16F
	const MON_170
	const MON_171
	const MON_172
	const MON_173
	const MON_174
	const MON_175
	const MON_176
	const MON_177
	const MON_178
	const MON_179
	const MON_17A
	const MON_17B
	const MON_17C
	const MON_17D
	const MON_17E
	const MON_17F
	const MON_180
	const MON_181
	const MON_182
	const MON_183
	const MON_184
	const MON_185
	const MON_186
	const MON_187
	const MON_188
	const MON_189
	const MON_18A
	const MON_18B
	const MON_18C
	const MON_18D
	const MON_18E
	const MON_18F
	const MON_190	; 400
	const MON_191
	const MON_192
	const MON_193
	const MON_194
	const MON_195
	const MON_196
	const MON_197
	const MON_198
	const MON_199
	const MON_19A
	const MON_19B
	const MON_19C
	const MON_19D
	const MON_19E
	const MON_19F
	const MON_1A0
	const MON_1A1
	const MON_1A2
	const MON_1A3
	const MON_1A4
	const MON_1A5
	const MON_1A6
	const MON_1A7
	const MON_1A8
	const MON_1A9
	const MON_1AA
	const MON_1AB
	const MON_1AC
	const MON_1AD
	const MON_1AE
	const MON_1AF
	const MON_1B0
	const MON_1B1
	const MON_1B2
	const MON_1B3
	const MON_1B4
	const MON_1B5
	const MON_1B6
	const MON_1B7
	const MON_1B8
	const MON_1B9
	const MON_1BA
	const MON_1BB
	const MON_1BC
	const MON_1BD
	const MON_1BE
	const MON_1BF
	const MON_1C0
	const MON_1C1
	const MON_1C2	; 450
	const MON_1C3
	const MON_1C4
	const MON_1C5
	const MON_1C6
	const MON_1C7
	const MON_1C8
	const MON_1C9
	const MON_1CA
	const MON_1CB
	const MON_1CC
	const MON_1CD
	const MON_1CE
	const MON_1CF
	const MON_1D0
	const MON_1D1
	const MON_1D2
	const MON_1D3
	const MON_1D4
	const MON_1D5
	const MON_1D6
	const MON_1D7
	const MON_1D8
	const MON_1D9
	const MON_1DA
	const MON_1DB
	const MON_1DC
	const MON_1DD
	const MON_1DE
	const MON_1DF
	const MON_1E0
	const MON_1E1
	const MON_1E2
	const MON_1E3
	const MON_1E4
	const MON_1E5
	const MON_1E6
	const MON_1E7
	const MON_1E8
	const MON_1E9
	const MON_1EA
	const MON_1EB
	const MON_1EC
	const MON_1ED
	const MON_1EE
	const MON_1EF
	const MON_1F0
	const MON_1F1
	const MON_1F2
	const MON_1F3
	const MON_1F4	; 500
	const MON_1F5
	const MON_1F6
	const MON_1F7
	const MON_1F8
	const MON_1F9
	const MON_1FA
	const MON_1FB
	const MON_1FC
	const MON_1FD
NUM_POKEMON EQU const_value + -1
	const MON_1FE	; don't use
	const MON_1FF	; don't use
	const MON_200	; don't use

NUM_SEARCH_MONS EQU 128

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
NUM_UNOWN EQU const_value + -1 ; 26
