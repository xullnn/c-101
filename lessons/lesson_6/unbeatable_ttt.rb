# define unbeatable
# choosing priority
  # can win immediately
  # defense
  # find the next move that can involve most possible killer moves
    # iterate through the unoccupied cells
      # if choosing this move can make most chances then it is
    # if every possible move can't make a chance then next
  # choose 5 if possible
  # random choose

# current not unbeatable
def detect_max_move(board)
  move = nil
  count = 0
  unoccupied_cells(board).each do |cell|
    test_board = board.dup
    test_board[cell] = "O"
    p detect_chances(test_board)
    current_chances_count = detect_chances(test_board).count
    if current_chances_count > count
      count = current_chances_count
      move = cell
    end
  end
  if count == 0
    nil
  else
    move
  end
end

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
  if detect_chances(board).sample
    choice = detect_chances(board).sample
  elsif detect_danger(board)
    choice = detect_danger(board)
  elsif detect_max_move(board)
    choice = detect_max_move(board)
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

def detect_chances(board)
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
  chances
end

loop do
  scores = { "user" => 0, "npc" => 0 }

  loop do
    board = new_board
    display_board(board)

      loop do
        user_place!(board)
        system("clear")
        break if find_winner(board) || tie?(board)

        npc_place!(board)
        display_board(board)
        break if find_winner(board) || tie?(board)
      end

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
