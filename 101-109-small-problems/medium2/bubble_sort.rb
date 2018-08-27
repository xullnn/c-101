# Understand problem
  # swap through the array
    # sort every 2 consecutive element
  # while no two consecutive elements need to sort
    # done

# Examples and test cases
  # array = [5, 3]
  # bubble_sort!(array)
  # array == [3, 5]
  #
  # array = [6, 2, 7, 1, 4]
  # bubble_sort!(array)
  # array == [1, 2, 4, 6, 7]
  #
  # array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  # bubble_sort!(array)
  # array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Data structe
  # array

# Algorithm
  # use incremental index to locate consecutive elements
  # how to determine the moment to abort sorting
    # use a counter to record the time of swapping in every iteration cycle
    # whenever the counter == 0 after a iteration cycle , stop sorting

def bubble_sort!(array)
  times = (1..(array.size - 1)).to_a
  loop do
    swapped = 0
    times.pop.to_i.times do |a|
      b = a + 1
      if array[a] > array[b]
        array[b], array[a] = array[a,2]
        swapped += 1
      end
    end
  return array if swapped == 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
