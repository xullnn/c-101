# Understand the problem
  # take in an array of integers
  # sum the first 1 integer
  # then sum the first 2
  # then sum the first 3
  # till the last integer
  # then sum all the sums up

# Examples and Test cases
  # sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
  # sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
  # sum_of_sums([4]) == 4
  # sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data structure
  # array and integer

# Algorithm
  # based on the process:
    # say the array has n integers
    # so the frist integer will be added for n times
    # the second integer will be added for n - 1 times
    # and so on .. the last integer will be added for 1 time
  # size - index equals the times a integer will be used

def sum_of_sums(array)
  size = array.size
  sum = 0
  array.each.with_index { |int, index| sum += int * (size - index) }
  sum
end
