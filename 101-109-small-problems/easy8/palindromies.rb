# Understand the problem
  # given a string
  # first find out its all substrings
  # then select substrings that are palindromic
  # keep the order how these substrings appearing in the original string
  # duplicate palindromic substrings should be included

# Examples and Test cases
  # palindromes('abcd') == []
  # palindromes('madam') == ['madam', 'ada']
  # palindromes('hello-madam-did-madam-goodbye') == [
  # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  # '-madam-', 'madam', 'ada', 'oo'
  # ]
  # palindromes('knitting cassettes') == [
  # 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  # ]

# Data structure
  # array and strings

# Algorithm
  # find out all substrings
  # filter out substrings that are not palindromes
def substrings_at_start(string)
  1.upto(string.length).map { |n| string[0,n] }
end

def substrings(string)
  strings = 0.upto(string.length - 1).map { |n| string[n..-1] }
  strings.map { |s| substrings_at_start(s)}.flatten
end

def palindromes(string)
  substrings = substrings(string)
  substrings.keep_if { |word| word == word.reverse && word.length >1 }
end

# ignore non-alphabetic chars
def palindromes(string)
  substrings = substrings(string)
  substrings.keep_if do |word|
    clean_word = word.delete('^a-zA-Z')
    clean_word == clean_word.reverse && clean_word.length > 1
  end
end
