require 'test/unit'
require 'character'

class TestCharacter < Test::Unit::TestCase
  def test_accepts_name
    char = Character.new "steve"
    assert_equal "steve", char.name
  end

  def test_sortable_by_roll
    chars = %w{steve bob joe marley mike}.collect{|name| Character.new(name) }
    sorted_chars = chars.sort
    rolls = sorted_chars.collect{|character| character.roll }
    assert_equal rolls, rolls.sort
  end
end
