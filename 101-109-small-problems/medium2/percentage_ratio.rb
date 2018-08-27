# understand the problem
  # 'neither' means all chars except for alphabetical words

# Examples and test cases
  # letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
  # letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
  # letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Data structure
  # string
  # hash
  # integer and float

# Algorithm
  # hash = Hash.new (for more predictable result should set 3 keys to 0 at first)
  # calculate the whole lenght of the stirng
  # respectively count lowercase, uppercase, neither chars length
  # calculate different ratios
  # the final ratio number should round to one decimal


def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  total_chars = string.length.to_f
  hash[:lowercase] = (string.count('a-z') / total_chars * 100).round(1)
  hash[:uppercase] = (string.count('A-Z') / total_chars * 100).round(1)
  hash[:neither] = 100 - hash[:lowercase] - hash[:uppercase]
  hash
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
