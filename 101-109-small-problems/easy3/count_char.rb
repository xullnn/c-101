puts "Please write word or multiple words:"
words = gets.chomp

p words.split(" ").join.length

# standard solution
# words.delete(" ").length
