class GdEvent
  include DataMapper::Resource
  property :id,                     Serial
  property :ETowerAttackEvent,      Integer, :min => 0, :max => 4294967295 #ENUM
  property :time_start,             Integer, :min => 0, :max => 4294967295
  property :time_end,               Integer, :min => 0, :max => 4294967295
end