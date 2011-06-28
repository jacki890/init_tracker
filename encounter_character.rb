require 'rubygems'
require 'data_mapper'
require 'character'
require 'encounter'

class EncounterCharacter
  include DataMapper::Resource

  property :id, Serial

  belongs_to :encounter, :key => true
  belongs_to :character, :key => true
end
