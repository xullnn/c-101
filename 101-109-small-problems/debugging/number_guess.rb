# def valid_integer?(string)
#   string.to_i.to_s == string
# end
#
# def guess_number(max_number, max_attempts)
#   winning_number = (1..max_number).to_a.sample
#   attempts = 0
#
#   loop do
#     attempts += 1
#     break if attempts > max_attempts
#
#     input = nil
#     until valid_integer?(input)
#       print 'Make a guess: '
#       input = gets.chomp
#     end
#
#     p guess = input.to_i
#
#     if guess == winning_number
#       puts 'Yes! You win.'
#     else
#       puts 'Nope. Too small.' if guess < winning_number
#       puts 'Nope. Too big.'   if guess > winning_number
#
#       # Try again:
#       guess_number(max_number, max_attempts)
#     end
#   end
#
# end
#
# guess_number(10, 3)
#
#
# Line 28 note that this is a recursive method, the problem is line 6 winning_number = (1..max_number).to_a.sample
# When a guess failed, we will call this method again, but very time we `sample` a new winning_number, so the winning_number is always changing
#
# Also line 7, attempts = 0, when a guess failed, the attempts is cleared to 0 again this leads a inifinite cycle
#

# To fix this:
# 1. we can get rid of the recursive method call, the loop can take care of the work
# 2. when we get the right number it puts out a winning message, but it doesn't abort the program this may cause confusion
#   so we add a `break` beneath `puts 'Yes! You win.'`
# 3. when reach the max attempts times, the program exit directly without any clue
#   to make it less confusion, change it to:
#   if attempts > max_attempts
#     puts "Guessing times used up."
#     break
#   end
#

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

    loop do
      attempts += 1
      if attempts > max_attempts
        puts "Guessing times used up."
        break
      end

      input = nil
      until valid_integer?(input)
        print 'Make a guess: '
        input = gets.chomp
      end

      p guess = input.to_i

      if guess == winning_number
        puts 'Yes! You win.'
        break
      else
        puts 'Nope. Too small.' if guess < winning_number
        puts 'Nope. Too big.'   if guess > winning_number
      end
    end
end

guess_number(10, 3)


# Another problem is when we get the right guess, the loop doesn'be broken(line 21 22)
