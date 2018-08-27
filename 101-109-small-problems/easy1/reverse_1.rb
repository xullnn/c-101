def reverse_sentence(sentence)
  sentence.reverse!.split(" ").map { |e| e.reverse }.join(" ")
end

# standard solution
def reverse_sentence(sentence)
  sentence.split(" ").reverse.join(" ")
end
