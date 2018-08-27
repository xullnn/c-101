def average(array)
  array.inject(:+) / array.size
end

# how `inject` transforms
# The inject and reduce methods are aliases. There is no performance benefit to either.

# array.inject do |acc, e|
#   acc + e
# end
#
# array.inject { |acc, e| acc + e }
#
# array.inject(0, :+)
#
# array.inject(:+)

# to float

def average(array)
  array.inject(:+).to_f / array.size
end
