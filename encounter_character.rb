class EncounterCharacter
  include DataMapper::Resource

  property :id, Serial
  property :encounter_id, Integer
  property :character_id, Integer

  belongs_to :encounter, 'Encounter', :key => true
  belongs_to :character, 'Character', :key => true

  attr_accessor :encounter_id, :character_id

  # def initialize(charid, encid)
  #   encounter_id = encid
  #   character_id = charid
  #   self.save!

  #   self.errors.each do |e|
  #     puts e
  #   end
  # end
end
