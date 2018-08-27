# In a nutshell, the reason of the bug is the `neutralize` method is mutating the caller during iteration operation.
#
# Here's more detailed depiction:
#
# problem code:
#
# words.each do |word|
#   words.delete(word) if negative?(word)
# end
#
# Ruby iterate through an array based on its incrementing index from 0 to array.length-1
#
# the original words is ["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
#
# - when index == 0 it gets the string "These", but it is not included in the negatives so there's no further operation on the array
# - when index == 1 it gets the string "dull", it's one of the member of negatives, so it get deleted(actually all "dull" get deleted)
#   - But here after deleting the "dull" there's no element on index 1, so all the elements behind will move forward
#   - Now the current words is ["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
#   - But the problem is the index will not pause, it moves on to 2
# - when index == 2 it gets "cards" instead "boring", so the "boring" will not be deleted
#
# In this particular case, if there are consecutive negative words, it would miss some.
# But if all the negative words are not consecutive, they would all be deleted.
#
# To fix this bug we can use `Array#reject!` or select

words.reject! { |word| negative?(word) }

# further exploration

# how to implement a mutating version reject!

def mutating_reject(array)
  index == 0
  loop do
    break if index == array.length
    if yield(array[index])
      array.delete_at(index)
    else
      index += 1
    end
  end
  array
end
