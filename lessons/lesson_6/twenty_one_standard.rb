def new_deck
  SUITS.product(NUMS).shuffle
end

def first_dealing!(deck)
  cards = [[], []]
  cards.each do |card|
    2.times { card << deck.pop }
  end
  cards
end

def hit_a_card!(deck, cards, name)
  system('clear') || system('cls')
  prompt "#{name.capitalize} choose to hit..."
  cards << deck.pop
end

def max_value(cards)
  sum = 0
  cards.each do |card|
    value = card[1]
    sum =
      if value == 'A' then sum + 11
      elsif value.to_i == 0 then sum + 10
      else  sum + value.to_i
      end
  end
  sum
end

def adaptable_value(cards)
  ajusted = max_value(cards)
  cards.select { |card| card.include?('A') }.count.times do
    ajusted -= 10 if ajusted > BUST_POINT
  end
  ajusted
end

def ask_move
  prompt "hit or stay? (enter 'h/hit' or s/stay): "
  answer = gets.chomp
  if answer == 'h' || answer == 'hit'
    'hit'
  elsif answer == 's' || answer == 'stay'
    'stay'
  else
    prompt "Invalid choose! Accessible input are h/hit or s/stay."
    ask_move
  end
end

def ask_point
  point = gets.chomp.to_i
  if point > 2
    point
  else
    prompt "You'd better enter a number > 2."
    ask_point
  end
end

def use_default_points?
  default = gets.chomp.downcase
  if default == 'n'
    false
  elsif default == 'y'
    true
  else
    prompt "Just answer 'y' or 'no'."
    use_default_points?
  end
end

def display_cards(player_cards, dealer_cards, disclose=false)
  puts "Player's cards: #{player_cards}"
  if disclose
    puts "Dealer's cards: #{dealer_cards}"
  else
    puts "Dealer's cards: #{dealer_cards[1..-1]} and ??? "
  end
end

def busted?(scores)
  scores > BUST_POINT
end

def report_result(player_scores, dealer_scores)
  if player_scores > BUST_POINT
    emphasize_puts "Player busted: #{player_scores}. Dealer: #{dealer_scores}."
  elsif dealer_scores > BUST_POINT
    emphasize_puts "Dealer busted: #{dealer_scores}. Player: #{player_scores}."
  elsif player_scores > dealer_scores
    emphasize_puts "Player won! #{player_scores} vs #{dealer_scores}."
  elsif player_scores < dealer_scores
    emphasize_puts "Dealer won! #{dealer_scores} vs #{player_scores}."
  else
    emphasize_puts "It's a tie! #{dealer_scores} vs #{player_scores}."
  end
end

def prompt(string)
  puts ""
  puts "=> #{string}"
  puts ""
end

def emphasize_puts(string)
  string = "  " + string + "  "
  puts ""
  puts string.center(70, "*")
  puts ""
end

SUITS = ['Heart', 'Diamond', 'Spade', 'Club']
NUMS = %w[2 3 4 5 6 7 8 9 J Q K A]

intro = <<INTRO
This Game needs a busted point for both players and a staying point for dealer.
Here's something you should notice:

   - Until dealer's score were samller than staying point, it had to choose hit.
   - Busted point must be greater than staying point.
   - Overly small numbers are not good choice.

The default combination is 21 and 17. If that's what you want.
Enter 'y' or "Y".
If you wanna customize them.
Enter 'n' or 'N'.
Do you wanna use 21 and 17 as your default setting?
INTRO

# ask for customized bust point and stay point
bust = 21
stay = 17
loop do
  prompt intro
  break if use_default_points?
  prompt "Choose a busted point: "
  bust = ask_point
  prompt "Choose a staying point for dealer (smaller than busting point) : "
  stay = ask_point

  if bust >= stay
    break
  else
    prompt "Not a valid combination. Try again."
  end
end

BUST_POINT = bust
STAY_POINT = stay

# start a round
loop do
  system("clear")
  deck = new_deck
  player_cards, dealer_cards = first_dealing!(deck)
  emphasize_puts " New round! "
  display_cards(player_cards, dealer_cards)
  player_scores = adaptable_value(player_cards)
  dealer_scores = adaptable_value(dealer_cards)

  # into a round
  loop do
    # player's turn
    loop do
      next_move = ask_move
      if next_move == 'hit'
        hit_a_card!(deck, player_cards, "player")
        player_scores = adaptable_value(player_cards)
      end
      break if busted?(player_scores) || next_move == "stay"
      display_cards(player_cards, dealer_cards)
    end

    # dealer's turn
    break if busted?(player_scores)
    if dealer_scores < STAY_POINT
      hit_a_card!(deck, dealer_cards, "dealer")
      dealer_scores = adaptable_value(dealer_cards)
      break if busted?(dealer_scores)
    else
      break
    end
    display_cards(player_cards, dealer_cards)
  end

  system('clear') || system('cls')
  prompt "Finnal comparison..."
  display_cards(player_cards, dealer_cards, true)
  report_result(player_scores, dealer_scores)

  prompt "Play again?('y' or 'n'):"
  answer = gets.chomp
  break unless answer.start_with?('y')
end
