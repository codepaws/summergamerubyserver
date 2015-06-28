## Generated from messages.proto
require "beefcake"
require_relative 'messages.enum.pb.rb'

class CTowerAttack_GameData
  include Beefcake::Message

  class ActiveAbility
    include Beefcake::Message
  end

  class Enemy
    include Beefcake::Message
  end

  class Lane
    include Beefcake::Message
  end

  class Event
    include Beefcake::Message
  end
end

class CTowerAttack_Stats
  include Beefcake::Message
end

class CTowerAttack_PlayerData
  include Beefcake::Message

  class ActiveAbility
    include Beefcake::Message
  end

  class Loot
    include Beefcake::Message
  end
end

class CTowerAttack_PlayerTechTree
  include Beefcake::Message

  class Upgrade
    include Beefcake::Message
  end

  class AbilityItem
    include Beefcake::Message
  end
end

class CTowerAttack_GetGameData_Request
  include Beefcake::Message
end

class CTowerAttack_GetGameData_Response
  include Beefcake::Message
end

class CTowerAttack_GetPlayerNames_Request
  include Beefcake::Message
end

class CTowerAttack_GetPlayerNames_Response
  include Beefcake::Message

  class PlayerName
    include Beefcake::Message
  end
end

class CTowerAttack_GetPlayerData_Request
  include Beefcake::Message
end

class CTowerAttack_GetPlayerData_Response
  include Beefcake::Message
end

class CTowerAttack_UseAbilities_Request
  include Beefcake::Message

  class UseAbilityData
    include Beefcake::Message
  end
end

class CTowerAttack_UseAbilities_Response
  include Beefcake::Message
end

class CTowerAttack_ChooseUpgrade_Request
  include Beefcake::Message
end

class CTowerAttack_ChooseUpgrade_Response
  include Beefcake::Message
end

class CTowerAttack_GetTuningData_Request
  include Beefcake::Message
end

class CTowerAttack_GetTuningData_Response
  include Beefcake::Message
end

class CTowerAttack_GetDailyStatsRollup_Request
  include Beefcake::Message
end

class CTowerAttack_GetDailyStatsRollup_Response
  include Beefcake::Message
end

class CTowerAttack_HandleGameEvent_Request
  include Beefcake::Message
end

class CTowerAttack_HandleGameEvent_Response
  include Beefcake::Message
end

class CTowerAttack_UseBadgePoints_Request
  include Beefcake::Message
end

class CTowerAttack_UseBadgePoints_Response
  include Beefcake::Message
end

class CTowerAttack_GameData

  class ActiveAbility
    optional :accountid_caster, :uint32, 1
    optional :ability, :uint32, 2
    optional :timestamp_done, :uint32, 3
    optional :multiplier, :double, 4
  end

  class Enemy
    optional :id, :uint64, 1
    optional :type, ETowerAttackEnemyType, 2
    optional :hp, :double, 3
    optional :max_hp, :double, 4
    optional :dps, :double, 5
    optional :timer, :double, 6
    optional :gold, :double, 7
  end

  class Lane
    repeated :enemies, CTowerAttack_GameData::Enemy, 1
    optional :dps, :double, 2
    optional :gold_dropped, :double, 3
    repeated :active_player_abilities, CTowerAttack_GameData::ActiveAbility, 4
    repeated :player_hp_buckets, :uint32, 5
    optional :element, ETowerAttackElement, 6
    optional :active_player_ability_decrease_cooldowns, :double, 7, :default => 1
    optional :active_player_ability_gold_per_click, :double, 8, :default => 0
  end

  class Event
    optional :event, ETowerAttackEvent, 1
    optional :time_start, :uint32, 2
    optional :time_end, :uint32, 3
  end
  optional :level, :uint32, 1
  repeated :lanes, CTowerAttack_GameData::Lane, 2
  optional :timestamp, :uint32, 3
  optional :status, EMiniGameStatus, 4
  repeated :events, CTowerAttack_GameData::Event, 5
  optional :timestamp_game_start, :uint32, 6
  optional :timestamp_level_start, :uint32, 7
  optional :universe_state, :string, 8
end

class CTowerAttack_Stats
  optional :num_players, :uint32, 1
  optional :num_mobs_killed, :uint64, 2
  optional :num_towers_killed, :uint64, 3
  optional :num_minibosses_killed, :uint64, 4
  optional :num_bosses_killed, :uint64, 5
  optional :num_clicks, :uint64, 6
  optional :num_abilities_activated, :uint64, 7
  optional :num_players_reaching_milestone_level, :uint64, 8
  optional :num_ability_items_activated, :uint64, 9
  optional :num_active_players, :uint32, 10
  optional :time_simulating, :double, 11
  optional :time_saving, :double, 12
end

