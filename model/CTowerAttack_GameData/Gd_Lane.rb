class GdLane
  include DataMapper::Resource
  property :id,                                         Serial
  property :dps,                                        Decimal, :precision => 17, scale: 5
  property :gold_dropped,                               Decimal, :precision => 17, scale: 5
  property :player_hp_buckets,                          Integer, :min => 0, :max => 4294967295
  property :ETowerAttackElement,                        Integer, :min => 0, :max => 4294967295 #ENUM
  property :active_player_ability_decrease_cooldowns,   Decimal, :precision => 17, scale: 5
  property :active_player_ability_gold_per_click,       Decimal, :precision => 17, scale: 5

  has n, :gd_enemies
  has n, :gd_active_abilities

  belongs_to :game_data
  #has n, :game_datas, :through => Resource
end
