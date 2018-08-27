def reverse_sentence(sentence)
  sentence.split(" ").each { |w| w.reverse! if w.length >= 5  }.join(" ")
end
