class PttAbilityItem
  include DataMapper::Resource
  property :id,                     Serial
  property :ETowerAttackAbility,    Integer, :min => 0, :max => 4294967295 #ENUM
  property :quantity,               Integer, :min => 0, :max => 4294967295

  belongs_to :player_tech_tree
end
