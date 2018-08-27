# Understand the problem
  # take in an array of integers
  # multiply them then divide the result by the quantity of integers
  # the result keeps 3 decimal places

# Examples and Test cases
  # show_multiplicative_average([3, 5])
  # The result is 7.500
  #
  # show_multiplicative_average([6])
  # The result is 6.000
  #
  # show_multiplicative_average([2, 5, 7, 11, 13, 17])
  # The result is 28361.667

# Data structure
  # array, integer

# Algorithm
  # product = array.inject(:*).to_f
  # / array.size.round(3)


def show_multiplicative_average(array)
  product = array.inject(:*).to_f
  a = (product / array.size)
  puts format("%.3f", a)
end
