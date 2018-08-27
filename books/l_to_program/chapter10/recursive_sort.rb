def recursive_sort(unsorted_array, sorted_array)
  if unsorted_array.empty?
    return sorted_array
  end
  sorted_array << find_smallest(unsorted_array)
  recursive_sort(unsorted_array, sorted_array)
end

def find_smallest(array)
  smallest = array[0]
  array.each do |e|
    if e < smallest
      smallest = e
    end
  end
  i = array.index(smallest)
  array.delete_at(i)
  smallest
end

unsorted_array = [2,3,1,5,5,5,12,6,7,0]
sorted_array = []
p recursive_sort(unsorted_array,sorted_array)
