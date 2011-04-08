require 'character'

class InitTracker

  def initialize
    @characters = File.new('./player_characters.txt', "r").readlines.collect do |character|
      Character.new(character.chomp)
    # lines = @characters.collect do |chars|
    #   "#{dice_roll} #{chars}\\n"
    # end.sort

    end.sort.reverse
  end

  # def dice_roll(sides = 6)
  #   rand(sides) + 1
  # end

  def write_file
    File.open('./order.txt', "w") do |init_file|
      @characters.each do |character|
        init_file.write("#{character.padded_roll} #{character.name}\n")
      end
    end
  end
end
