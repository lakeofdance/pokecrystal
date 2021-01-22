INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	dw LIGHT_SCREEN
	dw SKULL_BASH
	dw SAFEGUARD
	dw RAZOR_WIND
	dw PETAL_DANCE
	db -1 ; end

CharmanderEggMoves:
	dw BELLY_DRUM
	dw ANCIENTPOWER
	dw ROCK_SLIDE
	dw BITE
	dw OUTRAGE
	dw BEAT_UP
	db -1 ; end

SquirtleEggMoves:
	dw MIRROR_COAT
	dw HAZE
	dw MIST
	dw CONFUSION
	dw FORESIGHT
	dw FLAIL
	db -1 ; end

PidgeyEggMoves:
	dw PURSUIT
	dw FAINT_ATTACK
	dw FORESIGHT
	db -1 ; end

RattataEggMoves:
	dw SCREECH
	dw FLAME_WHEEL
	dw FURY_SWIPES
	dw BITE
	dw COUNTER
	dw REVERSAL
	db -1 ; end

SpearowEggMoves:
	dw FAINT_ATTACK
	dw FALSE_SWIPE
	dw SCARY_FACE
	dw QUICK_ATTACK
	dw TRI_ATTACK
	db -1 ; end

EkansEggMoves:
	dw PURSUIT
	dw SLAM
	dw SPITE
	dw BEAT_UP
	dw CRUNCH
	db -1 ; end

SandshrewEggMoves:
	dw FLAIL
	dw SAFEGUARD
	dw COUNTER
	dw RAPID_SPIN
	dw METAL_CLAW
	db -1 ; end

NidoranFEggMoves:
	dw SUPERSONIC
	dw DISABLE
	dw TAKE_DOWN
	dw FOCUS_ENERGY
	dw CHARM
	dw COUNTER
	dw BEAT_UP
	db -1 ; end

NidoranMEggMoves:
	dw SUPERSONIC
	dw DISABLE
	dw TAKE_DOWN
	dw CONFUSION
	dw AMNESIA
	dw COUNTER
	dw BEAT_UP
	db -1 ; end

VulpixEggMoves:
	dw FAINT_ATTACK
	dw HYPNOSIS
	dw FLAIL
	dw SPITE
	dw DISABLE
	db -1 ; end

ZubatEggMoves:
	dw QUICK_ATTACK
	dw PURSUIT
	dw FAINT_ATTACK
	dw GUST
	dw WHIRLWIND
	db -1 ; end

OddishEggMoves:
	dw SWORDS_DANCE
	dw RAZOR_LEAF
	dw FLAIL
	dw SYNTHESIS
	db -1 ; end

ParasEggMoves:
	dw FALSE_SWIPE
	dw SCREECH
	dw COUNTER
	dw PSYBEAM
	dw FLAIL
	dw LIGHT_SCREEN
	dw PURSUIT
	db -1 ; end

VenonatEggMoves:
	dw BATON_PASS
	dw SCREECH
	dw GIGA_DRAIN
	db -1 ; end

DiglettEggMoves:
	dw FAINT_ATTACK
	dw SCREECH
	dw ANCIENTPOWER
	dw PURSUIT
	dw BEAT_UP
	db -1 ; end

MeowthEggMoves:
	dw SPITE
	dw CHARM
	dw HYPNOSIS
	dw AMNESIA
	db -1 ; end

PsyduckEggMoves:
	dw ICE_BEAM
	dw HYPNOSIS
	dw PSYBEAM
	dw FORESIGHT
	dw LIGHT_SCREEN
	dw FUTURE_SIGHT
	dw PSYCHIC_M
	dw CROSS_CHOP
	db -1 ; end

MankeyEggMoves:
	dw ROCK_SLIDE
	dw FORESIGHT
	dw MEDITATE
	dw COUNTER
	dw REVERSAL
	dw BEAT_UP
	db -1 ; end

GrowlitheEggMoves:
	dw BODY_SLAM
	dw SAFEGUARD
	dw CRUNCH
	dw THRASH
	dw FIRE_SPIN
	db -1 ; end

PoliwagEggMoves:
	dw MIST
	dw SPLASH
	dw BUBBLEBEAM
	dw HAZE
	dw MIND_READER
	db -1 ; end

