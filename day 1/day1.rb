# Read the input data from the file passed as the first command line argument
lines = File.readlines(ARGV[0])

# Initialize a list to store the number of Calories carried by each Elf
calories = []

# Iterate over the lines of the input data
lines.each do |line|
  # If the line is empty, add a new entry to the calories list
  # (representing a new Elf)
  if line.strip.empty?
    calories << 0
  else
    # Otherwise, parse the number of Calories on the current line
    # and add it to the total number of Calories carried by the
    # current Elf
    calories[-1] += line.to_i
  end
end

# Find the Elf carrying the most Calories by finding the maximum
# value in the calories list
max_calories = calories.max

# Print the number of Calories carried by the Elf carrying the most
puts max_calories