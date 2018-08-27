

# Understand the problem
 # similar to substrings_at_start(string)
 # instead the string we pass in is changing dynamically

# Examples and Test cases
  # substrings('abcde') == [
  #   'a', 'ab', 'abc', 'abcd', 'abcde',
  #   'b', 'bc', 'bcd', 'bcde',
  #   'c', 'cd', 'cde',
  #   'd', 'de',
  #   'e'
  # ]

# Data structures
  # array and string

# Algorithm
  # use substrings_at_start as core
  # nesting an outer map which will pass different string in
def substrings_at_start(string)
  1.upto(string.length).map { |n| string[0,n] }
end

def substrings(string)
  strings = 0.upto(string.length - 1).map { |n| string[n..-1] }
  strings.map { |s| substrings_at_start(s)}.flatten
end
