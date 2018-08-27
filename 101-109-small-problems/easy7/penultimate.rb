# Understand the problem
 # given a string, return the penultimate word

# Examples and Test cases
  # penultimate('last word') == 'last'
  # penultimate('Launch School is great!') == 'is'

# Data structure
  # string and array

# Algorithm
  # split string into an array of strings
  # then array[-2]

def penultimate(string)
  string.split[-2]
end
