require 'setup'

it = InitTracker.new
it.dice_input_and_sort
it.write_file

e = Encounter.first
puts e.active_players


