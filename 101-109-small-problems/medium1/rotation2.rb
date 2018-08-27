# understand the problem
  # given an integer and number of digits need to rotate
  # rotate the last n digits

# Examples and Test cases
  # rotate_rightmost_digits(735291, 1) == 735291
  # rotate_rightmost_digits(735291, 2) == 735219
  # rotate_rightmost_digits(735291, 3) == 735912
  # rotate_rightmost_digits(735291, 4) == 732915
  # rotate_rightmost_digits(735291, 5) == 752913
  # rotate_rightmost_digits(735291, 6) == 352917

# Data structure
  # integer
  # string

# Algorithm
  # to_s


def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_rightmost_digits(int, n)
  s_int = int.to_s
  s_int[-n..-1] = rotate_string(s_int[-n..-1])
  s_int.to_i
end
