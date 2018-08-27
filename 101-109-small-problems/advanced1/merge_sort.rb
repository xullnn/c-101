# Understand the problem
  # given 2 sorted arr, merge them into one sorted arr
  # the operation should gradually build the result array
  # should not merge first then sorted the merged one

  # notice edge cases like:
    # one of the sub array is empty
    # repretitive elements in a array

# Examples and test cases
  # merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
  # merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
  # merge([], [1, 4, 5]) == [1, 4, 5]
  # merge([1, 4, 5], []) == [1, 4, 5]

# Data structure
  # array

# Algorithm
  # create a new empty array
  # create two copys of the sub arrays say copy1, copy2
  # determine which one is shorter, then name them with short and long
  #
  # loop do
  #   break if short is empty
  #   min = shift 1 element from short (min element)
  #   iterate through long with its index
  #     if min < current element
  #       long.insert(index, min) # mutating long
  #       break # loop to next iteration
  #     end
  # end
  #
  # return long

require 'pry'

def short_and_long(arr1, arr2)
  arr1, arr2 = arr1.dup, arr2.dup # for the reason of not to mutate the callers
  if arr1.size > arr2.size
    [arr2, arr1]
  else
    [arr1, arr2]
  end
end


def merge(arr1, arr2)
  short,long = short_and_long(arr1, arr2)
  until short.empty?
    min_of_s = short.shift
    if min_of_s < long[-1]
      long.each.with_index do |e, i|
        if e > min_of_s
          long.insert(i, min_of_s)
          break
        end
      end
    else
      long << min_of_s
    end
  end
  long
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# standard solution

def merge(arr1, arr2)
  new_arr = []
  index = 0

  arr1.each do |el_1|
    while arr2.size > index && arr2[index] <= el_1
      new_arr << arr2[index]
      index += 1
    end
    new_arr << el_1
  end
  new_arr + arr2[index..-1]
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
