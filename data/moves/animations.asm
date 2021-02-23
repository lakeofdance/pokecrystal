INCLUDE "constants.asm"

SECTION "Battle Animation Pointers", ROMX

INCLUDE "data/moves/animation_pointers.asm"


SECTION "Battle Animations 1", ROMX

BattleAnim_0:
BattleAnim_MirrorMove:
BattleAnim_ff:
BattleAnim_100:
	anim_ret

BattleAnim_SweetScent2:
	anim_2gfx ANIM_GFX_FLOWER, ANIM_GFX_MISC
	anim_obj ANIM_OBJ_FLOWER, 64, 96, $2
	anim_wait 2
	anim_obj ANIM_OBJ_FLOWER, 64, 80, $2
	anim_wait 64
	anim_obj ANIM_OBJ_COTTON, 136, 40, $15
	anim_obj ANIM_OBJ_COTTON, 136, 40, $2a
	anim_obj ANIM_OBJ_COTTON, 136, 40, $3f
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_wait 128
	anim_ret

BattleAnim_ThrowPokeBall:
	anim_if_param_equal NO_ITEM, .TheTrainerBlockedTheBall
	anim_if_param_equal MASTER_BALL, .MasterBall
	anim_if_param_equal ULTRA_BALL, .UltraBall
	anim_if_param_equal GREAT_BALL, .GreatBall
	; any other ball
	anim_2gfx ANIM_GFX_POKE_BALL, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL, 68, 92, $40
	anim_wait 36
	anim_obj ANIM_OBJ_POKE_BALL, 136, 65, $0
	anim_setobj $2, $7
	anim_wait 16
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 16
	anim_jump .Shake

.TheTrainerBlockedTheBall:
	anim_2gfx ANIM_GFX_POKE_BALL, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL_BLOCKED, 64, 92, $20
	anim_wait 20
	anim_obj ANIM_OBJ_01, 112, 40, $0
	anim_wait 32
	anim_ret

.UltraBall:
	anim_2gfx ANIM_GFX_POKE_BALL, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL, 68, 92, $40
	anim_wait 36
	anim_obj ANIM_OBJ_POKE_BALL, 136, 65, $0
	anim_setobj $2, $7
	anim_wait 16
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 16
	anim_jump .Shake

.GreatBall:
	anim_2gfx ANIM_GFX_POKE_BALL, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL, 68, 92, $40
	anim_wait 36
	anim_obj ANIM_OBJ_POKE_BALL, 136, 65, $0
	anim_setobj $2, $7
	anim_wait 16
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 16
	anim_jump .Shake

.MasterBall:
	anim_3gfx ANIM_GFX_POKE_BALL, ANIM_GFX_SMOKE, ANIM_GFX_SPEED
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_POKE_BALL, 64, 92, $20
	anim_wait 36
	anim_obj ANIM_OBJ_POKE_BALL, 136, 65, $0
	anim_setobj $2, $7
	anim_wait 16
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 24
	anim_sound 0, 1, SFX_MASTER_BALL
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $30
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $31
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $32
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $33
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $34
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $35
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $36
	anim_obj ANIM_OBJ_MASTER_BALL_SPARKLE, 136, 56, $37
	anim_wait 64
.Shake:
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $0, $0
	anim_wait 8
	anim_incobj 2
	anim_wait 16
	anim_sound 0, 1, SFX_CHANGE_DEX_MODE
	anim_incobj 1
	anim_wait 32
	anim_sound 0, 1, SFX_BALL_BOUNCE
	anim_wait 32
	anim_wait 32
	anim_wait 32
	anim_wait 8
	anim_setvar $0
.Loop:
	anim_wait 48
	anim_checkpokeball
	anim_if_var_equal $1, .Click
	anim_if_var_equal $2, .BreakFree
	anim_incobj 1
	anim_sound 0, 1, SFX_BALL_WOBBLE
	anim_jump .Loop

.Click:
	anim_keepsprites
	anim_ret

.BreakFree:
	anim_setobj $1, $b
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 136, 64, $10
	anim_wait 2
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $0, $0
	anim_wait 32
	anim_ret

BattleAnim_SendOutMon:
	anim_if_param_equal $0, .Normal
	anim_if_param_equal $1, .Shiny
	anim_if_param_equal $2, .Unknown
	anim_1gfx ANIM_GFX_SMOKE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_2B, $0, $1, $0
	anim_sound 0, 0, SFX_BALL_POOF
	anim_obj ANIM_OBJ_1B, 48, 96, $0
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 128
	anim_wait 4
	anim_call BattleAnim_ShowMon_0
	anim_ret

.Unknown:
	anim_1gfx ANIM_GFX_SMOKE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_2A, $0, $1, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_sound 0, 0, SFX_BALL_POOF
	anim_obj ANIM_OBJ_1B, 48, 96, $0
	anim_incbgeffect ANIM_BG_2A
	anim_wait 96
	anim_incbgeffect ANIM_BG_2A
	anim_call BattleAnim_ShowMon_0
	anim_ret

.Shiny:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $0
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $8
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $10
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $18
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $20
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $28
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $30
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SHINY, 48, 96, $38
	anim_wait 32
	anim_ret

.Normal:
	anim_1gfx ANIM_GFX_SMOKE
	anim_sound 0, 0, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 44, 96, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_ReturnMon:
	anim_sound 0, 0, SFX_BALL_POOF
BattleAnim_BatonPass_branch_c9486:
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Confused:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_KINESIS
	anim_obj ANIM_OBJ_CHICK, 44, 56, $15
	anim_obj ANIM_OBJ_CHICK, 44, 56, $aa
	anim_obj ANIM_OBJ_CHICK, 44, 56, $bf
	anim_wait 96
	anim_ret

BattleAnim_Slp:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_TAIL_WHIP
.loop
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 40
	anim_loop 3, .loop
	anim_wait 32
	anim_ret

BattleAnim_Brn:
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 0, 0, SFX_BURN
	anim_obj ANIM_OBJ_BURNED, 56, 88, $10
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 6
	anim_ret

BattleAnim_Psn:
	anim_1gfx ANIM_GFX_POISON
	anim_sound 0, 0, SFX_POISON
	anim_obj ANIM_OBJ_SKULL, 64, 56, $0
	anim_wait 8
	anim_sound 0, 0, SFX_POISON
	anim_obj ANIM_OBJ_SKULL, 48, 56, $0
	anim_wait 8
	anim_ret

BattleAnim_Sap:
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 16
	anim_ret

BattleAnim_Frz:
	anim_1gfx ANIM_GFX_ICE
	anim_obj ANIM_OBJ_FROZEN, 44, 110, $0
	anim_sound 0, 0, SFX_SHINE
	anim_wait 16
	anim_sound 0, 0, SFX_SHINE
	anim_wait 16
	anim_ret

BattleAnim_Par:
	anim_1gfx ANIM_GFX_STATUS
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_PARALYZED, 20, 88, $42
	anim_obj ANIM_OBJ_PARALYZED, 76, 88, $c2
	anim_wait 128
	anim_ret

BattleAnim_InLove:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_HEART, 64, 76, $0
	anim_wait 32
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_HEART, 36, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_InSandstorm:
	anim_1gfx ANIM_GFX_POWDER
	anim_obj ANIM_OBJ_SANDSTORM, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 72, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 56, 0, $2
.loop
	anim_sound 0, 1, SFX_MENU
	anim_wait 8
	anim_loop 6, .loop
	anim_wait 8
	anim_ret

BattleAnim_InNightmare:
	anim_1gfx ANIM_GFX_ANGELS
	anim_sound 0, 0, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_IN_NIGHTMARE, 68, 80, $0
	anim_wait 40
	anim_ret

BattleAnim_InWhirlpool:
	anim_1gfx ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_sound 0, 1, SFX_SURF
.loop
	anim_obj ANIM_OBJ_GUST, 132, 72, $0
	anim_wait 6
	anim_loop 6, .loop
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_wait 1
	anim_ret

BattleAnim_HitConfusion:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_POUND
	anim_obj ANIM_OBJ_04, 44, 96, $0
	anim_wait 16
	anim_ret

BattleAnim_Miss:
	anim_ret

BattleAnim_EnemyDamage:
.loop
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $0, $0
	anim_wait 5
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 5
	anim_loop 3, .loop
	anim_ret

BattleAnim_EnemyStatDown:
	anim_call BattleAnim_UserObj_1Row
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 40
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_PlayerStatDown:
	anim_call BattleAnim_UserObj_1Row
	anim_bgeffect ANIM_BG_WOBBLE_MON, $0, $0, $0
	anim_wait 40
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_PlayerDamage:
	anim_bgeffect ANIM_BG_VERTICAL_SHAKE, $20, $2, $20
	anim_wait 40
	anim_ret

BattleAnim_Wobble:
	anim_bgeffect ANIM_BG_35, $0, $0, $0
	anim_wait 40
	anim_ret

BattleAnim_Shake:
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $40
	anim_wait 40
	anim_ret

BattleAnim_Pound:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_08, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_KarateChop:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 136, 40, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_wait 6
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 136, 44, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 44, $0
	anim_wait 6
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 136, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_Doubleslap:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_Doubleslap_branch_c961b
	anim_sound 0, 1, SFX_DOUBLESLAP
	anim_obj ANIM_OBJ_08, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_Doubleslap_branch_c961b:
	anim_sound 0, 1, SFX_DOUBLESLAP
	anim_obj ANIM_OBJ_08, 120, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_CometPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_CometPunch_branch_c9641
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_CometPunch_branch_c9641:
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 120, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 120, 64, $0
	anim_wait 8
	anim_ret

BattleAnim_Bide_branch_c9651:
BattleAnim_MegaPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_wait 6
	anim_loop 3, .loop
	anim_ret

BattleAnim_Stomp:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_07, 136, 40, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_wait 6
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_07, 136, 44, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 44, $0
	anim_wait 6
	anim_sound 0, 1, SFX_STOMP
	anim_obj ANIM_OBJ_07, 136, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_DoubleKick:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_DoubleKick_branch_c96bd
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_DoubleKick_branch_c96bd:
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 120, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 120, 64, $0
	anim_wait 8
	anim_ret

BattleAnim_JumpKick:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_JumpKick_branch_c96f1
	anim_sound 0, 1, SFX_JUMP_KICK
	anim_obj ANIM_OBJ_07, 112, 72, $0
	anim_obj ANIM_OBJ_07, 100, 60, $0
	anim_setobj $1, $2
	anim_setobj $2, $2
	anim_wait 24
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_04, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_JumpKick_branch_c96f1:
	anim_wait 8
	anim_sound 0, 0, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_04, 44, 88, $0
	anim_wait 16
	anim_ret

BattleAnim_HiJumpKick:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_if_param_equal $1, BattleAnim_HiJumpKick_branch_c971e
	anim_wait 32
	anim_sound 0, 1, SFX_JUMP_KICK
	anim_obj ANIM_OBJ_07, 112, 72, $0
	anim_setobj $1, $2
	anim_wait 16
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_04, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_HiJumpKick_branch_c971e:
	anim_wait 16
	anim_sound 0, 0, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_04, 44, 88, $0
	anim_wait 16
	anim_ret

BattleAnim_RollingKick:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 112, 56, $0
	anim_setobj $1, $3
	anim_wait 12
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_MegaKick:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 67
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_07, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_07, 136, 56, $0
	anim_wait 6
	anim_loop 3, .loop
	anim_ret

BattleAnim_HyperFang:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $1, $0
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_FANG, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_SuperFang:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_FANG, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_FANG, 136, 56, $0
	anim_wait 6
	anim_loop 3, .loop
	anim_ret

BattleAnim_Ember:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 96, $12
	anim_wait 4
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 100, $14
	anim_wait 4
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 64, 84, $13
	anim_wait 16
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 120, 68, $30
	anim_obj ANIM_OBJ_EMBER, 132, 68, $30
	anim_obj ANIM_OBJ_EMBER, 144, 68, $30
	anim_wait 32
	anim_ret

BattleAnim_FirePunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_obj ANIM_OBJ_0A, 136, 56, $43
	anim_call BattleAnim_BurnSpin
	anim_wait 16
	anim_ret

BattleAnim_FireSpin:
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 88, $4
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 96, $3
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 88, $3
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_SPIN, 64, 96, $4
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 96
	anim_ret

BattleAnim_DragonRage:
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_DRAGON_RAGE, 64, 92, $0
	anim_wait 3
	anim_loop 16, .loop
	anim_wait 64
	anim_ret

BattleAnim_Flamethrower:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
    anim_call BattleAnim_FlamethrowerFlames
	anim_wait 16
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 16
	anim_loop 6, .loop
	anim_wait 16
	anim_ret

BattleAnim_FlamethrowerFlames:
	anim_obj ANIM_OBJ_FLAMETHROWER, 64, 92, $3
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 75, 86, $5
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 85, 81, $7
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 96, 76, $9
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 106, 71, $b
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 116, 66, $c
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 126, 61, $a
	anim_wait 2
	anim_obj ANIM_OBJ_FLAMETHROWER, 136, 56, $8
    anim_ret

BattleAnim_FireBlast:
	anim_1gfx ANIM_GFX_FIRE
.loop1
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 64, 92, $7
	anim_wait 6
	anim_loop 10, .loop1
.loop2
	anim_sound 0, 1, SFX_EMBER
	anim_wait 8
	anim_loop 10, .loop2
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_incobj 10
	anim_wait 2
.loop3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $2
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $3
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 56, $5
	anim_wait 16
	anim_loop 2, .loop3
	anim_wait 32
	anim_ret

BattleAnim_IcePunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_obj ANIM_OBJ_0A, 136, 56, $43
	anim_call BattleAnim_IcePunch_branch_cbbdf
	anim_wait 32
	anim_ret

BattleAnim_IceBeam:
	anim_1gfx ANIM_GFX_ICE
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_BEAM, 64, 92, $4
	anim_wait 4
	anim_loop 5, .loop
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
.loop2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_BEAM, 64, 92, $4
	anim_wait 4
	anim_loop 15, .loop2
	anim_wait 48
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_ret

BattleAnim_Blizzard:
	anim_1gfx ANIM_GFX_ICE
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 88, $63
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 80, $64
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 96, $63
	anim_wait 2
	anim_loop 3, .loop
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 32
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
	anim_wait 128
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 24
	anim_ret

BattleAnim_Bubble:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_sound 32, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $c1
	anim_wait 6
	anim_sound 32, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $e1
	anim_wait 6
	anim_sound 32, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $d1
	anim_wait 128
	anim_wait 32
	anim_ret

BattleAnim_Bubblebeam:
	anim_1gfx ANIM_GFX_BUBBLE
.loop
	anim_sound 16, 2, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $92
	anim_wait 6
	anim_sound 16, 2, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $b3
	anim_wait 6
	anim_sound 16, 2, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $f4
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 64
	anim_clearobjs
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_wait 1
	anim_call BattleAnim_UserObj_2Row
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 19
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 8
	anim_ret

BattleAnim_WaterGun:
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_2Row
	anim_sound 16, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_WATER_GUN, 64, 88, $0
	anim_wait 8
	anim_obj ANIM_OBJ_WATER_GUN, 64, 76, $0
	anim_wait 8
	anim_obj ANIM_OBJ_WATER_GUN, 64, 82, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 32
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_HydroPump:
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_2Row
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 108, 72, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 116, 72, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 124, 72, $0
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 132, 72, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 140, 72, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 148, 72, $0
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP, 156, 72, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 32
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_Surf:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_bgeffect ANIM_BG_SURF, $0, $0, $0
	anim_obj ANIM_OBJ_SURF, 88, 104, $8
.loop
	anim_sound 0, 1, SFX_SURF
	anim_wait 32
	anim_loop 4, .loop
	anim_incobj 1
	anim_wait 56
	anim_ret

BattleAnim_VineWhip:
	anim_1gfx ANIM_GFX_WHIP
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_40, 116, 52, $80
	anim_wait 4
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_3F, 128, 60, $0
	anim_wait 4
	anim_incobj 1
	anim_wait 4
	anim_ret

BattleAnim_LeechSeed:
	anim_1gfx ANIM_GFX_PLANT
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $20
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $30
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEECH_SEED, 48, 80, $28
	anim_wait 32
	anim_sound 0, 1, SFX_CHARGE
	anim_wait 128
	anim_ret

BattleAnim_RazorLeaf:
	anim_1gfx ANIM_GFX_PLANT
	anim_sound 0, 0, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $28
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $5c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $10
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $e8
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $9c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $d0
	anim_wait 6
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $1c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $50
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $dc
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $90
	anim_wait 80
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 3
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 5
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 7
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 9
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 1
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 2
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 4
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 6
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 8
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 10
	anim_wait 64
	anim_ret

BattleAnim_Solarbeam:
	anim_if_param_equal $0, .FireSolarBeam
	; charge turn
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 0, 0, SFX_CHARGE
	anim_obj ANIM_OBJ_3D, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $8
	anim_obj ANIM_OBJ_3C, 48, 84, $10
	anim_obj ANIM_OBJ_3C, 48, 84, $18
	anim_obj ANIM_OBJ_3C, 48, 84, $20
	anim_obj ANIM_OBJ_3C, 48, 84, $28
	anim_obj ANIM_OBJ_3C, 48, 84, $30
	anim_obj ANIM_OBJ_3C, 48, 84, $38
	anim_wait 104
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_wait 64
	anim_ret

.FireSolarBeam
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_ret

BattleAnim_Thunderpunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_obj ANIM_OBJ_0A, 136, 56, $43
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 64
	anim_ret

BattleAnim_Thundershock:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_obj ANIM_OBJ_34, 136, 56, $2
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_33, 136, 56, $0
	anim_wait 96
	anim_ret

BattleAnim_Thunderbolt:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_obj ANIM_OBJ_LIGHTNING_BOLT, 136, 56, $2
	anim_wait 16
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_31, 136, 56, $0
	anim_wait 64
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_wait 64
	anim_ret

BattleAnim_ThunderWave:
	anim_1gfx ANIM_GFX_LIGHTNING
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_THUNDER_WAVE, 136, 56, $0
	anim_wait 20
	anim_bgp $1b
	anim_incobj 1
	anim_wait 96
	anim_ret

BattleAnim_Thunder:
	anim_1gfx ANIM_GFX_LIGHTNING
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2E, 120, 68, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2D, 136, 68, $0
	anim_wait 48
	anim_ret

BattleAnim_RazorWind:
	anim_if_param_equal $1, BattleAnim_RazorWind_branch_c9fb5
	anim_1gfx ANIM_GFX_WHIP
	anim_bgeffect ANIM_BG_06, $0, $1, $0
.loop
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, 152, 40, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, 136, 56, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, 152, 64, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_41, 120, 40, $83
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_41, 120, 64, $83
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 24
	anim_ret

BattleAnim_Gust:
BattleAnim_Sonicboom:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
.loop
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 136, 72, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_obj ANIM_OBJ_01, 144, 64, $18
	anim_wait 8
	anim_obj ANIM_OBJ_01, 128, 32, $18
	anim_wait 16
	anim_ret

BattleAnim_Selfdestruct:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
	anim_if_param_equal $1, .loop
	anim_call BattleAnim_Selfdestruct_branch_cbb8f
	anim_wait 16
	anim_ret

.loop
	anim_call BattleAnim_Selfdestruct_branch_cbb62
	anim_wait 5
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Explosion:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $10
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
	anim_if_param_equal $1, .loop
	anim_call BattleAnim_Explosion_branch_cbb8f
	anim_wait 16
	anim_ret

.loop
	anim_call BattleAnim_Explosion_branch_cbb62
	anim_wait 5
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Acid:
	anim_1gfx ANIM_GFX_POISON
	anim_call BattleAnim_ShootAcid
	anim_wait 64
	anim_ret

BattleAnim_RockThrow:
	anim_1gfx ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $1, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 96
	anim_ret

BattleAnim_RockSlide:
	anim_1gfx ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $c0, $1, $0
.loop
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 4
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 16
	anim_loop 4, .loop
	anim_wait 96
	anim_ret

BattleAnim_Sing:
	anim_1gfx ANIM_GFX_NOISE
	anim_sound 16, 2, SFX_SING
.loop
	anim_obj ANIM_OBJ_SING, 64, 92, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $2
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $2
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_ret

BattleAnim_Poisonpowder:
BattleAnim_SleepPowder:
BattleAnim_Spore:
BattleAnim_StunSpore:
	anim_1gfx ANIM_GFX_POWDER
.loop
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 104, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 136, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 112, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 128, 16, $0
	anim_wait 4
	anim_sound 0, 1, SFX_POWDER
	anim_obj ANIM_OBJ_POWDER, 120, 16, $0
	anim_wait 4
	anim_loop 2, .loop
	anim_wait 96
	anim_ret

BattleAnim_HyperBeam:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $30, $4, $10
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_ret

BattleAnim_AuroraBeam:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_wait 64
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_incobj 5
	anim_wait 64
	anim_ret

BattleAnim_Vicegrip:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_37, 152, 40, $0
	anim_obj ANIM_OBJ_39, 120, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_Scratch:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_37, 144, 48, $0
	anim_obj ANIM_OBJ_37, 140, 44, $0
	anim_obj ANIM_OBJ_37, 136, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_FurySwipes:
	anim_1gfx ANIM_GFX_CUT
	anim_if_param_equal $1, BattleAnim_FurySwipes_branch_c9dd9
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_37, 144, 48, $0
	anim_obj ANIM_OBJ_37, 140, 44, $0
	anim_obj ANIM_OBJ_37, 136, 40, $0
	anim_sound 0, 1, SFX_SCRATCH
	anim_wait 32
	anim_ret

BattleAnim_FurySwipes_branch_c9dd9:
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_38, 120, 48, $0
	anim_obj ANIM_OBJ_38, 124, 44, $0
	anim_obj ANIM_OBJ_38, 128, 40, $0
	anim_sound 0, 1, SFX_SCRATCH
	anim_wait 32
	anim_ret

BattleAnim_Cut:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_Slash:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_obj ANIM_OBJ_3A, 148, 36, $0
	anim_wait 32
	anim_ret

BattleAnim_Clamp:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_CLAMP, 136, 56, $a0
	anim_obj ANIM_OBJ_CLAMP, 136, 56, $20
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 32
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 16
	anim_ret

