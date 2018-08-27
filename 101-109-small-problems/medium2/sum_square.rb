# Understand the problem
  # square of the sum of first n
    # (1+2+3..+n)**2
  # sum of the square of the first n
    # 1^2 + 2^2 + ... n^2
  # calculate the difference

# Examples and test cases
  # sum_square_difference(3) == 22
  #    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
  # sum_square_difference(10) == 2640
  # sum_square_difference(1) == 0
  # sum_square_difference(100) == 25164150

# Data structure
  # range
  # integer

# Algorithm
  # two reduce operation

def sum_square_difference(n)
  (1..n).reduce(:+) ** 2 - (1..n).reduce { |acc, x|  acc + x**2 }
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# another method of calculating sum of square
# (1..n).to_a.sum**2
