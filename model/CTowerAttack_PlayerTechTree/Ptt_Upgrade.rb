# Database Player Tech Tree Upgrade
class PttUpgrade
  include DataMapper::Resource
  property :id,                   Serial
  property :upgrade,              Integer, :min => 0, :max => 4294967295
  property :level,                Integer, :min => 0, :max => 4294967295
  property :cost_for_next_level,  Decimal, :precision => 17, scale: 5

  belongs_to :player_tech_tree
end