BattleAnim_Bite:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 8
	anim_ret

BattleAnim_Teleport:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TELEPORT, $0, $1, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 3
	anim_incbgeffect ANIM_BG_TELEPORT
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_call BattleAnim_Teleport_branch_cbb12
	anim_wait 64
	anim_ret

BattleAnim_Fly:
BattleAnim_Bounce:
	anim_if_param_equal $1, BattleAnim_Fly_Jump
	anim_if_param_equal $2, BattleAnim_Fly_branch_Fail
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 32
BattleAnim_Fly_branch_Fail:
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Fly_Jump:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_Fly_branch_cbb12
	anim_wait 64
	anim_ret

BattleAnim_DoubleTeam:
	anim_call BattleAnim_TargetObj_2Row
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_DOUBLE_TEAM, $0, $1, $0
	anim_wait 96
	anim_incbgeffect ANIM_BG_DOUBLE_TEAM
	anim_wait 24
	anim_incbgeffect ANIM_BG_DOUBLE_TEAM
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Recover:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_FULL_HEAL
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_call BattleAnim_RecoverBranch
	anim_wait 64
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_RecoverBranch:
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $30
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $31
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $32
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $33
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $34
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $35
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $36
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $37
	anim_ret

BattleAnim_Absorb:
	anim_1gfx ANIM_GFX_CHARGE
	anim_obj ANIM_OBJ_3D, 44, 88, $0
.loop
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 32
	anim_ret

BattleAnim_MegaDrain:
	anim_1gfx ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1C, $0, $0, $10
	anim_setvar $0
.loop
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 6
	anim_incvar
	anim_if_var_equal $7, .done
	anim_if_var_equal $2, .spawn
	anim_jump .loop

.spawn
	anim_obj ANIM_OBJ_3D, 44, 88, $0
	anim_jump .loop

.done
	anim_wait 32
	anim_incbgeffect ANIM_BG_1C
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_EggBomb:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_EXPLOSION
	anim_sound 0, 0, SFX_SWITCH_POKEMON
	anim_obj ANIM_OBJ_EGG, 44, 104, $1
	anim_wait 128
	anim_wait 96
	anim_incobj 1
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 128, 64, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 144, 68, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 136, 72, $0
	anim_wait 24
	anim_ret

BattleAnim_Softboiled:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_BUBBLE
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SWITCH_POKEMON
	anim_obj ANIM_OBJ_EGG, 44, 104, $6
	anim_wait 128
	anim_incobj 2
	anim_obj ANIM_OBJ_EGG, 76, 104, $b
	anim_wait 16
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_sound 0, 0, SFX_METRONOME
.loop
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $20
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 128
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_FocusEnergy:
BattleAnim_RazorWind_branch_c9fb5:
BattleAnim_SkullBash_branch_c9fb5:
BattleAnim_SkyAttack_branch_c9fb5:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_16, $0, $1, $40
	anim_bgeffect ANIM_BG_06, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_16
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Bide:
	anim_if_param_equal $0, BattleAnim_Bide_branch_c9651
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_ESCAPE_ROPE
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_wait 72
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Bind:
	anim_1gfx ANIM_GFX_ROPE
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_48, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_49, 132, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 48, $0
	anim_wait 64
	anim_sound 0, 1, SFX_BIND
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_wait 96
	anim_ret

BattleAnim_Wrap:
	anim_1gfx ANIM_GFX_ROPE
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_48, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 48, $0
	anim_wait 64
	anim_sound 0, 1, SFX_BIND
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_wait 96
	anim_ret

BattleAnim_Confusion:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_UserObj_2Row
	anim_sound 0, 1, SFX_PSYCHIC
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_wait 128
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_Constrict:
	anim_1gfx ANIM_GFX_ROPE
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_49, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_49, 132, 40, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 56, $0
	anim_wait 64
	anim_ret

BattleAnim_Earthquake:
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $10
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 24
	anim_loop 4, .loop
	anim_ret

BattleAnim_Fissure:
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $0
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 24
	anim_loop 4, .loop
	anim_ret

BattleAnim_Growl:
	anim_1gfx ANIM_GFX_NOISE
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_cry $0
.loop
	anim_call BattleAnim_Growl_branch_cbbbc
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 9
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_19, $0, $0, $40
	anim_wait 64
	anim_incbgeffect ANIM_BG_19
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 5
	anim_incobj 10
	anim_wait 8
	anim_ret

BattleAnim_Roar:
	anim_1gfx ANIM_GFX_NOISE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_cry $1
.loop
	anim_call BattleAnim_Roar_branch_cbbbc
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 16
	anim_if_param_equal $0, .done
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Supersonic:
	anim_1gfx ANIM_GFX_PSYCHIC
.loop
	anim_sound 6, 2, SFX_SUPERSONIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 64
	anim_ret

BattleAnim_Screech:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $1, $20
	anim_sound 6, 2, SFX_SCREECH
.loop
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 64
	anim_ret

BattleAnim_ConfuseRay:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_08, $0, $4, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $80
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $88
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $90
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $98
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a8
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b8
.loop
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_wait 16
	anim_loop 8, .loop
	anim_wait 32
	anim_ret

BattleAnim_Leer:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_Leer_branch_cbadc
	anim_wait 16
	anim_ret

BattleAnim_Reflect:
	anim_1gfx ANIM_GFX_REFLECT
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 64
	anim_ret

BattleAnim_LightScreen:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_REFLECT
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_FLASH
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $8
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $10
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $18
	anim_wait 4
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_obj ANIM_OBJ_SHINY, 72, 80, $20
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $28
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $30
	anim_wait 4
	anim_obj ANIM_OBJ_SHINY, 72, 80, $38
	anim_wait 64
	anim_ret

BattleAnim_Amnesia:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_LICK
	anim_obj ANIM_OBJ_AMNESIA, 64, 80, $2
	anim_wait 16
	anim_obj ANIM_OBJ_AMNESIA, 68, 80, $1
	anim_wait 16
	anim_obj ANIM_OBJ_AMNESIA, 72, 80, $0
	anim_wait 64
	anim_ret

BattleAnim_DizzyPunch:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 40, $0
	anim_obj ANIM_OBJ_02, 136, 64, $0
	anim_wait 16
	anim_sound 0, 1, SFX_KINESIS
	anim_obj ANIM_OBJ_CHICK, 136, 24, $15
	anim_obj ANIM_OBJ_CHICK, 136, 24, $aa
	anim_obj ANIM_OBJ_CHICK, 136, 24, $bf
	anim_wait 96
	anim_ret

BattleAnim_Rest:
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 0, SFX_TAIL_WHIP
.loop
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 40
	anim_loop 3, .loop
	anim_wait 32
	anim_ret

BattleAnim_AcidArmor:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_ACID_ARMOR, $0, $1, $8
	anim_sound 0, 0, SFX_MEGA_PUNCH
	anim_wait 64
	anim_incbgeffect ANIM_BG_ACID_ARMOR
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Splash:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_VICEGRIP
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 96
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Dig:
	anim_2gfx ANIM_GFX_SAND, ANIM_GFX_HIT
	anim_if_param_equal $0, .hit
	anim_if_param_equal $2, .fail
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_DIG, $0, $1, $1
	anim_obj ANIM_OBJ_57, 72, 104, $0
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_56, 56, 104, $0
	anim_wait 16
	anim_loop 6, .loop
	anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_DIG
	anim_call BattleAnim_ShowMon_0
	anim_ret

.hit
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 32
.fail
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_SandAttack:
	anim_1gfx ANIM_GFX_SAND
	anim_call BattleAnim_SandAttack_branch_cbc5b
	anim_ret

BattleAnim_StringShot:
	anim_1gfx ANIM_GFX_WEB
BattleAnim_StringShotBranch:
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 48, $1
	anim_wait 4
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 64, $1
	anim_wait 4
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_STRING_SHOT, 132, 56, $2
	anim_wait 64
	anim_ret

BattleAnim_Headbutt:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_wait 32
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HEADBUTT
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Tackle:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_BodySlam:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 4
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_TakeDown:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_DoubleEdge:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $10
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 128, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Submission:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_UserObj_1Row
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $0, $0
	anim_sound 0, 1, SFX_SUBMISSION
	anim_wait 32
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 32
	anim_obj ANIM_OBJ_01, 152, 56, $0
	anim_wait 32
	anim_obj ANIM_OBJ_01, 136, 52, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_Whirlwind:
	anim_1gfx ANIM_GFX_WIND
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 64, 112, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_sound 16, 2, SFX_WHIRLWIND
	anim_wait 128
	anim_if_param_equal $0, .done
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Hypnosis:
	anim_1gfx ANIM_GFX_PSYCHIC
.loop
	anim_sound 6, 2, SFX_SUPERSONIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_obj ANIM_OBJ_WAVE, 56, 80, $2
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 56
	anim_ret

BattleAnim_Haze:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 1, SFX_SURF
.loop
	anim_obj ANIM_OBJ_HAZE, 48, 56, $0
	anim_obj ANIM_OBJ_HAZE, 132, 16, $0
	anim_wait 12
	anim_loop 5, .loop
	anim_wait 96
	anim_ret

BattleAnim_Mist:
	anim_obp0 $54
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 0, SFX_SURF
.loop
	anim_obj ANIM_OBJ_MIST, 48, 56, $0
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 96
	anim_ret

BattleAnim_Smog:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 1, SFX_BUBBLEBEAM
.loop
	anim_obj ANIM_OBJ_SMOG, 132, 16, $0
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 96
	anim_ret

BattleAnim_PoisonGas:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 16, 2, SFX_BUBBLEBEAM
.loop
	anim_obj ANIM_OBJ_POISON_GAS, 44, 80, $2
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 128
	anim_ret

BattleAnim_HornAttack:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_wait 16
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_FuryAttack:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_HORN, 72, 72, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04, 128, 40, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HORN, 80, 88, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04, 136, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HORN, 76, 80, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04, 132, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_HornDrill:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_obj ANIM_OBJ_HORN, 72, 80, $3
	anim_wait 8
.loop
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_00, 132, 40, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_00, 140, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_00, 132, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_00, 124, 48, $0
	anim_wait 8
	anim_loop 3, .loop
	anim_ret

BattleAnim_PoisonSting:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_60, 64, 92, $14
	anim_wait 16
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Twineedle:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_60, 64, 92, $14
	anim_obj ANIM_OBJ_60, 56, 84, $14
	anim_wait 16
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_obj ANIM_OBJ_05, 128, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_PinMissile:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
.loop
	anim_obj ANIM_OBJ_60, 64, 92, $28
	anim_wait 8
	anim_obj ANIM_OBJ_60, 56, 84, $28
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_60, 52, 88, $28
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 128, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 132, 52, $0
	anim_loop 3, .loop
	anim_wait 16
	anim_ret

BattleAnim_SpikeCannon:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
.loop
	anim_obj ANIM_OBJ_60, 64, 92, $18
	anim_wait 8
	anim_obj ANIM_OBJ_60, 56, 84, $18
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_wait 8
	anim_obj ANIM_OBJ_60, 52, 88, $18
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 128, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 132, 52, $0
	anim_loop 3, .loop
	anim_wait 16
	anim_ret

BattleAnim_Transform:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_transform
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_updateactorpic
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_MegaEvolve:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_megaevolve
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_updateactorpic
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_PetalDance:
	anim_sound 0, 0, SFX_MENU
	anim_2gfx ANIM_GFX_FLOWER, ANIM_GFX_HIT
.loop
	anim_obj ANIM_OBJ_PETAL_DANCE, 48, 56, $0
	anim_wait 11
	anim_loop 8, .loop
	anim_wait 128
	anim_wait 64
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Barrage:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_EXPLOSION
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_PayDay:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_STATUS
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_wait 16
	anim_sound 0, 1, SFX_PAY_DAY
	anim_obj ANIM_OBJ_PAY_DAY, 120, 76, $1
	anim_wait 64
	anim_ret

BattleAnim_Mimic:
	anim_1gfx ANIM_GFX_SPEED
	anim_obp0 $fc
	anim_sound 63, 3, SFX_LICK
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $0
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $8
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $10
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $18
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $20
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $28
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $30
	anim_obj ANIM_OBJ_MIMIC, 132, 44, $38
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_LovelyKiss:
	anim_2gfx ANIM_GFX_OBJECTS, ANIM_GFX_ANGELS
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_LOVELY_KISS, 152, 40, $0
	anim_wait 32
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_HEART, 128, 40, $0
	anim_wait 40
	anim_ret

BattleAnim_Bonemerang:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_BONEMERANG, 88, 56, $1c
	anim_wait 24
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 24
	anim_ret

BattleAnim_Swift:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_sound 6, 2, SFX_METRONOME
	anim_obj ANIM_OBJ_SWIFT, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 72, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 76, $4
	anim_wait 64
	anim_ret

BattleAnim_Crabhammer:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 12
	anim_loop 3, .loop
	anim_ret

BattleAnim_SkullBash:
	anim_if_param_equal $1, BattleAnim_SkullBash_branch_c9fb5
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_wait 32
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
.loop
	anim_sound 0, 1, SFX_HEADBUTT
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_loop 3, .loop
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Kinesis:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_NOISE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_KINESIS, 80, 76, $0
	anim_wait 32
.loop
	anim_sound 0, 0, SFX_KINESIS
	anim_obj ANIM_OBJ_4B, 64, 88, $0
	anim_wait 32
	anim_loop 3, .loop
	anim_wait 32
	anim_sound 0, 0, SFX_KINESIS_2
	anim_wait 32
	anim_ret

BattleAnim_Peck:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 128, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_DrillPeck:
	anim_1gfx ANIM_GFX_HIT
.loop
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 124, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 132, 48, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 140, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 132, 64, $0
	anim_wait 4
	anim_loop 5, .loop
	anim_wait 16
	anim_ret

BattleAnim_Guillotine:
	anim_1gfx ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_37, 156, 44, $0
	anim_obj ANIM_OBJ_37, 152, 40, $0
	anim_obj ANIM_OBJ_37, 148, 36, $0
	anim_obj ANIM_OBJ_39, 124, 76, $0
	anim_obj ANIM_OBJ_39, 120, 72, $0
	anim_obj ANIM_OBJ_39, 116, 68, $0
	anim_obj ANIM_OBJ_39, 120, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_Flash:
	anim_1gfx ANIM_GFX_SPEED
	anim_sound 0, 1, SFX_FLASH
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $0
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $8
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $10
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $18
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $20
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $28
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $30
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $38
	anim_wait 32
	anim_ret

BattleAnim_Substitute:
	anim_sound 0, 0, SFX_SURF
	anim_if_param_equal $3, BattleAnim_Substitute_branch_ca77c
	anim_if_param_equal $2, BattleAnim_Substitute_branch_ca76e
	anim_if_param_equal $1, BattleAnim_Substitute_branch_ca760
	anim_1gfx ANIM_GFX_SMOKE
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 48
	anim_raisesub
	anim_obj ANIM_OBJ_BALL_POOF, 48, 96, $0
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Substitute_branch_ca760:
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 48
	anim_dropsub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Substitute_branch_ca76e:
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 48
	anim_raisesub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Substitute_branch_ca77c:
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 48
	anim_dropsub
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_Minimize:
	anim_sound 0, 0, SFX_SURF
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_minimize
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_updateactorpic
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_SkyAttack:
	anim_if_param_equal $1, BattleAnim_SkyAttack_branch_c9fb5
	anim_1gfx ANIM_GFX_SKY_ATTACK
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 32
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_SKY_ATTACK, 48, 88, $40
	anim_wait 64
	anim_incobj 1
	anim_wait 21
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_wait 64
	anim_incobj 1
	anim_wait 32
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_NightShade:
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_obp1 $1b
	anim_wait 32
	anim_call BattleAnim_UserObj_2Row
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_sound 0, 1, SFX_PSYCHIC
	anim_wait 96
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_Lick:
	anim_1gfx ANIM_GFX_WATER
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_LICK, 136, 56, $0
	anim_wait 64
	anim_ret

BattleAnim_TriAttack:
	anim_3gfx ANIM_GFX_FIRE, ANIM_GFX_ICE, ANIM_GFX_LIGHTNING
	anim_call BattleAnim_BurnSpin
	anim_wait 16
	anim_call BattleAnim_TriAttack_branch_cbbdf
	anim_wait 16
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $4
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 16
	anim_ret

BattleAnim_Withdraw:
	anim_1gfx ANIM_GFX_REFLECT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 48
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_WITHDRAW, 48, 88, $0
	anim_wait 64
	anim_incobj 2
	anim_wait 1
	anim_incbgeffect ANIM_BG_WITHDRAW
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Psybeam:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_08, $0, $4, $0
.loop
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE, 64, 88, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 48
	anim_ret

BattleAnim_DreamEater:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_bgp $1b
	anim_obp0 $27
	anim_sound 6, 3, SFX_WATER_GUN
	anim_call BattleAnim_DreamEater_branch_cbab3
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_LeechLife:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_sound 6, 3, SFX_WATER_GUN
	anim_call BattleAnim_LeechHP
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_Harden:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Psywave:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
.loop
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 80, $2
	anim_wait 8
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $3
	anim_wait 8
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 96, $4
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 32
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_Glare:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $20
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_Glare_branch_cbadc
	anim_wait 16
	anim_ret

BattleAnim_Thrash:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_08, 120, 72, $0
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 152, 40, $0
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Growth:
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_1gfx ANIM_GFX_CHARGE
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $0
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $8
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $10
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $18
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $20
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $28
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $30
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $38
	anim_wait 64
	anim_ret

BattleAnim_Conversion2:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_sound 63, 3, SFX_SHARPEN
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $0
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $8
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $10
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $18
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $20
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $28
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $30
	anim_obj ANIM_OBJ_CONVERSION2, 132, 44, $38
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_Smokescreen:
	anim_3gfx ANIM_GFX_HAZE, ANIM_GFX_EGG, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_SMOKESCREEN, 64, 92, $6c
	anim_wait 24
	anim_incobj 1
	anim_sound 0, 1, SFX_BALL_POOF
	anim_obj ANIM_OBJ_BALL_POOF, 108, 70, $10
	anim_wait 8
.loop
	anim_sound 0, 1, SFX_MENU
	anim_obj ANIM_OBJ_SMOKE, 132, 60, $20
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 128
	anim_ret

BattleAnim_Strength:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_VERTICAL_SHAKE, $10, $1, $20
	anim_sound 0, 0, SFX_STRENGTH
	anim_obj ANIM_OBJ_STRENGTH, 64, 104, $1
	anim_wait 128
	anim_incobj 1
	anim_wait 20
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 132, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_SwordsDance:
	anim_1gfx ANIM_GFX_WHIP
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $0
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $d
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $1a
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $27
	anim_obj ANIM_OBJ_SWORDS_DANCE, 48, 108, $34
	anim_wait 56
	anim_ret

BattleAnim_QuickAttack:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_SpeedJump:
	anim_obj ANIM_OBJ_SPEED_LINE, 24, 88, $2
	anim_obj ANIM_OBJ_SPEED_LINE, 32, 88, $1
	anim_obj ANIM_OBJ_SPEED_LINE, 40, 88, $0
	anim_obj ANIM_OBJ_SPEED_LINE, 48, 88, $80
	anim_obj ANIM_OBJ_SPEED_LINE, 56, 88, $81
	anim_obj ANIM_OBJ_SPEED_LINE, 64, 88, $82
	anim_ret

BattleAnim_Meditate:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_PSYBEAM
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 48
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Sharpen:
	anim_1gfx ANIM_GFX_SHAPES
	anim_obp0 $e4
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_obj ANIM_OBJ_SHARPEN, 48, 88, $0
	anim_wait 96
	anim_incobj 2
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_DefenseCurl:
	anim_1gfx ANIM_GFX_SHAPES
	anim_obp0 $e4
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_obj ANIM_OBJ_DEFENSE_CURL, 48, 88, $0
	anim_wait 96
	anim_incobj 2
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_SeismicToss:
	anim_2gfx ANIM_GFX_GLOBE, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_VERTICAL_SHAKE, $10, $1, $20
	anim_sound 0, 0, SFX_STRENGTH
	anim_obj ANIM_OBJ_SEISMIC_TOSS, 64, 104, $1
	anim_wait 128
	anim_incobj 1
	anim_wait 20
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 132, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Rage:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_RAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Agility:
	anim_1gfx ANIM_GFX_WIND
	anim_obp0 $fc
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_18, $0, $1, $40
    anim_call BattleAnim_AgilityLines
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 4
	anim_loop 18, .loop
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_BoneClub:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_MISC
	anim_obj ANIM_OBJ_BONE_CLUB, 64, 88, $2
	anim_wait 32
	anim_sound 0, 1, SFX_BONE_CLUB
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Barrier:
	anim_1gfx ANIM_GFX_REFLECT
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_wait 8
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 32
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 32
	anim_ret

BattleAnim_Waterfall:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
BattleAnim_WaterfallHits:
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 32, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 24, $0
	anim_wait 8
	anim_ret

BattleAnim_PsychicM:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
.loop
	anim_sound 6, 2, SFX_PSYCHIC
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 96
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_Sludge:
	anim_1gfx ANIM_GFX_POISON
	anim_call BattleAnim_Sludge_branch_cbc15
	anim_wait 56
	anim_ret

BattleAnim_Toxic:
	anim_1gfx ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_call BattleAnim_ShootAcid
	anim_wait 32
	anim_call BattleAnim_Toxic_branch_cbc15
	anim_wait 64
	anim_ret

BattleAnim_Metronome:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_SPEED
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_7A, 72, 88, $0
.loop
	anim_obj ANIM_OBJ_7B, 72, 80, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 48
	anim_ret

BattleAnim_Counter:
	anim_1gfx ANIM_GFX_HIT
.loop
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $2
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_08, 120, 72, $0
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 136, 40, $0
	anim_obj ANIM_OBJ_00, 136, 40, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $2
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_07, 152, 56, $0
	anim_obj ANIM_OBJ_00, 152, 56, $0
	anim_wait 6
	anim_loop 3, .loop
	anim_wait 16
	anim_ret

