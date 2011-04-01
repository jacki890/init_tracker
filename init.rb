# Purpose is to track initiative in a D&D game.
# Input PC's, NPC's and their initiative rolls, output order.

puts 'Type a character or monster name and hit Enter'

character = gets.chomp
init_array = []

while character != ''
  init_array.push character
  character = gets.chomp
end

puts init_array.sort
