# "POST /ITowerAttackMiniGameService/UseAbilities/v0001/ HTTP/1.1" 404 520 0.0020

post '/ITowerAttackMiniGameService/UseAbilities/v0001/' do 
  #{"input_json"=>"{\"requested_abilities\":[{\"ability\":2,\"new_lane\":1}],\"gameid\":\"49943\"}","access_token"=>"","format"=>"protobuf_raw"}

  request = CTowerAttack_UseAbilities_Request::handle_request(params)
  reply = CTowerAttack_UseAbilities_Response::create_response(request.gameid, request.requested_abilities)

  #response.headers['Content-Type'] = 'application/octet-stream'
  #return reply.encode
  return ''
end