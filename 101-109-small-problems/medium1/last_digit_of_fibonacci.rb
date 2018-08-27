# Understand the problem
  # calculate the nth fibonacci number's last digit

# Examples and Test cases
  # fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
  # fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
  # fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
  # fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
  # fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
  # fibonacci_last(123456789) # -> 4

# Data structure
  # integer

# Algorithm
  # Solution 1:
    # calculate exact fibonacci number then get its last digit

  # Solution 2:
    # every step we just get the last digit, thus may reduce the quantity of calculating


def fibonacci_last(nth)
  n = 1
  previous = 0
  current = 1
  while n < nth
    n += 1
    previous, current = current % 10, (previous + current) % 10
  end
  current % 10
end
