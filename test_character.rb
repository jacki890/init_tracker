require 'test/unit'
require 'character'

@@gets_returns = ""
class Character
  def gets; @@gets_returns; end
  def puts(x); end
end

class TestCharacter < Test::Unit::TestCase
  def test_accepts_name
    @@gets_returns = ""
    char = Character.new "steve"
    assert_equal "steve", char.name
  end

  def test_input_is_number_between_1_and_10
    @@gets_returns = "7"
    char = Character.new "steve"
    assert_equal 7, char.input_dice_roll
  end

  def test_input_is_empty_string
    @@gets_returns = ""
    char = Character.new "steve"
    assert char.input_dice_roll < 11, "was not less than 11"
    assert char.input_dice_roll > 0, "was not greater than 0"
  end

  def test_sortable_by_roll
    @@gets_returns = ""
    chars = %w{steve bob joe marley mike}.collect{|name| Character.new(name) }
    sorted_chars = chars.sort
    rolls = sorted_chars.collect{|character| character.roll }
    assert_equal rolls, rolls.sort
  end
end
