class CTowerAttack_PlayerTechTree
  def self.dbCreate_PlayerTechTree(steamid)
    tech_tree_db = PlayerTechTree.first(:steamid => steamid)

    tech_tree = self.new(
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

    return tech_tree
  end
end