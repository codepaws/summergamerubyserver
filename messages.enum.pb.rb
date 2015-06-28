require "beefcake"

module EMiniGameType
  K_EMiniGameType_Invalid = 0
  K_EMiniGameType_TowerAttack = 1
end

module EMiniGameStatus
  K_EMiniGameStatus_Invalid = 0
  K_EMiniGameStatus_WaitingForPlayers = 1
  K_EMiniGameStatus_Running = 2
  K_EMiniGameStatus_Ended = 3
end

module ETowerAttackElement
  K_ETowerAttackElement_Invalid = 0
  K_ETowerAttackElement_Fire = 1
  K_ETowerAttackElement_Water = 2
  K_ETowerAttackElement_Air = 3
  K_ETowerAttackElement_Earth = 4
end

module ETowerAttackAbility
  K_ETowerAttackAbility_Invalid = 0
  K_ETowerAttackAbility_Attack = 1
  K_ETowerAttackAbility_ChangeLane = 2
  K_ETowerAttackAbility_Respawn = 3
  K_ETowerAttackAbility_ChangeTarget = 4
  K_ETowerAttackAbility_Support_IncreaseDamage = 5
  K_ETowerAttackAbility_Support_IncreaseCritPercentage = 6
  K_ETowerAttackAbility_Support_Heal = 7
  K_ETowerAttackAbility_Support_IncreaseGoldDropped = 8
  K_ETowerAttackAbility_Support_DecreaseCooldowns = 9
  K_ETowerAttackAbility_Offensive_HighDamageOneTarget = 10
  K_ETowerAttackAbility_Offensive_DamageAllTargets = 11
  K_ETowerAttackAbility_Offensive_DOTAllTargets = 12
  K_ETowerAttackAbility_Item_Resurrection = 13
  K_ETowerAttackAbility_Item_KillTower = 14
  K_ETowerAttackAbility_Item_KillMob = 15
  K_ETowerAttackAbility_Item_MaxElementalDamage = 16
  K_ETowerAttackAbility_Item_GoldPerClick = 17
  K_ETowerAttackAbility_Item_IncreaseCritPercentagePermanently = 18
  K_ETowerAttackAbility_Item_IncreaseHPPermanently = 19
  K_ETowerAttackAbility_Item_GoldForDamage = 20
  K_ETowerAttackAbility_Item_Invulnerability = 21
  K_ETowerAttackAbility_Item_GiveGold = 22
  K_ETowerAttackAbility_Item_StealHealth = 23
  K_ETowerAttackAbility_Item_ReflectDamage = 24
  K_ETowerAttackAbility_Item_GiveRandomItem = 25
  K_ETowerAttackAbility_Item_SkipLevels = 26
  K_ETowerAttackAbility_Item_ClearCooldowns = 27
  K_ETowerAttackAbility_Item_Start = 13
  K_ETowerAttackAbility_Item_End = 27
  K_ETowerAttackAbility_MaxAbilities = 28
end

module ETowerAttackUpgradeType
  K_ETowerAttackUpgradeType_HitPoints = 0
  K_ETowerAttackUpgradeType_DPS = 1
  K_ETowerAttackUpgradeType_ClickDamage = 2
  K_ETowerAttackUpgradeType_DamageMultiplier_Fire = 3
  K_ETowerAttackUpgradeType_DamageMultiplier_Water = 4
  K_ETowerAttackUpgradeType_DamageMultiplier_Air = 5
  K_ETowerAttackUpgradeType_DamageMultiplier_Earth = 6
  K_ETowerAttackUpgradeType_DamageMultiplier_Crit = 7
  K_ETowerAttackUpgradeType_PurchaseAbility = 8
  K_ETowerAttackUpgradeType_BossLootDropPercentage = 9
  K_ETowerAttackUpgradeType_MaxTypes = 10
end

module ETowerAttackEnemyType
  K_ETowerAttackEnemyType_Tower = 0
  K_ETowerAttackEnemyType_Mob = 1
  K_ETowerAttackEnemyType_Boss = 2
  K_ETowerAttackEnemyType_MiniBoss = 3
  K_ETowerAttackEnemyType_TreasureMob = 4
  K_ETowerAttackEnemyType_Max = 5
end

module ETowerAttackEvent
  K_ETowerAttackEvent_Invalid = 0
  K_ETowerAttackEvent_NewStoreDeals_Morning = 1
  K_ETowerAttackEvent_NewStoreDeals_Evening = 2
end