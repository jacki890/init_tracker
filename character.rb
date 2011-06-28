require 'rubygems'
require 'data_mapper'

class Character
  include DataMapper::Resource

  # INPUT_FIELDS = %w{name race hp class level gender alignment ac ac_type}
  INPUT_FIELDS = %w{name}
  BOOLEAN_FIELDS = %w{npc active}

  property :id, Serial
  property :name, String
  property :npc, Integer
  property :active, Integer
  #has n, :encounter_characters, :child_key => [ :character_id ]

  # property :race, String
  # property :hp, Integer
  # property :class, String
  # property :level, Integer
  # property :gender, String
  # property :alignment, String
  # property :ac, Integer
  # property :ac_type, String

  # has n, :encounters

  attr_accessor :roll, :action, :id

  def self.enter_character
    puts "Please enter the attributes"
    character = Character.new

    INPUT_FIELDS.each do |attr|
      puts "#{attr.capitalize}: "
      character.send("#{attr}=", gets.chomp)
    end

    BOOLEAN_FIELDS.each do |attr|
      puts "If character is #{attr.upcase} enter \"yes\""
      answer = gets.chomp
      flag = (answer.downcase == "yes") ? 1 : 0
      character.send("#{attr}=", flag)
    end
    character.save!
  end

  def self.to_encounter
    EncounterCharacter.new(54, 2)
  end

  def active?
    active == 1
  end

  def roll_dice
    rand(10) + 1
  end

  def valid_roll?(roll)
    roll.to_i > 0 and roll.to_i < 11
  end

  def input_dice_roll
    puts "Please enter the dice roll plus any bonuses"
    puts "for " << name
    dice_input = gets.chomp
    while not valid_roll?(dice_input)
      if dice_input.empty?
        dice_input = roll_dice
      else
        puts "Please type a number and hit Return"
        dice_input = gets.chomp
      end
    end
   self.roll = dice_input.to_i
  end

  def input_action_for_round
    puts "Now enter the action for this round."
    puts "for " << name
    self.action = gets.chomp
  end

  def <=>(o)
    self.roll <=> o.roll
  end

  def padded_roll
    self.roll.to_s.rjust(2)
  end

  def to_s
    name
  end
end
