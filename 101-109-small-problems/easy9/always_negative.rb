# understand the problem
  # given any integr
  # always return its negative value
  # 0 returns 0

# Examples and Test case
  # negative(5) == -5
  # negative(-3) == -3
  # negative(0) == 0

# Data structure
  # integer

# Algorithm
  # if > 0 -integer
  # else integer

def negative(int)
  if int > 0
    - int
  else
    int
  end
end

# Another way is using Numeric#abs to get the absolute value of the integer
# http://ruby-doc.org/core-2.5.1/Integer.html#method-i-abs
def negative(int)
  -int.abs
end
