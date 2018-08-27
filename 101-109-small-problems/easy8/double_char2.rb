# Understand the problem
  # double every consonant letter

# Examples and Test cases
  # double_consonants('String') == "SSttrrinngg"
  # double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
  # double_consonants("July 4th") == "JJullyy 4tthh"
  # double_consonants('') == ""

# Data structure
  # array and string

# Algorithm
  # map through string.chars
  # only double chars that are consonants
  # notice the non-alphebtic chars


def double_consonants(string)
  string.chars.map { |c| c.match(/[a-zA-Z&&[^aoeiu]]/) ? c * 2 : c }.join
end