AbraEggMoves:
	dw LIGHT_SCREEN
	dw ENCORE
	dw BARRIER
	db -1 ; end

MachopEggMoves:
	dw LIGHT_SCREEN
	dw MEDITATE
	dw ROLLING_KICK
	dw ENCORE
	db -1 ; end

BellsproutEggMoves:
	dw SWORDS_DANCE
	dw ENCORE
	dw REFLECT
	dw SYNTHESIS
	dw LEECH_LIFE
	db -1 ; end

TentacoolEggMoves:
	dw AURORA_BEAM
	dw MIRROR_COAT
	dw RAPID_SPIN
	dw HAZE
	dw SAFEGUARD
	db -1 ; end

GeodudeEggMoves:
	dw MEGA_PUNCH
	dw ROCK_SLIDE
	db -1 ; end

PonytaEggMoves:
	dw FLAME_WHEEL
	dw THRASH
	dw DOUBLE_KICK
	dw HYPNOSIS
	dw CHARM
	dw QUICK_ATTACK
	db -1 ; end

SlowpokeEggMoves:
	dw SAFEGUARD
	dw BELLY_DRUM
	dw FUTURE_SIGHT
	dw STOMP
	db -1 ; end

FarfetchDEggMoves:
	dw FORESIGHT
	dw MIRROR_MOVE
	dw GUST
	dw QUICK_ATTACK
	dw FLAIL
	db -1 ; end

DoduoEggMoves:
	dw QUICK_ATTACK
	dw SUPERSONIC
	dw HAZE
	dw FAINT_ATTACK
	dw FLAIL
	db -1 ; end

SeelEggMoves:
	dw LICK
	dw PERISH_SONG
	dw DISABLE
	dw PECK
	dw SLAM
	dw ENCORE
	db -1 ; end

GrimerEggMoves:
	dw HAZE
	dw MEAN_LOOK
	dw LICK
	db -1 ; end

ShellderEggMoves:
	dw BUBBLEBEAM
	dw TAKE_DOWN
	dw BARRIER
	dw RAPID_SPIN
	dw SCREECH
	db -1 ; end

GastlyEggMoves:
	dw PSYWAVE
	dw PERISH_SONG
	dw HAZE
	db -1 ; end

OnixEggMoves:
	dw ROCK_SLIDE
	dw FLAIL
	db -1 ; end

DrowzeeEggMoves:
	dw LIGHT_SCREEN
	dw BARRIER
	db -1 ; end

KrabbyEggMoves:
	dw DIG
	dw HAZE
	dw AMNESIA
	dw FLAIL
	dw SLAM
	db -1 ; end

ExeggcuteEggMoves:
	dw SYNTHESIS
	dw MOONLIGHT
	dw REFLECT
	dw MEGA_DRAIN
	dw ANCIENTPOWER
	db -1 ; end

CuboneEggMoves:
	dw ROCK_SLIDE
	dw ANCIENTPOWER
	dw BELLY_DRUM
	dw SCREECH
	dw SKULL_BASH
	dw PERISH_SONG
	dw SWORDS_DANCE
	db -1 ; end

LickitungEggMoves:
	dw BELLY_DRUM
	dw MAGNITUDE
	dw BODY_SLAM
	db -1 ; end

KoffingEggMoves:
	dw SCREECH
	dw PSYWAVE
	dw PSYBEAM
	dw DESTINY_BOND
	dw PAIN_SPLIT
	db -1 ; end

RhyhornEggMoves:
	dw CRUNCH
	dw REVERSAL
	dw ROCK_SLIDE
	dw THRASH
	dw PURSUIT
	dw COUNTER
	dw MAGNITUDE
	db -1 ; end

ChanseyEggMoves:
	dw PRESENT
	dw METRONOME
	dw HEAL_BELL
	db -1 ; end

TangelaEggMoves:
	dw FLAIL
	dw CONFUSION
	dw MEGA_DRAIN
	dw REFLECT
	dw AMNESIA
	db -1 ; end

KangaskhanEggMoves:
	dw STOMP
	dw FORESIGHT
	dw FOCUS_ENERGY
	dw SAFEGUARD
	dw DISABLE
	db -1 ; end

HorseaEggMoves:
	dw FLAIL
	dw AURORA_BEAM
	dw OCTAZOOKA
	dw DISABLE
	dw SPLASH
	dw DRAGON_RAGE
	db -1 ; end

