require 'json'

class CTowerAttack_UseAbilities_Request
  def self.handle_request(params)
    r = JSON.parse(params['input_json'])
    request = self.new(:gameid => r['gameid'], :requested_abilities => [])

    r['requested_abilities'].each do |ability|
      request_ability = CTowerAttack_UseAbilities_Request::UseAbilityData.new
      request_ability.ability     = !ability.key?('ability')    ? nil : ability['ability']
      request_ability.new_lane    = !ability.key?('new_lane')   ? nil : ability['new_lane']
      request_ability.new_target  = !ability.key?('new_target') ? nil : ability['new_target']
      request_ability.num_clicks  = !ability.key?('num_clicks') ? nil : ability['num_clicks']

      request.requested_abilities << request_ability
    end

    # handle abilities
    #
    #

    log = "Input: #{PP.pp(params, '')}\nOutput:\n#{request.inspect}"
    File.open('stream_log.txt', 'a') { |file| file.write("#{Time.now.strftime('%Y%m%d-%H:%M:%S')} # CTowerAttack_UseAbilities_Request\n#{log}") }

    return request
  end
end
