require 'player'
require 'encounter'
require 'encounter_player'

class InitTracker

  def initialize
    @players = Player.all
  end

  def dice_input_and_sort
    @players.each do |player|
      player.input_dice_roll
    end
    @players.sort!
  end

  def write_file
    File.open('./order.txt', "w") do |init_file|
      @players.each do |player|
        init_file.write("#{player.padded_roll} #{player.name}\n")
      end
    end
    clear_screen
    puts(File.open('./order.txt', "r").readlines)
  end

  private
  def clear_screen
    puts "\e[H\e[2J"
  end
end
