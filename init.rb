def make_character(char)
  char
end

characters = File.open(File.join(File.dirname(__FILE__), "player_characters.txt"), "r")
each_pc = characters.readlines
characters.close

after_init = File.open(File.join(File.dirname(__FILE__), "order.txt"), "w")

each_pc.each do |line|
  chars = make_character(line)
  after_init.write(chars)
end

after_init.close
