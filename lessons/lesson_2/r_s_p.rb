# Understand the problem
  # Player makes a choice
  # NPC makes a choice
  # Fight(compare)

# Examples and Test cases
  # play_game(choice) => # tie, won, lost
  # play_game("paper")

# Data structure
  # array
  # string

# Algorithm
  # loop
    # pronounce game rules
      # npc choose
      # ask player to choose
      # validate input
      # run the comparing logic
      # output result
    # ask whether play again
  # end_loop

CHOICES = %w(rock paper scissors)

WON = "WON"
LOST = "LOST"
RESULTS = { ["rock", "paper"] => LOST,
            ["rock", "scissors"] => WON,
            ["paper", "scissors"] => LOST,
            ["paper", "rock"] => WON,
            ["scissors", "rock"] => LOST,
            ["scissors", "paper"] => WON
          }

def prompt(message)
  Kernel.puts(" => #{message}")
end

def valid_choice?(choice)
  CHOICES.include?(choice)
end

def make_choice
  prompt("Choose one: #{CHOICES.join(', ')}")
  choice = Kernel.gets().chomp()
  if valid_choice?(choice)
    choice
  else
    prompt("Not a valid choice, try again.")
    make_choice
  end
end

def play_game(choice, npc_choice)
  won_or_lost = RESULTS[[choice, npc_choice]]
  if choice == npc_choice
    prompt("#{choice} vs #{npc_choice} ------ It's a tie!")
  else
    prompt("#{choice} vs #{npc_choice} ------ You #{won_or_lost}")
  end
end

loop do
  npc_choice = CHOICES.sample
  choice = make_choice
  play_game(choice, npc_choice)

  prompt("Wanna play again? (y or yes to continue): ")
  answer = Kernel.gets().chomp()
  break if !answer.downcase.start_with?("y")
end
