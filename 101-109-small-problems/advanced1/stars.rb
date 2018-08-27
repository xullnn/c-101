# Understand the problem
# given a odd numebr n
  # n of stars will as the centeral line of a 'starry' shape
  # the surroundings are 3 stars in a line
  # from center to out, space between stars are incremental until they take a n chars space

# Examples and test cases

# star(7)
#
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# star(9)
#
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# Algorithm
  # treat the whole shape as 3 parts
    # 1 centeral line
    # 2 upper part
    # 3 reversed upper part

  # for part 2 and 3
    # use "*".join(incremental or decgressive spaces) to get single line
    # then center it

def star(n)
  up = (n - 3) / 2
  stars = %w[* * *]
  up.downto(0) { |spaces| puts stars.join(" " * spaces).center(n)}
  puts "*" * n
  0.upto(up) { |spaces| puts stars.join(" " * spaces).center(n)}
end

star 9
star 17
