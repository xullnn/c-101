def reverse(array)
  new_arr = []
  array.each { |e| new_arr.prepend e }
  new_arr
end

def reverse(array)
  # array.inject([]) { |new_arr, e| new_arr.prepend e }
  array.inject([], :prepend)
end

def reverse(array)
  array.each_with_object([]) { |e, new_arr| new_arr.prepend e }
end