BattleAnim_LowKick:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 124, 64, $0
	anim_obj ANIM_OBJ_00, 124, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 132, 64, $0
	anim_obj ANIM_OBJ_00, 132, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 140, 64, $0
	anim_obj ANIM_OBJ_00, 140, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_WingAttack:
	anim_1gfx ANIM_GFX_HIT
BattleAnim_WingAttackHit:
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_obj ANIM_OBJ_01, 116, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 144, 56, $0
	anim_obj ANIM_OBJ_01, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 140, 56, $0
	anim_obj ANIM_OBJ_01, 124, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Slam:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_obj ANIM_OBJ_01, 124, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Disable:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_STATUS
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_DISABLE, 132, 56, $0
	anim_wait 16
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_PARALYZED, 104, 56, $42
	anim_obj ANIM_OBJ_PARALYZED, 160, 56, $c2
	anim_wait 96
	anim_ret

BattleAnim_TailWhip:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_sound 0, 0, SFX_TAIL_WHIP
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Struggle:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Sketch:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_SKETCH
	anim_obj ANIM_OBJ_SKETCH, 72, 80, $0
	anim_wait 80
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_ret

BattleAnim_TripleKick:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_TripleKick_branch_cac95
	anim_if_param_equal $2, BattleAnim_TripleKick_branch_caca5
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_07, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 8
	anim_ret

BattleAnim_TripleKick_branch_cac95:
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 120, 64, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 120, 64, $0
	anim_wait 8
	anim_ret

BattleAnim_TripleKick_branch_caca5:
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 132, 32, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 132, 32, $0
	anim_wait 8
	anim_ret

BattleAnim_Thief:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THIEF
	anim_obj ANIM_OBJ_01, 128, 48, $0
BattleAnim_ThiefBranch:
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_1gfx ANIM_GFX_STATUS
	anim_sound 0, 1, SFX_THIEF_2
	anim_obj ANIM_OBJ_THIEF, 120, 76, $1
	anim_wait 64
	anim_ret

BattleAnim_SpiderWeb:
	anim_1gfx ANIM_GFX_WEB
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_SPIDER_WEB, 132, 48, $0
	anim_sound 6, 2, SFX_SPIDER_WEB
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 64
	anim_ret

BattleAnim_MindReader:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 1, SFX_MIND_READER
.loop
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $3
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $12
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $20
	anim_obj ANIM_OBJ_MIND_READER, 132, 48, $31
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_Nightmare:
	anim_1gfx ANIM_GFX_ANGELS
	anim_bgp $1b
	anim_obp0 $f
	anim_obj ANIM_OBJ_NIGHTMARE, 132, 40, $0
	anim_obj ANIM_OBJ_NIGHTMARE, 132, 40, $a0
	anim_sound 0, 1, SFX_NIGHTMARE
	anim_wait 96
	anim_ret

BattleAnim_FlameWheel:
	anim_1gfx ANIM_GFX_FIRE
    anim_call BattleAnim_FlameWheelPillar
	anim_wait 96
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $5
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 9
	anim_wait 8
	anim_ret
    
BattleAnim_FlameWheelPillar:
.loop
	anim_sound 0, 0, SFX_EMBER
	anim_obj ANIM_OBJ_FLAME_WHEEL, 48, 96, $0
	anim_wait 6
	anim_loop 8, .loop
    anim_ret

BattleAnim_Snore:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_NOISE
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_sound 0, 0, SFX_SNORE
.loop
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 8
	anim_ret

BattleAnim_Curse:
	anim_if_param_equal $1, .NotGhost
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_OBJECTS
	anim_obj ANIM_OBJ_CURSE, 68, 72, $0
	anim_sound 0, 0, SFX_CURSE
	anim_wait 32
	anim_incobj 1
	anim_wait 12
	anim_sound 0, 0, SFX_POISON_STING
	anim_obj ANIM_OBJ_04, 44, 96, $0
	anim_wait 16
	anim_ret

.NotGhost:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_19, $0, $1, $40
	anim_sound 0, 0, SFX_SHARPEN
	anim_wait 64
	anim_incbgeffect ANIM_BG_19
	anim_wait 1
	anim_bgeffect ANIM_BG_16, $0, $1, $40
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_16
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Flail:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SUBMISSION
	anim_bgeffect ANIM_BG_FLAIL, $0, $1, $0
	anim_wait 8
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_01, 152, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_FLAIL
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Conversion:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 63, 3, SFX_SHARPEN
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $0
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $8
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $10
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $18
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $20
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $28
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $30
	anim_obj ANIM_OBJ_CONVERSION, 48, 88, $38
	anim_wait 128
	anim_ret

BattleAnim_Aeroblast:
	anim_2gfx ANIM_GFX_BEAM, ANIM_GFX_AEROBLAST
	anim_bgp $1b
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $50, $4, $10
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_AEROBLAST
	anim_obj ANIM_OBJ_AEROBLAST, 72, 88, $0
	anim_wait 32
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 80, 84, $0
	anim_wait 2
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 96, 76, $0
	anim_wait 2
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 112, 68, $0
	anim_obj ANIM_OBJ_BEAM_END, 126, 62, $0
	anim_wait 48
	anim_ret

BattleAnim_CottonSpore:
	anim_obp0 $54
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 1, SFX_POWDER
.loop
	anim_obj ANIM_OBJ_COTTON_SPORE, 132, 32, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 96
	anim_ret

BattleAnim_Reversal:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_04, 112, 64, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 120, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_04, 128, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 136, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_04, 144, 48, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_FORESIGHT, 152, 40, $0
	anim_wait 24
	anim_ret

BattleAnim_Spite:
	anim_1gfx ANIM_GFX_ANGELS
	anim_obj ANIM_OBJ_SPITE, 132, 16, $0
	anim_sound 0, 1, SFX_SPITE
	anim_wait 96
	anim_ret

BattleAnim_PowderSnow:
	anim_1gfx ANIM_GFX_ICE
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW, 64, 88, $23
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW, 64, 80, $24
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW, 64, 96, $23
	anim_wait 2
	anim_loop 2, .loop
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 40
	anim_call BattleAnim_PowderSnow_branch_cbbdf
	anim_wait 32
	anim_ret

BattleAnim_Protect:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $0
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $d
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $1a
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $27
	anim_obj ANIM_OBJ_PROTECT, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 96
	anim_ret

BattleAnim_MachPunch:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 0, 0, SFX_MENU
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_ScaryFace:
	anim_1gfx ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_ScaryFace_branch_cbadc
	anim_wait 64
	anim_ret

BattleAnim_FaintAttack:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_CURSE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1D, $0, $1, $80
	anim_wait 96
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 120, 32, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 152, 40, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 136, 48, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_1D
	anim_call BattleAnim_ShowMon_0
	anim_wait 4
	anim_ret

BattleAnim_SweetKiss:
	anim_2gfx ANIM_GFX_OBJECTS, ANIM_GFX_ANGELS
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_SWEET_KISS, 96, 40, $0
	anim_sound 0, 1, SFX_SWEET_KISS
	anim_wait 32
	anim_sound 0, 1, SFX_SWEET_KISS_2
	anim_obj ANIM_OBJ_HEART, 120, 40, $0
	anim_wait 40
	anim_ret

BattleAnim_BellyDrum:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_NOISE
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 24
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_sound 0, 0, SFX_BELLY_DRUM
	anim_obj ANIM_OBJ_AA, 64, 104, $0
	anim_obj ANIM_OBJ_AB, 64, 92, $f8
	anim_wait 12
	anim_ret

BattleAnim_SludgeBomb:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_call BattleAnim_SludgeBomb_branch_cbc15
	anim_wait 64
	anim_ret

BattleAnim_MudSlap:
	anim_1gfx ANIM_GFX_SAND
	anim_obp0 $fc
	anim_call BattleAnim_MudSlap_branch_cbc5b
	anim_ret

BattleAnim_Octazooka:
	anim_3gfx ANIM_GFX_HAZE, ANIM_GFX_EGG, ANIM_GFX_SMOKE
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_OCTAZOOKA, 64, 92, $4
	anim_wait 16
	anim_obj ANIM_OBJ_BALL_POOF, 132, 56, $10
	anim_wait 8
	anim_if_param_equal $0, .done
.loop
	anim_obj ANIM_OBJ_SMOKE, 132, 60, $20
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 128
.done
	anim_ret

BattleAnim_Spikes:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $20
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $30
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES, 48, 88, $28
	anim_wait 64
	anim_ret

BattleAnim_ZapCannon:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_bgp $1b
	anim_obp0 $30
	anim_sound 6, 2, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_ZAP_CANNON, 64, 92, $2
	anim_wait 40
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_LIGHTNING_BOLT, 136, 56, $2
	anim_wait 16
	anim_obj ANIM_OBJ_31, 136, 56, $0
	anim_wait 128
	anim_ret

BattleAnim_Foresight:
	anim_1gfx ANIM_GFX_SHINE
	anim_call BattleAnim_UserObj_1Row
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 1, SFX_FORESIGHT
	anim_obj ANIM_OBJ_FORESIGHT, 132, 40, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_19, $0, $0, $40
	anim_wait 64
	anim_incbgeffect ANIM_BG_19
	anim_call BattleAnim_ShowMon_1
	anim_wait 8
	anim_ret

BattleAnim_DestinyBond:
	anim_1gfx ANIM_GFX_ANGELS
	anim_bgp $1b
	anim_obp0 $0
	anim_if_param_equal $1, BattleAnim_DestinyBond_branch_cb104
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_obj ANIM_OBJ_DESTINY_BOND, 44, 120, $2
	anim_wait 128
	anim_ret

BattleAnim_DestinyBond_branch_cb104:
	anim_obj ANIM_OBJ_DESTINY_BOND, 132, 76, $0
	anim_sound 0, 1, SFX_KINESIS
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $0, $0
	anim_wait 32
	anim_ret

BattleAnim_PerishSong:
	anim_1gfx ANIM_GFX_NOISE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 0, 2, SFX_PERISH_SONG
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $0
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $8
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $10
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $18
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $20
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $28
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $30
	anim_obj ANIM_OBJ_PERISH_SONG, 88, 0, $38
	anim_wait 112
	anim_ret

BattleAnim_IcyWind:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_battlergfx_1row
	anim_sound 0, 0, SFX_PSYCHIC
.loop
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 88, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 80, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 96, $4
	anim_wait 8
	anim_loop 2, .loop
	anim_wait 16
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_wait 64
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_incobj 7
	anim_wait 1
	anim_ret

BattleAnim_Detect:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 0, SFX_FORESIGHT
	anim_obj ANIM_OBJ_FORESIGHT, 64, 88, $0
	anim_wait 24
	anim_ret

BattleAnim_BoneRush:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_MISC
	anim_sound 0, 1, SFX_BONE_CLUB
	anim_obj ANIM_OBJ_BONE_RUSH, 132, 56, $2
	anim_wait 16
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 16
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 144, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_LockOn:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 1, SFX_MIND_READER
.loop
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $3
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $12
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $20
	anim_obj ANIM_OBJ_LOCK_ON, 132, 48, $31
	anim_wait 16
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_Outrage:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Sandstorm:
	anim_1gfx ANIM_GFX_POWDER
	anim_obj ANIM_OBJ_SANDSTORM, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 72, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SANDSTORM, 56, 0, $2
.loop
	anim_sound 0, 1, SFX_MENU
	anim_wait 8
	anim_loop 16, .loop
	anim_wait 8
	anim_ret

BattleAnim_GigaDrain:
	anim_2gfx ANIM_GFX_BUBBLE, ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1C, $0, $0, $10
	anim_sound 6, 3, SFX_GIGA_DRAIN
	anim_call BattleAnim_GigaDrain_branch_cbab3
	anim_wait 48
	anim_wait 128
	anim_incbgeffect ANIM_BG_1C
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_07, $0, $0, $0
.loop
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_Endure:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 5, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Charm:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_HEART, 64, 80, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_0
	anim_wait 4
	anim_ret

BattleAnim_Rollout:
BattleAnim_IceBall:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 0, SFX_SPARK
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_RUMBLE, $60, $1, $1
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_03, 136, 40, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_FalseSwipe:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_wait 4
	anim_obj ANIM_OBJ_GLIMMER, 136, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_Swagger:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_WIND
.loop
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 32
	anim_loop 2, .loop
	anim_wait 32
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 104, 40, $0
	anim_wait 40
	anim_ret

BattleAnim_MilkDrink:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_BUBBLE
	anim_call BattleAnim_TargetObj_1Row
	anim_obj ANIM_OBJ_MILK_DRINK, 74, 104, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_sound 0, 0, SFX_MILK_DRINK
.loop
	anim_obj ANIM_OBJ_RECOVER, 44, 88, $20
	anim_wait 8
	anim_loop 8, .loop
	anim_wait 128
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Spark:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_THUNDER_WAVE, 48, 92, $0
	anim_wait 24
	anim_setobj $1, $3
	anim_wait 1
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 2
	anim_wait 1
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_LIGHTNING_BOLT, 136, 56, $2
	anim_obj ANIM_OBJ_33, 136, 56, $0
	anim_wait 32
	anim_ret

BattleAnim_FuryCutter:
	anim_1gfx ANIM_GFX_CUT
.loop
	anim_sound 0, 1, SFX_CUT
	anim_if_param_and %00000001, .obj1
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_jump .okay

.obj1
	anim_obj ANIM_OBJ_3B, 112, 40, $0
.okay
	anim_wait 16
	anim_jumpuntil .loop
	anim_ret

BattleAnim_SteelWing:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_obj ANIM_OBJ_01, 116, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 144, 56, $0
	anim_obj ANIM_OBJ_01, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 140, 56, $0
	anim_obj ANIM_OBJ_01, 124, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_MeanLook:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_obp0 $e0
	anim_sound 0, 1, SFX_MEAN_LOOK
	anim_obj ANIM_OBJ_MEAN_LOOK, 148, 32, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 116, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 148, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 116, 32, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 132, 48, $0
	anim_wait 128
	anim_ret

BattleAnim_Attract:
	anim_1gfx ANIM_GFX_OBJECTS
.loop
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_ATTRACT, 44, 80, $2
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 128
	anim_wait 64
	anim_ret

BattleAnim_SleepTalk:
	anim_1gfx ANIM_GFX_STATUS
.loop
	anim_sound 0, 0, SFX_STRENGTH
	anim_obj ANIM_OBJ_ASLEEP, 64, 80, $0
	anim_wait 40
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_HealBell:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_NOISE
	anim_obj ANIM_OBJ_84, 72, 56, $0
	anim_wait 32
.loop
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_85, 72, 52, $0
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_85, 72, 52, $1
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_85, 72, 52, $2
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_85, 72, 52, $0
	anim_wait 8
	anim_sound 0, 0, SFX_HEAL_BELL
	anim_obj ANIM_OBJ_85, 72, 52, $2
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_ret

BattleAnim_Return:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_sound 0, 0, SFX_RETURN
	anim_wait 64
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 32
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_03, 136, 40, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Present:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_BUBBLE
	anim_sound 0, 1, SFX_PRESENT
	anim_obj ANIM_OBJ_PRESENT, 64, 88, $6c
	anim_wait 56
	anim_obj ANIM_OBJ_AMNESIA, 104, 48, $0
	anim_wait 48
	anim_incobj 2
	anim_if_param_equal $3, .heal
	anim_incobj 1
	anim_wait 1
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $12
.loop
	anim_call BattleAnim_Present_branch_cbb8f
	anim_wait 16
	anim_jumpuntil .loop
	anim_ret

.heal
	anim_sound 0, 1, SFX_METRONOME
.loop2
	anim_obj ANIM_OBJ_RECOVER, 132, 48, $24
	anim_wait 8
	anim_loop 8, .loop2
	anim_wait 128
	anim_ret

BattleAnim_Frustration:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 0, 0, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 72, 80, $0
	anim_wait 40
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 152, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_wait 1
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Safeguard:
	anim_1gfx ANIM_GFX_MISC
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $0
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $d
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $1a
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $27
	anim_obj ANIM_OBJ_SAFEGUARD, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 96
	anim_ret

BattleAnim_PainSplit:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_OBJECTS
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_04, 112, 48, $0
	anim_obj ANIM_OBJ_04, 76, 96, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_ret

BattleAnim_SacredFire:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnim_FirePillar
	anim_wait 96
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $5
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 9
	anim_wait 8
	anim_ret

BattleAnim_FirePillar:
.loop
	anim_sound 0, 0, SFX_EMBER
	anim_obj ANIM_OBJ_SACRED_FIRE, 48, 104, $0
	anim_wait 8
	anim_loop 8, .loop
	anim_ret

BattleAnim_Magnitude:
	anim_1gfx ANIM_GFX_ROCKS
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $e, $4, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 120, 68, $30
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 144, 64, $40
	anim_wait 2
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 2
	anim_jumpuntil .loop
	anim_wait 96
	anim_ret

BattleAnim_Dynamicpunch:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_EXPLOSION
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_0A, 136, 56, $43
	anim_wait 16
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $12
	anim_call BattleAnim_Dynamicpunch_branch_cbb8f
	anim_wait 16
	anim_ret

BattleAnim_Megahorn:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_wait 16
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Dragonbreath:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
.loop
	anim_obj ANIM_OBJ_DRAGONBREATH, 64, 92, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 64
	anim_ret

BattleAnim_BatonPass:
	anim_1gfx ANIM_GFX_MISC
	anim_obj ANIM_OBJ_BATON_PASS, 44, 104, $20
	anim_sound 0, 0, SFX_BATON_PASS
	anim_call BattleAnim_BatonPass_branch_c9486
	anim_wait 64
	anim_ret

BattleAnim_Encore:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_obj ANIM_OBJ_99, 64, 80, $90
	anim_obj ANIM_OBJ_99, 64, 80, $10
	anim_sound 0, 0, SFX_ENCORE
	anim_wait 16
	anim_obj ANIM_OBJ_9A, 64, 72, $2c
	anim_wait 32
	anim_obj ANIM_OBJ_9A, 64, 72, $34
	anim_wait 16
	anim_ret

BattleAnim_Pursuit:
	anim_1gfx ANIM_GFX_HIT
	anim_if_param_equal $1, BattleAnim_Pursuit_branch_cb62b
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_Pursuit_branch_cb62b:
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $0, $0
	anim_wait 4
	anim_call BattleAnim_UserObj_1Row
	anim_obj ANIM_OBJ_AD, 132, 64, $0
	anim_wait 64
	anim_obj ANIM_OBJ_AD, 132, 64, $1
	anim_sound 0, 1, SFX_BALL_POOF
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $0, $0
	anim_wait 64
	anim_incobj 3
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 120, 56, $0
	anim_bgeffect ANIM_BG_2D, $0, $0, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_RapidSpin:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
	anim_obp0 $e4
.loop
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_RAPID_SPIN, 44, 112, $0
	anim_wait 2
	anim_loop 5, .loop
	anim_wait 24
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 4
	anim_resetobp0
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_04, 136, 40, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 6
	anim_wait 1
	anim_ret

BattleAnim_SweetScent:
	anim_2gfx ANIM_GFX_FLOWER, ANIM_GFX_MISC
	anim_sound 0, 0, SFX_SWEET_SCENT
	anim_obj ANIM_OBJ_FLOWER, 64, 96, $2
	anim_wait 2
	anim_obj ANIM_OBJ_FLOWER, 64, 80, $2
	anim_wait 96
	anim_obp0 $54
	anim_sound 0, 1, SFX_SWEET_SCENT_2
	anim_obj ANIM_OBJ_COTTON, 136, 40, $15
	anim_obj ANIM_OBJ_COTTON, 136, 40, $2a
	anim_obj ANIM_OBJ_COTTON, 136, 40, $3f
	anim_wait 128
	anim_ret

BattleAnim_IronTail:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_wait 4
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_MetalClaw:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_CUT
	anim_resetobp0
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_37, 144, 48, $0
	anim_obj ANIM_OBJ_37, 140, 44, $0
	anim_obj ANIM_OBJ_37, 136, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_VitalThrow:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_STEP_BACK_USER, $0, $1, $0
	anim_wait 16
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 64, 96, $0
	anim_wait 8
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 56, 88, $0
	anim_wait 8
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 68, 104, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_STEP_BACK_USER
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_03, 132, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_MorningSun:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 0, SFX_MORNING_SUN
.loop
	anim_obj ANIM_OBJ_MORNING_SUN, 16, 48, $88
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 32
	anim_if_param_equal 0, .zero
	anim_call BattleAnim_MorningSun_branch_cbc6a
	anim_ret

.zero
	anim_call BattleAnim_MorningSun_branch_cbc80
	anim_ret

BattleAnim_Synthesis:
	anim_1gfx ANIM_GFX_SHINE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_if_param_equal $1, .one
	anim_call BattleAnim_Synthesis_branch_cbc6a
	anim_ret

.one
	anim_call BattleAnim_Synthesis_branch_cbc80
	anim_ret

BattleAnim_Crunch:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_bgp $1b
	anim_obp0 $c0
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $0
	anim_obj ANIM_OBJ_BITE, 136, 56, $a8
	anim_obj ANIM_OBJ_BITE, 136, 56, $28
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 144, 48, $18
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 128, 64, $18
	anim_wait 8
	anim_ret

BattleAnim_Moonlight:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgp $1b
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 0, 40, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 16, 56, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 32, 72, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 48, 88, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 64, 104, $0
	anim_wait 1
	anim_sound 0, 0, SFX_MOONLIGHT
	anim_wait 63
	anim_if_param_equal $3, .three
	anim_call BattleAnim_Moonlight_branch_cbc6a
	anim_ret

.three
	anim_call BattleAnim_Moonlight_branch_cbc80
	anim_ret

BattleAnim_HiddenPower:
	anim_1gfx ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $0
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $8
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $10
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $18
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $20
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $28
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $30
	anim_obj ANIM_OBJ_HIDDEN_POWER, 44, 88, $38
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 8
	anim_loop 12, .loop
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_wait 16
	anim_1gfx ANIM_GFX_HIT
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 32
	anim_ret

BattleAnim_CrossChop:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_A0, 152, 40, $0
	anim_obj ANIM_OBJ_A1, 120, 72, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $58, $2, $0
	anim_wait 92
	anim_sound 0, 1, SFX_VICEGRIP
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_wait 16
	anim_ret

BattleAnim_Twister:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
.loop1
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 64, 112, $0
	anim_wait 6
	anim_loop 9, .loop1
