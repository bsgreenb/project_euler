# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#
#
# How many such routes are there through a 20×20 grid?

# It seems like this could maybe be solved recursively?
# The way to approach it seems to be to think about what I'd do as a human to count at each step.
# Yes, basically the number of moves is:
# Number of options at current point + number of options at down point + number of options at right point

def num_paths(i=0, j=0, grid)
  puts "In num_paths with #{i}, #{j}"
  grid_size = grid.length

  #Memoization
  return grid[i][j] if grid[i][j]

  # Base case
  if (i == grid_size - 1) && (j == grid_size - 1)
    puts "1 path to #{i}, #{j}"
    grid[i][j] = 1
    return 1
  end

  # Can do both
  if i+1 < grid_size && j+1 < grid_size
    num_paths = num_paths(i + 1, j, grid) + num_paths(i, j + 1, grid)
    puts "#{num_paths} right and down from #{i},#{j}"
  # Can go down
  elsif i+1 < grid_size
    num_paths = num_paths(i + 1, j, grid)
    puts "#{num_paths} down from #{i},#{j}"
  # Can go right
  elsif j+1 < grid_size
    num_paths = num_paths(i, j + 1, grid)
    puts "#{num_paths} right from #{i},#{j}"
  end

  grid[i][j] = num_paths
  return num_paths
end

grid = Array.new(21)
i = 0
while i < grid.length
  grid[i] = Array.new(21)
  i +=1
end

puts num_paths(0, 0, grid)

# Takeaways from this problem:
# Memoization becomes obvious from repeated work
# Think carefully about what you're solving for and name accordingly.  In this case "num paths"
# Take a walk when you get stuck
# Be careful with object identity, as Array.new caused dat problem.
