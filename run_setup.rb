require 'setup'

# it = InitTracker.new
# it.dice_input_and_sort
# it.write_file

encounter = EncounterCharacter.create!(
  :encounter_id => 2,
  :character_id => 24)

encounter.errors.each do |e|
  puts e
end

