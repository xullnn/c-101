# Bug 1: line 40
# `cards.map` return a new array contains the corresponding value of every card
# but here the caller `cards` has not been changed, so the line 34 raises an TypeError
# because the cards array contains variouse integers or symbols
#
# To fix this add an exclamation mark after the `map` -- `map!`
# Thus `cards.sum` would work.
#
# Bug 2: It's about the method it picks cards
# Look at line 1 to 6, see how we build the deck, a fact is every `cards` object in deck is exactly the same object
# It means if we pop a card from `cards` object, all the four values in deck will be changed
# That's what line 24 is doing.
# This causes a situation that when we pick 1 card, we actually lose 4 cards from every suit.
# It looks like player just pick 4 cards, but in fact 16 cards are deducted from deck.
# This is what line 24 is doing.
#
# To fix this
#   avoid use same object as all four values in deck hash
#   for example add `.dup` after `cards` in line 3-6


cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

p player_cards
# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, cards)|
  cards.map! do |card|
    score(card)
  end

  sum += cards.sum
end

puts sum
