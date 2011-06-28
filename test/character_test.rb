require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '/character')
require 'dm-migrations'

@@gets_returns = ""
@@puts_returned = ""
class Character
  def gets
    @@gets_returns.shift
  end

  def puts(x); @@puts_returned = x; end
end

class CharacterTests < Test::Unit::TestCase
  def setup
    DataMapper.setup(:default, 'postgres://localhost/dnd')
    DataMapper.auto_migrate!
    @char = Character.new({ :name => "Bob",
                  :npc => 1,
                  :active => 1 })
  end

  def test_character_gets_saved
    @char.save
    assert_equal 1, Character.count
  end

  def test_roll_dice_is_random
    all_rolls = []
    1000.times do
      all_rolls << @char.roll_dice
    end
    assert_equal (1..10).to_a, all_rolls.sort.uniq
  end

  def test_dice_roll_is_valid
    assert @char.valid_roll?(1)
    assert @char.valid_roll?(10)
    assert !@char.valid_roll?(11)
    assert !@char.valid_roll?(0)
  end

  def test_input_dice_roll
    @@gets_returns = [""]
    @char.input_dice_roll
    assert (1..10).include? @char.roll
  end

  def test_dice_roll_actually_has_input
    @@gets_returns = ["1"]
    @char.input_dice_roll
    assert_equal 1, @char.roll
  end

  def test_if_dice_roll_input_is_invalid
    @@gets_returns = ["11", "3"]
    @char.input_dice_roll
    assert_equal "Please type a number and hit Return", @@puts_returned
    assert_equal 3, @char.roll
  end

  def test_action_is_entered
    assert_nil @char.action
    @@gets_returns = ["stomp"]
    @char.input_action_for_round
    assert_equal "stomp", @char.action
  end
end
