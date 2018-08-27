# Line 2 `name.chars` returns an array of single chars, this array is a different object from the orignal string -- `name`
# So the `upcase!` operation during the iteration is actually mutating the array, not the string `you`, the return value would be `["Y", "O", "U"]`
#
# To fix this just change line 2 to name.upcase!

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')
