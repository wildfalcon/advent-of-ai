# Read the input data from the file passed as the first command line argument
lines = File.readlines(ARGV[0])

# Initialize a list to store the number of Calories carried by each Elf
# with an initial value of 0
calories = [0]

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

# Sort the calories list in descending order
calories = calories.sort.reverse

# Find the total number of Calories carried by the top three Elves
# by taking the sum of the first three elements in the sorted list
total_calories = calories[0..2].sum

# Print the total number of Calories carried by the top three Elves
puts total_calories
