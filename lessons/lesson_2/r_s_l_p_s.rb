# rock scissors lizard paper spock

# Scissors cuts Paper covers Rock crushes Lizard poison Spock smashes Scissors decaptiates Lizard eats Paper disproves Spock vaporizes Rock crushes Scissors

# http://www.samkass.com/theories/RPSSL.html
CHOICES = {
  'r' => "rock",
  'p' => "paper",
  'sc' => "scissors",
  'sp' => 'spock',
  'l' => 'lizard'
}


WON = "WON"
LOST = "LOST"
RESULTS = { ["rock", "paper"] => LOST,
            ["rock", "scissors"] => WON,
            ["rock", "spock"] => LOST,
            ["rock", "lizard"] => WON,
            ["paper", "scissors"] => LOST,
            ["paper", "rock"] => WON,
            ["paper", "spock"] => WON,
            ["paper", "lizard"] => LOST,
            ["scissors", "rock"] => LOST,
            ["scissors", "paper"] => WON,
            ["scissors", "spock"] => LOST,
            ["scissors", "lizard"] => WON,
            ["spock", "rock"] => WON,
            ["spock", "paper"] => LOST,
            ["spock", "scissors"] => WON,
            ["spock", "lizard"] => LOST,
            ["lizard", "rock"] => LOST,
            ["lizard", "paper"] => WON,
            ["lizard", "scissors"] => LOST,
            ["lizard", "spock"] => WON
          }

def prompt(message)
  Kernel.puts(" => #{message}")
end

def valid_choice?(choice)
  CHOICES.values.include?(choice)
end

def make_choice
  prompt("Choose one: #{CHOICES.values.join(', ')}")
  cap = Kernel.gets().chomp()
  p choice = CHOICES[cap]
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
    "#{choice} vs #{npc_choice} ------ It's a TIE!"
  else
    "#{choice} vs #{npc_choice} ------ You #{won_or_lost}"
  end
end

def won?(current_result)
  current_result.include?("WON")
end

def lost?(current_result)
  current_result.include?("LOST")
end

def display_final_result(score_of_player, score_of_npc)
  if score_of_player == 5
    prompt("You just reached 5 scores, you WON!")
  else
    prompt("NPC just reached 5 scores, you LOST!")
  end
end

instruction = "Scissors cuts Paper covers Rock crushes Lizard poison Spock smashes Scissors decaptiates Lizard eats Paper disproves Spock vaporizes Rock crushes Scissors"
acronym_rule = <<-M

r  stands for rock,
sc stands for scissors,
p  stands for paper,
sp stands for spock,
l  stands for lizard

M

prompt(instruction)

score_of_player = 0
score_of_npc = 0

loop do
  prompt(acronym_rule)
  npc_choice = CHOICES.values.sample
  choice = make_choice
  puts current_result = play_game(choice, npc_choice)

  if won?(current_result)
    score_of_player += 1
  elsif lost?(current_result)
    score_of_npc += 1
  end

  prompt("Your current score is #{score_of_player}, NPC's is #{score_of_npc}")
  prompt("New round! The one first reaches 5 score counted as winner.")

  break if score_of_player == 5 || score_of_npc == 5
end

display_final_result(score_of_player, score_of_npc)
