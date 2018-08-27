# Understand the problem
  # given a integer n
  # print a line which always take n bytesize with 1 star on the right side
  # then 2 stars
  # 3 stars
  # ...until n stars

# Examples and Test cases
  # triangle(9)
  #
  #         *
  #        **
  #       ***
  #      ****
  #     *****
  #    ******
  #   *******
  #  ********
  # *********

# Data structure
  # string

# Algorithm
  # 1 star rjust(5)
  # 2 stars rjust(5)

# with `String#rjust`
def triangle(n)
  (1..n).each do |x|
    p ('*' * x).rjust(n)
  end
end

# brute one
def triangle(n)
  s = 1
  while s <= n
    puts " " * (n-s) + "*" * s
    s += 1
  end
end
