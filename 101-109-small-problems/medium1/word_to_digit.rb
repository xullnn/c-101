# Understand the problem
  # convert literal number into roman number
  # considerting the punctuation

# Examples ans Test cases
  # word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Data structure
  # hash, string, array

# Algorithm
  # create a hash as a converting list
  # split string into an array
  # map through the array
    # if hash[word] then hash[word]
    # else  word
  # join

h = { }
%w[zero one two three four five six seven eight nine ten].each_with_index do |literal_num, i|
  h[literal_num] = i.to_s
end
LIST = h

# def word_to_digit(string)
#   string.split.each do |word|
#     clean_word = word.delete('^a-zA-Z')
#     if LIST[clean_word]
#       string.gsub!(Regexp.new(clean_word), LIST[clean_word])
#      end
#    end
#   string
# end


# standard solution

def word_to_digit(string)
  LIST.each do |k, v|
    string.gsub!(/\b#{k}\b/, v)
  end
  string
end
