# Understand the problem
 # for each element in array1 as a, multiply a by every element in array2
 # return a sorted array containing all the products

# Examples and Test cases
  # multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data structure
  # array

# algorithm
  # nested iteration
  # outer level use map
  # inner one use each

def multiply_all_pairs(a,b)
  new_arr = []
  a.map do |x|
    b.each do |y|
     new_arr << x * y
    end
  end
  new_arr.sort
end

# use Array#product
def multiply_all_pairs(a,b)
a.product(b).map { |pair| pair.inject(:*) }.sort
end
