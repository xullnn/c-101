def shuffle(array, shuffled)
  shuffled << array.delete_at(rand(array.length))
  if array.empty?
    shuffled
  else
    shuffle(array, shuffled)
  end
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
shuffled = []

p shuffle(array,shuffled)
