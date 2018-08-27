def word_lengths(words)
  words.split.map { |word| "#{word} #{word.size}" }
end
