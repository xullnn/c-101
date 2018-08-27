# Understand the problem

  # Understand Fibonacci number
    # define first two number is 1
    # then from third number, every number is the sum of previous two number
  # in this problem we define the the first number has the index 1
  # the method take a number n
    # this n representing the how many digits a number is, for example, 1 has 1 digits, 21 has 2 digits
  # the target is get the first Fibonacci number's index that has n digits
    # for example, the first Fibonacci number has 2 digits is 13, and its index is 7

# Examples and Test cases

  # find_fibonacci_index_by_length(2) == 7
  # find_fibonacci_index_by_length(10) == 45
  # find_fibonacci_index_by_length(100) == 476
  # find_fibonacci_index_by_length(1000) == 4782
  # find_fibonacci_index_by_length(10000) == 47847

# Data structure


# Algorithm
# how to decide a Fibonacci numbers' digits amount: fibo.digits
# Since we don't wanna cal all Fibonacci numbers, so we use a loop
# how to cal Fibonacci numbers in a row:
  # First define pre = 0, current = 1, i = 0
# Loop
  # end point: fibo.digits != n
  # pre, current = current, pre + current; i += 1
  # after loop end, return i

def find_fibonacci_index_by_length(n)
  pre = 0
  current = 1
  i = 1
  while current.digits.size != n
    pre, current = current, pre + current
    i += 1
  end
  i
end
