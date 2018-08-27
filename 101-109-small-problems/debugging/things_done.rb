# The problem is there is not a base case in the recursive method `move`
# The purpose of setting argument `n` is to determine when the program should stop
# But it didn't set a condition to stop the process, so the method will operate like a infinite cycle
#
# The `n` is aiming to point out how many elements it wants to move, also the degressive operation `n-1` is appropriate
# To fix this add `return from_array if n == 0` before the first line in move.
#

def move(n, from_array, to_array)
  return from_array if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo
p done
