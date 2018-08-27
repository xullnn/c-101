# use `digits` method for integer

def digit_list(n)
  n.digits.reverse
end

# more fundamental one
def digit_list(n)
  digits = []
  x = 10
  loop do
    digit = n % x / (x / 10)
    digits.prepend(digit)
    break if n % x == n
    x *= 10
  end
  digits
end

# turn integer to string then using iterator then back to integer

# n.to_s.chars.map(&:to_i)

# standard solution
# solution use `divmod`
# http://ruby-doc.org/core-2.5.1/Numeric.html#method-i-divmod

# def digit_list(n)
#   digits = []
#   loop do
#     n,remainder = n.divmod(10)
#     digits.unshift(remainder)
#     break if n == 0
#   end
#   digits
# end
