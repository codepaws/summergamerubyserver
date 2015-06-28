class CTowerAttack_GetPlayerData_Request
  def self.handle_request(params)
    request = self.new(:gameid => params['gameid'], :include_tech_tree => params['include_tech_tree'].to_i, :steamid => params['steamid'])

    log = "Input:{gid => #{request[:gameid]}, steamid => #{request[:steamid]}, include_tech_tree => #{request[:include_tech_tree]}}\nOutput:\n#{request.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetPlayerData_Request\n#{log}") }
    
    return request
  end
end