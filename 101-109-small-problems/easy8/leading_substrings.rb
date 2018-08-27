# Understand the problem
  # take in a string containing one or more letters
  # return an array containing: string[0,1], string[0,2], string[0,3]...

# Examples and Test cases
  # substrings_at_start('abc') == ['a', 'ab', 'abc']
  # substrings_at_start('a') == ['a']
  # substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Data structures
  # string and array

# Algorithm
  # String#chars.map
  # 1.upto string.length

def substrings_at_start(string)
  1.upto(string.length).map { |n| string[0,n] }
end
