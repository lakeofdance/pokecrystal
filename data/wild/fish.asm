time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	dbwww \1, \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super

.Shore_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  KRABBY  
.Shore_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  KRABBY
	dbbw  90 percent + 1,  20,  KRABBY
	dbbw  100 percent,      0,  0				;time_group
.Shore_Super:
	dbbw  40 percent,      40,  KRABBY 
	dbbw  70 percent,       1,  0				;time_group
	dbbw  90 percent + 1,  40,  KRABBY
	dbbw  100 percent,     40,  KINGLER

.Ocean_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  TENTACOOL
.Ocean_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  TENTACOOL
	dbbw  90 percent + 1,  20,  CHINCHOU
	dbbw  100 percent,      2,  0				;time_group
.Ocean_Super:
	dbbw  40 percent,      40,  CHINCHOU
	dbbw  70 percent,       3,  0				;time_group
	dbbw  90 percent + 1,  40,  TENTACRUEL
	dbbw  100 percent,     40,  LANTURN

.Lake_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  GOLDEEN
.Lake_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  GOLDEEN
	dbbw  90 percent + 1,  20,  GOLDEEN
	dbbw  100 percent,      4,  0				;time_group
.Lake_Super:
	dbbw  40 percent,      40,  GOLDEEN
	dbbw  70 percent,       5,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  SEAKING

.Pond_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  POLIWAG
.Pond_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  POLIWAG
	dbbw  90 percent + 1,  20,  POLIWAG
	dbbw  100 percent,      6,  0				;time_group
.Pond_Super:
	dbbw  40 percent,      40,  POLIWAG
	dbbw  70 percent,       7,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  POLIWAG

.Dratini_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  MAGIKARP
.Dratini_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  MAGIKARP
	dbbw  90 percent + 1,  20,  MAGIKARP
	dbbw  100 percent,      8,  0				;time_group
.Dratini_Super:
	dbbw  40 percent,      40,  MAGIKARP
	dbbw  70 percent,       9,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  DRAGONAIR

.Qwilfish_Swarm_Old:
	dbbw  70 percent + 1,   5,  MAGIKARP
	dbbw  85 percent + 1,   5,  MAGIKARP
	dbbw  100 percent,      5,  QWILFISH
.Qwilfish_Swarm_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  QWILFISH
	dbbw  90 percent + 1,  20,  QWILFISH
	dbbw  100 percent,     10,  0				;time_group
.Qwilfish_Swarm_Super:
	dbbw  40 percent,      40,  QWILFISH
	dbbw  70 percent,      11,  0				;time_group
	dbbw  90 percent + 1,  40,  QWILFISH
	dbbw  100 percent,     40,  QWILFISH

.Remoraid_Swarm_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  REMORAID
.Remoraid_Swarm_Good:
	dbbw  35 percent,      20, MAGIKARP
	dbbw  70 percent,      20,  REMORAID
	dbbw  90 percent + 1,  20,  REMORAID
	dbbw  100 percent,     12,  0				;time_group
.Remoraid_Swarm_Super:
	dbbw  40 percent,      40,  REMORAID
	dbbw  70 percent,      13,  0				;time_group
	dbbw  90 percent + 1,  40,  REMORAID
	dbbw  100 percent,     40,  REMORAID

.Gyarados_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  MAGIKARP
.Gyarados_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  MAGIKARP
	dbbw  90 percent + 1,  20,  MAGIKARP
	dbbw  100 percent,     14,  0				;time_group
.Gyarados_Super:
	dbbw  40 percent,      40,  MAGIKARP
	dbbw  70 percent,      15,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  MAGIKARP

.Dratini_2_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  MAGIKARP
.Dratini_2_Good:
	dbbw  35 percent,      10,  MAGIKARP
	dbbw  70 percent,      10,  MAGIKARP
	dbbw  90 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     16,  0				;time_group
.Dratini_2_Super:
	dbbw  40 percent,      10,  MAGIKARP
	dbbw  70 percent,      17,  0				;time_group
	dbbw  90 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  DRAGONAIR

.WhirlIslands_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  KRABBY
.WhirlIslands_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  KRABBY
	dbbw  90 percent + 1,  20,  KRABBY
	dbbw  100 percent,     18,  0				;time_group
.WhirlIslands_Super:
	dbbw  40 percent,      40,  KRABBY
	dbbw  70 percent,      19,  0				;time_group
	dbbw  90 percent + 1,  40,  KINGLER
	dbbw  100 percent,     40,  SEADRA

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  TENTACOOL
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  TENTACOOL
	dbbw  90 percent + 1,  20,  TENTACOOL
	dbbw  100 percent,     20,  0				;time_group
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	dbbw  40 percent,      40,  TENTACOOL
	dbbw  70 percent,      21,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  QWILFISH

.Remoraid_Old:
	dbbw  70 percent + 1,  10,  MAGIKARP
	dbbw  85 percent + 1,  10,  MAGIKARP
	dbbw  100 percent,     10,  POLIWAG
.Remoraid_Good:
	dbbw  35 percent,      20,  MAGIKARP
	dbbw  70 percent,      20,  POLIWAG
	dbbw  90 percent + 1,  20,  POLIWAG
	dbbw  100 percent,      6,  0				;time_group
.Remoraid_Super:
	dbbw  40 percent,      40,  POLIWAG
	dbbw  70 percent,       7,  0				;time_group
	dbbw  90 percent + 1,  40,  MAGIKARP
	dbbw  100 percent,     40,  REMORAID

TimeFishGroups:
	;  day
	dbw 20, CORSOLA
	;nite
	dbw 20, STARYU	 	; 0
;
	dbw 40, CORSOLA  
	dbw 40, STARYU	 	; 1
;
	dbw 20, SHELLDER
	dbw 20, SHELLDER	; 2
;
	dbw 40, SHELLDER  
	dbw 40, SHELLDER	; 3
;
	dbw 20, GOLDEEN
	dbw 20, GOLDEEN	 	; 4
;
	dbw 40, GOLDEEN  
	dbw 40, GOLDEEN	 	; 5
;
	dbw 20, POLIWAG  
	dbw 20, POLIWAG		; 6
;
	dbw 40, POLIWAG  
	dbw 40, POLIWAG	 	; 7
;
	dbw 20, DRATINI
	dbw 20, DRATINI	 	; 8
;
	dbw 40, DRATINI 
	dbw 40, DRATINI	 	; 9
;
	dbw 20, QWILFISH
	dbw 20, QWILFISH	; 10
;
	dbw 40, QWILFISH
	dbw 40, QWILFISH	; 11
;
	dbw 20, REMORAID
	dbw 20, REMORAID	; 12
;
	dbw 40, REMORAID
	dbw 40, REMORAID	; 13
;
	dbw 20, GYARADOS  
	dbw 20, GYARADOS	; 14
;
	dbw 40, GYARADOS
	dbw 40, GYARADOS	; 15
;
	dbw 10, DRATINI
	dbw 10, DRATINI	 	; 16
;
	dbw 10, DRATINI 
	dbw 10, DRATINI	 	; 17
;
	dbw 20, HORSEA 
	dbw 20, HORSEA	 	; 18
;
	dbw 40, HORSEA 
	dbw 40, HORSEA	 	; 19
;
	dbw 20, TENTACOOL 
	dbw 20, TENTACOOL	; 20
;
	dbw 40, TENTACOOL
	dbw 40, TENTACOOL	; 21
