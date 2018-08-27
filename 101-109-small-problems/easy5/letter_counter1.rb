# split sentence into array
# map array, turn every word into their size
# h = {}
# count

def word_sizes(sentence)
  counts = sentence.split.map { |word| word.length }
  h = {}
  counts.uniq.each { |n| h[n] = counts.count(n) }
  h
end

# standard solution

def word_sizes(sentence)
  h = Hash.new(0)
  sentence.split.map do |word|
    h[word.length] += 1
  end
  h
end
