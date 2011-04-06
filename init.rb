def make_character(char)
  char
end

characters = File.open("/Users/jackikeys/Dropbox/apprentice_work/init_tracker/player_characters.txt", "r")
each_pc = characters.readlines
characters.close

after_init = File.open("/Users/jackikeys/Dropbox/apprentice_work/init_tracker/in_order.txt", "w")

each_pc.each do |line|
  chars = make_character(line)
  after_init.write(chars)
end

after_init.close
