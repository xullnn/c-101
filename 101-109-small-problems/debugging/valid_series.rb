# Line 5 `odd_count = 3 ? true : false` more accurate is `odd_count = 3` this is a assigning operation not a comparison.
# `odd_count = 3` 's return value will always be 3, and Ruby will always evaludate anything but `nil` and `false` to true
# So `odd_count = 3` will always evaludate to true, since then all the situations except for the sum value is not 47, this method will return true.
#
# To fix this just change `odd_count = 3` to `odd_count == 3`

# further exploaration
# to simplify, we don't need the whole ternary operator
# just need `odd_count == 3`
