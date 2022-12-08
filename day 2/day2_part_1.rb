# Get the input data filename from the command line arguments
input_filename = ARGV[0]

# Parse the strategy guide from the input file
strategy_guide = {}
File.foreach(input_filename) do |line|
  # Split the line into the opponent's choice and our response
  opponent, response = line.split
  # Store the response in the strategy guide
  strategy_guide[opponent] = response
end

# Initialize the total score
total_score = 0

# Simulate the tournament
strategy_guide.each do |opponent, response|
  # Calculate the score for this round
  score = 0
  case response
  when "X" # Rock
    if opponent == "A"
      # Rock ties with Rock
      score = 3
    elsif opponent == "B"
      # Rock beats Paper
      score = 6
    elsif opponent == "C"
      # Rock loses to Scissors
      score = 0
    end
    # Add the score for choosing Rock
    total_score += 1
  when "Y" # Paper
    if opponent == "A"
      # Paper beats Rock
      score = 6
    elsif opponent == "B"
      # Paper ties with Paper
      score = 3
    elsif opponent == "C"
      # Paper loses to Scissors
      score = 0
    end
    # Add the score for choosing Paper
    total_score += 2
  when "Z" # Scissors
    if opponent == "A"
      # Scissors loses to Rock
      score = 0
    elsif opponent == "B"
      # Scissors beats Paper
      score = 6
    elsif opponent == "C"
      # Scissors ties with Scissors
      score = 3
    end
    # Add the score for choosing Scissors
    total_score += 3
  end
  # Add the score for the outcome of the round to the total score
  total_score += score
end

# Print the total score
puts "Total score: #{total_score}"
