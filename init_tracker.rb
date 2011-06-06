require 'character'
require 'encounter'
require 'encounter_character'
require 'campaign'

class InitTracker

  def initialize
    clear_screen
    @current_encounter = Encounter.last
  end

  def choose_campaign
    puts "Type your ID for the current campaign."
    list_campaign = Campaign.all
    puts list_campaign

  end

  def dice_input_and_sort
    @characters = @current_encounter.active_characters
    @characters.each do |character|
      character.input_dice_roll
    end
    @characters.sort!
  end

  def write_file
    File.open('./order.txt', "w") do |init_file|
      @characters.each do |character|
        init_file.write("#{character.padded_roll} #{character.name}\n")
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
