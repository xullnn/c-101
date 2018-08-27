require 'pry'

WINNING_COM = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [7, 5, 3]
]

all_com = (1..9).to_a.combination(2).to_a
horzon_and_verti = all_com.keep_if { |com| (com[0] - com[1]).abs == 1 || (com[0] - com[1]).abs == 3 }
horzon_and_verti -= [[3,4], [6,7]]
threat_com = horzon_and_verti + [[1,5], [5,9], [7,5], [5,3]]

THREAT_COM = threat_com

# horizontally 2 in a row: (a - b).abs == 1 except [3,4] [6,7]
# vertically 2 in a row: (a - b).abs == 3
# diagonally 2 in a row: [1,5] [5,9] [7,5] [5,3]




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

def display_mode
mode = <<M

Choose fighting mode(user or npc):
  user : user first then alternate
  npc : npc first then alternate

M
end

def new_board
  board = {}
  (1..9).each { |n| board[n] = " " }
  board
end

def untaken_cells(board)
  board.select { |_, occupier| occupier == " " }.keys
end

def joinor(arr, punc=",", conj="or")
  punc += " "
  new_arr = arr.map(&:to_s)
  case new_arr.size
  when 0 then ''
  when 1 then new_arr.first
  when 2 then new_arr.join(" #{conj} ")
  else
    new_arr[-1] = "#{conj} #{new_arr.last}"
    new_arr.join(punc)
  end
end

def user_place_piece!(board)
  puts "Currently, available choices are #{joinor(untaken_cells(board))}"
  answer = gets.chomp.to_i
  if !untaken_cells(board).include?(answer)
    puts "This has been taken, pick from #{joinor(untaken_cells(board))}"
    user_place_piece!(board)
  end
  board[answer] = "X"
end

# def detect_threat(board)
#   user_choices = board.select { |_, occupier| occupier == "X" }.keys
#   WINNING_COM.each do |win_com|
#     if (win_com & user_choices).size == 2
#       possible_threat = win_com & user_choices
#       possible_move = (win_com - possible_threat)[0]
#       if untaken_cells(board).include?(possible_move)
#         return possible_move
#       end
#     end
#   end
#   nil
# end

def detect_threat(board)
  WINNING_COM.each do |win_com|
    if board.values_at(*win_com).count("X") == 2
      possible_move = board.select { |cell, occupier| win_com.include?(cell) && occupier == " " }.keys.first
      return possible_move if possible_move
    end
  end
  nil
end

def detect_chance(board)
  WINNING_COM.each do |win_com|
    if board.values_at(*win_com).count("O") == 2
      possible_killer = board.select { |cell, occupier| win_com.include?(cell) && occupier == " " }.keys.first
      return possible_killer if possible_killer
    end
  end
  nil
end

def npc_place_piece!(board)
  if detect_chance(board)
    choice = detect_chance(board)
  elsif detect_threat(board)
    choice = detect_threat(board)
  elsif board[5] == " "
    choice = 5
  else
    choice = untaken_cells(board).sample
  end
  board[choice] = "O"
end

def set_over?(board, scores)
  user_pieces = board.select { |_, occupier| occupier == "X" }.keys
  npc_pieces = board.select { |_, occupier| occupier == "O" }.keys
  WINNING_COM.each do |winning_com|
    if (winning_com & user_pieces).size == 3
      scores[:user] += 1
      puts "Set over, User's score +1. Current score is user: #{scores[:user]}, npc: #{scores[:npc]}"
      return true
    elsif (winning_com & npc_pieces).size == 3
      scores[:npc] += 1
      puts "Set over, NPC's score +1. Current score is user: #{scores[:user]}, npc: #{scores[:npc]}"
      return true
    end
  end
  false
end

def game_over?(scores)
  if scores[:user] == 3
    puts " You won! ".center(80, "*")
    return true
  elsif scores[:npc] == 3
    puts " NPC won! ".center(80, "*")
    return true
  end
  false
end

def tie?(board, scores)
  if untaken_cells(board).empty?
    puts "Set over, it's a Tie. Current score is user: #{scores[:user]}, npc: #{scores[:npc]}"
    return true
  end
  false
end

def update_screen(board)
  if board.count { |k,v| v == " " } >= 8
    display_board(board)
  else
    system("clear")
    display_board(board)
  end
end

def collect_mode
  puts display_mode
  mode = gets.chomp
  if mode == "user" || mode == "npc"
    return mode
  else
    puts "Invalid mode!!!"
    collect_mode
  end
end

def alternate_player(current_player)
  case current_player
  when "npc" then "user"
  when "user" then "npc"
  end
end

def place_piece!(board, current_player)
  case current_player
  when "user" then user_place_piece!(board)
  when "npc" then npc_place_piece!(board)
  end
end




# ------------------------------------------------------------------------------


loop do
  scores = {user:0, npc:0}
  current_player = collect_mode

  loop do
    board = new_board
    puts " New Set ".center(60, "*")

    loop do
      update_screen(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if set_over?(board, scores) || tie?(board, scores)
    end
    
    display_board(board)
    break if game_over?(scores)
  end

  puts "Play again?(y or n)"
  answer = gets.chomp
  break unless answer.start_with?("y")
end
