# the bug is caused by the use of `decease` method.
#
# Method definition creates a new local varaible scope, the `counter -=1` is actually a reassignment operation.
# It has no influence on the `conter` varaible on line 5. So this program will put `10` 10 times.
#
# To fix this we can directly use `counter -= 1` in line 9, instead of a method call.

counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'
