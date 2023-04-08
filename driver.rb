require './lib/main.rb'
puts "Create knight and tour"
knight = Knight.new

tour = knight.min_steps_to_reach_target([0, 1], [6,2], 64)
knight.find_path(knight.possible_moves, tour)


