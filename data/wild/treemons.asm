TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, level
;	dw species

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50,   	10
	dw SPEAROW
	db 15, 		10
	dw SPEAROW
	db 15, 		10
	dw SPEAROW
	db 10, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db -1
; rare
	db 50, 		10
	dw SPEAROW
	db 15, 		10
	dw HERACROSS
	db 15, 		10
	dw HERACROSS
	db 10, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db -1

TreeMonSet_Town:
; common
	db 50, 		10
	dw SPEAROW
	db 15, 		10
	dw EKANS
	db 15, 		10
	dw SPEAROW
	db 10, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db -1
; rare
	db 50, 		10
	dw SPEAROW
	db 15, 		10
	dw HERACROSS
	db 15, 		10
	dw HERACROSS
	db 10, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db  5, 		10
	dw AIPOM
	db -1

TreeMonSet_Route:
; common
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw SPINARAK
	db 15, 		10
	dw LEDYBA
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1
; rare
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw PINECO
	db 15, 		10
	dw PINECO
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1

TreeMonSet_Kanto:
; common
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw EKANS
	db 15, 		10
	dw HOOTHOOT
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1
; rare
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw PINECO
	db 15,		10
	dw PINECO
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1

TreeMonSet_Lake:
; common
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw VENONAT
	db 15, 		10
	dw HOOTHOOT
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1
; rare
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw PINECO
	db 15, 		10
	dw PINECO
	db 10, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db  5, 		10
	dw EXEGGCUTE
	db -1

TreeMonSet_Forest:
; common
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw PINECO
	db 15, 		10
	dw PINECO
	db 10, 		10
	dw NOCTOWL
	db  5, 		10
	dw BUTTERFREE
	db  5, 		10
	dw BEEDRILL
	db -1
; rare
	db 50, 		10
	dw HOOTHOOT
	db 15, 		10
	dw CATERPIE
	db 15, 		10
	dw WEEDLE
	db 10, 		10
	dw HOOTHOOT
	db  5, 		10
	dw METAPOD
	db  5, 		10
	dw KAKUNA
	db -1

TreeMonSet_Rock:
	db 90, 		15
	dw KRABBY
	db 10, 		15
	dw SHUCKLE
	db -1
