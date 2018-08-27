# Understand the problem
  # take in a string
  # capitalize every word in the string
  # other letters are lowercase

# Examples and Test case
  # word_cap('four score and seven') == 'Four Score And Seven'
  # word_cap('the javaScript language') == 'The Javascript Language'
  # word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Data structure
  # string
  # array

# Algorithm
  # split string into array
  # iterating through the array with everyword[0] = everyword[0].upcase!

def word_cap(string)
  string.split.each do |word|
    word.downcase!
    word[0] = word[0].upcase
  end.join(" ")
end

def word_cap(string)
  string.downcase.split.each { |word| word[0] = word[0].upcase }.join(" ")
end

# standard solution
# String#capitalize will capitalize the first letter while downcasing all the others

def word_cap(string)
  words = string.split
  words.each do |word|
    word.capitalize!
  end.join(" ")
end

# or string.split.map(&:capitalize).join(" ")
