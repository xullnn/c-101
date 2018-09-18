# input: an array of strings
# output: an array of integers

# convert alphabetic range ('a'..'z').to_a
# iterate through the words one by one (with index)
  # iterate through the chars one by one
    # if the current letter.lowercase == letters[index] count in

LETTERS = ('a'..'z').to_a

def solve(words)
  words.map do |word|
    count = 0
    word.each_char.with_index do |char, index|
      count += 1 if char.downcase == LETTERS[index]
    end
    count
  end
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