.loop2
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 8, .loop2
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_wait 64
	anim_obj ANIM_OBJ_01, 144, 64, $18
.loop3
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 4, .loop3
	anim_obj ANIM_OBJ_01, 128, 32, $18
.loop4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_wait 8
	anim_loop 4, .loop4
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_wait 32
	anim_ret

BattleAnim_RainDance:
	anim_1gfx ANIM_GFX_WATER
	anim_bgp $f8
	anim_obp0 $7c
	anim_sound 0, 1, SFX_RAIN_DANCE
	anim_obj ANIM_OBJ_RAIN, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 128
	anim_ret

BattleAnim_SunnyDay:
	anim_1gfx ANIM_GFX_WATER
	anim_bgp $90
	anim_sound 0, 1, SFX_MORNING_SUN
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 128
	anim_ret

BattleAnim_MirrorCoat:
	anim_2gfx ANIM_GFX_REFLECT, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_obj ANIM_OBJ_AE, 64, 72, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 88, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 80, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 96, $4
	anim_wait 8
	anim_loop 3, .loop
	anim_wait 32
	anim_ret

BattleAnim_PsychUp:
	anim_1gfx ANIM_GFX_STATUS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_PSYBEAM
	anim_obj ANIM_OBJ_PSYCH_UP, 44, 88, $0
	anim_obj ANIM_OBJ_PSYCH_UP, 44, 88, $10
	anim_obj ANIM_OBJ_PSYCH_UP, 44, 88, $20
	anim_obj ANIM_OBJ_PSYCH_UP, 44, 88, $30
	anim_wait 64
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_wait 16
	anim_ret

BattleAnim_Extremespeed:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 0, 0, SFX_MENU
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_Ancientpower:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 64, 108, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 75, 102, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 85, 97, $20
	anim_wait 8
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 96, 92, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 106, 87, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 116, 82, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ANCIENTPOWER, 126, 77, $20
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_ret

BattleAnim_ShadowBall:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_SMOKE
	anim_bgp $1b
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SHADOW_BALL, 64, 92, $2
	anim_wait 32
	anim_obj ANIM_OBJ_BALL_POOF, 132, 56, $10
	anim_wait 24
	anim_ret

BattleAnim_FutureSight:
	anim_1gfx ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
    anim_call BattleAnim_FutureSightBranch
.loop
	anim_sound 0, 0, SFX_THROW_BALL
	anim_wait 16
	anim_loop 4, .loop
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_ret
    
BattleAnim_FutureSightBranch:
BattleAnim_AgilityLines:
	anim_obj ANIM_OBJ_AGILITY, 8, 24, $10
	anim_obj ANIM_OBJ_AGILITY, 8, 48, $2
	anim_obj ANIM_OBJ_AGILITY, 8, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 8, 32, $6
	anim_obj ANIM_OBJ_AGILITY, 8, 56, $c
	anim_obj ANIM_OBJ_AGILITY, 8, 80, $4
	anim_obj ANIM_OBJ_AGILITY, 8, 104, $e
    anim_ret

BattleAnim_RockSmash:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_01, 128, 56, $0
BattleAnim_RockSmashBranch:
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $5c
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $e8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $d0
	anim_wait 6
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $1c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $50
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $dc
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $90
	anim_wait 32
	anim_ret

BattleAnim_Whirlpool:
	anim_1gfx ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_sound 0, 1, SFX_SURF
	anim_wait 16
.loop
	anim_obj ANIM_OBJ_GUST, 132, 72, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_wait 64
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_wait 1
	anim_ret

BattleAnim_BeatUp:
	anim_if_param_equal $0, .current_mon
	anim_sound 0, 0, SFX_BALL_POOF
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $1, $0
	anim_wait 16
	anim_beatup
	anim_sound 0, 0, SFX_BALL_POOF
	anim_bgeffect ANIM_BG_ENTER_MON, $0, $1, $0
	anim_wait 16
.current_mon
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_BEAT_UP
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_DreamEater_branch_cbab3:
BattleAnim_GigaDrain_branch_cbab3:
BattleAnim_LeechLife_branch_cbab3:
BattleAnim_LeechHP:
	anim_obj ANIM_OBJ_71, 132, 44, $0
	anim_obj ANIM_OBJ_71, 132, 44, $8
	anim_obj ANIM_OBJ_71, 132, 44, $10
	anim_obj ANIM_OBJ_71, 132, 44, $18
	anim_obj ANIM_OBJ_71, 132, 44, $20
	anim_obj ANIM_OBJ_71, 132, 44, $28
	anim_obj ANIM_OBJ_71, 132, 44, $30
	anim_obj ANIM_OBJ_71, 132, 44, $38
	anim_ret

BattleAnim_Glare_branch_cbadc:
BattleAnim_Leer_branch_cbadc:
BattleAnim_ScaryFace_branch_cbadc:
	anim_sound 6, 2, SFX_LEER
	anim_obj ANIM_OBJ_4E, 72, 84, $0
	anim_obj ANIM_OBJ_4E, 64, 80, $0
	anim_obj ANIM_OBJ_4E, 88, 76, $0
	anim_obj ANIM_OBJ_4E, 80, 72, $0
	anim_obj ANIM_OBJ_4E, 104, 68, $0
	anim_obj ANIM_OBJ_4E, 96, 64, $0
	anim_obj ANIM_OBJ_4E, 120, 60, $0
	anim_obj ANIM_OBJ_4E, 112, 56, $0
	anim_obj ANIM_OBJ_4F, 130, 54, $0
	anim_obj ANIM_OBJ_4F, 122, 50, $0
	anim_ret

BattleAnim_Fly_branch_cbb12:
BattleAnim_Teleport_branch_cbb12:
	anim_sound 0, 0, SFX_WARP_TO
	anim_obj ANIM_OBJ_44, 44, 108, $0
	anim_obj ANIM_OBJ_44, 44, 100, $0
	anim_obj ANIM_OBJ_44, 44, 92, $0
	anim_obj ANIM_OBJ_44, 44, 84, $0
	anim_obj ANIM_OBJ_44, 44, 76, $0
	anim_obj ANIM_OBJ_44, 44, 68, $0
	anim_obj ANIM_OBJ_44, 44, 60, $0
	anim_ret

BattleAnim_BeamBranch:
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 80, 84, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 96, 76, $0
	anim_wait 4
	anim_sound 0, 1, SFX_HYPER_BEAM
	anim_obj ANIM_OBJ_BEAM, 112, 68, $0
	anim_obj ANIM_OBJ_BEAM_END, 126, 62, $0
	anim_ret

BattleAnim_Explosion_branch_cbb62:
BattleAnim_Selfdestruct_branch_cbb62:
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 24, 64, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 56, 104, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 24, 104, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 56, 64, $0
	anim_wait 5
	anim_sound 0, 0, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 40, 84, $0
	anim_ret

BattleAnim_Dynamicpunch_branch_cbb8f:
BattleAnim_Explosion_branch_cbb8f:
BattleAnim_Present_branch_cbb8f:
BattleAnim_Selfdestruct_branch_cbb8f:
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 148, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 116, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 148, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 116, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 132, 52, $0
	anim_ret

BattleAnim_Growl_branch_cbbbc:
BattleAnim_Roar_branch_cbbbc:
BattleAnim_Snore_branch_cbbbc:
	anim_obj ANIM_OBJ_4B, 64, 76, $0
	anim_obj ANIM_OBJ_4B, 64, 88, $1
	anim_obj ANIM_OBJ_4B, 64, 100, $2
	anim_ret

BattleAnim_BurnSpin:
	anim_sound 0, 1, SFX_EMBER
.loop
	anim_obj ANIM_OBJ_BURNED, 136, 56, $10
	anim_obj ANIM_OBJ_BURNED, 136, 56, $90
	anim_wait 4
	anim_loop 4, .loop
	anim_ret

BattleAnim_IcePunch_branch_cbbdf:
BattleAnim_PowderSnow_branch_cbbdf:
BattleAnim_TriAttack_branch_cbbdf:
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 128, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 144, 70, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 120, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 152, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 144, 42, $0
	anim_wait 6
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_12, 128, 70, $0
	anim_ret

BattleAnim_SludgeBomb_branch_cbc15:
BattleAnim_Sludge_branch_cbc15:
BattleAnim_Toxic_branch_cbc15:
.loop
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 132, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 116, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 148, 72, $0
	anim_wait 8
	anim_loop 5, .loop
	anim_ret

BattleAnim_ShootAcid:
.loop
	anim_sound 6, 2, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_ACID, 64, 92, $10
	anim_wait 5
	anim_loop 8, .loop
	anim_ret

BattleAnim_MetalSheen:
	anim_sound 0, 0, SFX_SHINE
	anim_bgeffect ANIM_BG_17, $0, $1, $40
	anim_wait 8
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 32
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 64
	anim_incbgeffect ANIM_BG_17
	anim_ret

BattleAnim_MudSlap_branch_cbc5b:
BattleAnim_SandAttack_branch_cbc5b:
.loop
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_58, 64, 92, $4
	anim_wait 4
	anim_loop 8, .loop
	anim_wait 32
	anim_ret

BattleAnim_Moonlight_branch_cbc6a:
BattleAnim_MorningSun_branch_cbc6a:
BattleAnim_Synthesis_branch_cbc6a:
BattleAnim_RockPolishBranch:
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 44, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 96, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 21
	anim_ret

BattleAnim_Moonlight_branch_cbc80:
BattleAnim_MorningSun_branch_cbc80:
BattleAnim_Synthesis_branch_cbc80:
	anim_sound 0, 0, SFX_METRONOME
.loop
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_TargetObj_1Row:
BattleAnim_FollowEnemyFeet_0:
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_TargetObj_2Row:
BattleAnim_FollowPlayerHead_0:
	anim_battlergfx_1row
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $0, $0
	anim_wait 6
	anim_ret

BattleAnim_ShowMon_0:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 5
	anim_incobj 1
	anim_wait 1
	anim_ret

BattleAnim_UserObj_1Row:
BattleAnim_FollowEnemyFeet_1:
	anim_battlergfx_2row
	anim_bgeffect ANIM_BG_BATTLEROBJ_1ROW, $0, $1, $0
	anim_wait 6
	anim_ret

BattleAnim_UserObj_2Row:
BattleAnim_FollowPlayerHead_1:
	anim_battlergfx_1row
	anim_bgeffect ANIM_BG_BATTLEROBJ_2ROW, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_ShowMon_1:
	anim_wait 1
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_incobj 1
	anim_wait 1
	anim_ret

; The following from metalflygon08

BattleAnim_HyperVoice:
	anim_2gfx ANIM_GFX_PSYCHIC, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $1, $20
	anim_sound 6, 2, SFX_SCREECH
.loop
	anim_obj ANIM_OBJ_WAVE, 64, 88, $2
	anim_wait 2
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_loop 2, .loop
	anim_wait 64
	anim_ret

BattleAnim_EarthPower:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_EXPLOSION
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_18, 136, 56, $0
	anim_sound 0, 1, SFX_SPARK
	anim_call BattleAnim_RockSmashBranch
	anim_ret

BattleAnim_FlareBlitz:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_FirePillar
	anim_wait 96
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $5
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 9
	anim_wait 8
	anim_ret

BattleAnim_DazzlingGleam:
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_wait 4
	anim_bgeffect ANIM_BG_18, $0, $1, $40
.loop
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop
	anim_incbgeffect ANIM_BG_18
	anim_wait 32
	anim_ret

BattleAnim_DrainingKiss:
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_ANGELS
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_SWEET_KISS, 96, 40, $0
	anim_sound 0, 1, SFX_SWEET_KISS
	anim_wait 32
	anim_sound 0, 1, SFX_SWEET_KISS_2
.loop
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 128, 48, $2
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 64, $3
	anim_wait 6
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_ABSORB, 136, 32, $4
	anim_wait 6
	anim_loop 5, .loop
	anim_wait 32
	anim_ret

BattleAnim_DrillRun:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_sound 0, 0, SFX_RETURN
	anim_wait 64
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 32
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_wait 16
	anim_sound 0, 1, SFX_HORN_ATTACK
.loop
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 124, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 132, 48, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 140, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 132, 64, $0
	anim_wait 4
	anim_loop 5, .loop
	anim_wait 16
	anim_ret

BattleAnim_FairyWind:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_battlergfx_1row
	anim_sound 0, 0, SFX_METRONOME
.loop
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 88, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 80, $4
	anim_wait 8
	anim_obj ANIM_OBJ_AE, 64, 96, $4
	anim_wait 8
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_Moonblast:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_OBJECTS
	anim_bgp $1b
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 0, 40, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 16, 56, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 32, 72, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 48, 88, $0
	anim_obj ANIM_OBJ_MOONLIGHT, 64, 104, $0
	anim_wait 1
	anim_sound 0, 0, SFX_MOONLIGHT
	anim_wait 63
	anim_sound 6, 2, SFX_METRONOME
	anim_wait 5
	anim_obj ANIM_OBJ_SWIFT, 64, 88, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 72, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SWIFT, 64, 76, $4
	anim_wait 64
	anim_ret

BattleAnim_ThunderFang:
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 16
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 8
	anim_ret

BattleAnim_FireFang:
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 6
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 12
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 2
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $1
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $4
	anim_obj ANIM_OBJ_FIRE_BLAST, 136, 48, $5
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 9
	anim_wait 8
	anim_ret

BattleAnim_IceFang:
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 6
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 12
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 4
	anim_call BattleAnim_PowderSnow_branch_cbbdf
	anim_wait 8
	anim_ret

BattleAnim_PoisonFang:	
	anim_3gfx ANIM_GFX_CUT, ANIM_GFX_HIT, ANIM_GFX_POISON
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 6
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 12
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_call BattleAnim_BriefPoisonBubbles
	anim_wait 8
	anim_ret

BattleAnim_BriefPoisonBubbles:
.loop
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 132, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 116, 72, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, 148, 72, $0
	anim_wait 8
	anim_loop 2, .loop
	anim_ret

BattleAnim_SilverWind:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_AgilityLines
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 16
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 120, 32, $0
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 152, 40, $0
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 136, 48, $0
	anim_wait 32
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_Acrobatics:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 2
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 32, $0
	anim_wait 3
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 24, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_LeafBlade:	
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_CUT
	anim_sound 0, 0, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $28
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $5c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $10
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $e8
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $9c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $d0
	anim_wait 8
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_wait 32
	anim_ret

BattleAnim_DragonClaw:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_CUT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_resetobp0
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_37, 144, 48, $0
	anim_obj ANIM_OBJ_37, 140, 44, $0
	anim_obj ANIM_OBJ_37, 136, 40, $0
	anim_wait 32
	anim_ret


SECTION "Battle Animations 2", ROMX

BattleAnim_EnergyBall:
	anim_3gfx ANIM_GFX_CHARGE, ANIM_GFX_EGG, ANIM_GFX_SMOKE
	anim_sound 0, 0, SFX_CHARGE
	anim_obj ANIM_OBJ_3D, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $8
	anim_obj ANIM_OBJ_3C, 48, 84, $10
	anim_obj ANIM_OBJ_3C, 48, 84, $18
	anim_obj ANIM_OBJ_3C, 48, 84, $20
	anim_obj ANIM_OBJ_3C, 48, 84, $28
	anim_obj ANIM_OBJ_3C, 48, 84, $30
	anim_obj ANIM_OBJ_3C, 48, 84, $38
	anim_wait 104
	anim_sound 6, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_OCTAZOOKA, 64, 92, $4
	anim_wait 16
	anim_obj ANIM_OBJ_BALL_POOF, 132, 56, $10
	anim_wait 8
.loop
	anim_ret

BattleAnim_AerialAce:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_37, 152, 40, $0
	anim_wait 14
	anim_obj ANIM_OBJ_GLIMMER, 136, 40, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_wait 16
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_39, 120, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_IronHead:
	anim_1gfx ANIM_GFX_REFLECT, ANIM_GFX_CUT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_BraveBird:	
	anim_2gfx ANIM_GFX_SKY_ATTACK, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 32
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_SKY_ATTACK, 48, 88, $40
	anim_wait 64
	anim_incobj 1
	anim_wait 21
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 6
	anim_incobj 1
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 132, 40, $0
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_Hurricane:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
.loop
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_GUST, 64, 112, $0
	anim_wait 6
	anim_loop 9, .loop
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_sound 16, 2, SFX_WHIRLWIND
	anim_wait 64
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 132, 40, $0
	anim_wait 12
	anim_ret

BattleAnim_PetalBlizzard:
	anim_1gfx ANIM_GFX_FLOWER
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_FLOWER, 48, 108, $d
	anim_obj ANIM_OBJ_FLOWER, 48, 108, $1a
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_obj ANIM_OBJ_FLOWER, 48, 108, $27
	anim_obj ANIM_OBJ_FLOWER, 48, 108, $34
	anim_wait 56
	anim_ret

BattleAnim_AquaTail:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_sound 0, 1, SFX_SURF
	anim_wait 16
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_04, 120, 32, $0
	anim_wait 8
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_04, 152, 40, $0
	anim_wait 8
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_04, 136, 48, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_1D
	anim_call BattleAnim_ShowMon_0
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_wait 4
	anim_ret

BattleAnim_Avalanche:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_ICE
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $1, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 2
	anim_call BattleAnim_PowderSnow_branch_cbbdf
	anim_sound 0, 1, SFX_SHINE
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 32
	anim_ret

BattleAnim_FlashCannon:
	anim_1gfx ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $80
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $88
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $90
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $98
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $a8
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b0
	anim_obj ANIM_OBJ_CONFUSE_RAY, 64, 88, $b8
.loop
	anim_sound 0, 0, SFX_SHINE
	anim_wait 16
	anim_loop 8, .loop
	anim_wait 4
	anim_ret

BattleAnim_DarkPulse:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgp $1b
.loop
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_WAVE, 64, 88, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 48
	anim_ret

BattleAnim_FocusBlast:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_BEAM
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_STEP_BACK_USER, $0, $1, $0
	anim_wait 16
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 64, 96, $0
	anim_wait 8
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 56, 88, $0
	anim_wait 8
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_04, 68, 104, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_STEP_BACK_USER
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_ret

BattleAnim_NightSlash:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_CUT
	anim_bgp $1b
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_37, 152, 40, $0
	anim_wait 4
	anim_obj ANIM_OBJ_GLIMMER, 136, 40, $0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_wait 16
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_39, 120, 72, $0
	anim_wait 32
	anim_ret

BattleAnim_PlayRough:
	anim_2gfx ANIM_GFX_OBJECTS, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_HEART, 64, 80, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_0
	anim_wait 4
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_08, 120, 72, $0
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 152, 40, $0
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_sound 0, 0, SFX_ATTRACT
	anim_obj ANIM_OBJ_HEART, 64, 80, $0
	anim_wait 32
	anim_ret

BattleAnim_WildCharge:
	anim_3gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_THUNDER_WAVE, 48, 92, $0
	anim_wait 24
	anim_setobj $1, $3
	anim_wait 1
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $10
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 128, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_SeedBomb:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_EXPLOSION
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 148, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 116, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 148, 72, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 116, 32, $0
	anim_wait 5
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 132, 52, $0
	anim_ret

BattleAnim_PoisonJab:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_POISON
	anim_sound 6, 2, SFX_SLUDGE_BOMB
.loop
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_wait 6
	anim_loop 2, .loop
	anim_call BattleAnim_BriefPoisonBubbles
	anim_ret

BattleAnim_DragonPulse:
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_AEROBLAST
	anim_bgp $1b
	anim_sound 0, 0, SFX_AEROBLAST
	anim_obj ANIM_OBJ_AEROBLAST, 72, 88, $0
	anim_wait 32
.loop
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_DRAGON_RAGE, 64, 92, $0
	anim_wait 3
	anim_loop 16, .loop
	anim_wait 64
	anim_ret

BattleAnim_IcicleCrash:
	anim_2gfx ANIM_GFX_ICE, ANIM_GFX_ROCKS
.loop
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_BLIZZARD, 64, 96, $63
	anim_wait 2
	anim_loop 3, .loop
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $1, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 128, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 152, 68, $30
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_SMALL_ROCK, 136, 68, $30
	anim_wait 96
	anim_ret
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
	anim_wait 128
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 24
	anim_ret

BattleAnim_BulletPunch:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 4
	anim_obj ANIM_OBJ_06, 120, 64, $0
	anim_wait 3
	anim_obj ANIM_OBJ_01, 120, 64, $0
	anim_wait 4
	anim_obj ANIM_OBJ_06, 144, 48, $0
	anim_wait 3
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 4
	anim_obj ANIM_OBJ_06, 120, 64, $0
	anim_wait 3
	anim_obj ANIM_OBJ_01, 120, 64, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_ShadowClaw:
	anim_1gfx ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_obj ANIM_OBJ_3A, 148, 36, $0
	anim_wait 32
	anim_ret

BattleAnim_CalmMind:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SWEET_SCENT
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 32
	anim_sound 0, 0, SFX_SWEET_SCENT
	anim_incobj 5
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_GunkShot:
	anim_3gfx ANIM_GFX_EGG, ANIM_GFX_POISON, ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 128, 64, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 144, 68, $0
	anim_wait 8
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_18, 136, 72, $0
	anim_wait 24
	anim_call BattleAnim_BriefPoisonBubbles
	anim_ret

; The following from polished crystal

BattleAnim_Roost:
	anim_2gfx ANIM_GFX_MISC2, ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_wait 16
.loop
    anim_call BattleAnim_RoostFeathers
	anim_wait 48
	anim_loop 2, .loop
	anim_wait 28
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 44, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 96, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 21
	anim_incbgeffect ANIM_BG_18
	anim_ret
    
BattleAnim_RoostFeathers:
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_FEATHER, 48, 108, $0
	anim_obj ANIM_OBJ_FEATHER, 48, 108, $d
	anim_obj ANIM_OBJ_FEATHER, 48, 108, $1a
	anim_obj ANIM_OBJ_FEATHER, 48, 108, $27
	anim_obj ANIM_OBJ_FEATHER, 48, 108, $34
    anim_ret

