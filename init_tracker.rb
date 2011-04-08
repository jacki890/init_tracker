class InitTracker

  def make_character(char)
    char
  end

  def dice_roll(sides = 6)
    rand(sides) + 1
  end

  def write_file
    characters = File.open('./player_characters.txt', "r")
    each_pc = characters.readlines
    characters.close

    after_init = File.open('./order.txt', "w")

    each_pc.each do |line|
      chars = make_character(line)
      after_init.write("#{dice_roll} #{chars}")
    end

    after_init.close
  end
end
