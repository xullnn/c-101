
require "pry"

def new_board
  blank_board = {}
  [1, 2, 3].each do |row|
    [1, 2, 3].each do |column|
      blank_board[[row, column]] = nil
    end
  end
  blank_board
end

def untaken_cells(board)
  board.select { |_, state| !state }.keys
end

def make_choice
  puts "Please make a choice(like 1:2 or 2:3 ...):"
  choice = gets.chomp
  choice.split(":").map(&:to_i)
end

def tie?(board)
  board.select { |_, occupier| occupier }.count == 9
end

def win?(choices)
  diagonal1 = [[1, 1], [2, 2], [3, 3]]
  diagonal2 = [[3, 1], [2, 2], [1, 3]]
  rows = choices.map { |choice| choice[0] }.sort
  columns = choices.map { |choice| choice[1] }.sort
  [1, 2, 3].each do |n|
    if rows.count(n) == 3 || columns.count(n) == 3
      return true
    elsif (choices & diagonal1).size == 3
      return true
    elsif (choices & diagonal2).size == 3
      return true
    end
  end
  false
end

def visualize_board(board)
  line1 = board.select { |cell, _| cell[0] == 1 }
  line2 = board.select { |cell, _| cell[0] == 2 }
  line3 = board.select { |cell, _| cell[0] == 3 }
  [line1, line2, line3].each do |line|
    print_a_line(line)
  end
end

def print_a_line(line)
  strings = line.map do |_, occupier|
    if occupier == "user"
      "x"
    elsif occupier == "computer"
      "O"
    elsif occupier.nil?
      "-"
    end
  end
  puts strings.join("")
end

INTRO = <<MM
  Welcome to Tic-Tac-Toe
  Every cell in the board is respresented by two numbers: row and column
  For example (1,2) respresents you choosed to fill the cell of row 1 column 2
  Enter the two number with a colon as seperating mark like 1:2 or 2:3 (NO Space)
MM

loop do
  puts INTRO

  board = new_board

  puts "Now available cells are #{untaken_cells(board)}"

  loop do
    puts "Available choices are #{untaken_cells(board)}"
    choice = make_choice
    loop do
      if untaken_cells(board).include?(choice)
        board[choice] = "user"
        break
      else
        puts "This cell has been taken, please choice another one from \
        #{untaken_cells(board)}"
        choice = make_choice
      end
    end

    if tie?(board)
      puts "Game over, it's a Tie!".center(50, "*")
      break
    end

    user_choices = board.select { |_, occupier| occupier == "user" }.keys

    npc_choice = untaken_cells(board).sample

    board[npc_choice] = "computer"

    npc_choices = board.select { |_, occupier| occupier == "computer" }.keys

    visualize_board(board)

    if win?(user_choices)
      puts "Congratulations you WON!".center(50, "*")
      break
    elsif win?(npc_choices)
      puts "Sorry, you lost, computer won.".center(50, "*")
      break
    elsif tie?(board)
      puts "Game over, it's a Tie!".center(50, "*")
      break
    end
  end

  puts "Play again?"
  answer = gets.chomp
  break if !answer.start_with?("y")
end
