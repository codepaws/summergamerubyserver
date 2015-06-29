class CTowerAttack_GameData
  def self.db_create_game_data(gid)
    game = GameData.first(:id => gid)

    stats = nil
    game_data = CTowerAttack_GameData.new(
      :level                 => game[:level],
      :lanes                 => [],
      :timestamp             => game[:timestamp],
      :status                => game[:EMiniGameStatus],
      :events                => [],
      :timestamp_game_start  => game[:timestamp_game_start],
      :timestamp_level_start => game[:timestamp_level_start],
      :universe_state        => game[:universe_state]
    )

    game.gd_lanes.all.each do |db_lane|
      lane = CTowerAttack_GameData::Lane.new(
        :dps                                      => db_lane[:dps],
        :gold_dropped                             => db_lane[:gold_dropped],
        :player_hp_buckets                        => db_lane[:player_hp_buckets],
        :element                                  => db_lane[:ETowerAttackElement],
        :enemies                                  => [],
        :active_player_abilities                  => [],
        :active_player_ability_decrease_cooldowns => db_lane[:active_player_ability_decrease_cooldowns],
        :active_player_ability_gold_per_click     => db_lane[:active_player_ability_gold_per_click],
      )

      db_lane.gd_active_abilities.all.each do |db_ability|
        lane[:active_player_abilities] << CTowerAttack_GameData::ActiveAbility(
          :accountid_caster => db_ability[:accountid_caster],
          :ability          => db_ability[:ability],
          :timestamp_done   => db_ability[:timestamp_done],
          :multiplier       => db_ability[:multiplier].to_f
        )
      end

      db_lane.gd_enemies.all.each do |db_enemy|
        lane[:enemies] << CTowerAttack_GameData::Enemy.new(
          :id       => db_enemy[:id],
          :type     => db_enemy[:ETowerAttackEnemyType],
          :hp       => db_enemy[:hp].to_f,
          :max_hp   => db_enemy[:max_hp].to_f,
          :dps      => db_enemy[:dps].to_f,
          :gold     => db_enemy[:gold].to_f,
        )
      end

      game_data.lanes << lane
    end

    return game_data
  end

end