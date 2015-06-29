class CTowerAttack_GetPlayerData_Response
  def self.create_response(gid, steamid, include_tech_tree=0)
    player_data_rsp = self.new(
      :player_data  => CTowerAttack_PlayerData::db_create_player_data(steamid),
      :tech_tree    => include_tech_tree == 0 ? nil : CTowerAttack_PlayerTechTree::dbCreate_PlayerTechTree(steamid)
    )
    
    log = "Input:{gid => #{gid}, steamid => #{steamid}, include_tech_tree => #{include_tech_tree}}\nOutput:\n#{player_data_rsp.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetPlayerData_Response\n#{log}\n\n") }
  
    return player_data_rsp
  end
end