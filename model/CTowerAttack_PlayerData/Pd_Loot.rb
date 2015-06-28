class PdLoot
  include DataMapper::Resource
  property :id,                   Serial
  property :ETowerAttackAbility,  Integer, :min => 0, :max => 4294967295 #ENUM

  belongs_to :player_data
end