BattleAnim_BugBite:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
.loop
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 132, 64, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 132, 64, $5c
	anim_wait 4
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 128, 48, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 48, $5c
	anim_wait 4
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 144, 56, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 144, 56, $d0
	anim_wait 4
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 122, 52, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 122, 52, $50
	anim_wait 4
	anim_loop 5, .loop
	anim_wait 32
	anim_ret

BattleAnim_AirSlash:
	anim_1gfx ANIM_GFX_WHIP
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, -13, 0,   5, 0, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, -15, 0,   7, 0, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_42, -13, 0,   8, 0, $3
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_41,  15, 0,   5, 0, $83
	anim_wait 4
	anim_sound 0, 1, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_41,  15, 0,   8, 0, $83
	anim_wait 4
	anim_call BattleAnim_Slash
	anim_wait 24
	anim_ret

BattleAnim_IceShard:
	anim_1gfx ANIM_GFX_ICE
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  11, 0, $23
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  10, 0, $24
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  12, 0, $23
	anim_wait 2
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 10
	anim_call BattleAnim_IcePunch_branch_cbbdf
	anim_wait 20
	anim_ret

BattleAnim_Extrasensory:
	anim_1gfx ANIM_GFX_SHINE
	anim_sound 0, 1, SFX_CUT
	anim_bgp $1b
	anim_obj ANIM_OBJ_GLIMMER, 44, 96, $0
	anim_wait 40
	anim_call BattleAnim_UserObj_2Row
	anim_sound 0, 1, SFX_CUT
	anim_bgeffect ANIM_BG_NIGHT_SHADE, $0, $0, $8
	anim_obj ANIM_OBJ_GLIMMER, 44, 96, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_NIGHT_SHADE
	anim_wait 8
	anim_call BattleAnim_UserObj_2Row
	anim_sound 0, 1, SFX_CUT
	anim_bgeffect ANIM_BG_TELEPORT, $0, $0, $0
	anim_obj ANIM_OBJ_GLIMMER, 44, 96, $0
	anim_wait 4
	anim_sound 0, 1, SFX_PSYCHIC
	anim_wait 64
	anim_incbgeffect ANIM_BG_TELEPORT
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_Psystrike:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_NOISE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_KINESIS,  10, 0,   9, 4, $0
	anim_bgp $1b
	anim_wait 8
.loop
	anim_sound 0, 0, SFX_AEROBLAST
	anim_wait 32
	anim_loop 2, .loop
	anim_wait 48
	anim_sound 0, 0, SFX_PLACE_PUZZLE_PIECE_DOWN
	anim_wait 10
	anim_sound 0, 0, SFX_PLACE_PUZZLE_PIECE_DOWN
	anim_wait 10
	anim_sound 0, 0, SFX_PLACE_PUZZLE_PIECE_DOWN
	anim_wait 28
	anim_ret

BattleAnim_SuckerPunch:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_LICK
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 2
	anim_call BattleAnim_SpeedJump
	anim_wait 16
	anim_call BattleAnim_SuckerPunchHit1
	anim_wait 16
	anim_call BattleAnim_SuckerPunchHit2
	anim_wait 12
	anim_call BattleAnim_SpeedJump
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_SuckerPunchHit1:
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 104, 34, $0
	anim_wait 2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 124, 34, $0
	anim_wait 2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 144, 34, $0
	anim_ret

BattleAnim_SuckerPunchHit2:
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 156, 52, $0
	anim_wait 2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 138, 52, $0
	anim_wait 2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_00, 122, 52, $0
	anim_ret

BattleAnim_VoltSwitch:
	anim_3gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION, ANIM_GFX_CHARGE
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $30
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $31
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $32
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $33
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $34
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $35
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $36
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $37
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 8
	anim_wait 64
	anim_sound 6, 2, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_ZAP_CANNON, 64, 92, $2
	anim_wait 40
	anim_sound 0, 1, SFX_ZAP_CANNON
	anim_obj ANIM_OBJ_THUNDER_WAVE, 136, 56, $0
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 30
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_StoneEdge:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $e, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_STONE_EDGE, 132, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 116, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 140, 65, $3
	anim_obj ANIM_OBJ_02, 120, 40, $0
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 128, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 136, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 124, 65, $3
	anim_obj ANIM_OBJ_02, 152, 48, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 148, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 136, 65, $3
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 120, 65, $3
	anim_obj ANIM_OBJ_02, 136, 56, $0
	anim_wait 2
	anim_obj ANIM_OBJ_STONE_EDGE, 144, 65, $3
	anim_wait 2
	anim_loop 3, .loop
	anim_wait 24
	anim_ret

BattleAnim_ToxicSpikes:
	anim_1gfx ANIM_GFX_MISC
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES,   6, 0,  11, 0, $20
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES,   6, 0,  11, 0, $30
	anim_wait 8
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_SPIKES,   6, 0,  11, 0, $28
	anim_wait 32
.loop
	anim_1gfx ANIM_GFX_POISON
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, -16, 4,   9, 0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A,  14, 4,   9, 0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TOXIC
	anim_obj ANIM_OBJ_1A, -14, 4,   9, 0, $0
	anim_wait 8
	anim_loop 3, .loop
	anim_ret

BattleAnim_Trick:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_BUBBLE
.loop
	anim_sound 6, 2, SFX_SHARPEN
	anim_obj ANIM_OBJ_TRICK_FROM, 128, 64, $2
	anim_wait 38
	anim_sound 6, 2, SFX_SHARPEN
	anim_obj ANIM_OBJ_TRICK_TO, 64, 76, $2
	anim_wait 38
	anim_loop 2, .loop
.loop2
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_TRICK_FROM, 128, 64, $4
	anim_wait 16
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_TRICK_TO, 64, 76, $4
	anim_wait 16
	anim_loop 2, .loop2
	anim_sound 0, 1, SFX_KINESIS
	anim_obj ANIM_OBJ_CHICK, 136, 24, $15
	anim_obj ANIM_OBJ_CHICK, 136, 24, $aa
	anim_obj ANIM_OBJ_CHICK, 136, 24, $bf
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_TRICK_FROM, 128, 64, $4
	anim_wait 16
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_TRICK_TO, 64, 76, $4
	anim_wait 16
	anim_wait 32
	anim_ret

BattleAnim_Hex:
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_SPEED
	anim_bgp $f8
	anim_wait 8
	anim_call BattleAnim_UserObj_1Row
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_wait 40
	anim_bgp $1b
	anim_sound 0, 0, SFX_CURSE
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
.loop
	anim_obj ANIM_OBJ_HEX, 136, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_HEX, 128, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_BLUE_FLAME, 128, 54, $10
	anim_obj ANIM_OBJ_HEX, 144, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_HEX, 120, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_HEX, 152, 72, $6
	anim_wait 2
	anim_obj ANIM_OBJ_BLUE_FLAME, 144, 38, $90
	anim_obj ANIM_OBJ_HEX, 112, 72, $8
	anim_wait 2
	anim_obj ANIM_OBJ_HEX, 160, 72, $8
	anim_wait 2
	anim_loop 3, .loop
    anim_call BattleAnim_ShowMon_1
	anim_wait 24
	anim_ret

BattleAnim_UTurn:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_U_TURN_LAUNCH, 64, 92, $4
	anim_wait 16
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_00, 132, 56, $0
	anim_wait 8
	anim_sound 0, 0, SFX_RETURN
	anim_obj ANIM_OBJ_U_TURN_RISE, 132, 40, $6
	anim_wait 32
	anim_obj ANIM_OBJ_U_TURN_FALL, 48, 92, $30
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_CloseCombat:
	anim_2gfx ANIM_GFX_WIND, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_call BattleAnim_AgilityLines
	anim_wait 12
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_bgp $90
	anim_call BattleAnim_CloseCombatPunches
	anim_wait 16
	anim_ret

BattleAnim_CloseCombatPunches:
.loop
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 148, 56, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 122, 34, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 122, 34, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 132, 64, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 132, 64, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 140, 42, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 140, 42, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 114, 52, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 114, 52, $0
	anim_wait 2
	anim_loop 3, .loop
	anim_ret

BattleAnim_HoneClaws:
	anim_1gfx ANIM_GFX_CUT
.loop
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_HONE_CLAWS_LEFT,   8, 0,  11, 0, $0
	anim_obj ANIM_OBJ_HONE_CLAWS_LEFT,   8, 0,  10, 1, $0
	anim_obj ANIM_OBJ_HONE_CLAWS_LEFT,   8, 0,  9, 2, $0
	anim_sound 0, 1, SFX_SCRATCH
	anim_wait 32
	anim_sound 0, 1, SFX_SCRATCH
	anim_obj ANIM_OBJ_HONE_CLAWS_RIGHT,  3, 0,  11, 0, $0
	anim_obj ANIM_OBJ_HONE_CLAWS_RIGHT,  3, 0,  10, 1, $0
	anim_obj ANIM_OBJ_HONE_CLAWS_RIGHT,  3, 0,  9, 2, $0
	anim_sound 0, 1, SFX_SCRATCH
	anim_wait 32
	anim_loop 2, .loop
	anim_ret

BattleAnim_RockBlast:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_BLAST, 64, 92, $4
	anim_wait 16
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 56, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 56, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 56, $d0
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 56, $50
	anim_wait 32
	anim_ret

BattleAnim_Scald:
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_1Row
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP,  14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP,  15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, -16, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, -15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HYDRO_PUMP, -14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 0, 0, SFX_BURN
	anim_obj ANIM_OBJ_BURNED,  17, 0,   7, 0, $10
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 6
	anim_ret


SECTION "Battle Animations 3", ROMX

BattleAnim_TrickRoom:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $0
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $8
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $10
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $18
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $20
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $28
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $30
	anim_obj ANIM_OBJ_TRICK_ROOM, 88, 0, $38
.loop
	anim_sound 0, 2, SFX_SHARPEN
	anim_wait 18
	anim_loop 4, .loop
	anim_wait 36
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_ret

BattleAnim_Venoshock:
	anim_1gfx ANIM_GFX_POISON
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_ACID, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_THUNDER
	anim_wait 8
	anim_bgp $1b
	anim_obp0 $30
	anim_bgeffect ANIM_BG_VIBRATE_MON, $0, $0, $0
	anim_call BattleAnim_BriefPoisonBubbles
	anim_wait 16
	anim_call BattleAnim_ShowMon_1
	anim_ret

BattleAnim_IcicleSpear:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_ICICLE,   9, 0,   9, 0, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04,  16, 0,   5, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_ICICLE,  10, 0,  11, 0, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04, -15, 0,   7, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_ICICLE,   9, 4,  10, 0, $2
	anim_wait 8
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_04, -16, 4,   6, 0, $0
	anim_wait 8
	anim_ret

BattleAnim_Bulldoze:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 16
	anim_incbgeffect ANIM_BG_WITHDRAW
	anim_call BattleAnim_ShowMon_0
	anim_wait 8
.loop2
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $08, $2, $0
	anim_sound 0, 1, SFX_SPARK
	anim_wait 8
	anim_loop 6, .loop2
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_incbgeffect ANIM_BG_HORIZONTAL_SHAKE
	anim_wait 8
	anim_ret

BattleAnim_GigaImpact:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_sound 0, 0, SFX_OUTRAGE
.loop
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $0
	anim_obj ANIM_OBJ_GROWTH, 48, 108, $20
	anim_wait 4
	anim_loop 4, .loop
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_THUNDER
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $10
.loop2
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 20
	anim_loop 3, .loop2
	anim_wait 16
	anim_ret

BattleAnim_Facade:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_WATER
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_FLAIL, $0, $1, $0
	anim_wait 8
	anim_sound 0, 0, SFX_RETURN
.loop
	anim_obj ANIM_OBJ_WATER_GUN, 56, 80, $0
	anim_wait 14
	anim_incobj 2
	anim_clearobjs
	anim_call BattleAnim_TargetObj_1Row
	anim_loop 3, .loop
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_0A, 136, 48, $0
	anim_wait 24
	anim_incbgeffect ANIM_BG_FLAIL
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_FlameCharge:
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_HIT
.loop
	anim_sound 0, 0, SFX_EMBER
	anim_obj ANIM_OBJ_FLAME_WHEEL,   6, 0,  12, 0, $0
	anim_wait 6
	anim_loop 8, .loop
	anim_wait 96
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 4
	anim_incobj 9
	anim_wait 8
	anim_ret

BattleAnim_GyroBall:
	anim_1gfx ANIM_GFX_WIND
	anim_obp0 $e4
.loop
	anim_sound 0, 0, SFX_OUTRAGE
	anim_obj ANIM_OBJ_RAPID_SPIN, 44, 112, $0
	anim_wait 2
	anim_loop 10, .loop
	anim_wait 16
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_resetobp0
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_wait 6
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_PowerWhip:
	anim_1gfx ANIM_GFX_CUT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $10
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_37, -13, 0,   5, 0, $0
	anim_obj ANIM_OBJ_39,  15, 0,   9, 0, $0
	anim_wait 32
	anim_ret

BattleAnim_ShellSmash:
	anim_3gfx ANIM_GFX_REFLECT, ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_call BattleAnim_FollowPlayerHead_0
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 24
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_WITHDRAW, 48, 88, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_incobj 2
	anim_wait 1
	anim_incbgeffect ANIM_BG_1A
	anim_incbgeffect ANIM_BG_WITHDRAW
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_00, 5, 4,  0, 6, $0
	anim_obj ANIM_OBJ_SHELL_SMASH, 5, 4,  0, 6, $5c
	anim_obj ANIM_OBJ_SHELL_SMASH, 5, 4,  0, 6, $e8
	anim_obj ANIM_OBJ_SHELL_SMASH, 5, 4,  0, 6, $d0
	anim_obj ANIM_OBJ_SHELL_SMASH, 5, 4,  0, 6, $50
	anim_wait 12
	anim_bgeffect ANIM_BG_19, $0, $1, $40
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_KnockOff:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 3, 0, SFX_RAZOR_WIND
	anim_obj ANIM_OBJ_08, 136, 08, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 16, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 24, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 32, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 40, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 48, $0
	anim_wait 1
	anim_bgeffect ANIM_BG_VERTICAL_SHAKE, $10, $1, $20
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_obj ANIM_OBJ_08, 136, 56, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 64, $0
	anim_wait 1
	anim_obj ANIM_OBJ_08, 136, 72, $0
	anim_wait 8
	anim_ret

BattleAnim_NastyPlot:
	anim_1gfx ANIM_GFX_STATUS
	anim_call BattleAnim_FollowEnemyFeet_0
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_sound 0, 0, SFX_MIND_READER
	anim_obj ANIM_OBJ_PSYCH_UP,   5, 4,  11, 0, $0
	anim_obj ANIM_OBJ_PSYCH_UP,   5, 4,  11, 0, $10
	anim_obj ANIM_OBJ_PSYCH_UP,   5, 4,  11, 0, $20
	anim_obj ANIM_OBJ_PSYCH_UP,   5, 4,  11, 0, $30
	anim_wait 64
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_wait 16
	anim_ret

BattleAnim_DisarmingCry:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $1, $20
	anim_sound 6, 2, SFX_METRONOME
.loop
	anim_obj ANIM_OBJ_WAVE,   8, 0,  11, 0, $2
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 48
.loop2
	anim_1gfx ANIM_GFX_OBJECTS
	anim_obj ANIM_OBJ_HEART,   16, 0,   7, 0, $0
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_wait 24
	anim_sound 0, 0, SFX_SWEET_KISS
	anim_obj ANIM_OBJ_HEART,   16, 12,   7, 0, $0
	anim_loop 2, .loop2
	anim_wait 32
	anim_ret

; The following from pokemon prism

BattleAnim_RoarOfTime:
; prev NoisePulse
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_08, $0, $4, $0
.loop
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 10, 0, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 9, 4, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 9, 2, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 9, 4, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 10, 0, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 12, 0, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 12, 4, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 12, 6, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 12, 4, $4
	anim_wait 3
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_WAVE,  8, 0, 12, 0, $4
	anim_wait 3
	anim_loop 3, .loop
	anim_sound 0, 0, SFX_SCREECH
	anim_wait 48
	anim_ret

BattleAnim_PsychoCut:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_PSYCHIC
	anim_obp0 $e0
	anim_sound 0, 1, SFX_MEAN_LOOK
	anim_obj ANIM_OBJ_MEAN_LOOK, 16, 4,  3, 0, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 14, 4,  8, 0, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 19, 4,  5, 0, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 13, 4,  5, 0, $0
	anim_wait 5
	anim_obj ANIM_OBJ_MEAN_LOOK, 18, 4,  8, 0, $0
	anim_wait 5
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_3A, 18, 0,  4, 0, $0
	anim_wait 12
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_obj ANIM_OBJ_3A, 20, 0,  5, 0, $0
	anim_wait 12
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_3A, 16, 2,  3, 2, $0
	anim_wait 12
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_3A, 19, 3,  6, 4, $0
	anim_wait 12
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_obj ANIM_OBJ_3A, 17, 3,  5, 4, $0
	anim_wait 12
	anim_ret

BattleAnim_CosmicPower:
	anim_2gfx ANIM_GFX_GLOBE, ANIM_GFX_CHARGE
	anim_obj ANIM_OBJ_MOON,  6, 0, 9, 0, $1
	anim_sound 0, 0, SFX_MOONLIGHT
	anim_wait 63
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $0
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $8
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $10
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $18
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $20
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $28
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $30
	anim_obj ANIM_OBJ_GROWTH,  6, 0, 13, 4, $38
	anim_wait 64
	anim_ret

BattleAnim_AquaJet:
	anim_3gfx ANIM_GFX_SPEED, ANIM_GFX_HIT, ANIM_GFX_WATER
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_wait 4
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_HYDRO_PUMP, 9, 4, 13, 0, $0
	anim_wait 2
	anim_obj ANIM_OBJ_HYDRO_PUMP, 10, 4, 12, 2, $0
	anim_wait 1
	anim_sound 0, 0, SFX_MENU
	anim_wait 1
	anim_obj ANIM_OBJ_HYDRO_PUMP, 11, 4, 11, 4, $0
	anim_wait 2
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_HYDRO_PUMP, 12, 4, 10, 6, $0
	anim_wait 2
	anim_obj ANIM_OBJ_HYDRO_PUMP, 13, 4, 10, 0, $0
	anim_wait 1
	anim_sound 0, 0, SFX_MENU
	anim_wait 1
	anim_obj ANIM_OBJ_HYDRO_PUMP, 14, 4, 9, 2, $0
	anim_wait 2
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_HYDRO_PUMP, 15, 4, 8, 4, $0
	anim_wait 3
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_01, 17, 0, 7, 0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_AuraSphere:
	anim_2gfx ANIM_GFX_BEAM, ANIM_GFX_WIND
	anim_call BattleAnim_FollowEnemyFeet_0
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 3, 0, $10
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 6, 0, $2
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 11, 0, $8
	anim_wait 4
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 4, 0, $6
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 7, 0, $c
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 10, 0, $4
	anim_obj ANIM_OBJ_AGILITY, 1, 0, 13, 0, $e
	anim_sound 0, 0, SFX_RAZOR_WIND
	anim_wait 32
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $2, $10
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_SUPER_EFFECTIVE
	anim_obj ANIM_OBJ_BEAM,  8, 0, 11, 4, $0
	anim_incobj 8
	anim_wait 2
	anim_obj ANIM_OBJ_BEAM, 10, 0, 10, 4, $0
	anim_incobj 9
	anim_wait 2
	anim_obj ANIM_OBJ_BEAM, 12, 0,  9, 4, $0
	anim_incobj 10
	anim_wait 2
	anim_obj ANIM_OBJ_BEAM, 14, 0,  8, 4, $0
	anim_obj ANIM_OBJ_BEAM_END, 15, 6,  7, 6, $0
	anim_incobj 11
	anim_incobj 12
	anim_wait 2
	anim_obj ANIM_OBJ_BEAM_END, 17, 4,  7, 0, $0
	anim_wait 2
	anim_incobj 13
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_PowerGem:
	anim_2gfx ANIM_GFX_ICE, ANIM_GFX_SPEED
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $2, $0
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_GEM,  7, 4, 9, 4, $4
	anim_obj ANIM_OBJ_GEM,  7, 4, 11, 0, $4
	anim_obj ANIM_OBJ_GEM,  8, 4, 10, 0, $4
	anim_obj ANIM_OBJ_GEM,  8, 4, 11, 4, $4
	anim_wait 4
	anim_sound 6, 2, SFX_FLASH
	anim_obj ANIM_OBJ_AE,  8, 0,  9, 0, $4
	anim_wait 4
	anim_obj ANIM_OBJ_AE,  8, 0, 11, 0, $4
	anim_obj ANIM_OBJ_FLASH,  8, 0, 10, 0, $0
	anim_wait 6
	anim_obj ANIM_OBJ_AE,  8, 0, 10, 0, $4
	anim_wait 2
	anim_obj ANIM_OBJ_FLASH, 10, 0,  7, 6, $0
	anim_wait 4
	anim_obj ANIM_OBJ_FLASH, 12, 0,  9, 4, $0
	anim_wait 2
	anim_obj ANIM_OBJ_AE,  8, 0, 12, 0, $4
	anim_wait 2
	anim_obj ANIM_OBJ_FLASH, 14, 0,  8, 0, $0
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 6
	anim_ret

BattleAnim_Astonish:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $2, $2, $0
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_01, 16, 0,  6, 0, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_DrainPunch:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_SUBMISSION
	anim_obj ANIM_OBJ_06, 17, 0,  7, 0, $0
	anim_wait 6
	anim_sound 0, 1, SFX_PLACE_PUZZLE_PIECE_DOWN
	anim_obj ANIM_OBJ_01, 17, 0,  7, 0, $0
	anim_wait 20
	anim_call BattleAnim_Absorb
	anim_ret

BattleAnim_BugBuzz:
	anim_2gfx ANIM_GFX_NOISE, ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 8
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_sound 0, 0, SFX_SNORE
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_obj ANIM_OBJ_WAVE,  7, 0, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  9, 0, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
	anim_wait 4
	anim_sound 0, 0, SFX_SNORE
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_obj ANIM_OBJ_WAVE,  7, 4, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  8, 4, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  7, 6, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  8, 2, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
	anim_wait 24
	anim_ret

