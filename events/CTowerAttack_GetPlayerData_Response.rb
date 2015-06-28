class CTowerAttack_GetPlayerData_Response
  def self.create_response(gid, steamid, include_tech_tree=0)
    player_data_db = PlayerData.first(:steamid => steamid)

    player_data = CTowerAttack_PlayerData.new(
      :hp                         => player_data_db[:hp].to_f,
      :current_lane               => player_data_db[:current_lane],
      :target                     => player_data_db[:target],
      :time_died                  => player_data_db[:time_died],
      :gold                       => player_data_db[:gold].to_f,
      :active_abilities_bitfield  => player_data_db[:active_abilities_bitfield],
      :active_abilities           => [],
      :crit_damage                => player_data_db[:crit_damage].to_f,
      :loot                       => [],
    )

    tech_tree = nil
    puts "-------------------------------------------------"
    pp include_tech_tree
    puts "-------------------------------------------------"
    if include_tech_tree != 0
      tech_tree_db = PlayerTechTree.first(:steamid => steamid)

      tech_tree = CTowerAttack_PlayerTechTree.new(
        :upgrades                       => [],
        :damage_per_click               => tech_tree_db[:damage_per_click].to_f,
        :damage_multiplier_fire         => tech_tree_db[:damage_multiplier_fire].to_f,
        :damage_multiplier_water        => tech_tree_db[:damage_multiplier_water].to_f,
        :damage_multiplier_air          => tech_tree_db[:damage_multiplier_air].to_f,
        :damage_multiplier_earth        => tech_tree_db[:damage_multiplier_earth].to_f,
        :damage_multiplier_crit         => tech_tree_db[:damage_multiplier_crit].to_f,
        :unlocked_abilities_bitfield    => tech_tree_db[:unlocked_abilities_bitfield],
        :hp_multiplier                  => tech_tree_db[:hp_multiplier].to_f,
        :crit_percentage                => tech_tree_db[:crit_percentage].to_f,
        :badge_points                   => tech_tree_db[:badge_points].to_f,
        :ability_items                  => [],
        :boss_loot_drop_percentage      => tech_tree_db[:boss_loot_drop_percentage].to_f,
        :damage_multiplier_dps          => tech_tree_db[:damage_multiplier_dps].to_f,
        :damage_per_click_multiplier    => tech_tree_db[:damage_per_click_multiplier].to_f,
        :max_hp                         => tech_tree_db[:max_hp].to_f,
        :dps                            => tech_tree_db[:dps].to_f
      )

      tech_tree_db.ptt_upgrades.all.each do |upgrades_db|
        tech_tree.upgrades << CTowerAttack_PlayerTechTree::Upgrade.new(
          :upgrade              => upgrades_db[:upgrade],
          :level                => upgrades_db[:level],
          :cost_for_next_level  => upgrades_db[:cost_for_next_level].to_f
        )
      end
      tech_tree_db.ptt_ability_items.all.each do |ability_items_db|
        tech_tree.ability_items << CTowerAttack_PlayerTechTree::AbilityItem.new(
          :ability  => ability_items_db[:ability],
          :quantity => ability_items_db[:quantity]
        )
      end
    end

    player_data_rsp = self.new(:player_data => player_data, :tech_tree => tech_tree)
    
    log = "Input:{gid => #{gid}, steamid => #{steamid}, include_tech_tree => #{include_tech_tree}}\nOutput:\n#{player_data_rsp.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetPlayerData_Response\n#{log}\n\n") }
  
    return player_data_rsp
  end
end