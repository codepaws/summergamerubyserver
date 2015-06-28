#/ITowerAttackMiniGameService/GetPlayerData/v0001/?gameid=49943&steamid=1&include_tech_tree=0&format=protobuf_raw

get '/ITowerAttackMiniGameService/GetPlayerData/v0001/' do 
  request = CTowerAttack_GetPlayerData_Request::handle_request(params)
  reply = CTowerAttack_GetPlayerData_Response::create_response(request[:gameid], request[:steamid], request[:include_tech_tree])

  response.headers['Content-Type'] = 'application/octet-stream'
  return reply.encode
end