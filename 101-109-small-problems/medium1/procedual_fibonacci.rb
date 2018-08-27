# Understand the problem
  # ruby cannot handle heavy recursion
  # every recursive program can be written in procedual program
  # write a non-recursive fibonacci method

# Examples and Test cases
  # fibonacci(20) == 6765
  # fibonacci(100) == 354224848179261915075
  # fibonacci(100_001) # => 4202692702.....8285979669707537501

# Data structure
  # integer

# Algorithm
  # instead of thinking recursively(top to bottom), procedual program could think in bottom-top way
  # so we can calculate from first to nth
  # use loop
  # use 2 variables to represent previous fibonacci and current fibonacci

def fibonacci(nth)
  n = 1
  current = 1
  previous = 0
  while n < nth
    n += 1
    previous, current = current, previous + current
  end
  current
end
