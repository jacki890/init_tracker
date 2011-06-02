require 'test/unit'
require 'init_tracker'

class InputDiceRollTest < Test::Unit::TestCase
  def test_input_of_dice_roll_exists
    init_tracker = InitTracker.new
    assert_not_nil input_dice_roll, "WTF? why nil?"
  end
end

