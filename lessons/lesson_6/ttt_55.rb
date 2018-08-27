# What changed?
  # board changed
    # much more winning combinations
    # more steps

# What did not change?
  # winning rule not changed

# how to calculate all winning combinations
  # 1 calculate all 3-cells' combinations
  # sort every combination
  # select horizontal: b - a == c - b == 1
    # delete combinations that contain both 5&6, 10&11, 15&16, 20&21
  # select vertical: b - a == c - b == 5
  # diagonal:
    # difference 6: b - a == c - b == 6
    # difference 4: b - a == c - b == 4

all = (1..25).to_a.combination(3).to_a

horizontal = all.select { |com| com[2] - com[1] == 1 && com[1] - com[0] == 1 }
horizontal.delete_if do |com|
  (com & [5,6]).size == 2 ||
  (com & [10,11]).size == 2 ||
  (com & [15,16]).size == 2 ||
  (com & [20,21]).size == 2
end

vertical = all.select { |com| com[2] - com[1] == 5 && com[1] - com[0] == 5 }

diagonal_1 = all.select { |com| com[2] - com[1] == 6 && com[1] - com[0] == 6 }
diagonal_2 = all.select { |com| com[2] - com[1] == 4 && com[1] - com[0] == 4 }

WINNING_COM = horizontal + vertical + diagonal_1 + diagonal_2

def new_board
  (1..25).map { |num| [num, " "] }.to_h
end

def display_board(board)
brd = <<BOARD

          |          |          |          |
     #{board[1]}    |     #{board[2]}    |     #{board[3]}    |     #{board[4]}    |     #{board[5]}
          |          |          |          |
----------+----------+----------+----------+----------
          |          |          |          |
     #{board[6]}    |     #{board[7]}    |     #{board[8]}    |     #{board[9]}    |     #{board[10]}
          |          |          |          |
----------+----------+----------+----------+----------
          |          |          |          |
     #{board[11]}    |     #{board[12]}    |     #{board[13]}    |     #{board[14]}    |     #{board[15]}
          |          |          |          |
----------+----------+----------+----------+----------
          |          |          |          |
     #{board[16]}    |     #{board[17]}    |     #{board[18]}    |     #{board[19]}    |     #{board[20]}
          |          |          |          |
----------+----------+----------+----------+----------
          |          |          |          |
     #{board[21]}    |     #{board[22]}    |     #{board[23]}    |     #{board[24]}    |     #{board[25]}
          |          |          |          |

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
