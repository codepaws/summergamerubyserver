#/ITowerAttackMiniGameService/GetGameData/v0001/?gameid=49943&include_stats=0&format=protobuf_raw
require 'pp'

get '/ITowerAttackMiniGameService/GetGameData/v0001/' do
  request = CTowerAttack_GetGameData_Request::handle_request(params)
  reply = CTowerAttack_GetGameData_Response::create_response(request.gameid, request.include_stats)

  response.headers['Content-Type'] = 'application/octet-stream'
  return reply.encode
end