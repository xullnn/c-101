# Understand the prolem
  # definition of 'featured'
    # odd number
    # multiple of 7
    # no repetitive digits

  # write a method take an integer say 'int'
  # find the nearest featured number that is greater than int

  # print out a message if there found none

# Examples and test cases
  # featured(12) == 21
  # featured(20) == 21
  # featured(21) == 35
  # featured(997) == 1029
  # featured(1029) == 1043
  # featured(999_999) == 1_023_547
  # featured(999_999_987) == 1_023_456_987
  #
  # featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Date structure
  # integer

# Algorithm
  # how to find next number divisible by 7?
    # def next_7_divisible(current)
    #   current + ( 7-current % 7 )
    # end
  # if current now is even then continuing to find next
  # if current now is odd?
    # if digits are unique return it
    # else continuing to find next
  # when to put the error message
    # notice the limit that "digits" should all be unique
    # so the possible bigest number is 9876543210

# this will throw a stack to deep from the penultimate test case
def featured(num)
  next_one = next_7_divisible(num)
  return "There is no possible number that fulfills those requirements." if next_one > 9876543210
  if next_one.even? || next_one.digits.uniq != next_one.digits
    featured(next_one)
  else
    return next_one
  end
end

MSG = "There is no possible number that fulfills those requirements."

def next_7_divisible(current)
  current + ( 7-current % 7 )
end

def featured(num)
  current = num
  loop do
    current = next_7_divisible(current)
    return MSG if current > 9876543210
    break if current.odd? && current.digits.uniq == current.digits
  end
  current
end
