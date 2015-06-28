require 'rubygems'
require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{File.expand_path(File.dirname(__FILE__))}/project.db")

require_relative 'CTowerAttack_GameData/GameData.rb'
require_relative 'CTowerAttack_Stats/Stats.rb'
require_relative 'CTowerAttack_PlayerData/PlayerData.rb'
require_relative 'CTowerAttack_PlayerTechTree/PlayerTechTree.rb'

DataMapper.finalize
DataMapper.auto_migrate!

# uint64    :min => 0, :max => 18446744073709551615
# uint32    :min => 0, :max => 4294967295

require_relative 'seed_data/init.rb'