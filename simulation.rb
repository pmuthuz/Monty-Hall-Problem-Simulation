# Monty Hall Problem Simulaton
# https://en.wikipedia.org/wiki/Monty_Hall_problem
class MontyHallSimulation
  def initialize
    # Assign Goat to all doors
    @doors = %w(Goat Goat Goat)
    # Upgrade one random door to Car
    @doors[rand(3)] = 'Car'
  end

  def pick_door
    @pick = rand(3)
  end

  def reveal_door
    @revealed = @doors.each_index.select { |i| i != @pick && @doors[i] == 'Goat' }.sample
  end

  def swapper
    @doors[@doors.each_index.select { |i| i != @pick && i != @revealed }.sample] == 'Car' ? 1 : 0
  end

  def non_swapper
    @doors[@pick] == 'Car' ? 1 : 0
  end

  def result
    print 'Doors: ', @doors, "\t Picked: ", @pick, "\tRevealed: ", @revealed, "\tSwapper: ", swapper, "\tNon Swapper: ", non_swapper, "\n"
  end
end

swapper_won = 0
non_swapper_won = 0
10_000.times do
  simulation = MontyHallSimulation.new
  simulation.pick_door
  simulation.reveal_door
  # simulation.result
  swapper_won += simulation.swapper
  non_swapper_won += simulation.non_swapper
end

print 'swapper_won ', swapper_won, ' out of 10000 times ie ', (swapper_won.to_f / 10_000.to_f) * 100, "%\n"
print 'non_swapper_won ', non_swapper_won, ' out of 10000 times ie ', (non_swapper_won.to_f / 10_000.to_f) * 100, "%\n"
