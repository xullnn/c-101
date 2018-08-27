# understand the problem
  # what is double numebr here?
    # if a integer has even number of digits and the left half of the digits are the same as the right half side of the digits
    # otherwise the integer is not a double number
    # an integer has odd number of digits would never be a double number
  # if the number is a double number return itself
  # otherwise return the double the given integer

# Examples and Test cases
  # twice(37) == 74
  # twice(44) == 44
  # twice(334433) == 668866
  # twice(444) == 888
  # twice(107) == 214
  # twice(103103) == 103103
  # twice(3333) == 3333
  # twice(7676) == 7676
  # twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  # twice(5) == 10

# Data structure
  # intege array

# Algorithm
  # get the digits = integer.digits
  # if digits.size.odd? return the product of 2 times integer
  # if even?
    # compare the left and right half side of the digits
      # if same return itself
      # otherwise return product of 2 times integer


def twice(int)
  digits = int.digits
  size = digits.size
  if size.odd?
    int * 2
  else
    digits[0,size/2] == digits[size/2..-1] ? int : int * 2
  end
end
