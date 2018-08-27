# understand the problem
  # take an array of numbers as argument
  # split the array into 2 arrays, each one contains half amount of the original array
  # if the quantity of the original array is odd, the first returning array would get the extra element

# Examples and Test cases
  # halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  # halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  # halvsies([5]) == [[5], []]
  # halvsies([]) == [[], []]

# Data structure
  # array

# Algorithm
  # determine how many elements each array would get
    # n = array.size.to_f / 2
    # x = n.round(half: :up); y = n.to_i
    # a = array[0, x]
    # b = array[x,y]

def halvsies(array)
  n = array.size.to_f / 2
  x = n.ceil
  y = n.to_i
  [array[0,x], array[x,y]]
end
