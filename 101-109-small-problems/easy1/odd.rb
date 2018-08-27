def is_odd?(n)
  n % 2 == 1 ? true : false
end

# standard solution
# better one
# n % 2 == 1

# If you weren't certain whether % were the modulus or remainder operator, how would you rewrite #is_odd? so it worked regardless?
# using division method

# def is_odd?(n)
#   n % 2 == 1 || n % 2 == -1
# end

# The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.

# def is_odd?(n)
#   n.remainder(2) == 1 || n.remainder(2) == -1
# end
