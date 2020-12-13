AI_Redundant:
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves:
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_FOCUS_ENERGY, .FocusEnergy
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_SUBSTITUTE,   .Substitute
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SNORE,        .Snore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_NIGHTMARE,    .Nightmare
	dbw EFFECT_SPIKES,       .Spikes
	dbw EFFECT_STEALTH_ROCKS, .StealthRocks
	dbw EFFECT_TOXIC_SPIKES, .T_Spikes
	dbw EFFECT_STICKY_WEB,   .StickyWeb
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_TELEPORT,     .Teleport
	dbw EFFECT_MORNING_SUN,  .MorningSun
	dbw EFFECT_SYNTHESIS,    .Synthesis
	dbw EFFECT_MOONLIGHT,    .Moonlight
	dbw EFFECT_SWAGGER,      .Swagger
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	dbw EFFECT_BURN_UP,      .BurnUp
	dbw EFFECT_SOAK,         .Soak
	dbw EFFECT_TAUNT,        .Taunt
	dbw EFFECT_TAILWIND,     .Tailwind
	dbw EFFECT_HAIL,         .Hail
	dbw EFFECT_AURORA_VEIL,  .AuroraVeil
	dbw EFFECT_OCTOLOCK,     .Octolock
	db -1

.LightScreen:
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.FocusEnergy:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Confuse:
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Transform:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect:
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Substitute:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LeechSeed:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.Disable:
	ld a, [wPlayerDisableCount]
	and a
	ret

.Encore:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.Snore:
.SleepTalk:
	ld a, [wEnemyMonStatus]
	and SLP
	jp z, .Redundant
	jp .NotRedundant

.MeanLook:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret

.Nightmare:
	ld a, [wBattleMonStatus]
	and a
	jp z, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_NIGHTMARE, a
	ret

.Spikes:
	ld a, [wPlayerScreens2]
	bit SCREENS_SPIKES_1, a
	ret z
	bit SCREENS_SPIKES_2, a
	ret

.StealthRocks:
	ld a, [wPlayerScreens2]
	bit SCREENS_STEALTH_ROCKS, a
	ret

.T_Spikes:
	ld a, [wPlayerScreens2]
	bit SCREENS_TOXIC_SPIKES_2, a
	ret

.StickyWeb:
	ld a, [wPlayerScreens2]
	bit SCREENS_STICKY_WEB, a
	ret

.Foresight:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Sandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jp z, .Redundant
	jp .NotRedundant

.Attract:
	farcall CheckOppositeGender
	jp c, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.Safeguard:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.RainDance:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .Redundant
	jr .NotRedundant

.SunnyDay:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .Redundant
	jr .NotRedundant

.DreamEater:
	ld a, [wBattleMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Swagger:
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.FutureSight:
	ld a, [wEnemyFutureSightCount]
	and a
	ret

.BurnUp:
	ld a, [wEnemyMonType1]
	cp FIRE
	ret z
	ld a, [wEnemyMonType1 + 1]
	cp FIRE
	ret

.Soak:
	ld a, [wBattleMonType1]
	cp WATER
	jr nz, .NotRedundant
	ld a, [wBattleMonType2]
	cp WATER
	jr nz, .NotRedundant
	jr .Redundant

.Taunt:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TAUNTED, a
	ret

.Tailwind:
	ld a, [wEnemyScreens]
	bit SCREENS_TAILWIND, a
	ret

.Hail:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .Redundant
	jr .NotRedundant

.AuroraVeil:
	ld a, [wEnemyScreens]
	bit SCREENS_AURORA_VEIL, a
	ret

.Octolock:
	ld a, [wEnemySubStatus6]
	bit SUBSTATUS_OCTOLOCK, a
	ret

.Heal:
.MorningSun:
.Synthesis:
.Moonlight:
	farcall AICheckEnemyMaxHP
	jr nc, .NotRedundant
; fallthrough

.Teleport:
.Redundant:
	ld a, 1
	and a
	ret

.NotRedundant:
	xor a
	ret

AI_Redundant_Moves:
; Check if move bc will fail.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld e, 3
	ld hl, .Moves
	call IsWordInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves:
	dw FAKE_OUT,       .FakeOut
	dw FIRST_IMP,      .FirstImpression
	db -1

.FakeOut:
.FirstImpression:
	ld a, [wEnemyTurnsTaken]
	and a
	ret

.NotRedundant:
	xor a
	ret
