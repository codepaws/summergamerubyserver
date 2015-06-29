class CTowerAttack_UseAbilities_Response
  def self.create_response(gid, abilities)

    # seem to be missing the steam id from the request so not sure what player is firing off the ability.

    use_abilities_rsp = self.new(
      :player_data  => CTowerAttack_PlayerData::db_create_player_data(1),
      :tech_tree    => CTowerAttack_PlayerTechTree::dbCreate_PlayerTechTree(1)
    )
    
    log = "Input:{gid => #{gid}}\nOutput:\n#{use_abilities_rsp.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetPlayerData_Response\n#{log}\n\n") }
  
    return use_abilities_rsp
    
  end
end