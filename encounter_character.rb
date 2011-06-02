class EncounterCharacter
  include DataMapper::Resource

  property :id, Serial
  property :encounter_id, Integer
  property :character_id, Integer

  belongs_to :encounter
  belongs_to :character

end