BattleAnim_WillOWisp:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgp $1b
	anim_sound 0, 1, SFX_SPITE
	anim_obj ANIM_OBJ_DRAGON_RAGE, 8, 0, 11, 4, 0
	anim_wait 48
.loop
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_BURNED, 17, 0,  7, 0, $a0
	anim_obj ANIM_OBJ_BURNED, 17, 0,  7, 0, $20
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 16
	anim_sound 0, 0, SFX_BURN
	anim_bgp $e4
	anim_ret

BattleAnim_DragonDance:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $8, $2, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_bgeffect ANIM_BG_WAVE_DEFORM_USER, $0, $1, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_WAVE_DEFORM_USER
	anim_wait 16
	anim_loop 2, .loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 48
	anim_call BattleAnim_ShowMon_0
	anim_ret
	anim_ret

BattleAnim_BulkUp:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_WIND
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_sound 0, 0, SFX_NOT_VERY_EFFECTIVE
	anim_obj ANIM_OBJ_SWAGGER,  9, 4, 11, 0, $44
	anim_wait 32
	anim_loop 2, .loop
	anim_sound 0, 0, SFX_KINESIS
	anim_wait 16
	anim_ret

BattleAnim_ZenHeadbutt:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_TELEPORT, $0, $1, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_TACKLE, 0, $1, 2
	anim_wait 4
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 17, 0,  7, 0, $0
	anim_wait 8
	anim_incbgeffect ANIM_BG_TELEPORT
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_XScissor:
	anim_1gfx ANIM_GFX_CUT
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 19, 0,  4, 0, $0
	anim_obj ANIM_OBJ_3B, 14, 0,  4, 0, $0
	anim_wait 32
	anim_ret

BattleAnim_Hail:
	anim_1gfx ANIM_GFX_POWDER
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_obj ANIM_OBJ_HAIL, 11, 0,  0, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HAIL,  9, 0,  0, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_HAIL,  7, 0,  0, 0, $2
.loop
	anim_sound 0, 1, SFX_SHINE
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_wait 4
	anim_loop 16, .loop
	anim_wait 8
	anim_ret

BattleAnim_InHail:
	anim_1gfx ANIM_GFX_POWDER
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_obj ANIM_OBJ_HAIL, 11, 0,  0, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_HAIL,  9, 0,  0, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_HAIL,  7, 0,  0, 0, $2
.loop
	anim_sound 0, 1, SFX_SHINE
	anim_wait 4
	anim_sound 0, 0, SFX_SHINE
	anim_wait 4
	anim_loop 8, .loop
	anim_wait 8
	anim_ret

; The following from Black and White 3: Genesis

BattleAnim_WoodHammer:
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 72
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_00, 120, 72, $0
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $28
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $5c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $10
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $e8
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $9c
	anim_obj ANIM_OBJ_RAZOR_LEAF, 136, 56, $d0
	anim_wait 6
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 152, 40, $0
	anim_wait 16
	anim_ret

BattleAnim_Overheat:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_call BattleAnim_FirePillar
	anim_wait 64
	
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 29, 70, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 47, 72, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 62, 76, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 75, 81, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 85, 86, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 90, 94, $7
	anim_wait 2
	anim_sound 6, 2, SFX_EMBER
	anim_obj ANIM_OBJ_FIRE_BLAST, 93,104, $7
	anim_wait 24
	anim_clearobjs
	anim_wait 8
	anim_ret

BattleAnim_QuiverDance:
	anim_1gfx ANIM_GFX_SPEED
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_19, $0, $1, $40
	anim_sound 0, 0, SFX_SHARPEN
	anim_wait 64
	anim_incbgeffect ANIM_BG_19
	anim_wait 1
	anim_bgeffect ANIM_BG_16, $0, $1, $40
	anim_sound 0, 0, SFX_PSYBEAM
.loop
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_loop 3, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_16
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_CrossPoison:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_POISON
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_37, 142, 40, $0
	anim_obj ANIM_OBJ_38, 128, 40, $0
	anim_wait 32
	anim_call BattleAnim_BriefPoisonBubbles
	anim_wait 56
	anim_ret

BattleAnim_Psyshock:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_sound 6, 2, SFX_PSYCHIC
	
	anim_obj ANIM_OBJ_34,  92, 56, $0
	anim_obj ANIM_OBJ_34, 102, 26, $0
	anim_obj ANIM_OBJ_34, 132, 16, $0
	anim_obj ANIM_OBJ_34, 162, 26, $0
	anim_obj ANIM_OBJ_34, 172, 56, $0
	anim_obj ANIM_OBJ_34, 162, 86, $0
	anim_obj ANIM_OBJ_34, 132, 96, $0
	anim_obj ANIM_OBJ_34, 102, 86, $0
	anim_wait 8
	anim_clearobjs
	
	anim_obj ANIM_OBJ_34, 100, 56, $0
	anim_obj ANIM_OBJ_34, 108, 32, $0
	anim_obj ANIM_OBJ_34, 132, 24, $0
	anim_obj ANIM_OBJ_34, 156, 32, $0
	anim_obj ANIM_OBJ_34, 164, 56, $0
	anim_obj ANIM_OBJ_34, 156, 80, $0
	anim_obj ANIM_OBJ_34, 132, 88, $0
	anim_obj ANIM_OBJ_34, 108, 80, $0
	anim_wait 8
	anim_clearobjs
	
	anim_obj ANIM_OBJ_34, 108, 56, $0
	anim_obj ANIM_OBJ_34, 114, 38, $0
	anim_obj ANIM_OBJ_34, 132, 32, $0
	anim_obj ANIM_OBJ_34, 150, 38, $0
	anim_obj ANIM_OBJ_34, 156, 56, $0
	anim_obj ANIM_OBJ_34, 150, 74, $0
	anim_obj ANIM_OBJ_34, 132, 80, $0
	anim_obj ANIM_OBJ_34, 114, 74, $0
	anim_wait 8
	anim_clearobjs
	
	anim_obj ANIM_OBJ_34, 116, 56, $0
	anim_obj ANIM_OBJ_34, 132, 40, $0
	anim_obj ANIM_OBJ_34, 148, 56, $0
	anim_obj ANIM_OBJ_34, 132, 72, $0
	anim_wait 8
	anim_clearobjs
	
	anim_obj ANIM_OBJ_34, 124, 56, $0
	anim_obj ANIM_OBJ_34, 132, 48, $0
	anim_obj ANIM_OBJ_34, 140, 56, $0
	anim_obj ANIM_OBJ_34, 132, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_MudShot:
	anim_2gfx ANIM_GFX_SAND, ANIM_GFX_HIT
	anim_obp0 $fc
	anim_call BattleAnim_MudSlap_branch_cbc5b
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 32
	anim_ret

BattleAnim_ShadowSneak:
	anim_2gfx ANIM_GFX_ANGELS, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_bgp $1b
	anim_obp0 $0
	anim_obj ANIM_OBJ_DESTINY_BOND, 132, 76, $0
	anim_sound 0, 1, SFX_KINESIS
	anim_bgeffect ANIM_BG_RETURN_MON, $0, $0, $0
	anim_wait 48
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_ShadowPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_bgp $1b
	anim_wait 24
	anim_obj ANIM_OBJ_0A, 136, 56, $43
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_MeteorMash:
	anim_2gfx ANIM_GFX_REFLECT, ANIM_GFX_HIT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_2Row
	anim_call BattleAnim_MetalSheen
	anim_wait 4
	anim_bgp $1b
	anim_obp0 $0
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 4
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 3
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_GearGrind:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_1gfx ANIM_GFX_HIT
	anim_resetobp0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_05, 148, 56, $0
	anim_obj ANIM_OBJ_05, 116, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_05, 144, 56, $0
	anim_obj ANIM_OBJ_05, 120, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_05, 140, 56, $0
	anim_obj ANIM_OBJ_05, 124, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_MirrorShot:
	anim_3gfx ANIM_GFX_REFLECT, ANIM_GFX_SPEED, ANIM_GFX_BEAM
	anim_bgeffect ANIM_BG_06, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_FLASH
	anim_obj ANIM_OBJ_SCREEN, 72, 80, $0
	anim_wait 16
	anim_loop 3, .loop
	anim_call BattleAnim_MirrorShot_branch
	anim_wait 64
	anim_ret

BattleAnim_MirrorShot_branch:
	anim_sound 0, 0, SFX_FLASH
	anim_obj ANIM_OBJ_BEAM, 64, 92, $0
	anim_wait 4
	anim_sound 0, 0, SFX_FLASH
	anim_obj ANIM_OBJ_BEAM, 80, 84, $0
	anim_wait 4
	anim_sound 0, 1, SFX_FLASH
	anim_obj ANIM_OBJ_BEAM, 96, 76, $0
	anim_wait 4
	anim_sound 0, 1, SFX_FLASH
	anim_obj ANIM_OBJ_BEAM, 112, 68, $0
	anim_obj ANIM_OBJ_BEAM_END, 126, 62, $0
	anim_ret

BattleAnim_IronDefense:
	anim_1gfx ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_MetalSheen
	anim_wait 4
	anim_ret

BattleAnim_RockTomb:
	anim_1gfx ANIM_GFX_ROCKS
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $1, $0
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 120, 68, $30
	anim_wait 16
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 152, 68, $30
	anim_wait 16
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 144, 64, $40
	anim_wait 16
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_BIG_ROCK, 136, 68, $30
	anim_wait 96
	anim_ret

; The following are new

BattleAnim_StrengthSap:
	anim_2gfx ANIM_GFX_BUBBLE, ANIM_GFX_CHARGE
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 6, 3, SFX_WATER_GUN
	anim_call BattleAnim_GigaDrain_branch_cbab3
	anim_wait 48
	anim_wait 128
	anim_incbgeffect ANIM_BG_1C
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_1gfx ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_07, $0, $0, $0
.loop
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 40, 84, $0
	anim_wait 5
	anim_loop 2, .loop
	anim_wait 32
	anim_ret

BattleAnim_FreezeDry:
	anim_1gfx ANIM_GFX_ICE
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  11, 0, $23
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  10, 0, $24
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  12, 0, $23
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,   9, 0, $24
	anim_wait 2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_POWDER_SNOW,   8, 0,  13, 0, $23
	anim_wait 2
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_wait 48
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
	anim_wait 128
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_ret

BattleAnim_FlyingPress:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_Fly_branch_cbb12
	anim_wait 64
	anim_sound 0, 1, SFX_JUMP_KICK
	anim_obj ANIM_OBJ_07, 132, 62, $0
	anim_wait 2
	anim_obj ANIM_OBJ_07, 120, 50, $0
	anim_setobj $1, $2
	anim_setobj $2, $2
	anim_wait 24
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_04, 136, 48, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_CircleThrow:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_Throw
	anim_wait 32
	anim_if_param_equal $0, .done
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Throw:
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 126, 40, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 126, 40, $0
	anim_wait 6
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 146, 54, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 146, 54, $0
	anim_ret

BattleAnim_DragonTail:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 2, .loop
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_resetobp0
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 32
	anim_if_param_equal $0, .done
	anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $0, $0
	anim_wait 64
.done
	anim_ret

BattleAnim_Revenge:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 30, 90, $0
	anim_wait 40
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_bgp $90
.loop
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 148, 56, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 122, 34, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 122, 34, $0
	anim_wait 2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_06, 132, 64, $0
	anim_wait 1
	anim_obj ANIM_OBJ_01, 132, 64, $0
	anim_wait 2
	anim_loop 2, .loop
	anim_ret

BattleAnim_SignalBeam:
	anim_1gfx ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_07, $0, $2, $0
.loop
	anim_sound 6, 2, SFX_SPIDER_WEB
	anim_obj ANIM_OBJ_WAVE, 64, 88, $4
	anim_wait 4
	anim_loop 10, .loop
	anim_wait 48
	anim_ret

BattleAnim_Lunge:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 3
	anim_sound 0, 1, SFX_TACKLE
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_obj ANIM_OBJ_01, 128, 46, $0
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 46, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 46, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 46, $d0
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 46, $50
	anim_wait 6
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_FoulPlay:
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_sound 0, 1, SFX_NIGHTMARE
	anim_wait 48
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 122, 34, $0
	anim_wait 20
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 132, 64, $0
	anim_wait 48
	anim_ret

BattleAnim_Discharge:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $30
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $31
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $32
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $33
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $34
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $35
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $36
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $37
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2D, 136, 68, $0
	anim_wait 48
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_Electroweb:
	anim_1gfx ANIM_GFX_WEB
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_SPIDER_WEB, 132, 48, $0
	anim_sound 6, 2, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 64
	anim_ret

BattleAnim_Nuzzle:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_BOUNCE_DOWN, $0, $1, $0
	anim_sound 0, 0, SFX_RETURN
	anim_wait 64
	anim_incbgeffect ANIM_BG_BOUNCE_DOWN
	anim_wait 16
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_THUNDER_WAVE, 48, 92, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_obj ANIM_OBJ_01, 122, 34, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 8
	anim_ret

BattleAnim_ShockWave:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $30
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $31
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $32
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $33
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $34
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $35
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $36
	anim_obj ANIM_OBJ_CHARGE, 44, 88, $37
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 8
	anim_loop 4, .loop
	anim_wait 64
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_33, 136, 56, $0
	anim_wait 48
	anim_call BattleAnim_ShowMon_1
	anim_wait 1
	anim_ret

BattleAnim_DragonDarts:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_60, 64, 92, $14
	anim_wait 4
	anim_obj ANIM_OBJ_60, 54, 82, $14
	anim_wait 16
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_05, 130, 42, $0
	anim_wait 16
	anim_ret

BattleAnim_DragonRush:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_call BattleAnim_DragonRushCharge
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_resetobp0
	anim_sound 0, 0, SFX_LICK
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 2
	anim_call BattleAnim_SpeedJump
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 156, 60, $0
	anim_wait 12
	anim_call BattleAnim_SpeedJump
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 4
	anim_ret

BattleAnim_DragonRushCharge:
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_wait 2
	anim_loop 2, .loop
	anim_ret

BattleAnim_DualChop:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 136, 40, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_wait 16
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 140, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 140, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_SpiritBreak:
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_obp1 $1b
	anim_wait 16
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 132, 64, $0
	anim_wait 20
.loop
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 122, 34, $0
	anim_wait 6
	anim_loop 2, .loop
	anim_wait 20
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
.loop2
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_wait 6
	anim_loop 4, .loop2
	anim_wait 32
	anim_ret

BattleAnim_StrangeSteam:
	anim_1gfx ANIM_GFX_HAZE
	anim_sound 0, 1, SFX_WARP_TO
.loop
	anim_obj ANIM_OBJ_SMOG, 132, 16, $0
	anim_wait 8
	anim_loop 10, .loop
	anim_wait 48
	anim_ret

BattleAnim_HornLeech:
	anim_3gfx ANIM_GFX_HORN, ANIM_GFX_HIT, ANIM_GFX_BUBBLE
	anim_obj ANIM_OBJ_HORN, 72, 80, $1
	anim_wait 16
	anim_sound 0, 1, SFX_HORN_ATTACK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_clearobjs
	anim_call BattleAnim_TargetObj_1Row
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_71, 132, 44, $0
	anim_obj ANIM_OBJ_71, 132, 44, $8
	anim_obj ANIM_OBJ_71, 132, 44, $10
	anim_obj ANIM_OBJ_71, 132, 44, $18
	anim_obj ANIM_OBJ_71, 132, 44, $20
	anim_obj ANIM_OBJ_71, 132, 44, $28
	anim_obj ANIM_OBJ_71, 132, 44, $30
	anim_obj ANIM_OBJ_71, 132, 44, $38
	anim_wait 128
	anim_wait 48
	anim_ret

BattleAnim_BulletSeed:
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_HIT
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_BULLET_SEED, 64, 92, $4
	anim_wait 16
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_wait 32
	anim_ret

BattleAnim_Leafage:
	anim_1gfx ANIM_GFX_PLANT
	anim_sound 0, 0, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $5c
	anim_wait 16
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $d0
	anim_wait 16
	anim_obj ANIM_OBJ_RAZOR_LEAF, 48, 80, $28
	anim_wait 64
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 1
	anim_wait 2
	anim_incobj 2
	anim_wait 10
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 3
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_wait 64
	anim_ret

BattleAnim_MagicalLeaf:
	anim_1gfx ANIM_GFX_PLANT
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_bgeffect ANIM_BG_08, $0, $4, $0
.loop
	anim_sound 6, 2, SFX_PSYBEAM
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $28
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $5c
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $10
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $e8
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $9c
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $d0
	anim_wait 6
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $1c
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $50
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $dc
	anim_obj ANIM_OBJ_MAGICAL_LEAF, 48, 80, $90
	anim_wait 80
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 3
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 5
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 7
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 9
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 1
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 2
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 4
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 6
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 8
	anim_wait 2
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_incobj 10
	anim_wait 64
	anim_ret

BattleAnim_SolarBlade:
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_CUT
	anim_sound 0, 0, SFX_CHARGE
	anim_obj ANIM_OBJ_3D, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $8
	anim_obj ANIM_OBJ_3C, 48, 84, $10
	anim_obj ANIM_OBJ_3C, 48, 84, $18
	anim_obj ANIM_OBJ_3C, 48, 84, $20
	anim_obj ANIM_OBJ_3C, 48, 84, $28
	anim_obj ANIM_OBJ_3C, 48, 84, $30
	anim_obj ANIM_OBJ_3C, 48, 84, $38
	anim_wait 104
	anim_bgeffect ANIM_BG_FLASH_WHITE, $0, $4, $2
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 152, 40, $0
	anim_wait 64
	anim_ret

BattleAnim_MuddyWater:
	anim_1gfx ANIM_GFX_BUBBLE
	anim_bgeffect ANIM_BG_SURF, $0, $0, $0
	anim_obj ANIM_OBJ_MUDDY_WATER, 88, 104, $8
.loop
	anim_sound 0, 1, SFX_SURF
	anim_wait 32
	anim_loop 4, .loop
	anim_incobj 1
	anim_wait 56
	anim_ret

BattleAnim_FlipTurn:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_U_TURN_LAUNCH, 64, 92, $4
	anim_wait 16
	anim_sound 0, 1, SFX_WATER_GUN
	anim_obj ANIM_OBJ_00, 132, 56, $0
	anim_wait 8
	anim_sound 0, 0, SFX_RETURN
	anim_obj ANIM_OBJ_U_TURN_RISE, 132, 40, $6
	anim_wait 32
	anim_obj ANIM_OBJ_U_TURN_FALL, 48, 92, $30
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_Boomburst:
	anim_2gfx ANIM_GFX_NOISE, ANIM_GFX_PSYCHIC
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_sound 0, 0, SFX_OUTRAGE
	anim_wait 8
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_sound 0, 0, SFX_BOOMBURST
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_obj ANIM_OBJ_WAVE,  7, 0, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  9, 0, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
.loop
	anim_wait 24
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_sound 0, 0, SFX_BOOMBURST
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_obj ANIM_OBJ_WAVE,  7, 4, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  8, 4, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  7, 6, 11, 0, $2
	anim_obj ANIM_OBJ_WAVE,  8, 2, 11, 0, $2
	anim_wait 4
	anim_obj ANIM_OBJ_WAVE,  8, 0, 11, 0, $2
	anim_loop 2, .loop
	anim_wait 24
	anim_ret

BattleAnim_Liquidation:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_SURF
	anim_wait 16
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_bgeffect ANIM_BG_WHIRLPOOL, $0, $0, $0
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_incbgeffect ANIM_BG_WHIRLPOOL
	anim_wait 4
	anim_ret

BattleAnim_Soak:
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_2Row
	anim_sound 16, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_WATER_GUN, 64, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_WATER_GUN, 64, 76, $0
	anim_wait 4
	anim_obj ANIM_OBJ_WATER_GUN, 64, 82, $0
	anim_wait 4
	anim_obj ANIM_OBJ_WATER_GUN, 64, 74, $0
	anim_wait 4
	anim_obj ANIM_OBJ_WATER_GUN, 64, 80, $0
	anim_wait 24
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 32
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_HyperspaceFury:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_LICK
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_wait 2
	anim_call BattleAnim_SpeedJump
	anim_wait 4
	anim_bgp $1b
	anim_wait 16
	anim_call BattleAnim_CloseCombatPunches
	anim_wait 10
	anim_bgp $e4
	anim_wait 2
	anim_call BattleAnim_SpeedJump
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 12
	anim_ret

BattleAnim_OblivionWing:
	anim_2gfx ANIM_GFX_BUBBLE, ANIM_GFX_HIT
	anim_call BattleAnim_WingAttackHit
	anim_wait 24
	anim_sound 6, 3, SFX_WATER_GUN
	anim_call BattleAnim_LeechHP
	anim_wait 48
	anim_wait 128
	anim_ret

BattleAnim_BoltStrike:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 156, 52, $0
	anim_wait 2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_04, 138, 52, $0
	anim_wait 2
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_00, 122, 52, $0
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 12
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_SacredSword:
	anim_2gfx ANIM_GFX_WHIP, ANIM_GFX_CUT
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_40, 116, 52, $80
	anim_wait 8
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_3F, 138, 60, $0
	anim_wait 12
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 18, 0,  4, 0, $0
	anim_wait 32
	anim_ret

BattleAnim_SecretSword:
	anim_3gfx ANIM_GFX_CHARGE, ANIM_GFX_CUT, ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_call BattleAnim_SecretSwordGlimmer
	anim_wait 36
	anim_sound 0, 1, SFX_CUT
	anim_obj ANIM_OBJ_3A, 18, 0,  4, 0, $0
	anim_wait 32
	anim_ret

BattleAnim_SecretSwordGlimmer:
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_GLIMMER, 24, 64, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 56, 104, $0
	anim_wait 5
	anim_obj ANIM_OBJ_GLIMMER, 24, 104, $0
	anim_ret

BattleAnim_WakeUpSlap:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 144, 48, $0
	anim_wait 10
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 120, 48, $0
	anim_wait 10
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 144, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 144, 48, $0
	anim_wait 24
	anim_ret

BattleAnim_VacuumWave:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_MENU
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_SpeedJump
	anim_wait 12
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 134, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 134, 48, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret

