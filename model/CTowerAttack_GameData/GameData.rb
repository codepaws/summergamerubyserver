require_relative 'Gd_Enemy.rb'
require_relative 'Gd_Event.rb'
require_relative 'Gd_ActiveAbility.rb'
require_relative 'Gd_Lane.rb'

class GameData
  include DataMapper::Resource
  property :id,                     Serial
  property :level,                  Integer, :min => 0, :max => 4294967295
  property :timestamp,              Integer, :min => 0, :max => 4294967295
  property :EMiniGameStatus,        Integer, :min => 0, :max => 4294967295 # ENUM
  property :timestamp_game_start,   Integer, :min => 0, :max => 4294967295
  property :timestamp_level_start,  Integer, :min => 0, :max => 4294967295
  property :universe_state,         String

  has n, :gd_lanes
  has n, :player_datas, :through => Resource
end