class CTowerAttack_PlayerData

  class ActiveAbility
    optional :ability, :uint32, 1
    optional :timestamp_done, :uint32, 2
    optional :timestamp_cooldown, :uint32, 3
  end

  class Loot
    optional :ability, ETowerAttackAbility, 1
  end
  optional :hp, :double, 1
  optional :current_lane, :uint32, 2
  optional :target, :uint32, 3
  optional :time_died, :uint32, 4
  optional :gold, :double, 5
  optional :active_abilities_bitfield, :uint64, 6
  repeated :active_abilities, CTowerAttack_PlayerData::ActiveAbility, 7
  optional :crit_damage, :double, 8
  repeated :loot, CTowerAttack_PlayerData::Loot, 9
end

class CTowerAttack_PlayerTechTree

  class Upgrade
    optional :upgrade, :uint32, 1
    optional :level, :uint32, 2
    optional :cost_for_next_level, :double, 3
  end

  class AbilityItem
    optional :ability, ETowerAttackAbility, 1
    optional :quantity, :uint32, 2
  end
  repeated :upgrades, CTowerAttack_PlayerTechTree::Upgrade, 1
  optional :damage_per_click, :double, 2, :default => 1
  optional :damage_multiplier_fire, :double, 3, :default => 1
  optional :damage_multiplier_water, :double, 4, :default => 1
  optional :damage_multiplier_air, :double, 5, :default => 1
  optional :damage_multiplier_earth, :double, 6, :default => 1
  optional :damage_multiplier_crit, :double, 7, :default => 2
  optional :unlocked_abilities_bitfield, :uint64, 8, :default => 0
  optional :hp_multiplier, :double, 9, :default => 1
  optional :crit_percentage, :double, 10, :default => 0
  optional :badge_points, :double, 11
  repeated :ability_items, CTowerAttack_PlayerTechTree::AbilityItem, 12
  optional :boss_loot_drop_percentage, :double, 13, :default => 0.25
  optional :damage_multiplier_dps, :double, 14, :default => 1
  optional :base_dps, :double, 15
  optional :damage_per_click_multiplier, :double, 16, :default => 1
  optional :max_hp, :double, 17
  optional :dps, :double, 18
end

class CTowerAttack_GetGameData_Request
  optional :gameid, :uint64, 1
  optional :include_stats, :bool, 2
end

class CTowerAttack_GetGameData_Response
  optional :game_data, CTowerAttack_GameData, 1
  optional :stats, CTowerAttack_Stats, 2
end

class CTowerAttack_GetPlayerNames_Request
  optional :gameid, :uint64, 1
  repeated :accountids, :uint32, 2
end

class CTowerAttack_GetPlayerNames_Response

  class PlayerName
    optional :accountid, :uint32, 1
    optional :name, :string, 2
  end
  repeated :names, CTowerAttack_GetPlayerNames_Response::PlayerName, 1
end

class CTowerAttack_GetPlayerData_Request
  optional :gameid, :uint64, 1
  optional :include_tech_tree, :bool, 2, :default => false
  optional :steamid, :uint64, 3
end

class CTowerAttack_GetPlayerData_Response
  optional :player_data, CTowerAttack_PlayerData, 1
  optional :tech_tree, CTowerAttack_PlayerTechTree, 2
end

class CTowerAttack_UseAbilities_Request

  class UseAbilityData
    optional :ability, ETowerAttackAbility, 1
    optional :new_lane, :uint32, 2
    optional :new_target, :uint32, 3
    optional :num_clicks, :uint32, 4
  end
  optional :gameid, :uint64, 1
  repeated :requested_abilities, CTowerAttack_UseAbilities_Request::UseAbilityData, 2
end

class CTowerAttack_UseAbilities_Response
  optional :player_data, CTowerAttack_PlayerData, 1
  optional :tech_tree, CTowerAttack_PlayerTechTree, 2
end

class CTowerAttack_ChooseUpgrade_Request
  optional :gameid, :uint64, 1
  repeated :upgrades, :uint32, 2
end

class CTowerAttack_ChooseUpgrade_Response
  optional :tech_tree, CTowerAttack_PlayerTechTree, 1
end

class CTowerAttack_GetTuningData_Request
end

class CTowerAttack_GetTuningData_Response
  optional :json, :string, 1
end

class CTowerAttack_GetDailyStatsRollup_Request
  optional :timestamp, :uint32, 1
end

class CTowerAttack_GetDailyStatsRollup_Response
  optional :stats, CTowerAttack_Stats, 1
end

class CTowerAttack_HandleGameEvent_Request
  optional :gameid, :uint64, 1
  optional :event, ETowerAttackEvent, 2
end

class CTowerAttack_HandleGameEvent_Response
end

class CTowerAttack_UseBadgePoints_Request
  optional :gameid, :uint64, 1
  repeated :ability_items, ETowerAttackAbility, 2
end

class CTowerAttack_UseBadgePoints_Response
  optional :tech_tree, CTowerAttack_PlayerTechTree, 1
end
