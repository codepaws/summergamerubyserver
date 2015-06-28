class Stats
  include DataMapper::Resource
  property :id,                                   Serial
  property :num_players,                          Integer, :min => 0, :max => 4294967295
  property :num_mobs_killed,                      Integer, :min => 0, :max => 18446744073709551615
  property :num_towers_killed,                    Integer, :min => 0, :max => 18446744073709551615
  property :num_minibosses_killed,                Integer, :min => 0, :max => 18446744073709551615
  property :num_bosses_killed,                    Integer, :min => 0, :max => 18446744073709551615
  property :num_clicks,                           Integer, :min => 0, :max => 18446744073709551615
  property :num_abilities_activated,              Integer, :min => 0, :max => 18446744073709551615
  property :num_players_reaching_milestone_level, Integer, :min => 0, :max => 18446744073709551615
  property :num_ability_items_activated,          Integer, :min => 0, :max => 18446744073709551615
  property :num_active_players,                   Integer, :min => 0, :max => 4294967295
  property :time_simulating,                      Decimal, :precision => 17, scale: 5
  property :time_saving,                          Decimal, :precision => 17, scale: 5
end
