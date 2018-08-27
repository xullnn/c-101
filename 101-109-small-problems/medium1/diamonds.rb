# Understand the problem
  # draw 4-point diamond in a n x n grid
  # the numebr of stars

# Examples and Test cases
  # diamond(9)
  #
  #     *
  #    ***
  #   *****
  #  *******
  # *********
  #  *******
  #   *****
  #    ***
  #     *

# Data structure
  # string

# Algorithm
  # use `String#center`

def diamond(n)
  array = (1..n).step(2).to_a
  array += array[0..-2].reverse
  array.each do |x|
    puts ("*" * x).center(n)
  end
end