GoldeenEggMoves:
	dw PSYBEAM
	dw HAZE
	dw HYDRO_PUMP
	db -1 ; end

MrMimeEggMoves:
	dw FUTURE_SIGHT
	dw HYPNOSIS
	dw MIMIC
	db -1 ; end

ScytherEggMoves:
	dw COUNTER
	dw SAFEGUARD
	dw BATON_PASS
	dw RAZOR_WIND
	dw REVERSAL
	dw LIGHT_SCREEN
	db -1 ; end

PinsirEggMoves:
	dw FURY_ATTACK
	dw FLAIL
	db -1 ; end

LaprasEggMoves:
	dw AURORA_BEAM
	dw FORESIGHT
	db -1 ; end

EeveeEggMoves:
	dw FLAIL
	dw CHARM
	db -1 ; end

OmanyteEggMoves:
	dw BUBBLEBEAM
	dw AURORA_BEAM
	dw SLAM
	dw SUPERSONIC
	dw HAZE
	db -1 ; end

KabutoEggMoves:
	dw BUBBLEBEAM
	dw AURORA_BEAM
	dw RAPID_SPIN
	dw DIG
	dw FLAIL
	db -1 ; end

AerodactylEggMoves:
	dw WHIRLWIND
	dw PURSUIT
	dw FORESIGHT
	db -1 ; end

SnorlaxEggMoves:
	dw LICK
	db -1 ; end

DratiniEggMoves:
	dw LIGHT_SCREEN
	dw MIST
	dw HAZE
	dw SUPERSONIC
	db -1 ; end

ChikoritaEggMoves:
	dw VINE_WHIP
	dw LEECH_SEED
	dw COUNTER
	dw ANCIENTPOWER
	dw FLAIL
	dw SWORDS_DANCE
	db -1 ; end

CyndaquilEggMoves:
	dw FURY_SWIPES
	dw QUICK_ATTACK
	dw REVERSAL
	dw THRASH
	dw FORESIGHT
	dw SUBMISSION
	db -1 ; end

TotodileEggMoves:
	dw CRUNCH
	dw THRASH
	dw HYDRO_PUMP
	dw ANCIENTPOWER
	dw RAZOR_WIND
	dw ROCK_SLIDE
	db -1 ; end

SentretEggMoves:
	dw DOUBLE_EDGE
	dw PURSUIT
	dw SLASH
	dw FOCUS_ENERGY
	dw REVERSAL
	db -1 ; end

HoothootEggMoves:
	dw MIRROR_MOVE
	dw SUPERSONIC
	dw FAINT_ATTACK
	dw WING_ATTACK
	dw WHIRLWIND
	dw SKY_ATTACK
	db -1 ; end

LedybaEggMoves:
	dw PSYBEAM
	dw BIDE
	dw LIGHT_SCREEN
	db -1 ; end

SpinarakEggMoves:
	dw PSYBEAM
	dw DISABLE
	dw SONICBOOM
	dw BATON_PASS
	dw PURSUIT
	db -1 ; end

ChinchouEggMoves:
	dw FLAIL
	dw SUPERSONIC
	dw SCREECH
	db -1 ; end

PichuEggMoves:
	dw REVERSAL
	dw BIDE
	dw PRESENT
	dw ENCORE
	dw DOUBLESLAP
	db -1 ; end

CleffaEggMoves:
	dw PRESENT
	dw METRONOME
	dw AMNESIA
	dw BELLY_DRUM
	dw SPLASH
	dw MIMIC
	db -1 ; end

IgglybuffEggMoves:
	dw PERISH_SONG
	dw PRESENT
	dw FAINT_ATTACK
	db -1 ; end

TogepiEggMoves:
	dw PRESENT
	dw MIRROR_MOVE
	dw PECK
	dw FORESIGHT
	dw FUTURE_SIGHT
	db -1 ; end

NatuEggMoves:
	dw HAZE
	dw DRILL_PECK
	dw QUICK_ATTACK
	dw FAINT_ATTACK
	dw STEEL_WING
	db -1 ; end

MareepEggMoves:
	dw THUNDERBOLT
	dw TAKE_DOWN
	dw BODY_SLAM
	dw SAFEGUARD
	dw SCREECH
	dw REFLECT
	db -1 ; end

