require 'test/unit'
require 'init_tracker'

class DiceRollTest < Test::Unit::TestCase
  def test_dice_roll_gives_number_in_range
    init_tracker = InitTracker.new
    20.times do
      roll = init_tracker.dice_roll
      assert_not_equal 0, roll
      assert_not_equal 11, roll
      assert_equal Fixnum, roll.class
    end
  end

  def test_dice_roll_is_random
    init_tracker = InitTracker.new
    all_rolls = []
    1000.times do 
      all_rolls << init_tracker.dice_roll
    end
    assert_equal (1..10).to_a, all_rolls.sort.uniq
  end
end
