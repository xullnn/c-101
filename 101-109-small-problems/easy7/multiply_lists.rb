# Understand the problem
  # given two arrays , multiply twe elements in the same index
  # return a one dimensional array

# Examples and Test cases
  # multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data structure
  # array, integer

# Algorithm
  # use zip
    # a.zip(b).map do |pair|
    #   pair.inject(:*)
    # end
  # more brute
    # a.map.with_index do |e,i|
    # e * b[i]
    # end

def multiply_list(a,b)
  a.map.with_index { |e,i| e * b[i]}
end

def multiply_list(a,b)
  a.zip(b).map { |pair|pair.inject(:*) }
end
