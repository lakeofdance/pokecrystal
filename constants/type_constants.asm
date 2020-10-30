; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

PHYSICAL_TYPES EQU const_value
	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BIRD
	const BUG
	const GHOST
	const STEEL

UNUSED_TYPES EQU const_value
	const TYPE_10
	const TYPE_11
	const TYPE_12
	const TYPE_13
	const TYPE_14
	const TYPE_15
	const TYPE_16
	const TYPE_17
	const ROOST_TYPE
	const CURSE_T
UNUSED_TYPES_END EQU const_value

SPECIAL_TYPES EQU const_value
	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC
	const ICE
	const DRAGON
	const DARK
	const FAIRY
TYPES_END EQU const_value

TYPE_MASK  EQU %00011111
FROM_TYPE  EQU %00000000
PHYSICAL   EQU %01000000
SPECIAL    EQU %10000000
STATUS     EQU %11000000

CONTACT    EQU %00100000
NO_CONTACT EQU %00000000

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END
