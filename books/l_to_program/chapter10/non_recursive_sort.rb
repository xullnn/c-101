# keep two arrays
  # one is unsorted
  # the other is sorted
# loop do (break while unsorted array is empty)
  # find the smallest element from the unsorted array
  # push it too sorted array
  # repeat


def sort_array(array)
  sorted_array = []
  while !array.empty?
    sorted_array << find_smallest(array)
  end
  sorted_array
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

p sort_array(unsorted_array)
