require 'player'

class InitTracker

  def initialize
    # @players = File.new('./player_characters.txt', "r").readlines.collect do |player|
    @players = Player.all # (:order => [:name])
      # Player.new(:name => player.chomp) end.sort
  end

  def dice
    @players.each do |player|
      player.input_dice_roll
    end
    @players.sort
  end

  def write_file
    File.open('./order.txt', "w") do |init_file|
      @players.each do |player|
        init_file.write("#{player.padded_roll} #{player.name}\n")
      end
    end
    puts "\e[H\e[2J"
    puts(File.open('./order.txt', "r").readlines)
  end
end
