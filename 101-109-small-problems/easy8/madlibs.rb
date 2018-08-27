# Understand the problem
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
  # Do you [verb] your [adj] [noun] [adv]?

# Data structure
  # string

# Algorithm
  # use `gets.chomp` to get every type of word respectively
  # fill the word in the structure

puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an ajective:"
adj = gets.chomp

puts "Enter and adverb:"
adv = gets.chomp

response = "That's hilarious!"

puts "Do you #{verb} your #{adj} #{noun} #{adv}? #{response}"
