# understand the problem
  # return the central letter of a string
  # if the string's length is even
    # return the 2 letters in the central position

# Examples ans Test cases
  # center_of('I love ruby') == 'e'
  # center_of('Launch School') == ' '
  # center_of('Launch') == 'un'
  # center_of('Launchschool') == 'hs'
  # center_of('x') == 'x'

# Data structure
  #string

# Algorithm
  # based on length of the string
  # use slice ([]) to get the right char(chars)

def center_of(string)
  n = string.length
  n.odd? ? string[n/2] : string[n/2-1,2]
end
