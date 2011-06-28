require 'rubygems'
require 'data_mapper'
require 'encounter_character'

class Encounter
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  # property :campaign_id, Integer

  has n, :encounter_characters
  has n, :characters, :through => :encounter_characters
  # has n, :encounters, :through => :encounter_characters

  def active_characters
    characters.select{|character| character.active?}
  end
end
