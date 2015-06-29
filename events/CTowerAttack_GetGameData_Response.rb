class CTowerAttack_GetGameData_Response
  def self.create_response(gid, stats_flag=0)
    stats_flag = stats_flag.to_i
    
    game_data_rsp = self.new(
      :game_data  => CTowerAttack_GameData::db_create_game_data(gid),
      :stats      => stats_flag == 0 ? nil : CTowerAttack_Stats::db_create_stats(gid)
    )

    log = "Input:{gid => #{gid}, stats_flag => #{stats_flag}}\nOutput:\n#{game_data_rsp.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetGameData_Response\n#{log}\n\n") }

    return game_data_rsp
  end
end