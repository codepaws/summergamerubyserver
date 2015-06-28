require 'pp'

puts "###################################################"
puts "Loading Defaults"
puts "###################################################"
game_id = 49943

game = GameData.create(
  :id => game_id,
  :level => 1, 
  :timestamp => Time.now.to_i,
  :EMiniGameStatus => EMiniGameStatus::K_EMiniGameStatus_Running, 
  :timestamp_game_start => Time.now.to_i - 10, 
  :timestamp_level_start => Time.now.to_i - 10, 
  :universe_state => nil
)
game.save

$i = 0
while $i < 3  do
  game.gd_lanes.create(
    :dps                                      => 0,
    :gold_dropped                             => nil,
    :player_hp_buckets                        => 1,
    :ETowerAttackElement                      => ETowerAttackElement::K_ETowerAttackElement_Earth,
    :active_player_ability_decrease_cooldowns => 0,
    :active_player_ability_gold_per_click     => 0
  )
  $i +=1
end

game.gd_lanes.all.each do |lane|
  lane.gd_enemies.create(
    :ETowerAttackEnemyType  => ETowerAttackEnemyType::K_ETowerAttackEnemyType_Boss,
    :hp                     => 1000,
    :max_hp                 => 1000,
    :dps                    => 10,
    :gold                   => 5000
  )
end

## player data
player_data = PlayerData.create(
  :steamid      => 1,
  :hp           => 1000,
  :current_lane => 1,
  :target       => 0,
  :time_died    => nil,
  :gold         => 0,
  :active_abilities_bitfield => 0,
  :crit_damage  => 0
)


tech_tree = PlayerTechTree.create(
  :steamid => 1,
  :damage_per_click => 10,
  :damage_multiplier_fire => 1,
  :damage_multiplier_water => 1,
  :damage_multiplier_air => 1,
  :damage_multiplier_earth => 1,
  :damage_multiplier_crit => 2,
  :unlocked_abilities_bitfield => 0,
  :damage_per_click_multiplier => 1,
  :badge_points => 0,
  :boss_loot_drop_percentage => 0.25,
  :damage_multiplier_dps => 1,
  :base_dps => 1,
  :hp_multiplier => 935.29999,
  :crit_percentage => 0.1,
  :max_hp => 935299.99948,
  :dps => 0
)

upgrade_list = [
  {:upgrade => 0,:level => 11, :cost_for_next_level => 2384180},
  {:upgrade => 1,:level => 0, :cost_for_next_level => 150},
  {:upgrade => 2,:level => 0, :cost_for_next_level => 200},
  {:upgrade => 3,:level => 0, :cost_for_next_level => 50},
  {:upgrade => 4,:level => 0, :cost_for_next_level => 50},
  {:upgrade => 5,:level => 0, :cost_for_next_level => 50},
  {:upgrade => 6,:level => 0, :cost_for_next_level => 50},
  {:upgrade => 7,:level => 0, :cost_for_next_level => 50},
  {:upgrade => 8,:level => 12, :cost_for_next_level => 128550050},
  {:upgrade => 9,:level => 0, :cost_for_next_level => 10000},
  {:upgrade => 10,:level => 0, :cost_for_next_level => 10000},
  {:upgrade => 11,:level => 0, :cost_for_next_level => 5000},
  {:upgrade => 12,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 13,:level => 0, :cost_for_next_level => 1000000},
  {:upgrade => 14,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 15,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 16,:level => 0, :cost_for_next_level => 100000},
  {:upgrade => 17,:level => 0, :cost_for_next_level => 1000000},
  {:upgrade => 18,:level => 0, :cost_for_next_level => 2000000},
  {:upgrade => 19,:level => 0, :cost_for_next_level => 100000},
  {:upgrade => 20,:level => 8, :cost_for_next_level => 54875880},
  {:upgrade => 21,:level => 0, :cost_for_next_level => 100000},
  {:upgrade => 22,:level => 0, :cost_for_next_level => 100000},
  {:upgrade => 23,:level => 0, :cost_for_next_level => 1000000},
  {:upgrade => 24,:level => 0, :cost_for_next_level => 1000000},
  {:upgrade => 25,:level => 0, :cost_for_next_level => 1000000},
  {:upgrade => 26,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 27,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 28,:level => 0, :cost_for_next_level => 10000000},
  {:upgrade => 29,:level => 0, :cost_for_next_level => 100000000},
  {:upgrade => 30,:level => 0, :cost_for_next_level => 100000000},
  {:upgrade => 31,:level => 0, :cost_for_next_level => 100000000},
  {:upgrade => 32,:level => 0, :cost_for_next_level => 1000000000},
  {:upgrade => 33,:level => 0, :cost_for_next_level => 1000000000},
  {:upgrade => 34,:level => 0, :cost_for_next_level => 1000000000},
  {:upgrade => 35,:level => 0, :cost_for_next_level => 10000000000},
  {:upgrade => 36,:level => 0, :cost_for_next_level => 10000000000},
  {:upgrade => 37,:level => 0, :cost_for_next_level => 10000000000},
  {:upgrade => 38,:level => 0, :cost_for_next_level => 99999997952},
  {:upgrade => 39,:level => 0, :cost_for_next_level => 99999997952},
  {:upgrade => 40,:level => 0, :cost_for_next_level => 99999997952},
  {:upgrade => 41,:level => 0, :cost_for_next_level => 999999995904},
  {:upgrade => 42,:level => 0, :cost_for_next_level => 999999995904},
  {:upgrade => 43,:level => 0, :cost_for_next_level => 999999995904}
]

upgrade_list.each do |upgrade|
  tech_tree.ptt_upgrades.create(
    :upgrade              => upgrade[:upgrade],
    :level                => upgrade[:level],
    :cost_for_next_level  => upgrade[:cost_for_next_level],
  )
end

ability_list = [
  {:ability => 27, :quantity => 42580},
  {:ability => 20, :quantity => 2},
  {:ability => 13, :quantity => 1},
  {:ability => 14, :quantity => 4},
  {:ability => 18, :quantity => 4},
  {:ability => 17, :quantity => 3},
  {:ability => 19, :quantity => 5},
  {:ability => 16, :quantity => 1},
  {:ability => 21, :quantity => 2},
  {:ability => 24, :quantity => 4},
  {:ability => 26, :quantity => 57038},
  {:ability => 15, :quantity => 2},
  {:ability => 23, :quantity => 1}
]

ability_list.each do |ability|
  tech_tree.ptt_ability_items.create(
    :ETowerAttackAbility  => ability[:ability],
    :quantity             => ability[:quantity],
  )
end