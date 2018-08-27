# understand the problem
  # given a string
  # find all the alphabetic letters and check wether they are uppercase
  # need not to check non-alphabetic chars

# Examples and Test cases
  # uppercase?('t') == false
  # uppercase?('T') == true
  # uppercase?('Four Score') == false
  # uppercase?('FOUR SCORE') == true
  # uppercase?('4SCORE!') == true
  # uppercase?('') == true

# Data structure
  # string

# Algorithm
  # delete all lowercase letters check if the size of the stirng changed

def uppercase?(string)
  string.length  == string.delete('a-z').length
end

# standard solution
def uppercase?(string)
  string == string.upcase
end