MarillEggMoves:
	dw LIGHT_SCREEN
	dw PRESENT
	dw AMNESIA
	dw FUTURE_SIGHT
	dw BELLY_DRUM
	dw PERISH_SONG
	dw SUPERSONIC
	dw FORESIGHT
	db -1 ; end

SudowoodoEggMoves:
	dw SELFDESTRUCT
	db -1 ; end

HoppipEggMoves:
	dw CONFUSION
	dw GROWL
	dw ENCORE
	dw DOUBLE_EDGE
	dw REFLECT
	dw AMNESIA
	dw PAY_DAY
	db -1 ; end

AipomEggMoves:
	dw COUNTER
	dw SCREECH
	dw PURSUIT
	dw AGILITY
	dw SPITE
	dw SLAM
	dw DOUBLESLAP
	dw BEAT_UP
	db -1 ; end

YanmaEggMoves:
	dw WHIRLWIND
	dw REVERSAL
	dw LEECH_LIFE
	db -1 ; end

WooperEggMoves:
	dw BODY_SLAM
	dw ANCIENTPOWER
	dw SAFEGUARD
	db -1 ; end

MurkrowEggMoves:
	dw WHIRLWIND
	dw DRILL_PECK
	dw QUICK_ATTACK
	dw MIRROR_MOVE
	dw WING_ATTACK
	dw SKY_ATTACK
	db -1 ; end

MisdreavusEggMoves:
	dw SCREECH
	dw DESTINY_BOND
	db -1 ; end

GirafarigEggMoves:
	dw TAKE_DOWN
	dw AMNESIA
	dw FORESIGHT
	dw FUTURE_SIGHT
	dw BEAT_UP
	db -1 ; end

PinecoEggMoves:
	dw REFLECT
	dw PIN_MISSILE
	dw FLAIL
	dw SWIFT
	db -1 ; end

DunsparceEggMoves:
	dw BIDE
	dw ANCIENTPOWER
	dw ROCK_SLIDE
	dw BITE
	dw RAGE
	db -1 ; end

GligarEggMoves:
	dw METAL_CLAW
	dw WING_ATTACK
	dw RAZOR_WIND
	dw COUNTER
	db -1 ; end

SnubbullEggMoves:
	dw METRONOME
	dw FAINT_ATTACK
	dw REFLECT
	dw PRESENT
	dw CRUNCH
	dw HEAL_BELL
	dw LICK
	dw LEER
	db -1 ; end

QwilfishEggMoves:
	dw FLAIL
	dw HAZE
	dw BUBBLEBEAM
	dw SUPERSONIC
	db -1 ; end

ShuckleEggMoves:
	dw SWEET_SCENT
	db -1 ; end

HeracrossEggMoves:
	dw HARDEN
	dw BIDE
	dw FLAIL
	db -1 ; end

SneaselEggMoves:
	dw COUNTER
	dw SPITE
	dw FORESIGHT
	dw REFLECT
	dw BITE
	db -1 ; end

TeddiursaEggMoves:
	dw CRUNCH
	dw TAKE_DOWN
	dw SEISMIC_TOSS
	dw FOCUS_ENERGY
	dw COUNTER
	dw METAL_CLAW
	db -1 ; end

SlugmaEggMoves:
	dw ACID_ARMOR
	db -1 ; end

SwinubEggMoves:
	dw TAKE_DOWN
	dw BITE
	dw BODY_SLAM
	dw ROCK_SLIDE
	dw ANCIENTPOWER
	db -1 ; end

CorsolaEggMoves:
	dw ROCK_SLIDE
	dw SAFEGUARD
	dw SCREECH
	dw MIST
	dw AMNESIA
	db -1 ; end

RemoraidEggMoves:
	dw AURORA_BEAM
	dw OCTAZOOKA
	dw SUPERSONIC
	dw HAZE
	dw SCREECH
	db -1 ; end

DelibirdEggMoves:
	dw AURORA_BEAM
	dw QUICK_ATTACK
	dw FUTURE_SIGHT
	dw SPLASH
	dw RAPID_SPIN
	db -1 ; end

MantineEggMoves:
	dw TWISTER
	dw HYDRO_PUMP
	dw HAZE
	dw SLAM
	db -1 ; end

SkarmoryEggMoves:
	dw DRILL_PECK
	dw PURSUIT
	dw WHIRLWIND
	dw SKY_ATTACK
	db -1 ; end

