# https://en.wikipedia.org/wiki/Merge_sort
# Understand merge sort
  # split array into single-element sub arrays
  # recursively do
  #  merge adjacent two sub arrays while sorting them
  # end recursion while there's only on sub array

# Examples and test cases
  # merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
  # merge_sort([5, 3]) == [3, 5]
  # merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
  # merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
  # merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# Data structure
  # array

# Algorithm
  # split original array into single-element array

  # iterate through thi array
    # combine ajacent sub arrays while sorting them
    # repeat this process untill there only left 1 sub array

  # recursive approach
    # base case: only left one sub array

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

def merge_sort(arr)
  if arr.size == 1
    return arr
  else
    arr1 = arr[0, arr.size/2]
    arr2 = arr[arr.size/2..-1]

    sub1 = merge_sort(arr1)
    sub2 = merge_sort(arr2)
    merge(sub1, sub2)
  end
end


p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])
# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
#





















merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
