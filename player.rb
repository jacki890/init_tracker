class Player
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :race, String
  property :hp, Integer
  property :class, String
  property :level, Integer
  property :gender, String
  property :alignment, String
  property :ac, Integer
  property :ac_type, String

  attr_accessor :roll

  def initialize(*args)
    super
  end

  def self.enter_player
    puts "Please enter the attributes"
    player = Player.new

    puts "Name: "
    player.name = gets.chomp

    puts "Race: "
    player.race = gets.chomp

    player.save!
  end

  def input_dice_roll
    puts "Please enter the dice roll plus any bonuses"
    puts "for " << name
    dice_input = gets.chomp
    while dice_input.to_i < 1 || dice_input.to_i > 40
      if dice_input.empty?
        dice_input = rand(10) + 1
      else
        puts "Please type a number and hit Return"
        dice_input = gets.chomp
      end
    end
   self.roll = dice_input.to_i
  end

  def <=>(o)
    self.roll <=> o.roll
  end

  def padded_roll
    self.roll.to_s.rjust(2)
  end
end
