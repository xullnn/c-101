# Understand the problem
 # given a integer reverse its digits

# Examples and Test cases
  # reversed_number(12345) == 54321
  # reversed_number(12213) == 31221
  # reversed_number(456) == 654
  # reversed_number(12000) == 21 # Note that zeros get dropped!
  # reversed_number(1) == 1

# Data structure
  # array, integer

# Algorithm
 # use digits + reverse + join
 # to_s + reverse + to_i

def reversed_number(number)
  number.to_s.reverse.to_i
end
