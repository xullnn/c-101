# Based on the expected output
#
# []
# [21]
# [9, 16]
# [25, 36, 49]
#
# the original purpose of the program should be:
#  if array is empty? then return a empty array
#  if array.size == 1 then multiply the single element with 7
#  else calculate the square of every elements

def my_method(nums)
  if nums.empty?
    nums
  elsif nums.size == 1
    [nums[0] * 7]
  else
    nums.map { |n| n ** 2 }
  end
end


# standard solution mentions some key points

  # elsif is not following any expression in its line
  # but ruby would move downward until it find one
  # in this case the one is :
  #
  #   array.map do |value|
  #    value * value
  #  end
  #
  # yes it will use the return value of map(at least an array)
  # so it will always evaluates to true
  # therefore unless the passing in array is empty, the code will surely go into this branch
  # actually rewrite the code a little thing would go more clearer:
  #
  # ...
  # elsif array.map { |value| value * value }
  #
  # else
  # ...
  #
  # since there's no code in this elsif branch, it's equivalent to nil
  # so if the code goes into this branch, method will return nil
