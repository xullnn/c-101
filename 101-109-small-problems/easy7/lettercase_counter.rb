# Understand the problem
 # count the quantity of lowercase, uppercase letters, and other characters
 # return a hash, the keys is 'lowercase', 'uppercase', 'neihter'
 # the corresponding values are the the counting results

# Examples and Test cases
  # letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  # letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  # letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  # letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data structure
  # hash
  # integer

# Algorithm
  # count different kinds of chars
  # h['lowercase'] = string.count('a-z')
  # h['uppercase'] = string.count('A-Z')
  # h['neihter'] = string.length - h['lowercase']  - h['uppercase']


def letter_case_count(string)
  h = {}
  h[:lowercase] = string.count('a-z')
  h[:uppercase] = string.count('A-Z')
  h[:neihter] = string.length - h[:lowercase] - h[:uppercase]
  h
end