BattleAnim_ShadowBone:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_MISC
	anim_sound 0, 1, SFX_BONE_CLUB
	anim_obj ANIM_OBJ_BONE_RUSH, 132, 56, $2
	anim_wait 16
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 120, 48, $0
	anim_wait 16
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 144, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_DragonAscent:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_call BattleAnim_DragonRushCharge
	anim_wait 8
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_Fly_branch_cbb12
	anim_wait 2
	anim_call BattleAnim_WaterfallHits
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 32
	anim_ret

BattleAnim_SkyUppercut:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_06, $0, $1, $0
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_call BattleAnim_Fly_branch_cbb12
	anim_wait 2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 140, 48, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 140, 48, $0
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 8
	anim_ret

BattleAnim_MindBlown:
	anim_1gfx ANIM_GFX_EXPLOSION
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $24
.loop
	anim_call BattleAnim_Selfdestruct_branch_cbb62
	anim_wait 5
	anim_loop 2, .loop
	anim_wait 16
	anim_ret

BattleAnim_KingsShield:
	anim_1gfx ANIM_GFX_OBJECTS
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_KINGSSHIELD, 80, 80, $0
	anim_obj ANIM_OBJ_KINGSSHIELD, 80, 80, $d
	anim_obj ANIM_OBJ_KINGSSHIELD, 80, 80, $1a
	anim_obj ANIM_OBJ_KINGSSHIELD, 80, 80, $27
	anim_obj ANIM_OBJ_KINGSSHIELD, 80, 80, $34
	anim_sound 0, 0, SFX_PROTECT
	anim_wait 96
	anim_ret

BattleAnim_MistBall:
	anim_3gfx ANIM_GFX_EGG, ANIM_GFX_SMOKE, ANIM_GFX_HAZE
	anim_obp0 $54
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SHADOW_BALL, 64, 92, $2
	anim_wait 32
	anim_obj ANIM_OBJ_BALL_POOF, 132, 56, $10
	anim_wait 8
	anim_sound 0, 0, SFX_SURF
.loop
	anim_obj ANIM_OBJ_SMOKE, 132, 60, $20
	anim_wait 8
	anim_loop 5, .loop
	anim_wait 82
	anim_ret

BattleAnim_Accelerock:
	anim_2gfx ANIM_GFX_ROCKS, ANIM_GFX_HIT
	anim_sound 6, 2, SFX_SPARK
	anim_obj ANIM_OBJ_ROCK_BLAST, 64, 92, $4
	anim_wait 2
	anim_clearobjs
	anim_wait 2
	anim_obj ANIM_OBJ_ROCK_BLAST, 110, 60, $4
	anim_wait 6
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_01, 136, 50, $0
	anim_wait 32
	anim_ret

BattleAnim_BurnUp:
	anim_1gfx ANIM_GFX_FIRE
	anim_call BattleAnim_FirePillar
	anim_wait 96
	anim_call BattleAnim_BurnSpin
	anim_wait 8
	anim_ret

BattleAnim_FellStinger:	
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_obj ANIM_OBJ_60, 64, 92, $14
	anim_wait 16
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $14, $2, $0
	anim_wait 16
	anim_ret

BattleAnim_StormThrow:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_SHINE
	anim_call BattleAnim_AlwaysCritGleam
	anim_wait 8
	anim_call BattleAnim_Throw
	anim_wait 32
	anim_ret

BattleAnim_AlwaysCritGleam:
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_sound 0, 0, SFX_FORESIGHT
	anim_obj ANIM_OBJ_FORESIGHT, 64, 88, $0
	anim_wait 48
	anim_bgp $e4
	anim_ret

BattleAnim_FrostBreath:
	anim_2gfx ANIM_GFX_ICE, ANIM_GFX_SHINE
	anim_call BattleAnim_AlwaysCritGleam
	anim_wait 8
.loop2
	anim_sound 6, 2, SFX_SHINE
	anim_obj ANIM_OBJ_ICE_BEAM, 64, 92, $4
	anim_wait 4
	anim_loop 15, .loop2
	anim_wait 48
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_sound 0, 1, SFX_SHINE
	anim_wait 8
	anim_ret

BattleAnim_WickedBlow:
	anim_3gfx ANIM_GFX_SPEED, ANIM_GFX_HIT, ANIM_GFX_SHINE
	anim_call BattleAnim_AlwaysCritGleam
	anim_wait 8
	anim_call BattleAnim_SuckerPunchHit2
	anim_wait 24
	anim_ret

BattleAnim_FakeOut:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 116, 48, $0
	anim_obj ANIM_OBJ_08, 156, 48, $0
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 126, 48, $0
	anim_obj ANIM_OBJ_08, 146, 48, $0
	anim_wait 3
	anim_sound 0, 1, SFX_KARATE_CHOP
	anim_obj ANIM_OBJ_08, 136, 48, $0
	anim_wait 3
	anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_wait 16
	anim_ret

BattleAnim_MagmaStorm:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_MAGMA, 114, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 68, $30
	anim_wait 24
	anim_obj ANIM_OBJ_MAGMA, 114, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 48, $30
	anim_wait 24
	anim_obj ANIM_OBJ_MAGMA, 114, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 28, $30
	anim_wait 24
	anim_ret

BattleAnim_LavaPlume:
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_1Row
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_LAVA_PLUME,  14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_LAVA_PLUME,  15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_LAVA_PLUME, -16, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_LAVA_PLUME, -15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_LAVA_PLUME, -14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_FireLash:
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, 8, $2, $0
	anim_sound 0, 1, SFX_VICEGRIP
	anim_obj ANIM_OBJ_3A, 19, 0,  4, 0, $0
	anim_wait 4
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_MAGMA, 150, 28, $30
	anim_wait 2
	anim_obj ANIM_OBJ_MAGMA, 132, 48, $30
	anim_wait 2
	anim_obj ANIM_OBJ_MAGMA, 114, 68, $30
	anim_wait 48
	anim_ret

BattleAnim_BlazeKick:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_FIRE
	anim_obj ANIM_OBJ_07, 136, 56, $43
	anim_call BattleAnim_BurnSpin
	anim_wait 16
	anim_ret

BattleAnim_SlackOff:
	anim_2gfx ANIM_GFX_STATUS, ANIM_GFX_BUBBLE
	anim_sound 0, 0, SFX_TAIL_WHIP
	anim_obj ANIM_OBJ_ASLEEP, 44, 80, $0
	anim_wait 40
	anim_sound 0, 0, SFX_FULL_HEAL
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_call BattleAnim_RecoverBranch
	anim_wait 64
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_WorkUp:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_WIND
.loop
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 32
	anim_loop 2, .loop
	anim_sound 0, 0, SFX_KINESIS
	anim_wait 16
	anim_ret

BattleAnim_RockPolish:
	anim_2gfx ANIM_GFX_SHINE, ANIM_GFX_REFLECT
	anim_obp0 $0
	anim_sound 0, 0, SFX_RAGE
	anim_call BattleAnim_MetalSheen
	anim_obp0 $e4
	anim_call BattleAnim_RockPolishBranch
	anim_ret

BattleAnim_StoredPower:
	anim_2gfx ANIM_GFX_PSYCHIC, ANIM_GFX_CHARGE
	anim_bgp $90
	anim_sound 6, 3, SFX_WATER_GUN
	anim_obj ANIM_OBJ_3D, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $0
	anim_obj ANIM_OBJ_3C, 48, 84, $8
	anim_obj ANIM_OBJ_3C, 48, 84, $10
	anim_obj ANIM_OBJ_3C, 48, 84, $18
	anim_obj ANIM_OBJ_3C, 48, 84, $20
	anim_obj ANIM_OBJ_3C, 48, 84, $28
	anim_obj ANIM_OBJ_3C, 48, 84, $30
	anim_obj ANIM_OBJ_3C, 48, 84, $38
	anim_wait 80
	anim_clearobjs
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
	anim_sound 6, 2, SFX_PSYCHIC
	anim_wait 64
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_PoisonTail:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_POISON
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 16
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_call BattleAnim_ShowMon_0
	anim_wait 32
	anim_call BattleAnim_BriefPoisonBubbles
	anim_wait 56
	anim_ret

BattleAnim_ForcePalm:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 32
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_08, 136, 40, $0
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_08, 136, 40, $0
	anim_wait 6
	anim_loop 2, .loop
	anim_ret

BattleAnim_FreezeGlare:
	anim_2gfx ANIM_GFX_BEAM, ANIM_GFX_ICE
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_obj ANIM_OBJ_ICE_BUILDUP, 136, 74, $10
.loop
	anim_call BattleAnim_Glare_branch_cbadc
	anim_wait 20
	anim_loop 3, .loop
	anim_ret

BattleAnim_SpectralThief:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $8, $0
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_call BattleAnim_SpectralThiefBranch
	anim_obj ANIM_OBJ_00, 126, 38, $0
	anim_call BattleAnim_SpectralThiefBranch
	anim_obj ANIM_OBJ_00, 146, 58, $0
	anim_call BattleAnim_SpectralThiefBranch
	anim_wait 12
	anim_ret

BattleAnim_SpectralThiefBranch:
	anim_obj ANIM_OBJ_47, 44, 108, $6
	anim_obj ANIM_OBJ_47, 136, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 36, 108, $6
	anim_obj ANIM_OBJ_47, 128, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 52, 108, $8
	anim_obj ANIM_OBJ_47, 144, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 28, 108, $8
	anim_obj ANIM_OBJ_47, 120, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 60, 108, $6
	anim_obj ANIM_OBJ_47, 152, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 20, 108, $8
	anim_obj ANIM_OBJ_47, 112, 60, $6
	anim_wait 2
	anim_obj ANIM_OBJ_47, 68, 108, $8
	anim_obj ANIM_OBJ_47, 160, 60, $6
	anim_wait 2
	anim_ret

BattleAnim_ScorchingSands:
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_1Row
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_SANDS,  14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDS,  15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDS, -16, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $30, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDS, -15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SANDS, -14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 16
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret

BattleAnim_IceHammer:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ICE
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 12
	anim_loop 3, .loop
	anim_call BattleAnim_PowderSnow_branch_cbbdf
	anim_wait 32
	anim_ret

BattleAnim_HammerArm:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
.loop
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_08, 136, 56, $0
	anim_wait 4
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 12
	anim_loop 3, .loop
	anim_wait 32
	anim_ret

BattleAnim_BlueFlare:
	anim_1gfx ANIM_GFX_FIRE
.loop
	anim_sound 0, 0, SFX_EMBER
	anim_obj ANIM_OBJ_BLUE_FLARE1, 48, 96, $0
	anim_wait 6
	anim_loop 8, .loop
	anim_wait 96
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_BLUE_FLARE2, 136, 56, $1
	anim_obj ANIM_OBJ_BLUE_FLARE2, 136, 56, $2
	anim_obj ANIM_OBJ_BLUE_FLARE2, 136, 56, $3
	anim_obj ANIM_OBJ_BLUE_FLARE2, 136, 56, $4
	anim_obj ANIM_OBJ_BLUE_FLARE2, 136, 56, $5
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 12
	anim_ret

BattleAnim_StickyWeb:
	anim_1gfx ANIM_GFX_WEB
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_SPIDER_WEB, 128, 52, $0
	anim_sound 6, 2, SFX_SPIDER_WEB
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 4
	anim_obj ANIM_OBJ_SPIDER_WEB, 144, 38, $0
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 88, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 84, $0
	anim_wait 4
	anim_obj ANIM_OBJ_STRING_SHOT, 64, 80, $0
	anim_wait 64
	anim_ret

BattleAnim_Octolock:
	anim_1gfx ANIM_GFX_ROPE
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_49, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 48, $0
	anim_wait 8
	anim_obj ANIM_OBJ_49, 132, 40, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 56, $0
	anim_wait 64
	anim_sound 0, 1, SFX_BIND
	anim_incobj 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_wait 64
	anim_ret

BattleAnim_Snatch:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 16
	anim_sound 0, 1, SFX_THIEF
	anim_obj ANIM_OBJ_01, 148, 52, $0
	anim_call BattleAnim_ThiefBranch
	anim_ret

BattleAnim_ElectroBall:
	anim_3gfx ANIM_GFX_HIT, ANIM_GFX_EXPLOSION, ANIM_GFX_LIGHTNING
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
	anim_sound 6, 2, SFX_THROW_BALL
	anim_obj ANIM_OBJ_U_TURN_LAUNCH, 64, 92, $4
	anim_wait 16
	;anim_sound 0, 0, SFX_SPARK
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_00, 132, 56, $0
	anim_sound 0, 1, SFX_THUNDERSHOCK
	anim_obj ANIM_OBJ_THUNDER_WAVE, 136, 56, $0
	anim_wait 48
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_ret

BattleAnim_Howl:
	anim_1gfx ANIM_GFX_NOISE
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
.loop
	anim_sound 0, 0, SFX_SNORE
	anim_call BattleAnim_Snore_branch_cbbbc
	anim_wait 16
	anim_loop 3, .loop
	anim_wait 8
	anim_ret

BattleAnim_NeedleArm:
	anim_2gfx ANIM_GFX_HORN, ANIM_GFX_HIT
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_60, 64, 92, $14
	anim_wait 2
	anim_obj ANIM_OBJ_60, 56, 84, $14
	anim_obj ANIM_OBJ_60, 70, 100, $14
	anim_wait 16
	anim_sound 0, 1, SFX_POISON_STING
	anim_obj ANIM_OBJ_05, 136, 56, $0
	anim_wait 2
	anim_obj ANIM_OBJ_05, 128, 48, $0
	anim_obj ANIM_OBJ_05, 142, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_ZingZap:
	anim_2gfx ANIM_GFX_LIGHTNING, ANIM_GFX_EXPLOSION
	anim_sound 0, 0, SFX_ZAP_CANNON
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_obj ANIM_OBJ_THUNDER_WAVE, 48, 92, $0
	anim_wait 24
	anim_setobj $1, $3
	anim_wait 1
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 16
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $0, $0
	anim_wait 8
	anim_ret

BattleAnim_SpacialRend:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_BLACK_HUES, $0, $30, $0
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_wait $30
	anim_loop 2, .loop
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
	anim_wait 2
.loop2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 50, $0
	anim_wait 8
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 126, 60, $0
	anim_wait 8
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 146, 54, $0
	anim_wait 8
	anim_loop 2, .loop2
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_call BattleAnim_ShowMon_0
	anim_wait 12
	anim_ret

BattleAnim_FishiousRend:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $30, $0
.loop
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_wait $30
	anim_loop 2, .loop
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
	anim_wait 2
	anim_sound 0, 1, SFX_SURF
.loop2
	anim_obj ANIM_OBJ_00, 136, 50, $0
	anim_wait 8
	anim_obj ANIM_OBJ_00, 126, 60, $0
	anim_wait 8
	anim_obj ANIM_OBJ_00, 146, 54, $0
	anim_wait 8
	anim_loop 2, .loop2
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_call BattleAnim_ShowMon_0
	anim_wait 12
	anim_ret

BattleAnim_Geomancy:
	anim_if_param_equal $0, .GeomancyBoost
	; charge turn
	anim_1gfx ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $10, $0
	anim_sound 0, 0, SFX_METRONOME
    anim_call BattleAnim_GeomancyCharge
    anim_ret

.GeomancyBoost
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_SHINE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $0, $0
	anim_wait 4
	anim_call BattleAnim_DragonRushCharge
	anim_wait 24
	anim_bgp $e4
	anim_wait 24
	anim_bgeffect ANIM_BG_07, $0, $0, $0
	anim_call BattleAnim_SecretSwordGlimmer
	anim_wait 64
	anim_ret
    
BattleAnim_GeomancyCharge:
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $0
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $8
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $10
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $18
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $20
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $28
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $30
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $38
	anim_wait 104
	anim_ret

BattleAnim_Endeavor:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 4
	anim_sound 0, 1, SFX_THIEF_2
	anim_obj ANIM_OBJ_00, 136, 48, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_wait 12
	anim_ret

BattleAnim_DiamondStorm:
	anim_3gfx ANIM_GFX_ICE, ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_METRONOME
	anim_obj ANIM_OBJ_SMALL_DIAMOND,  64, 92, $3
	anim_wait 6
	anim_obj ANIM_OBJ_BIG_DIAMOND1,  60, 92, $3
	anim_wait 6
	anim_obj ANIM_OBJ_SMALL_DIAMOND,  64, 82, $3
	anim_obj ANIM_OBJ_AE,  64, 88, $4
	anim_wait 6
	anim_obj ANIM_OBJ_BIG_DIAMOND2,  56, 102, $3
	anim_obj ANIM_OBJ_AE,  64, 96, $4
	anim_obj ANIM_OBJ_FLASH,  136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_SMALL_DIAMOND,  64, 92, $3
	anim_obj ANIM_OBJ_AE,  64, 80, $4
	anim_wait 4
	anim_obj ANIM_OBJ_SMALL_DIAMOND,  56, 102, $3
	anim_obj ANIM_OBJ_FLASH, 136, 56, $8
	anim_wait 6
	anim_obj ANIM_OBJ_BIG_DIAMOND1,  56, 102, $3
	anim_obj ANIM_OBJ_FLASH, 136, 56, $10
	anim_wait 6
	anim_obj ANIM_OBJ_BIG_DIAMOND2,  60, 92, $3
	anim_obj ANIM_OBJ_AE,  64, 88, $4
	anim_obj ANIM_OBJ_FLASH, 136, 56, $18
	anim_wait 6
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $2, $0
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 128, 56, $0
	anim_wait 48
	anim_ret

BattleAnim_SeedFlare:
	anim_1gfx ANIM_GFX_PLANT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $0
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $8
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $10
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $18
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $20
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $28
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $30
	anim_obj ANIM_OBJ_SEED_FLARE, 44, 88, $38
.loop
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_wait 8
	anim_loop 6, .loop
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_wait 1
	anim_incobj 2
	anim_incobj 3
	anim_incobj 4
	anim_incobj 5
	anim_incobj 6
	anim_incobj 7
	anim_incobj 8
	anim_incobj 9
	anim_wait 16
	anim_1gfx ANIM_GFX_HIT
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 32
	anim_ret

BattleAnim_HeadCharge:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MEGA_KICK
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $10
	anim_wait 20
	anim_ret

BattleAnim_HeadSmash:
	anim_3gfx ANIM_GFX_HIT, ANIM_GFX_ROCKS, ANIM_GFX_EXPLOSION
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_WITHDRAW, $0, $1, $50
	anim_wait 48
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $40
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_sound 0, 0, SFX_SPARK
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
	;anim_obj ANIM_OBJ_18, 136, 56, $0
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $4, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 128, 64, $d0
	anim_wait 32
	anim_ret

BattleAnim_LowSweep:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_DOUBLE_KICK
	anim_obj ANIM_OBJ_07, 148, 64, $0
	anim_obj ANIM_OBJ_00, 148, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_MOVE_PUZZLE_PIECE
	anim_obj ANIM_OBJ_06, 136, 64, $0
	anim_obj ANIM_OBJ_00, 136, 64, $0
	anim_wait 6
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_POUND
	anim_obj ANIM_OBJ_08, 124, 64, $0
	anim_obj ANIM_OBJ_00, 124, 64, $0
	anim_wait 16
	anim_ret

BattleAnim_PowerUpPunch:
	anim_1gfx ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_2Row
	anim_bgeffect ANIM_BG_TACKLE, $0, $1, $0
	anim_wait 8
	anim_call BattleAnim_ShowMon_0
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_06, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 8
	anim_ret

BattleAnim_DualWingbeat:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_obj ANIM_OBJ_01, 116, 56, $0
	anim_wait 16
	anim_sound 0, 1, SFX_WING_ATTACK
	anim_obj ANIM_OBJ_01, 148, 56, $0
	anim_obj ANIM_OBJ_01, 116, 56, $0
	anim_wait 16
	anim_ret

BattleAnim_NaturesMadness:
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_HIT
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_NATURES_MADNESS, 116, 64, $20
	anim_incobj 1
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_NATURES_MADNESS, 130, 64, $20
	anim_incobj 2
	anim_wait 8
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_NATURES_MADNESS, 144, 64, $20
	anim_incobj 3
	anim_wait 72
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 136, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 126, 46, $0
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 140, 38, $0
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 138, 60, $0
	anim_wait 8
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_00, 128, 50, $0
	anim_wait 32
	anim_ret

BattleAnim_StealthRocks:
	anim_1gfx ANIM_GFX_ROCKS
	anim_sound 6, 2, SFX_MENU
	anim_obj ANIM_OBJ_STEALTH_ROCK, 66, 64, $20
	anim_wait 8
	anim_obj ANIM_OBJ_STEALTH_ROCK, 66, 58, $26
	anim_wait 8
	anim_obj ANIM_OBJ_STEALTH_ROCK, 66, 70, $16
	anim_wait 8
	anim_obj ANIM_OBJ_STEALTH_ROCK, 66, 74, $24
	anim_wait 8
	anim_obj ANIM_OBJ_STEALTH_ROCK, 66, 80, $18
	anim_wait 92
	anim_ret

BattleAnim_PsychicFang:	
	anim_2gfx ANIM_GFX_CUT, ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_ALTERNATE_HUES, $0, $2, $0
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
	anim_obj ANIM_OBJ_BITE, 136, 56, $98
	anim_obj ANIM_OBJ_BITE, 136, 56, $18
	anim_wait 6
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 144, 48, $18
	anim_wait 12
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_01, 128, 64, $18
	anim_wait 32
	anim_incbgeffect ANIM_BG_PSYCHIC
	anim_wait 4
	anim_ret

BattleAnim_Coil:
	anim_1gfx ANIM_GFX_ROPE
	anim_wait 8
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_COIL, 44, 106, $0
	anim_wait 32
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_COIL, 44, 98, $0
	anim_wait 32
	anim_sound 0, 0, SFX_SHINE
	anim_obj ANIM_OBJ_COIL, 44, 90, $0
	anim_wait 64
	anim_ret

BattleAnim_ToxicThread:
	anim_2gfx ANIM_GFX_WEB, ANIM_GFX_POISON
	anim_call BattleAnim_StringShotBranch
	anim_call BattleAnim_BriefPoisonBubbles
	anim_wait 8
	anim_ret

