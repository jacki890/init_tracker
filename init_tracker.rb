require 'character'

class InitTracker

  def initialize
    @characters = File.new('./player_characters.txt', "r").readlines.collect do |character|
      Character.new(character.chomp) end.sort.reverse
  end

  def write_file
    File.open('./order.txt', "w") do |init_file|
      @characters.each do |character|
        init_file.write("#{character.padded_roll} #{character.name}\n")
      end
    end
    puts(File.open('./order.txt', "r").readlines)
  end
end
