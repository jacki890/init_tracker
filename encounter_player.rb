class EncounterPlayer
  include DataMapper::Resource

  property :id, Serial
  property :encounter_id, Integer
  property :player_id, Integer

  belongs_to :encounter
  belongs_to :player

end
