# Understand the problem
  # reverse array **in place**
  # means mutating the array immediately
  # means the original input array must be changed after processing
  # not a new copy

# Examples and Testcase
  # list = [1,2,3,4]
  # result = reverse!(list) # => [4,3,2,1]
  # list == [4, 3, 2, 1]
  # list.object_id == result.object_id

# Data structure
 # array

# Algorithm
  # swap first and last element, then the one after first and the one before last
   # array[i-1], array[i] = array[i], array[i-1], i -= 1
   # do it array.size / 2.to_i times
    # if there are even numbers elments, the times we swap elements ensure every element's position has been changed
    # if there are odd numbers elements, we left the central element unmoved that's ok

def reverse!(array)
  first = 0
  last = -1
  (array.size / 2).to_i.times do
    array[first], array[last] = array[last], array[first]
    first += 1
    last -= 1
  end
  array
end
