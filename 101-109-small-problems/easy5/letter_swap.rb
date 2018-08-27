# split words into array of words
# enumerating every word and swap the first and the last letter

def swap(string)
  words = string.split
  words.map do |word|
    first_letter = word[0]
    word[0] = word[-1]
    word[-1] = first_letter
    word
  end.join(" ")
end

# standard solution
# 另一个置换字母的方式

# word[0], word[-1] = word[-1], word[0]
