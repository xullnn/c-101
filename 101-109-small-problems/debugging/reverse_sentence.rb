# The problem is in line 7
#   `words[i]` returns a bare word like "how" its string
#   but `reversed_words` is an array
#   they are different type of data structure
#   apply `+` between string and array will cause 'TypeError (no implicit conversion of Array into String'
#
# To fix this just encapsulate the `words[i]` into an array -- `[`words[i]`]`

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
