# "POST /ITowerAttackMiniGameService/UseAbilities/v0001/ HTTP/1.1" 404 520 0.0020

post '/ITowerAttackMiniGameService/UseAbilities/v0001/' do 
  #{"input_json"=>"{\"requested_abilities\":[{\"ability\":2,\"new_lane\":1}],\"gameid\":\"49943\"}","access_token"=>"28d39e6467b5c35a50c8491a57b9aecf","format"=>"protobuf_raw"}

  abilities = CTowerAttack_UseAbilities_Request.decode(params['input_json'])
  File.open('stream_log.txt', 'a') { |file| file.write("#{PP.pp(params, '')}\n\n") }
end