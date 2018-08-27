# Understand the problem
  # A 3 x 3 grid as competition board
  # Two players
    # Each one place a piece(in different shapes) alternately
    # Once a player reach a situation that 3 pieces are in a row, it won

# Data structure
  # board: a hash with integer keys representing every cell, with values with two different notations as the marks of placed cells
  # player: just a string name for tracking rounds and placed cells, or perhaps total scores

# alogrithm
  # phase 1
  # visualize the board (through the hash representing the board)
  # user or npc place a piece(not concern the overwirte situation)
  # detect unoccupied cells
  # limit user and npc's placing in the unoccupieds

  # phase 2
  # find_winner
  # announce winner
  # terminate current round

  # phase 3
  # ask user does he wanna play again?
  # back to top, refresh board, start over

  # How to alternating priority
    # User can choose who go first at the beginning of a new match
    # aften then
      # if user won current round then npc will go first next round
      # vice versa

      # if it's a tie, no alternating would happen
require "pry"

WINNING_COM = [
  [1,2,3], [4,5,6], [7,8,9],  # horizontal
  [1,4,7], [2,5,8], [3,6,9],  # vertical
  [1,5,9], [3,5,7]            # diagonal
]

def new_board
  (1..9).map { |num| [num, " "] }.to_h
end

def display_board(board)
brd = <<BOARD

          |          |
     #{board[1]}    |     #{board[2]}    |     #{board[3]}
          |          |
----------+----------+----------
          |          |
     #{board[4]}    |     #{board[5]}    |     #{board[6]}
          |          |
----------+----------+----------
          |          |
     #{board[7]}    |     #{board[8]}    |     #{board[9]}
          |          |

BOARD
puts brd
end

class String
  def emphasize
    "\n" + self.center(60, "*") + "\n"
  end
end

def user_place!(board)
  puts "Choose a cell from #{unoccupied_cells(board)}:"
  choice = gets.chomp.to_i
  if valid_choice?(board, choice)
    board[choice] = "X"
  else
    puts "\nThis cell has been taken!!!"
    user_place!(board)
  end
  choice
end

def npc_place!(board)
  if detect_chance(board)
    choice = detect_chance(board)
  elsif detect_danger(board)
    choice = detect_danger(board)
  elsif board[5] == " "
    choice = 5
  else
    choice = unoccupied_cells(board).sample
  end
  board[choice] = "O"
end

def unoccupied_cells(board)
  board.select { |_, occupier| occupier == " " }.keys
end

def valid_choice?(board, choice)
  unoccupied_cells(board).include?(choice)
end

def find_winner(board)
  user_pieces = board.select { |_, occupier| occupier == "X"}.keys
  npc_pieces = board.select { |_, occupier| occupier == "O"}.keys
  WINNING_COM.each do |com|
    if (user_pieces & com).size == 3
      return "user"
    elsif (npc_pieces & com).size == 3
      return "npc"
    end
  end
  nil
end

def tie?(board)
  !board.values.include?(" ")
end

def announce_winner(board)
  winner = find_winner(board)
  puts " #{winner} won this round!!! ".emphasize
end

def game_over?(scores)
  scores.values.include?(3)
end

def report_round_winner(board, scores)
  if winner = find_winner(board)
    puts " #{winner} won this round!!! ".emphasize
    scores[winner] += 1
    puts " #{winner} + 1. Current scores is user: #{scores["user"]}, \
  npc: #{scores["npc"]} ".emphasize
  else
    puts "It's a tie".emphasize
  end
end

def detect_danger(board)
  dangers = []
  user_choice = board.select { |_, occupier| occupier == "X" }.keys
  WINNING_COM.each do |com|
    if (user_choice & com).size == 2
      move = (com - user_choice)[0]
      if board[move] == " "
        dangers << move
      end
    end
  end
  dangers.sample
end

def detect_chance(board)
  chances = []
  npc_choice = board.select { |_, occupier| occupier == "O" }.keys
  WINNING_COM.each do |com|
    if (npc_choice & com).size == 2
      move = (com - npc_choice)[0]
      if board[move] == " "
        chances << move
      end
    end
  end
  chances.sample
end

def place_piece(board, first)
  if first == "user"
    user_place!(board)
  elsif first == "npc"
    npc_place!(board)
  end
end

def alternate_player!(first)
  if first == "user"
    "npc"
  elsif first == "npc"
    "user"
  end
end

loop do
  scores = { "user" => 0, "npc" => 0 }
  puts "Do you wanna go first?(enter 'y' if you want.)"
  x = gets.chomp
  x == 'y' ? first = "user" : first = "npc"

  loop do
    board = new_board
    display_board(board)

      loop do
        place_piece(board, first)
        display_board(board)
        break if find_winner(board) || tie?(board)
        first = alternate_player!(first)
      end

      first = alternate_player!(find_winner(board)) unless tie?(board)
      display_board(board)
      report_round_winner(board, scores)
      break if game_over?(scores)

    puts " New Round ".emphasize
  end

  puts" #{scores.key(3)} won the match!!! ".emphasize
  puts " Play Again? ".emphasize
  answer = gets.chomp
  break unless answer.start_with?("y")
end
