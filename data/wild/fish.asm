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
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  KRABBY  
.Shore_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  KRABBY
	db  90 percent + 1,  20
	dw  KRABBY
	db  100 percent,      0
	dw  0				;time_group
.Shore_Super:
	db  40 percent,      40
	dw  KRABBY 
	db  70 percent,       1
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  KRABBY
	db  100 percent,     40
	dw  KINGLER

.Ocean_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10     
	dw  TENTACOOL
.Ocean_Good:
	db  35 percent,      20     
	dw  MAGIKARP
	db  70 percent,      20     
	dw  TENTACOOL
	db  90 percent + 1,  20 
	dw  CHINCHOU
	db  100 percent,      2    
	dw  0				;time_group
.Ocean_Super:
	db  40 percent,      40    
	dw  CHINCHOU
	db  70 percent,       3     
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  TENTACRUEL
	db  100 percent,     40
	dw  LANTURN

.Lake_Old:
	db  70 percent + 1,  10 
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  GOLDEEN
.Lake_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  GOLDEEN
	db  90 percent + 1,  20
	dw  GOLDEEN
	db  100 percent,      4
	dw  0				;time_group
.Lake_Super:
	db  40 percent,      40
	dw  GOLDEEN
	db  70 percent,       5
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40 
	dw  SEAKING

.Pond_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10 
	dw  POLIWAG
.Pond_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  POLIWAG
	db  90 percent + 1,  20
	dw  POLIWAG
	db  100 percent,      6
	dw  0				;time_group
.Pond_Super:
	db  40 percent,      40
	dw  POLIWAG
	db  70 percent,       7
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40 
	dw  POLIWAG

.Dratini_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  MAGIKARP
.Dratini_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  MAGIKARP
	db  90 percent + 1,  20
	dw  MAGIKARP
	db  100 percent,      8
	dw  0				;time_group
.Dratini_Super:
	db  40 percent,      40
	dw  MAGIKARP
	db  70 percent,       9
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40 
	dw  DRAGONAIR

.Qwilfish_Swarm_Old:
	db  70 percent + 1,   5
	dw  MAGIKARP
	db  85 percent + 1,   5
	dw  MAGIKARP
	db  100 percent,      5
	dw  QWILFISH
.Qwilfish_Swarm_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  QWILFISH
	db  90 percent + 1,  20
	dw  QWILFISH
	db  100 percent,     10
	dw  0				;time_group
.Qwilfish_Swarm_Super:
	db  40 percent,      40
	dw  QWILFISH
	db  70 percent,      11
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  QWILFISH
	db  100 percent,     40
	dw  QWILFISH

.Remoraid_Swarm_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  REMORAID
.Remoraid_Swarm_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  REMORAID
	db  90 percent + 1,  20
	dw  REMORAID
	db  100 percent,     12
	dw  0				;time_group
.Remoraid_Swarm_Super:
	db  40 percent,      40
	dw  REMORAID
	db  70 percent,      13
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  REMORAID
	db  100 percent,     40
	dw  REMORAID

.Gyarados_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10 
	dw  MAGIKARP
.Gyarados_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  MAGIKARP
	db  90 percent + 1,  20
	dw  MAGIKARP
	db  100 percent,     14
	dw  0				;time_group
.Gyarados_Super:
	db  40 percent,      40
	dw  MAGIKARP
	db  70 percent,      15
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40
	dw  MAGIKARP

.Dratini_2_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  MAGIKARP
.Dratini_2_Good:
	db  35 percent,      10
	dw  MAGIKARP
	db  70 percent,      10
	dw  MAGIKARP
	db  90 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     16
	dw  0				;time_group
.Dratini_2_Super:
	db  40 percent,      10
	dw  MAGIKARP
	db  70 percent,      17
	dw  0				;time_group
	db  90 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  DRAGONAIR

.WhirlIslands_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  KRABBY
.WhirlIslands_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  KRABBY
	db  90 percent + 1,  20
	dw  KRABBY
	db  100 percent,     18
	dw  0				;time_group
.WhirlIslands_Super:
	db  40 percent,      40
	dw  KRABBY
	db  70 percent,      19
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  KINGLER
	db  100 percent,     40
	dw  SEADRA

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
;	db  70 percent + 1,  10
;	dw  MAGIKARP
	db  70 percent + 1,  17
	dw  0				;time_group
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  TENTACOOL
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  TENTACOOL
	db  90 percent + 1,  20
	dw  TENTACOOL
	db  100 percent,     20
	dw  0				;time_group
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	db  40 percent,      40
	dw  TENTACOOL
	db  70 percent,      21
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40
	dw  QWILFISH

.Remoraid_Old:
	db  70 percent + 1,  10
	dw  MAGIKARP
	db  85 percent + 1,  10
	dw  MAGIKARP
	db  100 percent,     10
	dw  POLIWAG
.Remoraid_Good:
	db  35 percent,      20
	dw  MAGIKARP
	db  70 percent,      20
	dw  POLIWAG
	db  90 percent + 1,  20
	dw  POLIWAG
	db  100 percent,      6
	dw  0				;time_group
.Remoraid_Super:
	db  40 percent,      40
	dw  POLIWAG
	db  70 percent,       7
	dw  0				;time_group
	db  90 percent + 1,  40
	dw  MAGIKARP
	db  100 percent,     40
	dw  REMORAID

TimeFishGroups:
	;  day
	db 20
	dw CORSOLA
	;nite
	db 20
	dw STARYU	 ; 0
;
	db 40
	dw CORSOLA  
	db 40
	dw STARYU	 ; 1
;
	db 20
	dw SHELLDER
	db 20
	dw SHELLDER	 ; 2
;
	db 40
	dw SHELLDER  
	db 40
	dw SHELLDER	 ; 3
;
	db 20
	dw GOLDEEN
	db 20
	dw GOLDEEN	 ; 4
;
	db 40
	dw GOLDEEN  
	db 40
	dw GOLDEEN	 ; 5
;
	db 20
	dw POLIWAG  
	db 20
	dw POLIWAG	 ; 6
;
	db 40
	dw POLIWAG  
	db 40
	dw POLIWAG	 ; 7
;
	db 20
	dw DRATINI
	db 20
	dw DRATINI	 ; 8
;
	db 40
	dw DRATINI 
	db 40
	dw DRATINI	 ; 9
;
	db 20
	dw QWILFISH
	db 20
	dw QWILFISH	 ; 10
;
	db 40
	dw QWILFISH
	db 40
	dw QWILFISH	 ; 11
;
	db 20
	dw REMORAID
	db 20
	dw REMORAID	 ; 12
;
	db 40
	dw REMORAID
	db 40
	dw REMORAID	 ; 13
;
	db 20
	dw GYARADOS  
	db 20
	dw GYARADOS	 ; 14
;
	db 40
	dw GYARADOS
	db 40
	dw GYARADOS	 ; 15
;
	db 10
	dw DRATINI
	db 10
	dw DRATINI	 ; 16
;
	db 10
	dw DRATINI 
	db 10
	dw DRATINI	 ; 17
;
	db 20
	dw HORSEA 
	db 20
	dw HORSEA	 ; 18
;
	db 40
	dw HORSEA 
	db 40
	dw HORSEA	 ; 19
;
	db 20
	dw TENTACOOL 
	db 20
	dw TENTACOOL	 ; 20
;
	db 40
	dw TENTACOOL
	db 40
	dw TENTACOOL	 ; 21
