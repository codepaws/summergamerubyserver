require_relative 'Pd_ActiveAbility.rb'
require_relative 'Pd_Loot.rb'

class PlayerData
  include DataMapper::Resource
  property :id,                         Serial, :key => true
  property :steamid,                    Integer, :min => 0, :max => 18446744073709551615, :key => true
  property :hp,                         Decimal, :precision => 17, scale: 5
  property :current_lane,               Integer, :min => 0, :max => 4294967295
  property :target,                     Integer, :min => 0, :max => 4294967295
  property :time_died,                  Integer, :min => 0, :max => 4294967295
  property :gold,                       Decimal, :precision => 17, scale: 5
  property :active_abilities_bitfield,  Integer, :min => 0, :max => 18446744073709551615
  property :crit_damage,                Decimal, :precision => 17, scale: 5

  has n, :pd_active_abilities
  has n, :pd_loots

  has n, :game_datas, :through => Resource
end