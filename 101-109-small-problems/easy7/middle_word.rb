# Understand the problem
  # take in a sentence, get the word in the middle of the sentence
  # consider as many edge cases as you can

# irregular structure
  # when 2 or more spaces between two words
  # when 2 ore more spaces before the first word or behind the last word

# quantity of words
  # when odd
  # when even
  # when empty string
  # when one or more spaces

# Examples and Test cases
  # "     This sentence contains five words."
  # "This sentence contains five words.     "
  # "This      sentence contains five words."

  # "But this sentence contains six words."

# Data structure
  # string and array

# Algorithm
  # first compact the string, remove all the repeated spaces(String#split whill do it for us)
  # split string into an array of words
  # when words quantity is odd?
    # get the middle one, index = array.size / 2
  # when words quantity is even?
    # get the word just after the middle position, also index = array.size / 2
  # when empty string or one or more spaces, return nil

def middle_word(string)
  words = string.split
  words[words.size / 2]
end
