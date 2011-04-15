class Character
  attr_accessor :roll, :name
  def initialize(name)
    self.name = name
    self.roll = input_dice_roll
  end

  def input_dice_roll
    puts "Please enter the d10 dice roll (number from 1 - 10)"
    puts "for " << @name
    dice_input = gets.chomp.to_i
    while dice_input < 1 || dice_input > 10
      puts "Please type a number between 1 and 10"
      dice_input = gets.chomp.to_i
    end
    dice_input
  end

  def <=>(o)
    self.roll <=> o.roll
  end

  def padded_roll
    self.roll.to_s.rjust(2)
  end
end
