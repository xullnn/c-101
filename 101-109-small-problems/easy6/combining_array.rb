# Understand the problem
  # combining two arrays into one
  # remove duplicated elements

# Examples and Test cases
  # merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
  # merge([1,2,1,3],[]) == [1,2,3]

# Data structure
  # Array

# Algorithm
  # first use '+' method then 'uniq!'

def merge(a,b)
  (a + b).uniq!
end

# standard solution
# http://ruby-doc.org/core-2.5.1/Array.html#method-i-7C
# Set Union - Returns a new array by joining ary with other_ary, excluding any duplicates and preserving the order from the given arrays.
def merge(a,b)
  a | b
end