HoundourEggMoves:
	dw FIRE_SPIN
	dw RAGE
	dw PURSUIT
	dw COUNTER
	dw SPITE
	dw REVERSAL
	dw BEAT_UP
	db -1 ; end

PhanpyEggMoves:
	dw FOCUS_ENERGY
	dw BODY_SLAM
	dw ANCIENTPOWER
	dw WATER_GUN
	db -1 ; end

StantlerEggMoves:
	dw REFLECT
	dw SPITE
	dw DISABLE
	dw LIGHT_SCREEN
	dw BITE
	db -1 ; end

TyrogueEggMoves:
	dw RAPID_SPIN
	dw HI_JUMP_KICK
	dw MACH_PUNCH
	dw MIND_READER
	db -1 ; end

SmoochumEggMoves:
	dw MEDITATE
	db -1 ; end

ElekidEggMoves:
	dw KARATE_CHOP
	dw BARRIER
	dw ROLLING_KICK
	dw MEDITATE
	dw CROSS_CHOP
	db -1 ; end

MagbyEggMoves:
	dw KARATE_CHOP
	dw MEGA_PUNCH
	dw BARRIER
	dw SCREECH
	dw CROSS_CHOP
	db -1 ; end

MiltankEggMoves:
	dw PRESENT
	dw REVERSAL
	dw SEISMIC_TOSS
	db -1 ; end

LarvitarEggMoves:
	dw PURSUIT
	dw STOMP
	dw OUTRAGE
	dw FOCUS_ENERGY
	dw ANCIENTPOWER
	db -1 ; end

YamaskEggMoves:
	dw DISABLE
	dw ENDURE
	dw FAKE_TEARS
	dw MEMENTO
	dw NASTY_PLOT
	dw NIGHTMARE
	dw PAIN_SPLIT
	dw TOXIC_SPIKES
	db -1 ; end

FroakieEggMoves:
	dw MIND_READER
	dw POWERUPPUNCH
	dw TOXIC_SPIKES
	db -1 ; end

NincadaEggMoves:
	dw BUG_BITE
	dw BUG_BUZZ
	dw ENDURE
	dw FAINT_ATTACK
	dw FINAL_GAMBIT
	dw GUST
	dw NIGHT_SLASH
	dw SILVER_WIND
	db -1 ; end

AronEggMoves:
	dw BODY_SLAM
	dw CURSE
	dw DRAGON_RUSH
	dw ENDEAVOR
	dw HEAD_SMASH
	dw IRON_HEAD
	dw REVERSAL
	dw SCREECH
	dw STEALTHROCKS
	dw STOMP
	dw SUPERPOWER
	db -1 ; end

NosepassEggMoves:
	dw DOUBLE_EDGE
	dw ENDURE
	dw MAGNITUDE
	dw ROLLOUT
	dw STEALTHROCKS
	db -1 ; end

JoltikEggMoves:
	dw CROSS_POISON
	dw DISABLE
	dw FAINT_ATTACK
	dw LUNGE
	dw PIN_MISSILE
	dw POISON_STING
	dw PURSUIT
	db -1 ; end

FletchlingEggMoves:
	dw SNATCH
	db -1 ; end

LittenEggMoves:
	dw BODY_SLAM
	dw CRUNCH
	dw FAKE_OUT
;	dw HEATWAVE
	dw NASTY_PLOT
	dw POWER_TRIP
	dw REVENGE
	db -1 ; end

ApplinEggMoves:
	dw DEFENSE_CURL
	dw ROLLOUT
	dw SUCKER_PUNCH
	db -1 ; end

DreepyEggMoves:
	dw CONFUSE_RAY
	dw CURSE
	dw DISABLE
	dw DOUBLE_TEAM
	dw DRAGON_TAIL
	dw SUCKER_PUNCH
	db -1 ; end

MudkipEggMoves:
	dw ANCIENTPOWER
	dw AVALANCHE
	dw BARRIER
	dw BITE
	dw COUNTER
	dw CURSE
	dw DOUBLE_EDGE
	dw ICE_BALL
	dw MIRROR_COAT
	dw SLUDGE
	dw STOMP
	dw WHIRLPOOL
	db -1 ; end

NoEggMoves:
	db -1 ; end
