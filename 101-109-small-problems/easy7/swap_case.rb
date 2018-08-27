# Understand the problem
  # take in a string
  # uppcase the lowercase letters and downcase the uppercase letters

# Examples and Test cases
  # swapcase('CamelCase') == 'cAMELcASE'
  # swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Data structure
  # string
  # array

# algorithm
 # split every char then handle them one by one

def swapcase(string)
  string.each_char.with_index do |c,i|
    if c.match /[a-z]/
      string[i] = c.upcase
    else
      string[i] = c.downcase
    end
  end
  string
end
