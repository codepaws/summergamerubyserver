class CTowerAttack_PlayerData
  def self.db_create_player_data(steamid)
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

    return player_data
  end
end