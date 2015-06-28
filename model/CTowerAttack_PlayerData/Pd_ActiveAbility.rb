class PdActiveAbility
  include DataMapper::Resource
  property :id,                 Serial
  property :ability,            Integer, :min => 0, :max => 4294967295
  property :timestamp_done,     Integer, :min => 0, :max => 4294967295
  property :timestamp_cooldown, Integer, :min => 0, :max => 4294967295

  belongs_to :player_data
end