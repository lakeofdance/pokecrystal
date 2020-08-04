; battle commands are defined in engine/battle/effect_commands.asm

	dw 0 ; padding

BattleCommandPointers:
; entries correspond to macros/scripts/battle_commands.asm
	dba BattleCommand_CheckObedience
	dba BattleCommand_UsedMoveText
	dba BattleCommand_DoTurn
	dba BattleCommand_Critical
	dba BattleCommand_DamageStats
	dba BattleCommand_Stab
	dba BattleCommand_DamageVariation
	dba BattleCommand_CheckHit
	dba BattleCommand_LowerSub
	dba BattleCommand_MoveAnimNoSub
	dba BattleCommand_RaiseSub
	dba BattleCommand_FailureText
	dba BattleCommand_ApplyDamage
	dba BattleCommand_CriticalText
	dba BattleCommand_SuperEffectiveText
	dba BattleCommand_CheckFaint
	dba BattleCommand_BuildOpponentRage
	dba BattleCommand_PoisonTarget
	dba BattleCommand_SleepTarget
	dba BattleCommand_DrainTarget
	dba BattleCommand_EatDream
	dba BattleCommand_BurnTarget
	dba BattleCommand_FreezeTarget
	dba BattleCommand_ParalyzeTarget
	dba BattleCommand_Selfdestruct
	dba BattleCommand_MirrorMove
	dba BattleCommand_PayDay
	dba BattleCommand_Conversion
	dba BattleCommand_ResetStats
	dba BattleCommand_StoreEnergy
	dba BattleCommand_UnleashEnergy
	dba BattleCommand_ForceSwitch
	dba BattleCommand_EndLoop
	dba BattleCommand_FlinchTarget
	dba BattleCommand_OHKO
	dba BattleCommand_Recoil
	dba BattleCommand_Mist
	dba BattleCommand_FocusEnergy
	dba BattleCommand_Confuse
	dba BattleCommand_ConfuseTarget
	dba BattleCommand_Heal
	dba BattleCommand_Transform
	dba BattleCommand_Screen
	dba BattleCommand_Poison
	dba BattleCommand_Paralyze
	dba BattleCommand_Substitute
	dba BattleCommand_RechargeNextTurn
	dba BattleCommand_Mimic
	dba BattleCommand_Metronome
	dba BattleCommand_LeechSeed
	dba BattleCommand_Splash
	dba BattleCommand_Disable
	dba BattleCommand_ClearText
	dba BattleCommand_Charge
	dba BattleCommand_CheckCharge
	dba BattleCommand_TrapTarget
	dba BattleCommand_Rampage
	dba BattleCommand_CheckRampage
	dba BattleCommand_ConstantDamage
	dba BattleCommand_Counter
	dba BattleCommand_Encore
	dba BattleCommand_PainSplit
	dba BattleCommand_Snore
	dba BattleCommand_Conversion2
	dba BattleCommand_LockOn
	dba BattleCommand_Sketch
	dba BattleCommand_SleepTalk
	dba BattleCommand_DestinyBond
	dba BattleCommand_Spite
	dba BattleCommand_FalseSwipe
	dba BattleCommand_HealBell
	dba BattleCommand_HeldFlinch
	dba BattleCommand_TripleKick
	dba BattleCommand_KickCounter
	dba BattleCommand_Thief
	dba BattleCommand_ArenaTrap
	dba BattleCommand_Nightmare
	dba BattleCommand_Defrost
	dba BattleCommand_Curse
	dba BattleCommand_Protect
	dba BattleCommand_Spikes
	dba BattleCommand_Foresight
	dba BattleCommand_PerishSong
	dba BattleCommand_StartSandstorm
	dba BattleCommand_Endure
	dba BattleCommand_CheckCurl
	dba BattleCommand_RolloutPower
	dba BattleCommand_FuryCutter
	dba BattleCommand_Attract
	dba BattleCommand_HappinessPower
	dba BattleCommand_Present
	dba BattleCommand_DamageCalc
	dba BattleCommand_FrustrationPower
	dba BattleCommand_Safeguard
	dba BattleCommand_CheckSafeguard
	dba BattleCommand_GetMagnitude
	dba BattleCommand_BatonPass
	dba BattleCommand_Pursuit
	dba BattleCommand_ClearHazards
	dba BattleCommand_HealMorn
	dba BattleCommand_HealDay
	dba BattleCommand_HealNite
	dba BattleCommand_HiddenPower
	dba BattleCommand_StartRain
	dba BattleCommand_StartSun
	dba BattleCommand_AttackUp
	dba BattleCommand_DefenseUp
	dba BattleCommand_SpeedUp
	dba BattleCommand_SpecialAttackUp
	dba BattleCommand_SpecialDefenseUp
	dba BattleCommand_AccuracyUp
	dba BattleCommand_EvasionUp
	dba BattleCommand_AttackUp2
	dba BattleCommand_DefenseUp2
	dba BattleCommand_SpeedUp2
	dba BattleCommand_SpecialAttackUp2
	dba BattleCommand_SpecialDefenseUp2
	dba BattleCommand_AccuracyUp2
	dba BattleCommand_EvasionUp2
	dba BattleCommand_AttackDown
	dba BattleCommand_DefenseDown
	dba BattleCommand_SpeedDown
	dba BattleCommand_SpecialAttackDown
	dba BattleCommand_SpecialDefenseDown
	dba BattleCommand_AccuracyDown
	dba BattleCommand_EvasionDown
	dba BattleCommand_AttackDown2
	dba BattleCommand_DefenseDown2
	dba BattleCommand_SpeedDown2
	dba BattleCommand_SpecialAttackDown2
	dba BattleCommand_SpecialDefenseDown2
	dba BattleCommand_AccuracyDown2
	dba BattleCommand_EvasionDown2
	dba BattleCommand_StatUpMessage
	dba BattleCommand_StatDownMessage
	dba BattleCommand_StatUpFailText
	dba BattleCommand_StatDownFailText
	dba BattleCommand_EffectChance
	dba BattleCommand_StatDownAnim
	dba BattleCommand_StatUpAnim
	dba BattleCommand_SwitchTurn
	dba BattleCommand_BellyDrum
	dba BattleCommand_PsychUp
	dba BattleCommand_Rage
	dba BattleCommand_DoubleFlyingDamage
	dba BattleCommand_DoubleUndergroundDamage
	dba BattleCommand_MirrorCoat
	dba BattleCommand_CheckFutureSight
	dba BattleCommand_FutureSight
	dba BattleCommand_DoubleMinimizeDamage
	dba BattleCommand_SkipSunCharge
	dba BattleCommand_ThunderAccuracy
	dba BattleCommand_Teleport
	dba BattleCommand_BeatUp
	dba BattleCommand_RageDamage
	dba BattleCommand_ResetTypeMatchup
	dba BattleCommand_AllStatsUp
	dba BattleCommand_BideFailText
	dba BattleCommand_RaiseSubNoAnim
	dba BattleCommand_LowerSubNoAnim
	dba BattleCommand_BeatUpFailText
	dba BattleCommand_ClearMissDamage
	dba BattleCommand_MoveDelay
	dba BattleCommand_MoveAnim
	dba BattleCommand_TriStatusChance
	dba BattleCommand_SuperEffectiveLoopText
	dba BattleCommand_StartLoop
	dba BattleCommand_Curl
	dba BattleCommand_BurnUp
	dba BattleCommand_BurnUpText
