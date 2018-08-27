# it may use index as tool
# position may be the key
# use map to make a new array

def running_total(numbers)
  numbers.each.with_index do |n, i|
    if i > 0
      numbers[i] += numbers[i-1]
    end
  end
end

# standard solution
def running_total(numbers)
  sum = 0
  numbers.map { |n| sum += n }
end


# use each_with_object

def running_total(numbers)
  sum = 0
  numbers.each_with_object([]) { |n, a| a << sum += n  }
end
