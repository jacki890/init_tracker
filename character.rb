class Character
  attr_accessor :roll, :name
  def initialize(name)
    self.name = name
    self.roll = rand(20) + 1
  end

  def <=>(o)
    self.roll <=> o.roll
  end

  def padded_roll
    self.roll.to_s.rjust(2)
  end
end
