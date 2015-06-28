class CTowerAttack_GetGameData_Request
  def self.handle_request(params)
    request = self.new(:gameid => params['gameid'].to_i, :include_stats => params['include_stats'])


    log = "Input:{gid => #{request[:gameid]}, include_stats => #{request[:include_stats]}}\nOutput:\n#{request.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_GetGameData_Request\n#{log}\n\n") }
    return request
  end
end
