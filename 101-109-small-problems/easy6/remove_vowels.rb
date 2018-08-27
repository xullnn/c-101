# Understand the problem

# input: array of string
# output: array of string but with vowels removed

# Examples and Test cases

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# input array may include one or more elements
# for every single elements
  # if it is all vowels, get a empty string
  # else get string with vowels removed

# Data structure
# array's enough

# Algorithm

# iterating（each） throught the array
# for single string, use String#delete！ 'aoeiu'

def remove_vowels(array_of_string)
  array_of_string.each { |s| s.delete!('aoeiuAOEIU') }
end
