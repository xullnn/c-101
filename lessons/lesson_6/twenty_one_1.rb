# Data structure
# clubs (♣), diamonds (♦), hearts (♥), spades (♠)
SUITS = %w[(♣) (♦) (♥) (♠)]

def new_deck
  deck = {}
  SUITS.each do |suit|
    (2..9).each do |n|
      deck["#{n}#{suit}"] = n
    end
    %w(jack queen king).each do |card|
      deck["#{card}#{suit}"] = 10
    end
    deck["ace#{suit}"] = 0
  end
  deck
end

def calculate_total(cards)
  if cards.keys.any? { |card| card.include?("ace") }
    total_ex_ace = cards.select { |card, _| !card.include?("ace") }.values.sum
    limit = 21 - total_ex_ace
    aces = cards.select { |card, _| card.include?("ace") }
    total_ex_ace + total_of_aces(aces, limit)
  else
    cards.values.sum
  end
end

def total_of_aces(aces, limit)
  case aces.size
  when 1
    limit > 10 ? 11 : 1
  when 2
    limit > 11 ? 11 + 1 : 1 + 1
  when 3
    limit > 12 ? 11 + 1 + 1 : 1 + 1 + 1
  when 4
    limit > 13 ? 11 + 1 + 1 + 1 : 1 + 1 + 1 + 1
  end
end

def hide_a_card!(dealer_cards)
  cards = dealer_cards.keys
  dealer_cards["hide"] = { cards[0] => dealer_cards.delete(cards[0]) }
  dealer_cards["show"] = { cards[1] => dealer_cards.delete(cards[1]) }
end

def first_deal(new_deck)
  two_pairs = [{}, {}]
  two_pairs.map do |pair|
    new_deck.keys.sample(2).each do |card|
      pair[card] = new_deck.delete(card)
    end
  end
  hide_a_card!(two_pairs[1])
  two_pairs
end

def busted?(cards)
  calculate_total(cards) > 21
end

def format_cards(array)
  case array.size
  when 1 then array[0]
  when 2 then "#{array[0]} and #{array[1]}."
  else
    last = array.delete_at(-1)
    array.join(", ") + " and " + last
  end
end

def display_cards(cards_of_player, dealer_cards)
  strf_player_cards = format_cards(cards_of_player.keys)
  puts "\nYour current cards are: #{strf_player_cards}"
  if dealer_cards.keys.include?("show")
    strf_dealer_cards = format_cards(dealer_cards["show"].keys)
    puts "Dealer current cards are: #{strf_dealer_cards} and an unkonwn\n\n"
  else
    strf_dealer_cards = format_cards(dealer_cards.keys)
    puts "Dealer current cards are: #{strf_dealer_cards}\n\n"
  end
end

def ask_move
  puts "Choose 'hit' or 'stay':"
  answer = gets.chomp
  unless answer == 'hit' || answer == 'stay'
    puts "Invalid answer!!!"
    ask_move
  end
  answer
end

def extract_cards(dealer_cards)
  dealer_cards.each_with_object({}) do |(_, cards), hash|
    cards.each do |card, value|
      hash[card] = value
    end
  end
end

def print_winner(cards_of_player, dealer_cards)
  player_scores = calculate_total(cards_of_player)
  dealer_scores = calculate_total(extract_cards(dealer_cards))
  display_cards(cards_of_player, extract_cards(dealer_cards))
  if player_scores > 21 || (dealer_scores <= 21 && dealer_scores > player_scores)
    puts center(" Dealer won! Scores are #{dealer_scores} vs #{player_scores} ")
  elsif dealer_scores > 21 || (player_scores <= 21 && player_scores > dealer_scores)
    puts center(" Player won! Scores are #{player_scores} vs #{dealer_scores} ")
  elsif player_scores == dealer_scores
    puts center("It's a Tie! #{player_scores} vs #{dealer_scores}")
  end
end

def center(string)
  string.center(70, "*")
end

def hit_player!(deck, cards_of_player)
  card = deck.keys.sample
  cards_of_player[card] = deck.delete(card)
end

def hit_dealer!(deck, dealer_cards)
  puts center(" Dealer choose to hit... ")
  card = deck.keys.sample
  dealer_cards["show"][card] = deck.delete(card)
end

# round cycle
loop do
  deck = new_deck
  cards_of_player, dealer_cards = first_deal(new_deck)
  display_cards(cards_of_player, dealer_cards)

  loop do
    loop do # player turn
      answer = ask_move
      hit_player!(deck, cards_of_player) if answer == 'hit'
      display_cards(cards_of_player, dealer_cards)
      break if answer == 'stay' || busted?(cards_of_player)
    end

    # dealer's turn
    if busted?(cards_of_player)
      print_winner(cards_of_player, dealer_cards)
      break
    elsif calculate_total(extract_cards(dealer_cards)) < 17
      hit_dealer!(deck, dealer_cards)
      display_cards(cards_of_player, dealer_cards)
      break print_winner(cards_of_player, dealer_cards) if
      busted?(extract_cards(dealer_cards))
      puts center(" Keep going... ")
    else
      puts center(" Dealer choose to stay... ")
      print_winner(cards_of_player, dealer_cards)
      break
    end
  end
  puts "\nPlay another round?('y' or 'n')"
  answer = gets.chomp
  break unless answer.start_with?('y')
end
