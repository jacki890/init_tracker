require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '/encounter')
require 'dm-migrations'


class EncounterTests < Test::Unit::TestCase
  def setup
    DataMapper.setup(:default, 'postgres://localhost/dnd')
    DataMapper.auto_migrate!

    @char = Character.new({ :name => "Bob",
                  :npc => 1,
                  :active => 1 })
    @enc_char = EncounterCharacter.new(:character => @char)
    char2 = Character.new({ :name => "Tim",
                  :npc => 1,
                  :active => 1 })
    enc_char2 = EncounterCharacter.new(:character => char2)

    @encounter = Encounter.new({ :name => "Epic tales"} )
    @encounter.encounter_characters << @enc_char
    @encounter.encounter_characters << enc_char2
  end

  def test_save_encounter
    @encounter.save
    assert_equal 1, Encounter.count
  end
end
