
def word_sizes(sentence)
  h = Hash.new(0)
  sentence.split.map do |word|
    h[word.gsub(/[^a-zA-Z]/, "").length] += 1
  end
  h
end
