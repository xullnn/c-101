# understand the problem
  # given an array
  # rotate the elements
    # imagine all the elements is a cycle from a top view
    # then rotate them clockwise

  # or think like this:
    # move the first element to the last position of the array
    # other elements move forward as a whole

# Examples and Test cases
  # rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  # rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  # rotate_array(['a']) == ['a']
  #
  # x = [1, 2, 3, 4]
  # rotate_array(x) == [2, 3, 4, 1]   # => true
  # x == [1, 2, 3, 4]                 # => true


# Algorithm
  # create a new array
  # push 1..-1 then push 0

def rotate_array(origin)
  new_arr = []
  new_arr << origin[1..-1]
  new_arr << origin[0]
  new_arr.flatten
end

# standard solution

def rotate_array
  origin[1..-1] + [origin[0]]
end

# rotate string

# "string" => "trings"
# "s" => "s"

def rotate_string(string)
  string[1..-1] + string[0]
end

# rotate integer

# 2568 => 5682
# 2340 => 3402
# 2034 => 342
# 2 => 2
def rotate_integer(int)
  rotate_string(int.to_s).to_i
end
