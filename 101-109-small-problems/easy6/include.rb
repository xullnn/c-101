# Understand the problem
  # here 'include' can be interpret as 'Is there a same element as e?'

# Examples and Test cases
  # include?([1,2,3,4,5], 3) == true
  # include?([1,2,3,4,5], 6) == false
  # include?([], 3) == false
  # include?([nil], nil) == true
  # include?([], nil) == false

# Data structure
# array and integer

# Algorithm
  # comparing e with every element in the given array
  # if there found the same one return true
  # if there's no same element return false

def include?(array, obj)
  array.each { |e| return true if obj == e }
  false
end

# standdard solution
def include?(array, obj)
  !!array.find_index(obj)
end
