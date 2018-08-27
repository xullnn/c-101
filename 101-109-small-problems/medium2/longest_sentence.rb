text1 = File.read("longest_sentence.txt")
text2 = File.read("demo.txt")

END_OF_S = /\.\s|\!\s|\?\s/

def longest_sentence(text)
  sentences = text.split(END_OF_S)
  longest = sentences.max_by { |sentence| sentence.size }
  puts "#{longest}"
  puts "Length: #{longest.split.length}"
end

# p longest_sentence(text1) # => 87
#
# p longest_sentence(text2) # => 157

END_OF_W = /\.\s|\!\s|\?\s|,\s|\s;\s|\s\"|\"\s|\'\s|\s\'|\s|\"/

puts text1.split(END_OF_W).max_by { |word| word.length } # => proposition
puts text2.split(END_OF_W).max_by { |word| word.length } # => http://www.gutenberg.org/8/84/
