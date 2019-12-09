; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 3
	dw GEODUDE
	db 3
	dw DUNSPARCE
	db 2
	dw ZUBAT
	db 2
	dw GEODUDE
	db 2
	dw DUNSPARCE
	db 4
	dw DUNSPARCE
	db 4
	dw DUNSPARCE
	; day
	db 3
	dw GEODUDE
	db 3
	dw DUNSPARCE
	db 2
	dw ZUBAT
	db 2
	dw GEODUDE
	db 2
	dw DUNSPARCE
	db 4
	dw DUNSPARCE
	db 4
	dw DUNSPARCE
	; nite
	db 3
	dw GEODUDE
	db 3
	dw DUNSPARCE
	db 2
	dw ZUBAT
	db 2
	dw GEODUDE
	db 2
	dw DUNSPARCE
	db 4
	dw DUNSPARCE
	db 4
	dw DUNSPARCE

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12
	dw NIDORAN_M
	db 12
	dw NIDORAN_F
	db 12
	dw YANMA
	db 14
	dw YANMA
	db 14
	dw PIDGEY
	db 10
	dw DITTO
	db 10
	dw DITTO
	; day
	db 12
	dw NIDORAN_M
	db 12
	dw NIDORAN_F
	db 12
	dw YANMA
	db 14
	dw YANMA
	db 14
	dw PIDGEY
	db 10
	dw DITTO
	db 10
	dw DITTO
	; nite
	db 12
	dw NIDORAN_M
	db 12
	dw NIDORAN_F
	db 12
	dw YANMA
	db 14
	dw YANMA
	db 14
	dw HOOTHOOT
	db 10
	dw DITTO
	db 10
	dw DITTO

	db -1 ; end