BattleAnim_VCreate:
	anim_1gfx ANIM_GFX_FIRE
    anim_call BattleAnim_FlameWheelPillar
	anim_wait 96
	anim_wait 4
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $3
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_MAGMA, 114, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 123, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 141, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 68, $30
	anim_wait 64
	anim_ret

BattleAnim_DracoMeteor:
	anim_2gfx ANIM_GFX_EXPLOSION, ANIM_GFX_SPEED
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_call BattleAnim_DragonRushCharge
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_resetobp0
BattleAnim_MeteorShower:
	anim_obj ANIM_OBJ_METEOR, 32, 18, $6
	anim_wait 16
	anim_obj ANIM_OBJ_METEOR, 56, 18, $6
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 16
	anim_obj ANIM_OBJ_METEOR, 40, 18, $6
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 16
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 80
	anim_ret

BattleAnim_SmackDown:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_ROCKS
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_08, 136, 52, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 52, $0
	anim_wait 8
	anim_sound 0, 1, SFX_SPARK
	anim_obj ANIM_OBJ_08, 136, 56, $0
	anim_wait 6
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 2
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $28
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $5c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $10
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $e8
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $9c
	anim_obj ANIM_OBJ_ROCK_SMASH, 136, 56, $d0
	anim_wait 48
	anim_ret

BattleAnim_FieryDance:
	anim_1gfx ANIM_GFX_FIRE
    anim_call BattleAnim_FlameWheelPillar
	anim_wait 96
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_EMBER, 120, 68, $30
	anim_obj ANIM_OBJ_EMBER, 132, 68, $30
	anim_obj ANIM_OBJ_EMBER, 144, 68, $30
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_16, $0, $1, $40
.loop2
	anim_bgeffect ANIM_BG_SHAKE_USER, $0, $1, $0
	anim_wait 32
	anim_incbgeffect ANIM_BG_SHAKE_USER
	anim_loop 3, .loop2
	anim_wait 8
	anim_incbgeffect ANIM_BG_16
	anim_call BattleAnim_ShowMon_0
	anim_ret

BattleAnim_StruggleBug:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 6, 2, SFX_MENU
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $10, $1, $20
	anim_wait 32
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 132, 64, $0
	anim_wait 4
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 128, 48, $0
	anim_wait 4
	anim_sound 0, 1, SFX_BITE
	anim_obj ANIM_OBJ_02, 144, 56, $0
	anim_wait 24
	anim_ret

BattleAnim_MeteorBeam:
	anim_if_param_equal $0, .FireMeteorBeam
	; charge turn
	anim_1gfx ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_16, $0, $1, $40
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_sound 0, 0, SFX_SWORDS_DANCE
	anim_call BattleAnim_GeomancyCharge
	anim_ret
    
.FireMeteorBeam
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_EXPLOSION
	anim_sound 0, 0, SFX_SWITCH_POKEMON
	anim_obj ANIM_OBJ_METEOR_BEAM, 48, 84, $30
	anim_wait 60
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_obj ANIM_OBJ_METEOR, 32, 18, $6
	anim_wait 16
	anim_obj ANIM_OBJ_METEOR, 56, 18, $6
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 16
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 48
	anim_ret

BattleAnim_SteelBeam:
	anim_2gfx ANIM_GFX_REFLECT, ANIM_GFX_BEAM
	anim_obp0 $0
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_ret


SECTION "Battle Animations 4", ROMX

BattleAnim_BoltBeak:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 124, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 132, 48, $0
	anim_wait 8
	anim_sound 0, 1, SFX_PECK
	anim_obj ANIM_OBJ_02, 140, 56, $0
	anim_wait 8
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $6, $20
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2E, 132, 68, $0
	anim_wait 48
	anim_ret

BattleAnim_GravApple:
	anim_1gfx ANIM_GFX_MISC2
	anim_sound 0, 1, SFX_STRENGTH
	anim_obj ANIM_OBJ_APPLE, 136, 48, $30
	anim_wait 16
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $60, $1, $0
	anim_wait 48
	anim_ret
    
BattleAnim_ThunderKick:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_LIGHTNING
	anim_obj ANIM_OBJ_07, 136, 56, $43
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $2
	anim_sound 0, 1, SFX_THUNDER
	anim_obj ANIM_OBJ_2F, 152, 68, $0
	anim_wait 64
	anim_ret
    
BattleAnim_AppleAcid:
	anim_1gfx ANIM_GFX_WATER
	anim_sound 16, 2, SFX_WATER_GUN
	anim_obj ANIM_OBJ_APPLE_ACID, 64, 88, $0
	anim_wait 8
	anim_obj ANIM_OBJ_APPLE_ACID, 64, 76, $0
	anim_wait 8
	anim_obj ANIM_OBJ_APPLE_ACID, 64, 82, $0
	anim_wait 64
	anim_ret
    
BattleAnim_SteamEruption:
	anim_bgeffect ANIM_BG_30, $0, $0, $0
	anim_1gfx ANIM_GFX_WATER
	anim_call BattleAnim_UserObj_1Row
	anim_sound 0, 1, SFX_HYDRO_PUMP
	anim_obj ANIM_OBJ_HYDRO_PUMP,  14, 4,   9, 0, $0
	anim_obj ANIM_OBJ_HYDRO_PUMP, -14, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 16
	anim_obj ANIM_OBJ_HYDRO_PUMP,  15, 4,   9, 0, $0
	anim_obj ANIM_OBJ_HYDRO_PUMP, -15, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $8, $0, $0
	anim_wait 16
	anim_obj ANIM_OBJ_HYDRO_PUMP, -16, 4,   9, 0, $0
	anim_bgeffect ANIM_BG_31, $1c, $0, $0
	anim_wait 20
	anim_call BattleAnim_ShowMon_1
	anim_bgeffect ANIM_BG_32, $0, $0, $0
	anim_wait 16
	anim_ret
    
BattleAnim_ClangingScales:
	anim_1gfx ANIM_GFX_NOISE
.loop
	anim_sound 0, 0, SFX_2_BOOPS
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $40
	anim_obj ANIM_OBJ_SING, 64, 92, $0
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $1
	anim_wait 8
	anim_obj ANIM_OBJ_SING, 64, 92, $2
	anim_wait 40
	anim_loop 3, .loop
	anim_wait 64
	anim_ret
    
BattleAnim_WaterShuriken:
	anim_2gfx ANIM_GFX_HIT, ANIM_GFX_BUBBLE
.loop
	anim_sound 16, 2, SFX_BUBBLEBEAM
	anim_obj ANIM_OBJ_BUBBLE, 64, 92, $f6
	anim_wait 3
    anim_loop 5, .loop
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 24
	anim_ret
    
BattleAnim_LeafStorm:
	anim_2gfx ANIM_GFX_PLANT, ANIM_GFX_WHIP
.loop
	anim_sound 0, 0, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_LEAF_STORM, 48, 80, $5
	anim_wait 3
	anim_obj ANIM_OBJ_LEAF_STORM, 52, 86, $5
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_wait 3
	anim_obj ANIM_OBJ_LEAF_STORM, 44, 90, $5
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_sound 0, 1, SFX_VINE_WHIP
	anim_wait 3
	anim_obj ANIM_OBJ_LEAF_STORM, 48, 84, $5
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_3F, 126, 42, $80
	anim_wait 3
	anim_obj ANIM_OBJ_LEAF_STORM, 46, 76, $5
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_wait 3
	anim_obj ANIM_OBJ_LEAF_STORM, 48, 80, $5
	anim_sound 16, 2, SFX_VINE_WHIP
	anim_obj ANIM_OBJ_40, 138, 50, $0
	anim_wait 3
    anim_loop 2, .loop
	anim_wait 80
	anim_ret
    
BattleAnim_PsychoBoost:
	anim_2gfx ANIM_GFX_EXPLOSION, ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_PSYCHIC, $0, $0, $0
    anim_call BattleAnim_FutureSightBranch
.loop
	anim_sound 0, 0, SFX_THROW_BALL
	anim_wait 16
	anim_loop 3, .loop
	anim_incbgeffect ANIM_BG_PSYCHIC
    anim_clearobjs
	anim_obj ANIM_OBJ_METEOR, 32, 18, $6
	anim_wait 16
	anim_obj ANIM_OBJ_METEOR, 56, 18, $6
	anim_sound 0, 0, SFX_BOOMBURST
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 16
	anim_obj ANIM_OBJ_METEOR, 40, 18, $6
	anim_sound 0, 0, SFX_BOOMBURST
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 16
	anim_sound 0, 0, SFX_BOOMBURST
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $8, $3
	anim_wait 80
	anim_ret

BattleAnim_FleurCannon:
	anim_2gfx ANIM_GFX_BEAM, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $10, $0
	anim_sound 0, 0, SFX_METRONOME
    anim_call BattleAnim_GeomancyCharge
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_BeamBranch
	anim_wait 48
	anim_ret

BattleAnim_Superpower:
	anim_2gfx ANIM_GFX_SPEED, ANIM_GFX_HIT
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_1A, $0, $1, $20
	anim_bgeffect ANIM_BG_07, $0, $2, $0
	anim_call BattleAnim_DragonRushCharge
	anim_wait 8
	anim_incbgeffect ANIM_BG_1A
	anim_call BattleAnim_ShowMon_0
	anim_bgp $90
	anim_call BattleAnim_MegaPunch
	anim_wait 16
	anim_ret

BattleAnim_FirstImpression:
	anim_2gfx ANIM_GFX_MISC2, ANIM_GFX_HIT
	anim_sound 0, 0, SFX_THROW_BALL
	anim_obj ANIM_OBJ_XMARK, 110, 30, $0
	anim_obj ANIM_OBJ_XMARK, 78, 80, $0
    anim_wait 40
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_wait 24
	anim_ret
    
BattleAnim_PartingShot:
	anim_2gfx ANIM_GFX_MISC, ANIM_GFX_WIND
	anim_sound 0, 0, SFX_MENU
	anim_obj ANIM_OBJ_SWAGGER, 72, 88, $44
	anim_wait 32
    anim_bgeffect ANIM_BG_PULL_BACK_USER, $0, $1, $0
	anim_wait 32
	anim_sound 0, 1, SFX_KINESIS_2
	anim_obj ANIM_OBJ_ANGER, 104, 40, $0
	anim_wait 40
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 16
	anim_ret
    
BattleAnim_ChargeBeam:
	anim_2gfx ANIM_GFX_BEAM, ANIM_GFX_CHARGE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $10, $0
	anim_sound 0, 0, SFX_THUNDERSHOCK
    anim_call BattleAnim_ElectricCharge
	anim_bgeffect ANIM_BG_06, $0, $2, $0
	anim_call BattleAnim_MirrorShot_branch
	anim_wait 48
	anim_ret
    
BattleAnim_ElectricCharge:
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $0
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $8
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $10
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $18
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $20
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $28
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $30
	anim_obj ANIM_OBJ_CHARGE_BEAM, 48, 84, $38
	anim_wait 104
	anim_ret
    
BattleAnim_BrickBreak:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 122, 46, $0
	anim_wait 40
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_01, 146, 56, $0
	anim_wait 40
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_06, 134, 52, $0
    anim_wait 2
	anim_obj ANIM_OBJ_01, 134, 52, $0
	anim_wait 24
	anim_ret
    
BattleAnim_Defog:
	anim_1gfx ANIM_GFX_WIND
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
    anim_wait 4
	anim_sound 16, 2, SFX_WHIRLWIND
	anim_call BattleAnim_AgilityLines
    anim_wait 90
    anim_ret
    
BattleAnim_FeatherDance:
	anim_1gfx ANIM_GFX_MISC2
	anim_bgeffect ANIM_BG_17, $0, $1, $40
	anim_wait 16
    anim_call BattleAnim_RoostFeathers
    anim_wait 80
    anim_ret
    
BattleAnim_CourtChange:
	anim_1gfx ANIM_GFX_SHAPES
	anim_sound 0, 0, SFX_SHARPEN
	anim_obj ANIM_OBJ_COURT_CHANGE1, 88, 64, $0
	anim_obj ANIM_OBJ_COURT_CHANGE2, 88, 88, $0
	anim_wait 120
	anim_ret
    
BattleAnim_ReflectType:
	anim_1gfx ANIM_GFX_REFLECT
	anim_sound 0, 0, SFX_SHARPEN
	anim_bgeffect ANIM_BG_17, $0, $1, $40
	anim_wait 8
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 32
	anim_obj ANIM_OBJ_HARDEN, 48, 84, $0
	anim_wait 64
	anim_incbgeffect ANIM_BG_17
	anim_ret
    
BattleAnim_TrumpCard:
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $40
    anim_wait 5
.loop
	anim_sound 16, 2, SFX_WATER_GUN
    anim_wait 5
    anim_loop 5, .loop
    anim_wait 8
    anim_call BattleAnim_Slash
    anim_wait 8
    anim_ret
    
BattleAnim_ThousandArrows:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_06, $0, $1, $0
.loop
	anim_bgeffect ANIM_BG_FLASH_INVERTED, $0, $4, $2
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 152, 40, $3
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 136, 56, $3
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 152, 64, $3
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 120, 40, $83
	anim_wait 4
	anim_sound 0, 1, SFX_COMET_PUNCH
	anim_obj ANIM_OBJ_02, 120, 64, $83
	anim_wait 4
	anim_loop 3, .loop
	anim_wait 24
	anim_ret
    
BattleAnim_ThousandWaves:
	anim_1gfx ANIM_GFX_HIT
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $40
    anim_wait 4
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 56, $0
	anim_obj ANIM_OBJ_01, 116, 64, $0
	anim_obj ANIM_OBJ_01, 156, 64, $0
	anim_wait 6
	anim_sound 0, 1, SFX_LICK
    anim_obj ANIM_OBJ_01, 136, 48, $0
	anim_obj ANIM_OBJ_01, 116, 56, $0
	anim_obj ANIM_OBJ_01, 156, 56, $0
	anim_wait 6
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 40, $0
	anim_obj ANIM_OBJ_01, 116, 48, $0
	anim_obj ANIM_OBJ_01, 156, 48, $0
	anim_wait 6
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 32, $0
	anim_obj ANIM_OBJ_01, 116, 40, $0
	anim_obj ANIM_OBJ_01, 156, 40, $0
	anim_wait 6
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 136, 24, $0
	anim_obj ANIM_OBJ_01, 116, 32, $0
	anim_obj ANIM_OBJ_01, 156, 32, $0
	anim_wait 6
	anim_sound 0, 1, SFX_LICK
	anim_obj ANIM_OBJ_01, 116, 24, $0
	anim_obj ANIM_OBJ_01, 156, 24, $0
	anim_wait 6
	anim_ret
    
BattleAnim_HeatWave:
	anim_1gfx ANIM_GFX_WIND
	anim_obp0 $fc
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_18, $0, $1, $40
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 24, $10
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 48, $2
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 88, $8
	anim_wait 4
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 32, $6
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 56, $c
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 80, $4
	anim_obj ANIM_OBJ_HEAT_WAVE, 8, 104, $e
	anim_wait 12
	anim_sound 6, 2, SFX_EMBER
    anim_wait 90
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret
    
BattleAnim_OminousWind:
	anim_1gfx ANIM_GFX_WIND
	anim_bgp $f8
	anim_call BattleAnim_TargetObj_1Row
	anim_bgeffect ANIM_BG_18, $0, $1, $40
    anim_call BattleAnim_AgilityLines
    anim_wait 2
.loop
	anim_sound 0, 0, SFX_CURSE
    anim_wait 16
    anim_loop 5, .loop
    anim_wait 4
	anim_incbgeffect ANIM_BG_18
	anim_call BattleAnim_ShowMon_0
	anim_ret
    
BattleAnim_PhantomForce:
	anim_if_param_equal $0, .hit
	anim_if_param_equal $2, .fail
	anim_bgeffect ANIM_BG_17, $0, $1, $40
    anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
    anim_wait 2
	anim_bgp $1b
	anim_obp0 $0
	anim_wait 64
	anim_ret

.hit
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_wait 48
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 140, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 126, 50, $0
	anim_wait 8
	anim_sound 0, 1, SFX_TACKLE
	anim_obj ANIM_OBJ_01, 132, 44, $0
    anim_wait 8
.fail
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 40
	anim_ret
    
BattleAnim_ShadowForce:
	anim_if_param_equal $0, .hit
	anim_if_param_equal $2, .fail
	anim_bgeffect ANIM_BG_17, $0, $1, $40
    anim_wait 32
	anim_bgeffect ANIM_BG_HIDE_MON, $0, $1, $0
    anim_wait 2
	anim_bgp $1b
	anim_obp0 $0
	anim_wait 64
	anim_ret

.hit
	anim_1gfx ANIM_GFX_HIT
	anim_bgp $1b
	anim_wait 48
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 140, 56, $0
	anim_wait 8
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 126, 50, $0
	anim_wait 8
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 132, 44, $0
    anim_wait 8
.fail
	anim_bgeffect ANIM_BG_SHOW_MON, $0, $1, $0
	anim_wait 40
	anim_ret
    
BattleAnim_Poltergeist:
	anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_EXPLOSION
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $0
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $8
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $10
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $18
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $20
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $28
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $30
	anim_wait 4
	anim_obj ANIM_OBJ_GEOMANCY, 48, 84, $38
	anim_wait 104
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_obj ANIM_OBJ_17, 132, 52, $0
    anim_wait 16
	anim_ret
    
BattleAnim_SpiritShackle:
	anim_1gfx ANIM_GFX_HIT
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $1, $40
    anim_wait 32
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $2, $10
    anim_wait 48
	anim_sound 6, 2, SFX_WHIRLWIND
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $40, $2, $0
    anim_wait 2
	anim_sound 0, 1, SFX_MEGA_PUNCH
	anim_obj ANIM_OBJ_00, 136, 56, $0
    anim_wait 64
    anim_ret
    
BattleAnim_BlastBurn:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
    anim_call BattleAnim_FirePillar
	anim_wait 96
    anim_call BattleAnim_LavaPlume
    anim_ret
    
BattleAnim_BurningJealousy:
	anim_1gfx ANIM_GFX_FIRE
    anim_call BattleAnim_FlameWheelPillar
	anim_wait 112
	anim_bgeffect ANIM_BG_TACKLE2, $0, $1, $0
	anim_wait 4
    anim_call BattleAnim_BurnSpin
    anim_wait 40
    anim_ret
    
BattleAnim_Eruption:
	anim_2gfx ANIM_GFX_FIRE, ANIM_GFX_EXPLOSION
	anim_bgp $f8
	anim_obp0 $7c
    anim_call BattleAnim_FirePillar
	anim_wait 96
    anim_call BattleAnim_MeteorShower
    anim_ret
    
BattleAnim_WaterSpout:
    anim_2gfx ANIM_GFX_CHARGE, ANIM_GFX_WATER
	anim_bgp $f8
	anim_obp0 $7c
	anim_sound 0, 0, SFX_WATER_GUN
	anim_obj ANIM_OBJ_METEOR_BEAM, 48, 84, $30
	anim_wait 96
	anim_sound 0, 1, SFX_RAIN_DANCE
	anim_obj ANIM_OBJ_RAIN, 88, 0, $0
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $1
	anim_wait 8
	anim_obj ANIM_OBJ_RAIN, 88, 0, $2
	anim_wait 128
	anim_ret
    
BattleAnim_Incinerate:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
    anim_call BattleAnim_FlamethrowerFlames
	anim_wait 64
    anim_clearobjs
    anim_wait 8
    anim_call BattleAnim_BurnSpin
    anim_wait 40
    anim_ret
    
BattleAnim_Inferno:
	anim_1gfx ANIM_GFX_FIRE
	anim_bgeffect ANIM_BG_WHITE_HUES, $0, $8, $0
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_MAGMA, 132, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 114, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 28, $30
	anim_wait 80
	anim_obj ANIM_OBJ_MAGMA, 114, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 114, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 28, $30
    anim_clearobjs
	anim_sound 0, 1, SFX_EMBER
	anim_obj ANIM_OBJ_MAGMA, 114, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 68, $30
	anim_obj ANIM_OBJ_MAGMA, 132, 48, $30
	anim_obj ANIM_OBJ_MAGMA, 114, 28, $30
	anim_obj ANIM_OBJ_MAGMA, 150, 28, $30
	anim_wait 80
	anim_ret
    
BattleAnim_MysticalFire:
	anim_1gfx ANIM_GFX_FIRE
	anim_sound 6, 2, SFX_EMBER
    anim_call BattleAnim_MysticalFireFlames
	anim_wait 16
.loop
	anim_sound 0, 1, SFX_EMBER
	anim_wait 16
	anim_loop 4, .loop
	anim_wait 16
	anim_ret

BattleAnim_MysticalFireFlames:
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 64, 92, $3
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 75, 86, $5
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 85, 81, $7
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 96, 76, $9
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 106, 71, $b
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 116, 66, $c
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 126, 61, $a
	anim_wait 2
	anim_obj ANIM_OBJ_MYSTICAL_FIRE, 136, 56, $8
    anim_ret
    
BattleAnim_SearingShot:
	anim_1gfx ANIM_GFX_FIRE
    anim_call BattleAnim_FlameWheelPillar
	anim_wait 112
	anim_sound 6, 2, SFX_EMBER
    anim_call BattleAnim_FlamethrowerFlames
    anim_wait 38
    anim_ret
    
BattleAnim_AnchorShot:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_ROPE
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $1, $40
    anim_wait 8
	anim_sound 0, 1, SFX_BIND
	anim_obj ANIM_OBJ_49, 132, 64, $0
	anim_wait 8
	anim_obj ANIM_OBJ_48, 132, 48, $0
	anim_wait 72
	anim_ret
    
BattleAnim_MagnetBomb:
	anim_2gfx ANIM_GFX_EGG, ANIM_GFX_REFLECT
	anim_call BattleAnim_TargetObj_1Row
	anim_call BattleAnim_MetalSheen
	anim_call BattleAnim_ShowMon_0
    anim_wait 2
	anim_sound 6, 2, SFX_SLUDGE_BOMB
	anim_obj ANIM_OBJ_SLUDGE_BOMB, 64, 92, $10
	anim_wait 36
	anim_sound 0, 1, SFX_EGG_BOMB
	anim_bgeffect ANIM_BG_HORIZONTAL_SHAKE, $20, $1, $40
    anim_wait 32
	anim_ret