# understand the problem
  # given an integer
  # if the number of digits is l
    # first rotate all digits
    # then last l-1 digits
    # then last l-2 digits
    # until l - n == 2
  # return the integer we get from the last rotation

# Examples and Test cases
  # max_rotation(735291) == 321579
  # max_rotation(3) == 3
  # max_rotation(35) == 53
  # max_rotation(105) == 15 # the leading zero gets dropped
  # max_rotation(8_703_529_146) == 7_321_609_845

# Data structure
  # string
  # integer

# Algorithm
  # l = int.to_s.length
  # first rotate last l digits
  # then last l - 1
  # until l - n == 1


def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_rightmost_digits(int, n)
  s_int = int.to_s
  s_int[-n..-1] = rotate_string(s_int[-n..-1])
  s_int.to_i
end

def max_rotation(int)
  l = int.to_s.length
  n = 0
  until l - n == 1
    int = rotate_rightmost_digits(int, l-n)
    n += 1
  end
  int
end
