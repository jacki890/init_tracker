require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '/encounter_character')
require 'dm-migrations'

class EncounterCharacterTests < Test::Unit::TestCase
  def setup
    DataMapper.setup(:default, 'postgres://localhost/dnd')
    DataMapper.auto_migrate!

    @char = Character.new({ :name => "Bob",
                  :npc => 1,
                  :active => 1 })

    @encounter = Encounter.new({ :name => "Epics" })
    @enc_char = EncounterCharacter.new(:character => @char,
                                      :encounter => @encounter)
  end

  def test_encounter_character_exists
    old_count = EncounterCharacter.count
    @enc_char.save
    assert_equal old_count+1, EncounterCharacter.count
  end
end
