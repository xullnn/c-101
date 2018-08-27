# understand the problem
  # given two arguments
  # the second is the starting number
  # the first one the count(how many numbers it will be returned)
  # return an array, in the array are:
    # starting number * 1
    # starting number * 2
    # ...
    # do this (first argument) times

# Examples and Test cases
  # sequence(5, 1) == [1, 2, 3, 4, 5]
  # sequence(4, -7) == [-7, -14, -21, -28]
  # sequence(3, 0) == [0, 0, 0]
  # sequence(0, 1000000) == []

# Data structure
  # array (index)

# Algorithm
  # n.times.map

def sequence(a,b)
  a.times.map { |n| b * (n+1) }
end

# standard solution

(1..b).map { |n| b * n }
