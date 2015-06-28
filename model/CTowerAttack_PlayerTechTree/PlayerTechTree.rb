require_relative 'Ptt_AbilityItem.rb'
require_relative 'Ptt_Upgrade.rb'

class PlayerTechTree
  include DataMapper::Resource
  property :id,                           Serial, :key => true
  property :steamid,                      Integer, :min => 0, :max => 18446744073709551615, :key => true
  property :damage_per_click,             Decimal, :precision => 17, scale: 5, :default => 1.0
  property :damage_multiplier_fire,       Decimal, :precision => 17, scale: 5, :default => 1.0
  property :damage_multiplier_water,      Decimal, :precision => 17, scale: 5, :default => 1.0
  property :damage_multiplier_air,        Decimal, :precision => 17, scale: 5, :default => 1.0
  property :damage_multiplier_earth,      Decimal, :precision => 17, scale: 5, :default => 1.0
  property :damage_multiplier_crit,       Decimal, :precision => 17, scale: 5, :default => 2.0
  property :unlocked_abilities_bitfield,  Integer, :min => 0, :max => 18446744073709551615, :default => 0
  property :hp_multiplier,                Decimal, :precision => 17, scale: 5, :default => 1.0
  property :crit_percentage,              Decimal, :precision => 17, scale: 5, :default => 0
  property :badge_points,                 Decimal, :precision => 17, scale: 5
  property :boss_loot_drop_percentage,    Decimal, :precision => 17, scale: 5, :default => 0.25
  property :damage_multiplier_dps,        Decimal, :precision => 17, scale: 5, :default => 1
  property :base_dps,                     Decimal, :precision => 17, scale: 5
  property :damage_per_click_multiplier,  Decimal, :precision => 17, scale: 5, :default => 1.0
  property :max_hp,                       Decimal, :precision => 17, scale: 5
  property :dps,                          Decimal, :precision => 17, scale: 5

  has n, :ptt_upgrades
  has n, :ptt_ability_items
end
