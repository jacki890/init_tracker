class Player
  include DataMapper::Resource

  INPUT_FIELDS = %w{name race hp class level gender alignment ac ac_type}
  BOOLEAN_FIELDS = %w{npc active}

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
  property :npc, Integer
  property :active, Integer

  has n, :encounters
  has n, :encounters, :through => :encounter_player
  attr_accessor :roll

  def self.enter_player
    puts "Please enter the attributes"
    player = Player.new

    INPUT_FIELDS.each do |attr|
      puts "#{attr.capitalize}: "
      player.send("#{attr}=", gets.chomp)
    end

    BOOLEAN_FIELDS.each do |attr|
      puts "#{attr.capitalize}: "
      answer = gets.chomp
      flag = (answer.downcase == "yes") ? 1 : 0
      player.send("#{attr}=", flag)
    end

    player.save!
  end

  def initialize(*args)
    super
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

  def to_s
    name
  end

end
