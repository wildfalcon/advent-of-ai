# Open the file and read its contents
file = File.open("strategy_guide.txt")
strategy_guide = file.read

# Parse the input data and store it in a data structure
strategy_guide_data = strategy_guide.split("\n").map { |line| line.split(" ") }

# Define a method that takes in the opponent's move and returns your move
# according to the strategy guide
def get_move(opponent_move, strategy_guide_data)
  case opponent_move
  when "A"
    strategy_guide_data[0][1] # Rock
  when "B"
    strategy_guide_data[1][1] # Paper
  when "C"
    strategy_guide_data[2][1] # Scissors
  end
end

# Define a method that calculates the score for a round
def calculate_score(opponent_move, your_move)
  score = 0
  if your_move == "X"
    # Rock
    if opponent_move == "A"
      # Rock
      score = 3 # Draw
    elsif opponent_move == "B"
      # Paper
      score = 0 # Loss
    elsif opponent_move == "C"
      # Scissors
      score = 8 # Win
    end
  elsif your_move == "Y"
    # Paper
    if opponent_move == "A"
      # Rock
      score = 8 # Win
    elsif opponent_move == "B"
      # Paper
      score = 3 # Draw
    elsif opponent_move == "C"
      # Scissors
      score = 0 # Loss
    end
  elsif your_move == "Z"
    # Scissors
    if opponent_move == "A"
      # Rock
      score = 0 # Loss
    elsif opponent_move == "B"
      # Paper
      score = 8 # Win
    elsif opponent_move == "C"
      # Scissors
      score = 3 # Draw
    end
  end

  score
end

# Initialize the total score to 0
total_score = 0

# Simulate the game by iterating over the input data and calling the
# game logic methods for each round
strategy_guide_data.each do |round|
  # Determine the opponent's move and your move
  opponent_move = round[0]
  your_move = get_move(opponent_move, strategy_guide_data)

  # Calculate the score for the round and update the total score
  score = calculate_score(opponent_move, your_move)
  total_score += score
end

# Print the total score
puts "Total score: #{total_score}"
