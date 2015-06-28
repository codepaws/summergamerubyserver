class GdEnemy
  include DataMapper::Resource
  property :id,                     Serial
  property :ETowerAttackEnemyType,  Integer, :min => 0, :max => 4294967295 #ENUM
  property :hp,                     Decimal, :precision => 17, scale: 5
  property :max_hp,                 Decimal, :precision => 17, scale: 5
  property :dps,                    Decimal, :precision => 17, scale: 5
  property :timer,                  Decimal, :precision => 17, scale: 5
  property :gold,                   Decimal, :precision => 17, scale: 5

  belongs_to :gd_lane
end
