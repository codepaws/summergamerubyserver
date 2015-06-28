class GdActiveAbility
  include DataMapper::Resource
  property :id,               Serial
  property :accountid_caster, Integer, :min => 0, :max => 4294967295
  property :ability,          Integer, :min => 0, :max => 4294967295
  property :timestamp_done,   Integer, :min => 0, :max => 4294967295
  property :multiplier,       Decimal, :precision => 17, scale: 5

  belongs_to :gd_lane
end